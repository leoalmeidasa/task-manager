// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
// app/javascript/packs/application.js
// Importa Turbo e controladores
import "@hotwired/turbo-rails"
import "controllers"

// Importa Popper.js e Bootstrap
import * as Popper from "@popperjs/core"
import * as Bootstrap from "bootstrap"

// Inicializa componentes do Bootstrap (exemplo: tooltips)
document.addEventListener("turbo:load", () => {
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new Bootstrap.Tooltip(tooltipTriggerEl)
    })
})