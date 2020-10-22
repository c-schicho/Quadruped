#!/usr/bin/env python

import math, rospy
import pandas as pd
from std_msgs.msg import String, Float32, Int32
from robot_open_quadruped.msg import JointAngles, TransformedAngles


path = "/home/jetson-nano/robot_open-quadruped/calibration_software/data/calibration_values.csv"
limits = pd.read_csv(path)


def average(x1, x2):
    return (x1 + x2) / 2


def angle_transformation(joint_angles):
    tr_angles = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    r_counter = 0
    l_counter = 8

    for leg in range(4):
        if leg % 2 != 0:
            # right legs
            for joint in range(3):
                angle = math.degrees(joint_angles[leg][joint])
                addr = joint + r_counter
                min_limit = limits.iloc[0, addr+1]
                max_limit = limits.iloc[1, addr+1]
                if joint == 0: # hip
                    tr_angles[addr] = min(max(average(min_limit, max_limit) + angle, min_limit), max_limit)
                if joint == 1: # upper leg
                    tr_angles[addr] = min(max((max_limit - angle), min_limit), max_limit)
                if joint == 2: # lower leg
                    tr_angles[addr] = min(max(angle, min_limit), max_limit)
                    r_counter = 4

        else:
            # left legs
            for joint in range(3):
                angle = math.degrees(joint_angles[leg][joint])
                addr = joint + l_counter
                min_limit = limits.iloc[0, addr+1]
                max_limit = limits.iloc[1, addr+1]
                if joint == 0: # hip
                    tr_angles[addr] = min(max(average(min_limit, max_limit) + angle, min_limit), max_limit)
                if joint == 1: # upper leg
                    tr_angles[addr] = min(max((min_limit + angle), min_limit), max_limit)
                if joint == 2: # lower leg
                    tr_angles[addr] = min(max((max_limit - angle), min_limit), max_limit)
                    l_counter = 12

    return [int(i) for i in tr_angles]


joint_angles = None


def joint_angles_callback(msg):
    global joint_angles
    joint_angles = [msg.rr, msg.lr, msg.rf, msg.lf]


if __name__ == "__main__":

    rospy.init_node('angle_transforamtion', anonymous=True)
    sub = rospy.Subscriber('joint_angles', JointAngles, joint_angles_callback)
    pub = rospy.Publisher("transformed_angles", TransformedAngles, queue_size=10)
    rate = rospy.Rate(10)

    while not rospy.is_shutdown():
        if not joint_angles is None:
            tr_angles = angle_transformation(joint_angles)
            tr_a = TransformedAngles()
            tr_a.angles = tr_angles

            pub.publish(tr_a)
            rate.sleep()
