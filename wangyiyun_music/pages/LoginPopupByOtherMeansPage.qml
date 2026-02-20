import QtQuick
import QtQuick.Window
import Qt5Compat.GraphicalEffects
import QtQuick.Controls


Popup {
    anchors.centerIn: parent
    width: 300
    height: 400
    clip: true
    closePolicy: Popup.NoAutoClose
    background: Rectangle {
        anchors.fill: parent
        color: "#1b1b23"
        radius: 10
        border.width: 1
        border.color: "#75777f"



    }
}

