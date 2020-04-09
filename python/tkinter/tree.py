from tkinter import *
from tkinter import ttk


class app():

    def __init__(self, parent = None):
        print('creating new one with ' + str(parent))

        self.parent = parent
        self.root = Tk()
        self.root.title("Recursive")
        self.alive = True
        
        mainframe = ttk.Frame(self.root, padding="3 3 12 12")
        mainframe.grid(column = 0, row = 0, sticky=(N,W,E,S))
        mainframe.columnconfigure(0, weight = 1)
        mainframe.rowconfigure(0, weight = 1)

        ttk.Button(
            mainframe,
            text = "New one",
            command = self.newone
        ).grid(
            column = 1, row = 1, sticky = W
        )

        ttk.Button(
            mainframe,
            text = "Quit",
            command = self.quit
        ).grid(
            column = 1, row = 2, sticky = W
        )


        # self.root.bind('<Return>', self.newone)


    def quit(self):
        print('quit ' + '-' * 80)        
        if self.parent and self.parent.alive:
            print("self root: {}\t paretn root: {}".format(str(self.root), str(self.parent.root)))

            self.parent.quit()
        self.alive = False
        self.root.destroy()
        
    
    def newone(self):
        x = app(self)
        x.run()

    def run(self):

        self.root.mainloop()

x = app()
x.run()
