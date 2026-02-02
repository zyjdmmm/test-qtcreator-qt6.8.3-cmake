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

    //第三步：连接
    Connections {
        target: AppSingleton// 指定要监听哪个对象发出的信号
        function onDataChanged(newData) {//加上前缀on再将信号首字母大写
            root.receivedData = newData
            console.log("组件接收到信号:", newData)
        }
    }

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
}
