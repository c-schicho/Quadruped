#!/usr/bin/env python

import math

class LegIK:
    """
    This is a class for performing the leg inverse kinematics for the open-quadruped project.
    You will find further information on my website enabling-intelligence.com or you
    could also write me an email to contact@enabling-intelligence.com.
    """

    def __init__(self, upper, lower, off0, off1):
        self.upper = upper
        self.lower = lower
        self.off0 = off0
        self.off1 = off1


    def get_joint_angles(self, x, y, z):
        joint_angles = []
       # for i in range(4):
        try:
            # Y-Axis
            y += self.off1
            h1 = math.sqrt(z**2 +y**2)
            h2 = math.sqrt(self.off0**2 + self.off1**2)
            b0 = math.atan(y / z)
            b1 = math.atan(self.off1 / self.off0)
            b2 = math.atan(self.off0 / self.off1)
            b3 = math.asin((h2 * math.sin(b2 + math.radians(90))) / h1)
            b4 = math.radians(90) - (b2 + b3)
            b5 = b1 - b4
            z1 = (h2 * math.sin(b4) / math.sin(b3))
            a0 = b0 - b5 # hip angle

            # X-Axis
            h3 = math.sqrt(x**2 + z1**2)
            a1_0 = math.acos((self.upper**2 + z1**2 - self.lower**2) / (2 * self.upper * z1))
            a1_1 = math.acos(z1 / h3)
            if x < 0:
                a1 = a1_0 - a1_1 # shoulder angle
            else:
                a1 = a1_0 + a1_1 # shoulder angle

            # Z-Axis
            a2 = math.acos((self.upper**2 + self.lower**2 - z1**2) / (2 * self.upper * self.lower)) # wrist angle

            for i in range(4):
                joint_angles.append([a0, a1, a2])

        except:
            pass

        return joint_angles


