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


    //
    Popup {
        id: loginPopup
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

            Image {
                id:closeImg
                // scale: 2
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 15
                anchors.rightMargin: 30
                source: "qrc:/image/close.svg"


                // 只设置一个维度，另一个维度自动等比缩放
                width: 15
                fillMode: Image.PreserveAspectFit  // 核心：等比缩放

                //抗锯齿
                smooth: true
                mipmap: true


                //实现图片高亮(没办法只能用qt5，qt6连ai都没搞明白怎么弄)
                layer.enabled: false
                layer.effect: ColorOverlay {
                    source: closeImg
                    color: "white"
                }

                MouseArea{
                    onClicked: {
                        loginPopup.close()
                    }

                    z:100
                }
            }

            // 标题
            Label {
                id: loginText
                text: "扫码登录"
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 100
                font.bold: true
                font.family: "黑体"
                font.pixelSize: 32
            }
        }






        //第三步：连接
        Connections {
            target: BasicConfig// 指定要监听哪个对象发出的信号
            function onOpenLoginPopup() {//加上前缀on再将信号首字母大写
                loginPopup.open()

            }
        }
    }








}
