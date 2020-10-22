#!/usr/bin/env python3

import rospy
import pandas as pd
from std_msgs.msg import String, Float32, Int32
from robot_open_quadruped.msg import JointAngles, TransformedAngles


path = "/home/jetson-nano/robot_open-quadruped/calibration_software/data/calibration_values.csv"
limits = pd.read_csv(path)


def angle_transformation(self):
    tr_angles = {}    

    # right front leg
    i = 0
    for angle in angles.rf:
        min_limit = limits.iloc[0,i]
        max_limit = limits.iloc[1,i]
        if i == 0: # hip
            tr_angles[i] = min(max((90 - angle), max_limit), min_limit) 
        if i == 1: # upper leg
            tr_angles[i] = min(max((max_limit - angle), max_limit), min_limit)
        if i == 2: # lower leg
            tr_angles[i] = min(max(angle, max_limit), min_limit)
        i += 1    

    # right rear leg
    i = 4
    for angle in angles.rr:
        min_limit = limits.iloc[0,i]
        max_limit = limits.iloc[1,i]
        if i == 4: # hip
            tr_angles[i] = min(max((90 - angle), max_limit), min_limit) 
        if i == 5: # upper leg
            tr_angles[i] = min(max((max_limit - angle), max_limit), min_limit)
        if i == 6: # lower leg
            tr_angles[i] = min(max(angle, max_limit), min_limit)
        i += 1    

    # left front leg
    i = 8
    for angle in angles.lf:
        min_limit = limits.iloc[0,i]
        max_limit = limits.iloc[1,i]
        if i == 8: # hip 
            tr_angles[i] = min(max((90 - angle), max_limit), min_limit) 
        if i == 9: # upper leg
            tr_angles[i] = min(max((max_limit - angle), max_limit), min_limit)
        if i == 10: # lower leg
            tr_angles[i] = min(max(angle, max_limit), min_limit)
        i += 1    

    # left rear leg
    i = 12
    for angle in angles.lr:
        min_limit = limits.iloc[0,i]
        max_limit = limits.iloc[1,i]
        if i == 12: # hip
            tr_angles[i] = min(max((90 - angle), max_limit), min_limit) 
        if i == 13: # upper leg
            tr_angles[i] = min(max((max_limit - angle), max_limit), min_limit)
        if i == 14: # lower leg
            tr_angles[i] = min(max(angle, max_limit), min_limit)
        i += 1    

    return tr_angles


angles = None


def joint_angles_callback(msg):
    global angles_rf, angles_rr, angles_lf, angles_lr
    angles_rf = msg.rf
    angles_rr = msg.rr
    angles_lf = msg.lf
    angles_lr = msg.lr


if __name__ == "__main__":

    rospy.init_node('angle_transforamtion', anonymous=True)
    sub = rospy.Subscriber('joint_angles', JointAngles, joint_angles_callback)
    pub = rospy.Publisher("transformed_angles", TransformedAngles, queue_size=10)
    rate = rospy.Rate(10)

    while not rospy.is_shutdown():
        if not angles is None:
            tr_angles = angle_transformation()
            tr_a = TransformedAngles()
            tr_a.angles = tr_angles

            pub.publish(tr_a)
            rate.sleep()
