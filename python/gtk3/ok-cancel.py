import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, GObject

class EntryWindow(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="Test Demo")
        self.set_size_request(800, 100)

        self.set_position(Gtk.WindowPosition.CENTER)
        self.timeout_id = None

        vbox = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=6)
        self.add(vbox)

        self.entry = Gtk.Entry()
        self.entry.set_text("Introduzca texto...")
        vbox.pack_start(self.entry, True, True, 0)

        hbox = Gtk.Box(spacing=6)
        vbox.pack_start(hbox, True, True, 0)
        
        self.ok_button = Gtk.Button("Ok")
        self.ok_button.connect("clicked", self.on_click_run)
        hbox.pack_start(self.ok_button, True, True, 0)

        self.salir_button = Gtk.Button("Salir")
        self.salir_button.connect("clicked", self.on_click_exit)
        hbox.pack_start(self.salir_button, True, True, 0)

        
    def on_click_run(self, button):
        print (self.entry.get_text())

    def on_click_exit(self, button):
        Gtk.main_quit()

win = EntryWindow()
win.connect("delete-event", Gtk.main_quit)
win.show_all()
Gtk.main()
