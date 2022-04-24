import gi, requests as req
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk

weatherResponse = req.get('http://wttr.in/?0?q?T')
#weatherResponse = req.get('http://wttr.in/?0?q')

class weatherWindow(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="Weather from wttr.in")
        hbox = Gtk.Box(spacing=5)
        label = Gtk.Label()
        label.set_markup(weatherResponse.text)
        hbox.pack_start(label, True, True, 5)
        self.add(hbox)

window = weatherWindow()        
window.resize(300,150)
window.connect("destroy", Gtk.main_quit)
window.show_all()
Gtk.main()