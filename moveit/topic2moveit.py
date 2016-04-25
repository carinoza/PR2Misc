#!/usr/bin/env python

import rospy

from moveit_commander import MoveGroupCommandInterpreter, MoveGroupInfoLevel
from std_msgs.msg import String


cmdInterpreter = MoveGroupCommandInterpreter()
last_cmd = "load pos.cfg"

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'

def print_message(level, msg):
	if level == MoveGroupInfoLevel.FAIL:
        	print bcolors.FAIL + msg + bcolors.ENDC
    	elif level == MoveGroupInfoLevel.WARN:
        	print bcolors.WARNING + msg + bcolors.ENDC
    	elif level == MoveGroupInfoLevel.SUCCESS:
        	print bcolors.OKGREEN + msg + bcolors.ENDC
    	elif level == MoveGroupInfoLevel.DEBUG:
        	print bcolors.OKBLUE + msg + bcolors.ENDC
    	else:
        	print msg

	
def load_positions():
	(level, msg) = cmdInterpreter.execute(last_cmd)
	print_message(level, msg)	

def send_cmd(message):
	global last_cmd
	if message.data != last_cmd:	
		rospy.loginfo("Received command: %s", message.data)
		(level, msg) = cmdInterpreter.execute(message.data)
		print_message(level, msg)
		last_cmd = message.data

if __name__ == '__main__':
	rospy.init_node('t2moveit', anonymous=True)
	load_positions()
	rospy.Subscriber('t2moveit_cmd', String, send_cmd)
	rospy.spin()
