#!/usr/bin/env python3

import math
import time
import rospy
from control_library import leg_ik, body_ik
from std_msgs.msg import String, Float32, Int32
from robot_open_quadruped.msg import JointAngles
from sensor_msgs.msg import Joy


# body ik params
yaw_limit = 15
pitch_limit = 15
roll_limit = 15

# mode settings
body_mode = 0
gait_mode = 1
mode=body_mode

# instantiate leg & body IK models
leg_model = leg_ik.LegIKModel(109.868, 144.580, 11.369, 63.763)
body_model = body_ik.BodyIKModel(76.655, 229.3, 130)


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

            # use joystick values + limits to figure out desired euler angle represent
            yaw = axes[2] * yaw_limit
            pitch = axes[5] * pitch_limit
            roll = axes[0] * roll_limit

            # use the body IK model to figure out the hip-to-foot vectors needed for the desired pose
            body_model.reset_pose()
            body_model.transform(math.radians(yaw), math.radians(pitch), math.radians(roll))
            htf_vecs = body_model.get_htf_vectors()

            # convert the hip-to-foot vectors into joint angles using leg IK model
            ja_m = leg_model.ja_from_htf_vecs(htf_vecs)

            # populate the JointAngles ros message
            ja = JointAngles()
            ja.lf = ja_m[0]
            ja.rf = ja_m[1]
            ja.lr = ja_m[2]
            ja.rr = ja_m[3]
     
            #publishing JointAngles message to topic
            pub.publish(ja)
            rate.sleep()
