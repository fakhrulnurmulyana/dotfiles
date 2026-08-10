from qutebrowser.api import interceptor
config.load_autoconfig()

c.statusbar.show = "never"
c.url.start_pages = ["https://github.com"]

allowed_hosts = {
    "github.com",
    "www.github.com",

    "github.githubassets.com",
    "images.ctfassets.net",
    "avatars.githubusercontent.com",

    "ollama.com",
    "www.ollama.com",

    "huggingface.co",
    "www.huggingface.co",
    "hf.co",
}

def whitelist(request):
    host = request.request_url.host()

    if host not in allowed_hosts:
        request.block()

interceptor.register(whitelist)
c.url.default_page = "https://github.com"
c.auto_save.session = True
