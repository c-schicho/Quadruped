#!/usr/bin/env python

import rospy
from adafruit_servokit import ServoKit
from std_msgs.msg import String, Float32, Int32
from robot_open_quadruped.msg import TransformedAngles


kit = ServoKit(channels=16, address=0x40)


# right front leg
kit.servo[0].set_pulse_width_range(550, 2400)  # hip
kit.servo[1].set_pulse_width_range(550, 2400)  # upper leg
kit.servo[2].set_pulse_width_range(550, 2400)  # lower leg        

# right rear leg
kit.servo[4].set_pulse_width_range(550, 2400)  # hip
kit.servo[5].set_pulse_width_range(550, 2400)  # upper leg
kit.servo[6].set_pulse_width_range(550, 2400)  # lower leg        

# left front leg
kit.servo[8].set_pulse_width_range(550, 2400)  # hip
kit.servo[9].set_pulse_width_range(550, 2400)  # upper leg
kit.servo[10].set_pulse_width_range(550, 2400) # lower leg        

# left rear leg
kit.servo[12].set_pulse_width_range(550, 2400) # hip
kit.servo[13].set_pulse_width_range(550, 2400) # upper leg
kit.servo[14].set_pulse_width_range(550, 2400) # lower leg 


angles = None


def transformed_angles_callback(msg):
    global angles
    angles = msg.angles 

 
if __name__ == "__main__":

    rospy.init_node('leg_movement')
    sub = rospy.Subscriber('transformed_angles', TransformedAngles, transformed_angles_callback)
    rate = rospy.Rate(10)

    while not rospy.is_shutdown():
        if not angles is None:
            # right front leg
            kit.servo[0].angle = angles[0]   # hip
            kit.servo[1].angle = angles[1]   # upper leg
            kit.servo[2].angle = angles[2]   # lower leg

            # right rear leg
            kit.servo[4].angle = angles[4]   # hip
            kit.servo[5].angle = angles[5]   # upper leg
            kit.servo[6].angle = angles[6]   # lower leg         

            # left front leg
            kit.servo[8].angle = angles[8]   # hip
            kit.servo[9].angle = angles[9]   # upper leg
            kit.servo[10].angle = angles[10] # lower leg          

            # left rear leg
            kit.servo[12].angle = angles[12] # hip
            kit.servo[13].angle = angles[13] # upper leg
            kit.servo[14].angle = angles[14] # lower leg
