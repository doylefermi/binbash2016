from binbash import run_code
import subprocess
import hashlib

def check_code(filepath, filetxt_path, testcases, users_dir):
	i = 0
	md5_final = ""
	testcase1res = ""
	data = {}
	for test,filetxt in zip(testcases,filetxt_path):
		if i==0:
			create_container = ['docker','run','-id','-m', '10M', '--kernel-memory', '5M','-v',users_dir+':/tmp','binbash/bash', '/bin/bash']
			container_id = subprocess.check_output(create_container).decode("utf-8")

		user_out = run_code(filepath, filetxt, test, container_id,users_dir)

		test_cases_file = open(test)

		md5_user = hashlib.md5(user_out.encode('utf-8')).hexdigest()

		if i == 0 :
			testcase1res = user_out
			data['result'] = "Testcase input: \n" + str(test_cases_file.read()) + "\n\nYour output: \n" + user_out.encode('utf-8')
			i = i + 1

		if "Out of memory" in user_out:
			md5_final = "Out of memory noob _!_ @doylefermi"
			data['result'] = "Testcase input: \n" + str(test_cases_file.read()) + "\n\nYour output: \nOut of memory. Warning!!! You will be reported to the admin."
			break

		if md5_user == "e6172b72cffb8ad775dba1c18fd2ae01":
			md5_final = md5_user+md5_user+md5_user
			break

		print user_out.encode('utf-8') + "----------------------" + md5_user
		md5_final = md5_final + md5_user

	data["md5"] = hashlib.md5(md5_final.encode('utf-8')).hexdigest()
	clean_container = ['docker','rm','-f',container_id.strip()]
	subprocess.check_output(clean_container)
	return data
