
------CODERC-SLO--------
------MENU INVOICE------

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page("html/index.html")

files {
    "html/index.html",
    "html/libraries/axios.min.js",
    "html/libraries/vue.min.js",
    "html/libraries/vuetify.js",
    "html/libraries/vuetify.css",
    "html/style.css",
    "html/script.js"
   
}

server_script "config.lua"
server_script "server.lua"
client_script "client.lua"
client_script "config.lua"