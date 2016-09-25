import subprocess32 as subprocess
import shlex
import os
import shutil
from threading import Timer

def kill_proc(proc, timeout):
	timeout["value"] = True
	proc.kill()

def run(cmd, timeout_sec):
	proc = subprocess.Popen(shlex.split(cmd), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	timeout = {"value": False}
	timer = Timer(timeout_sec, kill_proc, [proc, timeout])
	timer.start()
	stdout, stderr = proc.communicate()
	timer.cancel()

	if timeout["value"]:
		return "Timedout. Warning!!! You will be reported to the admin"
	else:
		return  stdout+stderr

def run_code(filepath, filetxt_path, testcases, container_id, users_dir):
	cases = open(testcases).readlines()
	final_cases =[]

	for i in cases:
		final_cases.append(i.strip())

	# remove the folder test & empty the home dir


	for the_file in os.listdir(users_dir):
		file_path = os.path.join(users_dir, the_file)
		print file_path

	try:
		if os.path.isfile(file_path):
			os.unlink(file_path)
			#elif os.path.isdir(file_path): shutil.rmtree(file_path)
	except Exception as e:
		print(e)

	# now home dir is emptied



	dest = users_dir

	start_container =['docker','start',container_id]
	start_container[-1] = start_container[-1].strip()
	subprocess.check_output(start_container)

	shutil.copyfile(filepath, dest+'/user.sh')

	if ''.join(final_cases).endswith(".txt"):
		shutil.copyfile(filetxt_path, dest+'/'+''.join(final_cases))
		final_cases = ''.join(final_cases).split()
	# print final_cases
	# copyto_container = ['docker','cp',filepath,container_id.strip()+':/user.sh']
	# subprocess.check_output(copyto_container)
	# copyto_container = ['docker','cp',filetxt_path,container_id.strip()+':/file.txt']
	# subprocess.check_output(copyto_container)
	command = "docker exec "+container_id.strip()+" /bin/bash user.sh "+"'"+"' '".join(final_cases)+"'"
	# print command
	#= ['docker','exec',container_id.strip(),'/bin/bash','user.sh']
	# run_container+=final_cases
	# print (run_container)

	return run(command,5)
	# return "out"
	# try:
	# 	container_out = subprocess.check_output(run_container,stderr=subprocess.STDOUT, timeout=15)
	# 	return container_out.decode("utf-8")
	# except subprocess.CalledProcessError as e:	#TODO: Raise timeout error
	# 	return e.output.decode("utf-8")
