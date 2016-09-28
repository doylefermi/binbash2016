from django.shortcuts import render
from bashbin.models import User, Question
from django.http import JsonResponse
from django.utils import timezone
import os
from bashbin.tasks import docker_run
from celery.result import AsyncResult
import subprocess32 as subprocess
from tabulate import tabulate
import requests
def telegram_bot(msg):
    try:
        url = "https://api.telegram.org/bot270974521:AAHuzi4Iz1642lyCJoJKiAmIokiRl0hOu6k/sendMessage"
        data = { "chat_id": "@binbash2016",
                 "text"   : msg }
        response = requests.post(url,params=data)
    except:
        print "tele-error"
def question_dir_path(level_no,question_no):
    return os.path.dirname(os.path.realpath(__file__)) + r"/Bash/Level{0}/Question{1}/".format(level_no,question_no)
def read_file(path):
    with open(path, 'r') as content_file:
        content = content_file.read()
    return content
def file_get_contents(filename):
    with open(filename) as f:
        return f.read()
def listdir_nohidden(path):
    for f in os.listdir(path):
        if not f.startswith('.'):
            yield f
def input_everything(request):
    if request.GET.get("secrettoken","") == "excel2016" :
        for i in range(1,6):
            for j in range(1,6):
                dir_path = question_dir_path(i,j)
                if not Question.objects.filter(question_id=j, level_id=i).exists():
                    try:
                        Q = Question(question_id=j,level_id=i,question_timestamp=timezone.now(), ls_cmd=" ".join(listdir_nohidden(dir_path)), cat_of_question=read_file(dir_path+"question.txt"), cat_of_file=read_file(dir_path+"file.txt"), cat_of_testcase=read_file(dir_path+"testcase.txt"), answer_md5=read_file(dir_path+".md5"), intro_to_level=read_file(dir_path+".intro.txt"))
                        Q.save()
                    except IOError as e:
                        print "IO Error level{0} question{1} {2}".format(i,j,e)
                else :
                    Q = Question.objects.get(question_id=j, level_id=i)
                    Q.question_timestamp=timezone.now()
                    Q.ls_cmd=" ".join(listdir_nohidden(dir_path))
                    Q.cat_of_question=read_file(dir_path+"question.txt")
                    Q.cat_of_file=read_file(dir_path+"file.txt")
                    Q.cat_of_testcase=read_file(dir_path+"testcase.txt")
                    Q.answer_md5=read_file(dir_path+".md5")
                    Q.intro_to_level=read_file(dir_path+".intro.txt")
                    Q.save()
        return JsonResponse({"inputdb":"worked"}, content_type ="application/json")
    else :
        return JsonResponse({"inputdb":"failed due to invalid token"}, content_type ="application/json")
def user_details(request):
    current_user = User.objects.get(user_id=request.GET.get("user_id",""))
    Qobject = Question.objects.get(question_id=current_user.question, level_id=current_user.level)
    a = "Welcome {0}.\nYour last login occured at {1}.\n".format(current_user.name, current_user.last_login_timestamp)
    context = { "status"       : "Success",
                "result"       : str(a) + "You are currently in level {0} question {1}".format(current_user.level, current_user.question)}
    return JsonResponse(context, content_type ="application/json")

def ls_request(request):
    current_user = User.objects.get(user_id=request.GET.get("user_id",""))
    Qobject = Question.objects.get(question_id=current_user.question, level_id=current_user.level)
    context = { "status" : "Success",
                "result" : Qobject.ls_cmd }
    return JsonResponse(context, content_type ="application/json")

def cat_request(request):
    if len(request.GET.get("cmd","").split()) == 1:
        context = { "status" : "Success",
                    "result" : "cat requires a filename" }
        return JsonResponse(context, content_type ="application/json")
    file_name = request.GET.get("cmd","").split()[1]
    current_user = User.objects.get(user_id=request.GET.get("user_id",""))
    Qobject = Question.objects.get(question_id=current_user.question, level_id=current_user.level)
    context = { "status" : "Failure",
                "reason" : "Skipped all if-elses in cat request" }
    if (file_name == "question.txt"):
        context = { "status" : "Success",
                    "result" : Qobject.cat_of_question }
    elif (file_name == "answer.sh"):
        contents = ""
        if current_user.cat_of_answer.encode("utf-8") != "":
            contents = file_get_contents(current_user.cat_of_answer)
        context = { "status" : "Success",
                    "result" : contents }
    elif (file_name == "file.txt"):
        context = { "status" : "Success",
                    "result" : Qobject.cat_of_file }
    elif (file_name == "testcase.txt"):
        context = { "status" : "Success",
                    "result" : Qobject.cat_of_testcase }
    else:
        context = { "status" : "Success",
                    "result" : "cat: {}: No such file or directory".format(file_name) }
    return JsonResponse(context, content_type ="application/json")

