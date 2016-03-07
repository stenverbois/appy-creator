<style lang="scss">
@import "./../../style/custom/variables.scss";

canvas {
  padding-left: 0;
  padding-right: 0;
  margin-left: auto;
  margin-right: auto;
  display: block !important;
}
</style>

<template>
  <div id="qr"></div>
</template>

<script lang="coffee">
require 'qrcode'
module.exports =
  methods:
    renderQR: (url) ->
      new_image = new Image()
      new_image.src = require './../../assets/appy.png'
      new_image.onload = =>
        $('#qr').qrcode
          # render method: 'canvas', 'image' or 'div'
          render: 'canvas'

          # version range somewhere in 1 .. 40
          minVersion: 1
          maxVersion: 40

          # error correction level: 'L', 'M', 'Q' or 'H'
          ecLevel: 'H'

          # offset in pixels if drawn onto existing canvas
          left: 0
          top: 0

          # size in pixels
          size: 300

          # code color or image element
          fill: '#000'

          # background color or image element, null for transparent background
          background: null

          # content
          text: url

          # corner radius relative to module width: 0.0 .. 0.5
          radius: 0

          # quiet zone in modules
          quiet: 0

          mode: 4
          mSize: 0.2
          mPosX: 0.5
          mPosY: 0.5
          image: new_image

</script>
