import QtQuick
import QtQuick.Window
import Qt5Compat.GraphicalEffects
import QtQuick.Controls


Popup {
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

        Image{
            id:qrcode
            x:190
            y:180
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 10
            anchors.topMargin: 10

            source: "qrc:/image/qrcode.svg"


            // // 只设置一个维度，另一个维度自动等比缩放
            width: 100
            fillMode: Image.PreserveAspectFit  // 核心：等比缩放

            //抗锯齿
            smooth: true
            mipmap: true

            MouseArea{
                anchors.left: parent.left
                anchors.top: parent.top
                width: 50
                height: 50
                hoverEnabled: true

                onEntered: {
                    cursorShape =Qt.PointingHandCursor

                }
                onExited: {
                    cursorShape =Qt.ArrowCursor
                }
                onClicked: {
                    loginPopupByOtherMeansPage.close()
                    loginPopup.open()
                }

            }
        }

        Canvas {
            id: canvas
            anchors.fill: parent
            onPaint: {
                let ctx = canvas.getContext("2d")
                ctx.beginPath()
                ctx.moveTo(110, 1)
                ctx.lineTo(1, 110)
                ctx.lineTo(110, 110)
                ctx.lineTo(110, 1)
                ctx.fillStyle = "#1b1b23"
                ctx.fill()
            }
        }

        //关闭按钮
        Image {
            id:closeImg
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 20
            anchors.rightMargin: 20


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
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onEntered: {
                    closeImg.layer.enabled = true
                }
                onExited: {
                    closeImg.layer.enabled = false
                }
                onClicked: {
                    loginPopupByOtherMeansPage.close()
                }
            }



        }


    }
}

