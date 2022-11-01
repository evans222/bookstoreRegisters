import win32gui
import pyautogui

def get_pixel_colour(i_x, i_y):
	i_desktop_window_id = win32gui.GetDesktopWindow()
	i_desktop_window_dc = win32gui.GetWindowDC(i_desktop_window_id)
	long_colour = win32gui.GetPixel(i_desktop_window_dc, i_x, i_y)
	i_colour = int(long_colour)
	win32gui.ReleaseDC(i_desktop_window_id,i_desktop_window_dc)
	return (i_colour & 0xff), ((i_colour >> 8) & 0xff), ((i_colour >> 16) & 0xff)

print("press Ctrl+C to quit")
colorText = ""
avgNoRed = 200
avgNoGreen = 200
avgNoBlue = 200

try:
    while True:
        x, y = pyautogui.position()
        a, b, c = get_pixel_colour(x, y)
        avgNoGreen = (a + c) / 2
        avgNoBlue = (a + b) / 2
        avgNoRed = (b + c) / 2

        if (abs(a - c) < 150) and (b > (avgNoGreen + 35)) and (a < b) and (c < b):
            colorText += "green"
        if (abs(a - b) < 150) and (c > (avgNoBlue + 35)) and (a < c) and (b < c):
            colorText += "blue"
        if (abs(b - c) < 150) and (a > (avgNoRed + 35)) and (c < a) and (b < a):
            colorText += "red"

            #there should be no overlap between colors, i.e. "bluered" should not show up
        positionStr = colorText + ' X: ' + str(x).rjust(4) + ' Y: ' + str(y).rjust(4) + ' color: ' + str(a).rjust(3) + ', ' + str(b).rjust(3) + ', ' + str(c).rjust(3)
        print(positionStr, end='')
        print('\b' * len(positionStr), end='', flush=True)
        colorText = ""

except KeyboardInterrupt:
    print()
    