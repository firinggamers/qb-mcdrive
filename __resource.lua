

------MENU INVOICE------

fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'firinggamers'
description 'mccdrive script and job for qbus'

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
