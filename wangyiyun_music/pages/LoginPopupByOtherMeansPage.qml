import QtQuick
import QtQuick.Window
import Qt5Compat.GraphicalEffects
import QtQuick.Controls
import "../basic"

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

        Row {
            id: titleRowItems
            spacing: 10
            anchors.topMargin: 50
            anchors.leftMargin: 60
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                source: "qrc:/image/logo.svg"

                // 只设置一个维度，另一个维度自动等比缩放
                width: 40
                fillMode: Image.PreserveAspectFit  // 核心：等比缩放

                //抗锯齿
                smooth: true
                mipmap: true
            }

            Label {
                color: "white"
                font.bold: true
                text: "啊giao音乐"
                font.pixelSize: 32
                font.family: BasicConfig.commonFont
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Column {
            id: loginColumnItems
            anchors.top: titleRowItems.bottom
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter

            TextField {
                id: telNumberTextField
                width: 250
                height: 30
                font.pixelSize: height/2
                font.family: BasicConfig.commFont
                color: BasicConfig.fieldTextColor
                placeholderText: "请输入手机号"
                placeholderTextColor: BasicConfig.defaultFontNormalColor
                verticalAlignment: Text.AlignVCenter
                // leftPadding:60

                background: Rectangle {
                    anchors.fill: parent
                    radius: telNumberTextField.height/2
                    color: BasicConfig.fieldBgColor
                    border.width: 1
                    border.color: telNumberTextField.focus?BasicConfig.fieldBgColor:BasicConfig.fieldBgColor


                    Item {
                        id: countryTelTextItem
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        width: telNumberTextField.leftPadding

                        Row {
                            anchors.centerIn: parent
                            spacing: 10

                            Label {
                                id: countryTelNumText
                                text: "+86"
                                color: "white"
                                font.bold: true
                                font.pixelSize: 20
                                font.family: BasicConfig.commFont
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            Label {
                                id: arrowLabel
                                text: ">"
                                color: "white"
                                rotation: 90
                                font.bold: true
                                font.pixelSize: 20
                                font.family: BasicConfig.commFont
                                anchors.verticalCenter: parent.verticalCenter
                            }

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
                                    telDataSipPop.open()
                                }
                            }
                        }

                        Popup{
                            id:telDatasPop
                            width: telNumberTextField.height
                            y: telNumberTextField.height+5
                            height: 370
                            background: Rectangle{//美化





                            }



                        }
                    }
                }
            }
        }


    }
}

