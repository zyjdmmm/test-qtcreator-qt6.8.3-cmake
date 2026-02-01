import QtQuick
import QtQuick.Window
import QtQuick.Controls
import "./basic"

Window {
    id: window
    width: 800
    height: 600
    visible: true
    title: AppSingleton.appName

    Column {
        anchors.centerIn: parent
        spacing: 20

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

        Button {
            text: "点击调用单例方法"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                AppSingleton.showMessage("按钮被点击了！")
            }
        }
    }
}
