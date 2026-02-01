import QtQuick
import QtQuick.Window
import QtQuick.Controls
import "./basic"
import "./components"

Window {
    id: window
    width: 800
    height: 600
    visible: true
    title: AppSingleton.appName

    Column {
        anchors.centerIn: parent
        spacing: 30

        Text {
            text: "应用名称: " + AppSingleton.appName
            font.pixelSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: "应用版本: " + AppSingleton.appVersion
            font.pixelSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }

        DataReceiver {
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            text: "发送数据到组件"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                AppSingleton.dataChanged("Hello from Button!")
            }
        }
    }
}
