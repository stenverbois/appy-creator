/**
 * Created by thierryderuyttere on 22/08/15.
 */


(function($){
    $.fn.createQR = function(id){
        var new_image = new Image();

        // Set image source
        new_image.src = "/static/appy.png";

        $(this).qrcode({
            // render method: 'canvas', 'image' or 'div'
            render: 'canvas',

            // version range somewhere in 1 .. 40
            minVersion: 1,
            maxVersion: 40,

            // error correction level: 'L', 'M', 'Q' or 'H'
            ecLevel: 'L',

            // offset in pixel if drawn onto existing canvas
            left: 0,
            top: 0,

            // size in pixel
            size: 300,

            // code color or image element
            fill: '#000',

            // background color or image element, null for transparent background
            background: null,

            // content
            text: id,

            // corner radius relative to module width: 0.0 .. 0.5
            radius: 0,

            // quiet zone in modules
            quiet: 0,

            mode: 4,
            mSize: 0.2,
            mPosX: 0.5,
            mPosY: 0.5,
            image: new_image

        });
    };
})(jQuery);


$(document).ready(function(){
    // How to use
    $('#test').createQR('2fd4e1c67a2d28fced849ee1bb76e7391b93eb12');

});
