# wttr
A simple Vala app to load http://wttr.in/

As default `./wttr`, will load http://wttr.in/ in a Webview

If you run it with the location as argument `./wttr <location>`, will load that location

## About the code
This code is a modified version of the Vala WebKit Sample code in

https://wiki.gnome.org/Projects/Vala/WebKitSample


## About wttr.in
If you need help finding the location code

https://wttr.in/:help

More info about wttr.in project

https://github.com/chubin/wttr.in

## To build it
`valac --pkg gtk+-3.0 --pkg webkit2gtk-4.0 --thread wttr.vala`
