import subprocess32 as subprocess
import shlex
import os
import shutil
from threading import Timer
import glob

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
		return "Timedout. Warning!!! You will be reported to the admin."
	else:
		return  stdout+stderr

def run_code(filepath, filetxt_path, testcases, container_id, users_dir):
	files = glob.glob(users_dir+"/*")
	for f in files:
		try:
			if os.path.isfile(f):
				os.remove(f)
			elif os.path.isdir(f):
				shutil.rmtree(f)
		except Exception as e:
			print e

	cases = open(testcases).readlines()
	final_cases =[]

	for i in cases:
		final_cases.append(i.strip())


	file_path=""
	for the_file in os.listdir(users_dir):
		file_path = os.path.join(users_dir, the_file)

	try:
		if os.path.isfile(file_path):
			os.unlink(file_path)
	except Exception as e:
		print(e)

	dest = users_dir

	start_container =['docker','start',container_id]
	start_container[-1] = start_container[-1].strip()
	subprocess.check_output(start_container)

	shutil.copyfile(filepath, dest+'/user.sh')

	for add_file in final_cases:
		if ''.join(add_file).endswith(".txt"):
			shutil.copyfile(filetxt_path, dest+'/'+''.join(add_file))

	command = "docker exec "+container_id.strip()+" /bin/bash user.sh"
	for add_file in final_cases:
		command = command +" '"+add_file+"'"
	print command

	return run(command,20)
