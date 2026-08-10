from qutebrowser.api import interceptor
config.load_autoconfig()

c.tabs.show = "never"
c.statusbar.show = "never"
c.url.start_pages = ["https://web.whatsapp.com"]

allowed_hosts = {
    "web.whatsapp.com",
    "static.whatsapp.net",
    "media-cgk2-2.cdn.whatsapp.net"
}

def whitelist(request):
    host = request.request_url.host()

    if host not in allowed_hosts:
        request.block()

interceptor.register(whitelist)
c.url.default_page = "https://web.whatsapp.com"
c.auto_save.session = True
