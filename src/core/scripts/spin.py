#! /usr/bin/env python

import rospy
from rospy import Time 

def main():
    rospy.init_node('just_spin', anonymous=True)
    rate = rospy.Rate(50)  # 5hz
    while not rospy.is_shutdown():
          rate.sleep()   


if __name__ == '__main__':
    main()
