from gi.repository import Gtk, GLib
from gi.repository import WebKit

class  ReloadView:
    def __init__(self):
        window = Gtk.Window()
        window.connect('delete-event',Gtk.main_quit)

        self.view = WebKit.WebView()
        self.view.load_uri('http://example.net')
        GLib.timeout_add_seconds(5, self.reload) #every 5 seconds

        window.add(self.view)
        window.fullscreen()
        window.show_all()

    def reload(self):
        self.view.reload()
        #self.view.reload_bypass_cache() for complete reload
        return True

if __name__ == "__main__":
    ReloadView()
    Gtk.main()
