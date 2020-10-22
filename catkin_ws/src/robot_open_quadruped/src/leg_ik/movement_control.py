#!/usr/bin/env python

import math
import time
import rospy
from quadruped_kinematics import LegIK
from std_msgs.msg import String, Float32, Int32
from robot_open_quadruped.msg import JointAngles
from sensor_msgs.msg import Joy


x_scale = 50
y_scale = 50
z_scale = 102



leg_model = LegIK(109.868, 144.580, 11.369, 63.763)
#body_model = BodyIK(76.655, 229.3, 200)


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

            x = axes[0] * x_scale + 1
            y = axes[1] * y_scale + 63
            z = axes[2] * z_scale + 155

            joint_angles = leg_model.get_joint_angles(x, y, z)

            ja = JointAngles()
            ja.lf = joint_angles[0]
            ja.rf = joint_angles[1]
            ja.lr = joint_angles[2]
            ja.rr = joint_angles[3]

            pub.publish(ja)
            rate.sleep()
