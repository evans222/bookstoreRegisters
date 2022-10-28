import win32gui
import pyautogui

def get_pixel_colour(i_x, i_y):
	i_desktop_window_id = win32gui.GetDesktopWindow()
	i_desktop_window_dc = win32gui.GetWindowDC(i_desktop_window_id)
	long_colour = win32gui.GetPixel(i_desktop_window_dc, i_x, i_y)
	i_colour = int(long_colour)
	win32gui.ReleaseDC(i_desktop_window_id,i_desktop_window_dc)
	return (i_colour & 0xff), ((i_colour >> 8) & 0xff), ((i_colour >> 16) & 0xff)
    
def select_credit_card(timeout):
    stopTime = time.time() + timeout
    while time.time() < stopTime: #start of the actual card selection
        a = 1
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
    