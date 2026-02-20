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


    LoginPopupPage{
        id: loginPopup


        //第三步：连接
        //注意：感觉实例化后只能放在外面了
        Connections {
            target: BasicConfig// 指定要监听哪个对象发出的信号
            function onOpenLoginPopup() {//加上前缀on再将信号首字母大写
                loginPopup.open()

            }
        }

    }

    LoginPopupByOtherMeansPage{
        id:loginPopupByOtherMeansPage

    }





}
