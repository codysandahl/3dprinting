import board
from digitalio import DigitalInOut, Direction
import adafruit_dotstar as dotstar
import time
import neopixel
import random

# setup onboard pixel
dot = dotstar.DotStar(board.APA102_SCK, board.APA102_MOSI, 1, brightness=0.2)
dot[0] = (0, 0, 0)

# setup built-in red LED
led = DigitalInOut(board.D13)
led.direction = Direction.OUTPUT
led.value = False

# NeoPixel strip connected on D4
NUMPIXELS = 8
PIXEL_ORDER = neopixel.GRB # different boards take RGB or GRB
BRIGHTNESS = 0.1
neopixels = neopixel.NeoPixel(board.D4, NUMPIXELS, brightness=BRIGHTNESS, auto_write=False, pixel_order=PIXEL_ORDER)

# program state
timeToChangeColor = 5.0 # sec to pause between color changes
lastColorChange = 0
timeToInterpolateColor = 1.0 # sec to interpolate between old and new color values
isInterpolating = False
oldColor = (0, 0, 0)
color = (255, 127, 0)
useSingleColor = False # set to False to randomly switch colors

######################### MAIN LOOP ##############################

if useSingleColor:
    for p in range(NUMPIXELS):
        neopixels[p] = color
    neopixels.show()

i = 0
while not useSingleColor:
    # get current time
    curTime = time.monotonic()
    # time to change colors?
    if lastColorChange == 0 or curTime - lastColorChange >= timeToChangeColor:
        # save time of change
        lastColorChange = curTime
        isInterpolating = True
        # save old color
        oldColor = color
        # set random color for this loop
        color = (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))
    # interpolating color?
    if isInterpolating:
        interpolation = (curTime - lastColorChange) / timeToInterpolateColor
        if (interpolation >= 1.0):
            interpolation = 1.0
            isInterpolating = False
        # set each pixel color
        for p in range(NUMPIXELS):
            interRed = int(oldColor[0] + (color[0] - oldColor[0]) * interpolation)
            interGreen = int(oldColor[1] + (color[1] - oldColor[1]) * interpolation)
            interBlue = int(oldColor[2] + (color[2] - oldColor[2]) * interpolation)
            neopixels[p] = (interRed, interGreen, interBlue)
        neopixels.show()
