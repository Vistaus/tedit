import QtQuick 2.0
import "../js/qqr.js" as QRCodeBackend

/*
  QML component wrapper for qqr.js library object (the js library used to generate QR Codes)
*/

Canvas {
    id: canvas
    // background colour to be used
    property color background : "white"
    // foreground colour to be used
    property color foreground : "black"
    // ECC level to be applied (e.g. L, M, Q, H)
    property string level : "L"
    // value to be encoded in the generated QR code
    property string value : ""

    onPaint : {
        var qr = QRCodeBackend.get_qr()
        qr.canvas({
            background : canvas.background,
            canvas : canvas,
            value: canvas.value,
            foreground : canvas.foreground,
            level : canvas.level,
            side : Math.min(canvas.width, canvas.height),
            value : canvas.value
        })        
    }

    onHeightChanged : {
        requestPaint()
    }

    onWidthChanged : {
        requestPaint()
    }

    onBackgroundChanged : {
        requestPaint()
    }

    onForegroundChanged : {
        requestPaint()
    }

    onLevelChanged : {
        requestPaint()
    }

    onValueChanged : {
        requestPaint()
    }
}
