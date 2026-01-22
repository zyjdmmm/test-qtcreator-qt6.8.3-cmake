import QtQuick
import QtQuick.Window

Window {
    id:window
    width: 1000
    height: 500
    visible: true
    title: qsTr("Hello World")

    // 设置窗口无边框 + 仅保留最小化/最大化按钮
    flags:Qt.FramelessWindowHint |
          Qt.Window |
          Qt.WindowSystemMenuHint |
          Qt.WindowMaximizeButtonHint |
          Qt.WindowMinimizeButtonHint

    // 左侧区域
    Rectangle {
        id: leftRect
        width: 255
        anchors.top: parent.top
        anchors.bottom: bottomRect.top
        color: "#1a1a21"
    }

    // 右侧区域
    Rectangle {
        id: rightRect
        anchors.left: leftRect.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: bottomRect.top
        color: "#13131a"
    }

    // 底部区域
    Rectangle {
        id: bottomRect
        height: 100
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: "#2d2d37"
    }


    //解决窗口无法拖动的问题
    MouseArea {
        anchors.fill: parent
        property point clickPos: "0,0"  // int real string var point ListModel

        // function(mouse) 可以不写但是报错warning，要求显示传递参数，mouse是系统提供的
        onPressed: function(mouse) {
            clickPos = Qt.point(mouse.x, mouse.y)//必须写上Qt.

        }

        // 鼠标移动时计算偏移并更新窗口位置
        onPositionChanged: function(mouse) {
            // 计算鼠标移动的偏移量
            let delta = Qt.point(mouse.x - clickPos.x, mouse.y - clickPos.y)
            // 移动窗口
            window.x += delta.x
            window.y += delta.y
        }
    }

}
