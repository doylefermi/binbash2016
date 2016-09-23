from celery import task
from docker.bashmain import check_code

@task()
def docker_run(answer_path, file_txt, testcase, home):
    return check_code(answer_path, file_txt, testcase, home)