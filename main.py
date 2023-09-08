import time
import win32gui
import pyautogui
import keyboard

def get_pixel_colour(i_x, i_y):
	i_desktop_window_id = win32gui.GetDesktopWindow()
	i_desktop_window_dc = win32gui.GetWindowDC(i_desktop_window_id)
	long_colour = win32gui.GetPixel(i_desktop_window_dc, i_x, i_y)
	i_colour = int(long_colour)
	win32gui.ReleaseDC(i_desktop_window_id,i_desktop_window_dc)
	return (i_colour & 0xff), ((i_colour >> 8) & 0xff), ((i_colour >> 16) & 0xff)
    
def wait_for_color(x, y, r, g, b, stopTime): #takes x/y coordinates, r/g/b value to look for, stopTime
    while time.time() < stopTime:
        a, b, c = get_pixel_colour(x, y)
        if (a == r and b == g and c == b):
            return

    """
    ---Alternative method, needs refining, but add colorToFind at function declaration if using---

    colorFound
    while True:
        a, b, c = get_pixel_colour(x, y)
        if (abs(a - c) < 150) and (a < b) and (c < b):
            colorFound = "green"
        if (abs(a - b) < 150) and (a < c) and (b < c):
            colorFound = "blue"
        if (abs(b - c) < 150) and (c < a) and (b < a):
            colorFound = "red"
        if (colorToFind == colorFound):
            return
    """

def select_credit_card(timeout):
    stopTime = time.time() + timeout
    while time.time() < stopTime: #start of the actual card selection
        wait_for_color(1888, 165, 19, 12, 105, stopTime) #blue value is 105 for front registers, but 106 at stadium registers. NEED A CALIBRATION MODULE
        
    print("done with the while loop")
    
try:
    while True:
        if (keyboard.is_pressed('home')):
            select_credit_card(5)
        """
        x, y = pyautogui.position()
        a, b, c = get_pixel_colour(x, y)
        positionStr = 'X: ' + str(x).rjust(4) + ' Y: ' + str(y).rjust(4) + ' color: ' + str(a).rjust(3) + ', ' + str(b).rjust(3) + ', ' + str(c).rjust(3)
        print(positionStr, end='')
        print('\b' * len(positionStr), end='', flush=True)
        """
except KeyboardInterrupt: 
    print("Done")
    