def help_request(request):
    context = { "status": "Success",
                "result": """BIN BASH HELP\n Commands available in terminal
    ls - list all the files in the current directory.
    cat filename - displays contents of the file named "filename".
    submit - opens up an upload window to submit code and runs the code.
    scoreboard - displays top current users in the scoreboard.

How to play:
    https://goo.gl/AWT8uL

Note:

    Input to your code must always be command line.
    We will run your code against multiple test cases.

What happens when you submit:
    On submission the answer file is run as ./answer.sh with each line from testcase.txt as a command line argument.
     """ }
    return JsonResponse(context, content_type ="application/json")
def rank(request):
    user_list = User.objects.order_by('-level', '-question', 'last_correct_submit_timestamp')
    user_id = request.GET.get("user_id","").split()[0]
    if user_id == 0 :
        context = { "status" : "Success",
                    "result" : 0 }
        return JsonResponse(context, content_type ="application/json")
    rank = 1
    found = False
    for i in user_list :
        if i.user_id == user_id:
            if i.disable_account == 1:
                rank = 0
            found = True
            break
        rank = rank + 1
    if found :
        context = { "status" : "Success",
                    "result" : rank }
    else :
        context = { "status" : "Success",
                    "result" : 0 }
    return JsonResponse(context, content_type ="application/json")

def scoreboard_request(request):
    user_list = User.objects.order_by('-level', '-question', 'last_correct_submit_timestamp')#[:10]
    context =  { "status"       : "Success",
                 "result count" : len(user_list) }
    user_details = { }
    user_details[0] = ["RANK", "NAME", "LEVEL", "QUESTION"]
    valuelist = []
    j = 1
    for i in user_list:
        if i.disable_account == 1:
            i.name = i.name + " (removed)"
            i.question = 0
            i.level = 0
        user_details[j] = [j, i.name, i.level, i.question]
        valuelist.append(user_details[j])
        j = j + 1
    context["result_json"] = user_details
    string_rank = tabulate(valuelist, user_details[0], tablefmt="grid")
    context["result"] = string_rank
    return JsonResponse(context, content_type ="application/json")

def submit_request(user_id, answer_path):
    if answer_path == "":
        return JsonResponse({ "status": "Failure",
                              "reason": "Provide path to answer file" }, content_type ="application/json")
    current_user = User.objects.get(user_id=user_id)
    Qobject = Question.objects.get(question_id=current_user.question, level_id=current_user.level)
    local_dir = question_dir_path(current_user.level, current_user.question)
    extra_file_txt  = [local_dir + "file.txt",local_dir + ".file2.txt",local_dir + ".file3.txt"]
    testcase = [local_dir + "testcase.txt", local_dir + ".testcase2.txt", local_dir + ".testcase3.txt"]
    current_user.cat_of_answer = answer_path
    current_user.save()
    context = {}
    home = os.path.dirname(os.path.realpath(__file__)) + r"/home"
    task_id = docker_run.delay( answer_path, extra_file_txt, testcase, home)
    context = task_id.get()
    hack_path = os.path.dirname(os.path.realpath(__file__)) + r"/hackers/"
    if (str(context["md5"]).split() == str(Qobject.answer_md5).split()) :
        context["status"] = "Success"
        current_user.last_correct_submit_timestamp = timezone.now()
        if (current_user.question == 5):
            current_user.level = current_user.level + 1
            current_user.question = 1
        elif (current_user.question < 5):
            current_user.question = current_user.question + 1
        current_user.cat_of_answer = ""
        current_user.save()
        context["result"] = "Success on test cases\n" + str(context["result"]).replace("52.39.25.19", "Nigga you thought you can find me? _!_")
        context["info"] = "You have successfully cleared this round.\n\n"
        if  current_user.question == 1 :
            Qobject = Question.objects.get(question_id=current_user.question, level_id=current_user.level)
            context["info"] +=  Qobject.intro_to_level
    else :
        if (str(context["md5"]).split()[0] == 'b51abcddf693c69824cc5f262f68084b' or str(context["md5"]).split()[0] == 'b498eb642d47b33c5e268625751cb062') :
            with open(hack_path + '{}.txt'.format(current_user.name), 'w+') as f:
                f.write("hacker")
            current_user.hack_attempts = current_user.hack_attempts + 1
            current_user.save()
        context["status"] = "Success"
        context["result"] = "Failure occured on one of the test cases\n" + str(context["result"]).replace("52.39.25.19", "Nigga you thought you can find me? _!_")
        context["info"] = ""
    return JsonResponse(context, content_type ="application/json")

