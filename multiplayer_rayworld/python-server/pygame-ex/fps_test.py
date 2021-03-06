# -*- coding: utf-8 -*-
import pygame

clock = pygame.time.Clock()
minutes = 0
seconds = 0
milliseconds = 0

FPS = 10

while True: #game loop
    #do stuff here
    if milliseconds > 1000:
        seconds += 1
        milliseconds -= 1000
    if seconds > 60:
        minutes += 1
        seconds -= 60

    print ("{}:{}".format(minutes, seconds))

    milliseconds += clock.tick_busy_loop(FPS) #returns the time since the last time we called the function, and limits the frame rate to 60FPS
