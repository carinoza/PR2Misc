#!/usr/bin/python
#
# Take Strings from the 'speakme' topic and pass them to festival
# so that the PR2 speaks them out loud.
# Note we set the volume at startup.
#
# USAGE:
# Make sure this file is executable and then simply ./topic2festival.py
#
import rospy
import os
from std_msgs.msg import String

def festivalit(message):
	os.system('echo "'+message.data+'" | festival --tts')

if __name__ == '__main__':
	rospy.init_node('t2f', anonymous=True)
	rospy.Subscriber('speakme', String, festivalit)
	rospy.loginfo(os.system('amixer set PCM 90%'))
	rospy.spin()

