using Gtk;
using WebKit;

public class ValaBrowser : Window {

    private const string TITLE = "WTTR";
    private const string DEFAULT_URL = "http://wttr.in";
    private const string STATUS_LABEL = "wttr.in";

    private Regex protocol_regex;

    private WebView web_view;
    private Label status_bar;

    public ValaBrowser () {
        this.title = ValaBrowser.TITLE;
        this.window_position = WindowPosition.CENTER;
        this.set_default_size(900, 600);

        try {
            this.protocol_regex = new Regex (".*://.*");
        } catch (RegexError e) {
            critical ("%s", e.message);
        }

        create_widgets ();
        connect_signals ();
    }

    private void create_widgets () {

        this.web_view = new WebView ();
        var scrolled_window = new ScrolledWindow (null, null);
        scrolled_window.set_policy (PolicyType.AUTOMATIC, PolicyType.AUTOMATIC);
        scrolled_window.add (this.web_view);
        this.status_bar = new Label (STATUS_LABEL);
        this.status_bar.xalign = 0;
        var box = new Box (Gtk.Orientation.VERTICAL, 0);
        box.pack_start (scrolled_window, true, true, 0);
        box.pack_start (this.status_bar, false, true, 0);
        add (box);
    }

    private void connect_signals () {
        this.destroy.connect (Gtk.main_quit);
    }

    public void start (string URL="") {
        show_all ();
        if (URL != "") {
            this.web_view.load_uri (DEFAULT_URL + "/" + URL);
            
        }else {
            this.web_view.load_uri (DEFAULT_URL);
        }
    }

    public static int main (string[] args) {
        Gtk.init (ref args);

        var browser = new ValaBrowser ();
        if (args.length < 2) {
            browser.start ();
        }else {
            browser.start (args[1]);
        }

        Gtk.main ();

        return 0;
    }
}