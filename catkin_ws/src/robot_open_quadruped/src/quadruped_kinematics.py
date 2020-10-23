"""
Author: Christopher Schicho
Email: contact@enabling-intelligence.com
"""

"""
This is an program designed to calculate the inverse kinematic of a quadrupedal robot. 
It is based on this paper: https://github.com/c-schicho/robot_open-quadruped/blob/master/docs/inverse_kinematics.pdf by Christopher Schicho.
This paper is a formal describtion of this program. 
"""


#!/usr/bin/env python

import math
import numpy as np
from scipy.spatial.transform import Rotation

class QPKinematics:
    """
    This class is for performing the whole kinematics of a quadruped robot
    """

    def __init__(self, length, width, height, upper, lower, off0, off1):
        """
        args: length, width, height, upper, lower, off0, off1
        """
        self.length = length
        self.width = width
        self.height = height
        self.upper = upper
        self.lower = lower
        self.off0 = off0
        self.off1 = off1

        self.body_model = BodyIK(self.length, self.width, self.height)
        self.leg_model = LegIK(self.upper, self.lower, self.off0, self.off1)


    def qp_joint_angles(self, roll, yaw, pitch):
        """
        args: roll, yaw, pitch
        """
        self.body_model.initial_pose()
        leg_vectors = self.body_model.get_leg_vectors(roll, yaw, pitch)
        joint_angles = self.leg_model.get_joint_angles(leg_vectors)

        return joint_angles



class BodyIK:
    """
    This class is for performing the body kinematics of a quadruped robot.
    """

    def __init__(self, length, width, height):
        """
        args: length, width, height
        Input in mm.
        """
        self.length = length
        self.width = width
        self.height = height

    
    def initial_pose(self):
        """
        Function for returing to the initial pose.
        """

        self.body_points = np.array([[self.length / 2, self.width / 2, self.height],     # right front
                                     [-self.length / 2, self.width / 2, self.height],    # right back
                                     [self.length / 2, -self.width / 2, self.height],    # left front
                                     [-self.length / 2, -self.width / 2, self.height]]   # left back
                                    )

        self.leg_points = np.array([[self.length / 2, self.width / 2, 0],                # right front
                                    [-self.length / 2, self.width / 2, 0],               # right back
                                    [self.length / 2, -self.width / 2, 0],               # left front
                                    [-self.length / 2, -self.width / 2, 0]]              # left back
                                   )
    

    def get_leg_vectors(self, roll, yaw, pitch):
        """
        args: roll, yaw, pitch 
        input: roll, yaw, pitch in degree
        output: leg vectors [4x3]
        """

        # yaw rotation
        yaw = math.radians(yaw)
        rot_axis = np.array([0,0,1])
        rot_vector = yaw * rot_axis
        rotation = Rotation.from_rotvec(rot_vector)
        for i, point in enumerate(self.body_points):
            self.body_points[i] = rotation.apply(point)

        # pitch rotation
        pitch = math.radians(pitch)
        rot_axis = np.array([0,1,0])
        rot_vector = pitch * rot_axis
        rotation = Rotation.from_rotvec(rot_vector)
        for i, point in enumerate(self.body_points):
            self.body_points[i] = rotation.apply(point)

        # roll rotation
        roll = math.radians(roll)
        rot_axis = np.array([1,0,0])
        rot_vector = roll * rot_axis
        rotation = Rotation.from_rotvec(rot_vector)
        for i, point in enumerate(self.body_points):
            self.body_points[i] = rotation.apply(point)

        return np.subtract(self.body_points, self.leg_points)

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


    def transform_cordinate_vector(self, vector):
        for _, (x, y, z) in enumerate(vector):
            leg_vectors = [[x, y, z], [x, y, z], [x, y, z], [x, y, z]]
        return leg_vectors


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


    def get_joint_angles(self, leg_vectors):
        """
        args: leg_vectors (of size 4x3 or 1x3)
        """
        joint_angles = []

        if len(leg_vectors) == 1:
            leg_vectors = self.transform_cordinate_vector(leg_vectors)

        try:
            for i, (x, y, z) in enumerate(leg_vectors): 
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
                    if i == 0 or i == 1:
                        joint_angles.append([a0, a1, a2])

                    # left side
                    a1, a2 = self.get_leg_angles(x, z2)
                    if i == 2 or i == 3:
                        joint_angles.append([a0, a1, a2])

                else:
                    # right side
                    a1, a2 = self.get_leg_angles(x, z2)
                    if i == 0 or i == 1:
                        joint_angles.append([a0, a1, a2])

                    # left side
                    a1, a2 = self.get_leg_angles(x, z1)
                    if i == 2 or i == 3:
                        joint_angles.append([a0, a1, a2])

        except:
            pass

        return joint_angles