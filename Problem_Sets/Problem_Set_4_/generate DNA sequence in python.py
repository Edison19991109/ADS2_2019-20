# -*- coding: utf-8 -*-
"""
Created on Sun Oct 13 16:57:48 2019

@author: KANG Jianning
"""

import random
def DNA(length):
    return ''.join(random.choice("A"*2+"C"*3+"G"*3+"T"*2) for _ in range (length))
print(DNA(10))
print(DNA(50))
print(DNA(100))