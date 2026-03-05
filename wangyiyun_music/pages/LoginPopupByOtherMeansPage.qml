import QtQuick
import QtQuick.Window
import Qt5Compat.GraphicalEffects
import QtQuick.Controls
import QtQuick.Layouts

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

            Rectangle {
                id: countryCodeContainer
                width: 250
                height: 50
                color: "#f5f5f5"
                radius: 25

                // 当前选中的国家码
                property string currentCountryName: "中国"

                RowLayout {
                    anchors.fill: parent
                    spacing: 0

                    // 区号选择区域（可点击）
                    MouseArea {
                        id: countryCodeClickArea
                        Layout.preferredWidth: 100
                        Layout.fillHeight: true
                        cursorShape: Qt.PointingHandCursor

                        Rectangle {
                            anchors.fill: parent
                            color: "transparent"

                            Row {
                                anchors.centerIn: parent
                                spacing: 4

                                Text {
                                    id:currentCountryCodeText
                                    text: "+86"
                                    font.pixelSize: 16
                                    color: "#333333"
                                    verticalAlignment: Text.AlignVCenter
                                }

                                Text {
                                    text: "▼"
                                    font.pixelSize: 12
                                    color: "#666666"
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }


                        }

                        // 点击弹出国家码选择弹窗
                        onClicked: countryCodePopup.open()
                    }

                    // 右侧分隔线
                    Rectangle {
                        width: 1
                        height: parent.height * 0.6
                        color: "#e0e0e0"
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    // 手机号输入框
                    TextField {
                        id: phoneInput
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        placeholderText: "请输入手机号"
                        placeholderTextColor: "#999999"
                        font.pixelSize: 16
                        color: "#333333"
                        background: Item {} // 移除默认背景
                        verticalAlignment: TextInput.AlignVCenter
                        leftPadding: 16
                    }
                }

                // 国家码选择弹窗
                Popup {
                    id: countryCodePopup
                    x: parent.x
                    y: parent.y + parent.height + 10
                    width: parent.width
                    height: 300
                    modal: true
                    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside // 点击任意其他地方关闭这个popup

                    // 背景
                    background: Rectangle {
                        anchors.fill: parent
                        color: "white"
                        radius: 8
                        border.color: "#e0e0e0"
                        border.width: 1
                    }

                    // 弹窗内容
                    Column {
                        anchors.fill: parent

                        // 弹窗标题
                        Text {
                            id: popupTitle
                            text: "选择国家/地区"
                            font.pixelSize: 18
                            font.bold: true
                            color: "#333333"
                            anchors.left: parent.left
                            anchors.margins: 16
                            height: 40
                        }

                        // 国家码列表（使用Column布局）
                        ListView {
                            id: countryCodeList
                            anchors.top: popupTitle.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            anchors.margins: 16
                            clip: true

                            // 模拟国家码数据
                            model: ListModel {
                                ListElement { countryName: "中国"; countryCode: "+86" }
                                ListElement { countryName: "中国香港"; countryCode: "+852" }
                                ListElement { countryName: "中国台湾"; countryCode: "+886" }
                                ListElement { countryName: "美国"; countryCode: "+1" }
                                ListElement { countryName: "英国"; countryCode: "+44" }
                                ListElement { countryName: "日本"; countryCode: "+81" }
                                ListElement { countryName: "韩国"; countryCode: "+82" }
                            }

                            // 列表项（使用Row布局）
                            delegate: Item {
                                width: parent.width
                                height: 48

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        // 更新选中的国家码
                                        currentCountryCodeText.text = countryCode
                                        countryCodeContainer.currentCountryName = countryName
                                        // 关闭弹窗
                                        countryCodePopup.close()
                                    }

                                    // 列表项内容（Row布局）
                                    Row {
                                        anchors.fill: parent
                                        spacing: 8

                                        // 国家名称
                                        Text {
                                            text: countryName
                                            font.pixelSize: 16
                                            color: "#333333"
                                            anchors.verticalCenter: parent.verticalCenter
                                        }

                                        // 国家码（靠右显示）
                                        Text {
                                            text: countryCode
                                            font.pixelSize: 16
                                            color: "#666666"
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.right: parent.right
                                            rightPadding: 20
                                        }

                                        // 选中状态指示器
                                        Rectangle {
                                            width: 20
                                            height: 20
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.right: parent.right
                                            visible: (countryCode === currentCountryCodeText.text)

                                            Text {
                                                text: "✓"
                                                font.pixelSize: 16
                                                color: "#0088ff"
                                                anchors.centerIn: parent
                                            }
                                        }
                                    }

                                    // 分隔线
                                    Rectangle {
                                        width: parent.width
                                        height: 1
                                        color: "#f0f0f0"
                                        anchors.bottom: parent.bottom
                                    }
                                }
                            }
                        }
                    }
                }
            }


        }


    }
}


