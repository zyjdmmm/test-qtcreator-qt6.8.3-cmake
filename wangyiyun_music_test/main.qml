import QtQuick
import QtQuick.Window
import QtQuick.Controls


Window {
    id: window
    width: 800
    height: 600
    visible: true
    // title: AppSingleton.appName

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            text: "helloworld"
            font.pixelSize: 32
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            text: "Click Me"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Image {
            source: "qrc:/galaxy.png"
            // width: 100
            // height: 100
            scale:0.1
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Image {
            source: "qrc:/test.svg"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}




