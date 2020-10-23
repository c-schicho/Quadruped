"""
Author: Christopher Schicho
Email: contact@enabling-intelligence.com
"""


#!/usr/bin/env python

import math
import time
import rospy
from quadruped_kinematics import QPKinematics
from std_msgs.msg import String, Float32, Int32
from robot_open_quadruped.msg import JointAngles
from sensor_msgs.msg import Joy


roll_scale = 20
yaw_scale = 20
pitch_scale = 20

qp_kinematics = QPKinematics(76.655, 229.3, 155, 109.868, 144.58, 11.369, 63.763)


axes = None
buttons = None


def controller_callback(msg):
    global buttons, axes
    buttons = msg.buttons
    axes = msg.axes


if __name__ == "__main__":

    rospy.init_node("movement_control", anonymous=True)
    sub = rospy.Subscriber("joy", Joy, controller_callback)
    pub = rospy.Publisher("joint_angles", JointAngles, queue_size=10)
    rate = rospy.Rate(10)

    while not rospy.is_shutdown():
        if not (axes is None or buttons is None):

            roll = axes[0] * roll_scale
            yaw = axes[1] * yaw_scale
            pitch = axes[2] * pitch_scale

            joint_angles = qp_kinematics.qp_joint_angles(roll, yaw, pitch)

            ja = JointAngles()
            ja.rf = joint_angles[0]
            ja.rr = joint_angles[1]
            ja.lf = joint_angles[2]
            ja.lr = joint_angles[3]

            pub.publish(ja)
            rate.sleep()
