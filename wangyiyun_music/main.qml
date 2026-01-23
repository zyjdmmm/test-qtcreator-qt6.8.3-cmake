import QtQuick
import QtQuick.Window
import Qt5Compat.GraphicalEffects


import "pages"//为什么只能导入文件夹并只能加入cmake编译???


Window {
    id:window
    width: 1000
    height: 500
    visible: true
    title: qsTr("Hello World")


    /************************************************************/
    //解决窗口无法拖动的问题
    //注意必须放在最前面不然会阻挡后面的按钮
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


    // 设置窗口无边框 + 仅保留最小化/最大化按钮
    flags:Qt.FramelessWindowHint |
          Qt.Window |
          Qt.WindowSystemMenuHint |
          Qt.WindowMaximizeButtonHint |
          Qt.WindowMinimizeButtonHint

    /************************************************************/


    // 左侧区域
    LeftPage{
        id: leftRect
        width: 255
        anchors.top: parent.top
        anchors.bottom: bottomRect.top
        color: "#1a1a21"
    }

    // 右侧区域
    RightPage{
        id: rightRect
        anchors.left: leftRect.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: bottomRect.top
        color: "#13131a"
    }


    // 底部区域
    PlayMusicPage {
        id: bottomRect
        height: 100
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: "#2d2d37"
    }













}
