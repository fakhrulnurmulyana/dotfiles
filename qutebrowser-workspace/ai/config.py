from qutebrowser.api import interceptor
config.load_autoconfig()

c.statusbar.show = "never"
c.url.start_pages = ["chatgpt.com"]

allowed_hosts = {
    "gemini.google.com",
    "fonts.gstatic.com",
    "gemini.gstatic.com",
    "www.google.com",
    "www.gstatic.com",

    "chatgpt.com",
    "accounts.google.com",
    "www.google.com",
}

def whitelist(request):
    host = request.request_url.host()

    if host not in allowed_hosts:
        request.block()

interceptor.register(whitelist)
c.url.default_page = "chatgpt.com"
c.auto_save.session = True
