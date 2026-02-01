import QtQuick
import QtQuick.Controls
import "../basic"

Rectangle {
    id: root
    width: 300
    height: 150
    color: "#f0f0f0"
    border.color: "#cccccc"
    border.width: 1
    radius: 8

    property string receivedData: "等待数据..."

    Column {
        anchors.centerIn: parent
        spacing: 10

        Text {
            text: "数据接收组件"
            font.pixelSize: 16
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: "接收到的数据: " + root.receivedData
            font.pixelSize: 14
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Component.onCompleted: {
        AppSingleton.dataChanged.connect(function(newData) {
            root.receivedData = newData
            console.log("组件接收到信号:", newData)
        })
    }

    Component.onDestruction: {
        AppSingleton.dataChanged.disconnect()
    }
}
