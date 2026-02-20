import QtQuick
import QtQuick.Window
import Qt5Compat.GraphicalEffects
import QtQuick.Controls

//
Popup {
    anchors.centerIn: parent
    width: 300
    height: 400
    clip: true
    closePolicy: Popup.NoAutoClose

    onOpened:{
        showAnimation.onlyShowQrcodeFlag=false
        showAnimation.start()
    }

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
                anchors.fill: parent
                hoverEnabled: true//必须有这句，强制接收鼠标事件
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
            anchors.topMargin: 50
            font.bold: true
            font.family: "黑体"
            font.pixelSize: 32
        }

        Image{
            id:galaxy
            x:15
            y:132
            source: "qrc:/image/galaxy.png"


            // 只设置一个维度，另一个维度自动等比缩放
            width: 160
            fillMode: Image.PreserveAspectFit  // 核心：等比缩放

            //抗锯齿
            smooth: true
            mipmap: true
       }

        Image{
            id:qrcode
            x:190
            y:180

            source: "qrc:/image/qrcode.svg"


            // // 只设置一个维度，另一个维度自动等比缩放
            width: 100
            fillMode: Image.PreserveAspectFit  // 核心：等比缩放

            //抗锯齿
            smooth: true
            mipmap: true

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    showAnimation.onlyShowQrcodeFlag=true
                    showAnimation.start()
                }
                onExited:{
                    showAnimation.onlyShowQrcodeFlag=false
                    showAnimation.start()
                }
            }


       }

        ParallelAnimation{
            id:showAnimation
            property bool onlyShowQrcodeFlag: true

            //galaxy
            NumberAnimation {
                target: galaxy
                property: "x"
                duration: 500
                from:showAnimation.onlyShowQrcodeFlag?15:200
                to:showAnimation.onlyShowQrcodeFlag?200:15
            }

            NumberAnimation {
                target: galaxy
                property: "y"
                duration: 500
                from:showAnimation.onlyShowQrcodeFlag?132:0
                to:showAnimation.onlyShowQrcodeFlag?0:132
            }
            NumberAnimation {
                target: galaxy
                property: "opacity"
                duration: 500
                from:showAnimation.onlyShowQrcodeFlag?1:0
                to:showAnimation.onlyShowQrcodeFlag?0:1
            }

            // qrcode
            NumberAnimation {
                target: qrcode
                property: "x"
                duration: 500
                from:showAnimation.onlyShowQrcodeFlag?190:50
                to:showAnimation.onlyShowQrcodeFlag?50:190
            }
            NumberAnimation {
                target: qrcode
                property: "y"
                duration: 500
                from:showAnimation.onlyShowQrcodeFlag?180:100
                to:showAnimation.onlyShowQrcodeFlag?100:180
            }
            NumberAnimation {
                target: qrcode
                property: "width"
                duration: 500
                from:showAnimation.onlyShowQrcodeFlag?100:200
                to:showAnimation.onlyShowQrcodeFlag?200:100
            }


        }


        Text {
            color: "#75777f"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            text: "选择其他方式登录 >"
            font.pixelSize: 20
            // font.family: BasicConfig.commFont

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    cursorShape = Qt.PointingHandCursor
                }
                onExited: {
                    cursorShape = Qt.ArrowCursor
                }
                onClicked: {
                    // 这里可以添加点击事件处理逻辑
                    loginPopup.close()
                    loginPopupByOtherMeansPage.open()
                }
            }
        }

        // //关闭按钮
        // Image {
        //     id:closeImg1
        //     anchors.top: parent.top
        //     anchors.right: parent.right
        //     anchors.topMargin: 20
        //     anchors.rightMargin: 20


        //     source: "qrc:/image/close.svg"

        //     // 只设置一个维度，另一个维度自动等比缩放
        //     width: 15
        //     fillMode: Image.PreserveAspectFit  // 核心：等比缩放

        //     //抗锯齿
        //     smooth: true
        //     mipmap: true

        //     //实现图片高亮(没办法只能用qt5，qt6连ai都没搞明白怎么弄)
        //     layer.enabled: false
        //     layer.effect: ColorOverlay {
        //         source: closeImg
        //         color: "white"
        //     }
        //     MouseArea {
        //         anchors.fill: parent
        //         hoverEnabled: true

        //         onEntered: {
        //             closeImg.layer.enabled = true
        //         }
        //         onExited: {
        //             closeImg.layer.enabled = false
        //         }
        //         onClicked: {
        //             loginPopupByOtherMeansPage.close()
        //         }
        //     }



        // }


    }







}
