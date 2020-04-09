from tkinter import Tk
from tkinter import ttk

def newone():

    root = Tk()
    root.title("hello world")
    ttk.Button(root, text="hello button?").grid()
    root.mainloop()

    
newone()
newone()
