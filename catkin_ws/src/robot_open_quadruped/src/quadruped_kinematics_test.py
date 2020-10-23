"""
Author: Christopher Schicho
Email: contact@enabling-intelligence.com
"""


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


    def get_leg_angles(self, x, z0):
        # X-Axis
        h3 = math.sqrt(x**2 + z0**2)
        a1_1 = math.acos((self.upper**2 + z0**2 - self.lower**2) / (2 * self.upper * z0))
        a1_2 = math.acos(z0 / h3)
        if x < 0:
            a1 = a1_1 - a1_2 # shoulder angle
        else:
            a1 = a1_1 + a1_2 # shoulder angle  

        # Z-Axis
        a2 = math.acos((self.upper**2 + self.lower**2 - z0**2) / (2 * self.upper * self.lower)) # wrist angle   

        return a1, a2




    def get_joint_angles(self, x, y, z):
        joint_angles = []
       # for i in range(4):
        try:
            # Y-Axis
            y += self.off1
            h2 = math.sqrt(z**2 +y**2)
            h3 = math.sqrt(self.off0**2 + self.off1**2)
            b0 = math.atan(y / z)
            b1 = math.atan(self.off1 / self.off0)
            b2 = math.atan(self.off0 / self.off1)
            b3 = math.asin((h3 * math.sin(b2 + math.radians(90))) / h2)
            b4 = math.radians(90) - (b2 + b3)
            b5 = b1 - b4
            a0 = b0 - b5 # hip angle
            b6 = 90 - (b1 - a0)
            b7 = 90 - b6
            b8 = 90 - (b6 + b7)
            off2 = h3 * math.cos(b7)
            z1 = (h3 * math.sin(b4) / math.sin(b3))
            z2 = ((z - off2) / math.cos(b8))

            if y < 0:
                # right side
                a1, a2 = self.get_leg_angles(x, z1)
                for i in range(2):
                    joint_angles.append([a0, a1, a2])

                # left side
                a1, a2 = self.get_leg_angles(x, z2)
                for i in range(2):
                    joint_angles.append([a0, a1, a2])

            else:
                # right side
                a1, a2 = self.get_leg_angles(x, z2)
                for i in range(2):
                    joint_angles.append([a0, a1, a2])

                # left side
                a1, a2 = self.get_leg_angles(x, z1)
                for i in range(2):
                    joint_angles.append([a0, a1, a2])

        except:
            pass

        return joint_angles



#if __name__ == "__main__":
#    leg = LegIK(109.868, 144.580, 11.369, 63.763)
#    print(leg.get_joint_angles(0,0,150))