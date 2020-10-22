#!/usr/bin/env python

import os
import pandas as pd
from adafruit_servokit import ServoKit

# creating a list contaning all joint names according to their channels on the PCA9685
joint_names = ["r_front_hip",
               "r_front_upper",
               "r_front_lower",
               "not connected",
               "r_rear_hip",
               "r_rear_upper",
               "r_rear_lower",
               "not connected",
               "l_front_hip",
               "l_front_upper",
               "l_front_lower",
               "not connected",
               "l_rear_hip",
               "l_rear_upper",
               "l_rear_lower"]

# loading / creating a dataframe for holding the values
path = os.getcwd() + "/data/calibration_values.csv"
df_not_read = True

while df_not_read:
    try:
        df = pd.read_csv(path)
        df_not_read = False
    except:
        df = pd.DataFrame(columns=joint_names)
        df.to_csv(path)

# initializing the PCA 9685
kit = ServoKit(channels=16, address=0x40)
pwm_min = 550
pwm_max = 2400

# starting the calibration
calibration_running = True

while calibration_running:
    channel = int(input("Which channel would you like to set?"))
    print("You are moving " + joint_names[channel])
    kit.servo[channel].set_pulse_width_range(pwm_min, pwm_max)

    min_max_input = input("Would you like to set the min or max value? [min, max]")
    inputs = ["min", "max"]

    if min_max_input not in inputs:
        break

    if min_max_input == "min":
        index = 0
    else:
        index = 1

    servo_active = True
    servo_angle = 0

    while servo_active:
        servo_input = input("Enter an angle Value [q to abord, s to save]")

        if servo_input == "q":
            servo_active = False

        if servo_input == "s":
            df.loc[index, joint_names[channel]] = servo_angle
            df.to_csv("/data/calibration_values.csv")
            servo_active = False
            print("Saving was successful!")

        else:
            try:
                servo_angle = int(servo_input)
                kit.servo[channel].angle = servo_angle
            except:
                print("Something went wrong!")
                break

    continue_input = input("Would you like to calibrate another servo? [y, n]")

    if continue_input == "n":
        calibration_running = False
