window.jQuery = require("jquery")
window.$ = require("jquery")

require("jquery-qrcode")
require("../../../../lib/qr-code/qrcode_generator.js")

$("#qr").createQR("test")
