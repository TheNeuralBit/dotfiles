#! /usr/bin/python

import os.path

DIR = '/sys/class/backlight/intel_backlight/'
with open(os.path.join(DIR, 'max_brightness')) as f:
    MAX_BRIGHTNESS = float(f.read().strip('\n'))
with open(os.path.join(DIR, 'actual_brightness')) as f:
    BRIGHTNESS = float(f.read().strip('\n'))

print(int(round(BRIGHTNESS*100/MAX_BRIGHTNESS)))