def binbash_request(request):
    user_id = request.GET.get("user_id","").split()
    if user_id[0] == 0 :
        context = { "status": "Failure",
                    "reason": "contact admin" }
        return JsonResponse(context, content_type ="application/json")
    print request.GET.get("name","")
    name = request.GET.get("name","")
    if len(user_id) == 0:
        context = { "status": "Failure",
                    "reason": "No user id provided" }
        return JsonResponse(context, content_type ="application/json")
    else:
        user_count = len(User.objects.filter(user_id=user_id[0]))
        if user_count == 0:
            if request.GET.get("create","") == "true":
                telegram_bot(name+" logged in")
                User(user_id = str(user_id[0]), level=1, question=1, name=name, last_login_timestamp=timezone.now(),last_correct_submit_timestamp=timezone.now()).save()
                current_user = User.objects.get(user_id=user_id[0])
                Qobject = Question.objects.get(question_id=current_user.question, level_id=current_user.level)
                context = { "status"       : "Success",
                            "result"       : str(Qobject.intro_to_level) + "How to play:\n    https://goo.gl/AWT8uL\nYour last login occured at {}".format(current_user.last_login_timestamp),
                            "level"        : current_user.level,
                            "question"     : current_user.question }
                return JsonResponse(context, content_type ="application/json")
            context = { "status": "Failure",
                        "reason": "No user present" }
            return JsonResponse(context, content_type ="application/json")
        elif user_count == 1 :
            current_user = User.objects.get(user_id=user_id[0])
            if current_user.disable_account == 1:
                context = { "status"       : "Success",
                            "result"       : "Your account has been disabled by the admin. Please contact the event organisers for more details." }
                return JsonResponse(context, content_type="application/json")
            if request.GET.get("create","") == "true":
                telegram_bot(name+" logged in")
                Qobject = Question.objects.get(question_id=current_user.question, level_id=current_user.level)
                context = { "status"       : "Success",
                            "result"       : str(Qobject.intro_to_level) + "How to play:\n    https://goo.gl/AWT8uL\nYour last login occured at {}".format(current_user.last_login_timestamp) }
                current_user.last_login_timestamp=timezone.now()
                current_user.save()
                return JsonResponse(context, content_type ="application/json")
        elif user_count >= 1 :
            context = { "status": "Failure",
                        "reason": "2 users with same id found. Contact admin." }
            return JsonResponse(context, content_type ="application/json")
    cmd = request.GET.get("cmd","").split()
    if len(cmd) == 0:
        context = { "status": "Success",
                    "result": "" }
        return JsonResponse(context, content_type ="application/json")
    switch = {
        "ls": ls_request,
        "cat": cat_request,
        "submit": upload,
        "scoreboard": scoreboard_request,
        "help": help_request,
        "whoami":user_details
    }
    request.POST._mutable = True
    if cmd[0] == "submit" :
        request.POST["user_id"] = user_id[0]
    func = switch.get(cmd[0], lambda request: JsonResponse({ "status": "Success",
                                                             "result": "bash: {0}: command not found...".format(cmd[0]) },
                                                             content_type ="application/json"))
    return func(request)

def start_page(request):
    return JsonResponse({"status":"Success"}, content_type ="application/json")

def upload(request):
    print request.FILES
    print request.POST
    if request.method == 'POST':
        if request.FILES.get('file',"") != "":
            user_id = request.POST.get("user_id","")
            cuser = User.objects.get(user_id=user_id)
            path = handle_uploaded_file(request.FILES['file'], cuser)
            return submit_request(user_id, path)
        else :
            return JsonResponse({"status": "Failure", "reason": "No file in POST request"}, content_type ="application/json")
    return JsonResponse({"status": "Failure", "reason": "needs POST request"}, content_type ="application/json")

def handle_uploaded_file(f, cuser):
    path = r'/home/ec2-user/binbash2016/binbash/src/bashbin/answers/{0}_name{1}_L{2}_Q{3}.sh'.format(cuser.user_id, cuser.name ,cuser.level, cuser.question)
    with open(path, 'w+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)
    return path
