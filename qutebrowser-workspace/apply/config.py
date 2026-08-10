from qutebrowser.api import interceptor
config.load_autoconfig()

c.url.start_pages = ["glints.com"]

allowed_hosts = {
    "glints.com",
    "fonts.googleapis.com",
    "fonts.gstatic.com",
    "images.glints.com",
}

def whitelist(request):
    host = request.request_url.host()

    if host not in allowed_hosts:
        request.block()

interceptor.register(whitelist)
c.url.default_page = "glints.com"
c.auto_save.session = True
