import tkinter
import keyboard
import win32gui
import pyautogui
import time

spacebarContinue = 'press the spacebar to continue...'
step1 = False
step2 = False
step3 = False
step4 = False
#x, y = pyautogui.position()
def wait_for_key(key):
    while True:
        if keyboard.is_pressed(key):
            return

#main calibration
def calibrate_main(event):
    wait_for_key('Space')
    instruction_label.config(text = event.char)

def test_function():
    while True:
        instruction_label.config(text='Yes')
        time.sleep(1)
        instruction_label.config(text='No')
        time.sleep(1)
#initial GUI setup
root = tkinter.Tk()

instruction_label = tkinter.Label(root, text = 'Start with the POS signed out')
key_label = tkinter.Label(root, text = spacebarContinue)
root.title('Calibration Wizard')
root.geometry("300x200+10+20")

instruction_label.pack()
key_label.pack()
#root.bind("c", calibrate_main)

#root.after(50, test_function)
root.mainloop()
wait_for_key('Space')
input()



