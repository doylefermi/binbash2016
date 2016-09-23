from binbash import run_code
import subprocess
import hashlib

def check_code(filepath, filetxt_path, testcases, users_dir):
	response = {}
	fail = 0
	i = 0
	md5_final = ""
	testcase1res = ""
	for test,filetxt in zip(testcases,filetxt_path):
		if i==0:
			# create_container = ['docker','run','-id','binbash/bash', '/bin/sh']
			create_container = ['docker','run','-m','10M','--kernel-memory','5M','-id','-v',users_dir+':/tmp','binbash/bash', '/bin/sh']
			container_id = subprocess.check_output(create_container).decode("utf-8")
		user_out = run_code(filepath, filetxt, test, container_id,users_dir)
		# original_out = run_code(original_filepath, filetxt_path, test)
		# print (original_out + " User out:-\n" + user_out)
		test_cases_file = open(test)
		data = {}
		md5_user = hashlib.md5(user_out.encode('utf-8')).hexdigest()
		# md5_original = hashlib.md5(original_out.encode('utf-8')).hexdigest()
		if i == 0 :
			testcase1res = user_out
			data['result'] = str(test_cases_file.read()) + "\n" + user_out
			response[test] = data
			i = i + 1

		# data['expected_output'] = original_out
		md5_final = md5_final + md5_user
		# print md5_final

		if i==3:
			clean_container = ['docker','rm','-f',container_id.strip()]
			subprocess.check_output(clean_container)

	response["md5"] = hashlib.md5(md5_final.encode('utf-8')).hexdigest()
	print response
	return response
