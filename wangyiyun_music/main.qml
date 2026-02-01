import QtQuick
import QtQuick.Window
import Qt5Compat.GraphicalEffects
import QtQuick.Controls


import "pages"//为什么只能导入文件夹并只能加入cmake编译???
import "./basic"

AGiaoMusicMainWindows {
    id:window
    width: 1000
    height: 500

    Connections{
        target:BasicConfig
        function onOpenLoginPopup(){
            loginPopup.open()
        }

    }

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


    //
    Popup {
        id: loginPopup
        anchors.centerIn: parent
        width: 466
        height: 638
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










}
