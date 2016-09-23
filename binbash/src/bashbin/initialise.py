import subprocess
import shutil
import os

def create_user(username, container_id):
	"""Fuction to create the user """
	# container_id = "22c9d5f42584fe172fe51d610759534dcb1b4b3048409628b4f458588843077f"

	# docker exec  -u="root" 977df660c8697f1b3a36eb79b155a4665722d1a725d7b664cf420165f878e85c adduser --disabled-password --gecos '' user1
	subprocess.check_output(['docker','exec','-u','root',container_id,'adduser','--disabled-password','--gecos','',username])
	# docker exec  -u="root" 977df660c8697f1b3a36eb79b155a4665722d1a725d7b664cf420165f878e85c chmod -R 0700 /home/user1
	subprocess.check_output(['docker','exec','-u','root',container_id,'chmod','-R','0770','/home/'+username])


def restore_users(username_list, container_id):
	"""Fuction to restore the users in list """
	u_list =['admin']
	u_list.extend(username_list)
	for i in u_list:
		create_user(i,container_id)

def start_container(users_dir,username_list):
	# docker run -id -v /home/haxorware/users:/home binbash/ubuntu
	c_id = subprocess.check_output(['docker','run','-id','-v',users_dir+':/home','binbash/ubuntu']).split('\n')[0]
	restore_users(username_list,c_id)
	return c_id

def copyall(src_files,username,users_dir):
	"""	Copies all files in src directory to destination directory	"""
	dest = users_dir+"/"+username
	print dest
	
	for file_name in src_files:
		if (os.path.isfile(file_name)):
			shutil.copy(file_name, dest)
