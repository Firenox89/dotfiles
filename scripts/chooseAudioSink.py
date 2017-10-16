#! /usr/bin/env python

from pulsectl import Pulse
import subprocess

pulse = Pulse('audio-sink-chooser')

sinks = pulse.sink_list()
choices = ""
for sink in sinks:
    choices = choices + sink.description + '\n'

p = subprocess.run(['rofi', '-dmenu'], input=choices, encoding='ascii', stdout=subprocess.PIPE)
choice = str(p.stdout).strip()
choosensink =  next(sink for sink in sinks if sink.description == choice)
pulse.default_set(choosensink)

inputs = pulse.sink_input_list()

for ainput in inputs:
    pulse.sink_input_move(ainput.index, choosensink.index)
