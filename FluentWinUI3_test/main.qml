import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.FluentWinUI3

Window {
    id: window
    width: 1200
    height: 800
    visible: true
    title: qsTr("FluentWinUI3 组件测试 - 粉色系")
    color: "#FFF0F5"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 30
        spacing: 30

        Text {
            text: qsTr("FluentWinUI3 组件测试")
            font.pixelSize: 28
            font.bold: true
            color: "#FF6B9D"
            Layout.alignment: Qt.AlignHCenter
        }

        Frame {
            Layout.fillWidth: true
            Layout.preferredHeight: 120
            padding: 20
            background: Rectangle {
                color: "#FFFFFF"
                radius: 8
                border.color: "#FFB6C1"
                border.width: 2
            }

            ColumnLayout {
                anchors.fill: parent
                spacing: 15

                Text {
                    text: qsTr("1. Button (按钮)")
                    font.pixelSize: 16
                    font.bold: true
                    color: "#FF6B9D"
                }

                Row {
                    spacing: 15

                    Button {
                        text: qsTr("主要按钮")
                        background: Rectangle {
                            color: parent.pressed ? "#FF1493" : (parent.hovered ? "#FF69B4" : "#FF6B9D")
                            radius: 6
                        }
                        contentItem: Text {
                            text: parent.text
                            color: "#FFFFFF"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.pixelSize: 14
                        }
                    }

                    Button {
                        text: qsTr("次要按钮")
                        background: Rectangle {
                            color: parent.pressed ? "#FFB6C1" : (parent.hovered ? "#FFC0CB" : "#FFFFFF")
                            radius: 6
                            border.color: "#FF6B9D"
                            border.width: 2
                        }
                        contentItem: Text {
                            text: parent.text
                            color: "#FF6B9D"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.pixelSize: 14
                        }
                    }
                }
            }
        }

        Frame {
            Layout.fillWidth: true
            Layout.preferredHeight: 120
            padding: 20
            background: Rectangle {
                color: "#FFFFFF"
                radius: 8
                border.color: "#FFB6C1"
                border.width: 2
            }

            ColumnLayout {
                anchors.fill: parent
                spacing: 15

                Text {
                    text: qsTr("2. TextBox (文本框)")
                    font.pixelSize: 16
                    font.bold: true
                    color: "#FF6B9D"
                }

                TextField {
                    id: textField
                    Layout.fillWidth: true
                    placeholderText: qsTr("请输入文本...")
                    font.pixelSize: 14
                    background: Rectangle {
                        color: "#FFFFFF"
                        radius: 6
                        border.color: textField.activeFocus ? "#FF6B9D" : "#FFB6C1"
                        border.width: textField.activeFocus ? 2 : 1
                    }
                    color: "#4A4A4A"
                }
            }
        }

        Frame {
            Layout.fillWidth: true
            Layout.preferredHeight: 100
            padding: 20
            background: Rectangle {
                color: "#FFFFFF"
                radius: 8
                border.color: "#FFB6C1"
                border.width: 2
            }

            ColumnLayout {
                anchors.fill: parent
                spacing: 15

                Text {
                    text: qsTr("3. CheckBox (复选框)")
                    font.pixelSize: 16
                    font.bold: true
                    color: "#FF6B9D"
                }

                Row {
                    spacing: 20

                    CheckBox {
                        id: checkBox1
                        text: qsTr("选项一")
                        font.pixelSize: 14
                        contentItem: Text {
                            text: parent.text
                            color: "#4A4A4A"
                            verticalAlignment: Text.AlignVCenter
                            leftPadding: parent.indicator.width + parent.spacing
                        }
                        indicator: Rectangle {
                            implicitWidth: 20
                            implicitHeight: 20
                            x: parent.leftPadding
                            y: parent.height / 2 - height / 2
                            radius: 4
                            border.color: "#FFB6C1"
                            border.width: 2
                            color: parent.checked ? "#FF6B9D" : "#FFFFFF"

                            Text {
                                anchors.centerIn: parent
                                text: "✓"
                                color: "#FFFFFF"
                                font.pixelSize: 14
                                visible: parent.parent.checked
                            }
                        }
                    }

                    CheckBox {
                        id: checkBox2
                        text: qsTr("选项二")
                        font.pixelSize: 14
                        contentItem: Text {
                            text: parent.text
                            color: "#4A4A4A"
                            verticalAlignment: Text.AlignVCenter
                            leftPadding: parent.indicator.width + parent.spacing
                        }
                        indicator: Rectangle {
                            implicitWidth: 20
                            implicitHeight: 20
                            x: parent.leftPadding
                            y: parent.height / 2 - height / 2
                            radius: 4
                            border.color: "#FFB6C1"
                            border.width: 2
                            color: parent.checked ? "#FF6B9D" : "#FFFFFF"

                            Text {
                                anchors.centerIn: parent
                                text: "✓"
                                color: "#FFFFFF"
                                font.pixelSize: 14
                                visible: parent.parent.checked
                            }
                        }
                    }
                }
            }
        }

        Frame {
            Layout.fillWidth: true
            Layout.preferredHeight: 100
            padding: 20
            background: Rectangle {
                color: "#FFFFFF"
                radius: 8
                border.color: "#FFB6C1"
                border.width: 2
            }

            ColumnLayout {
                anchors.fill: parent
                spacing: 15

                Text {
                    text: qsTr("4. ProgressBar (进度条)")
                    font.pixelSize: 16
                    font.bold: true
                    color: "#FF6B9D"
                }

                ProgressBar {
                    id: progressBar
                    Layout.fillWidth: true
                    value: 0.65
                    background: Rectangle {
                        implicitWidth: 200
                        implicitHeight: 8
                        color: "#FFB6C1"
                        radius: 4
                    }
                    contentItem: Item {
                        Rectangle {
                            width: progressBar.visualPosition * parent.width
                            height: parent.height
                            radius: 4
                            color: "#FF6B9D"
                        }
                    }

                    Text {
                        anchors.right: parent.right
                        anchors.top: parent.bottom
                        anchors.topMargin: 5
                        text: qsTr("进度: 65%")
                        font.pixelSize: 12
                        color: "#FF6B9D"
                    }
                }
            }
        }

        Frame {
            Layout.fillWidth: true
            Layout.preferredHeight: 100
            padding: 20
            background: Rectangle {
                color: "#FFFFFF"
                radius: 8
                border.color: "#FFB6C1"
                border.width: 2
            }

            ColumnLayout {
                anchors.fill: parent
                spacing: 15

                Text {
                    text: qsTr("5. Slider (滑块)")
                    font.pixelSize: 16
                    font.bold: true
                    color: "#FF6B9D"
                }

                Row {
                    spacing: 15
                    Layout.fillWidth: true

                    Slider {
                        id: slider
                        from: 0
                        to: 100
                        value: 50
                        Layout.fillWidth: true
                        background: Rectangle {
                            x: slider.leftPadding
                            y: slider.topPadding + slider.availableHeight / 2 - height / 2
                            implicitWidth: 200
                            implicitHeight: 6
                            width: slider.availableWidth
                            height: implicitHeight
                            radius: 3
                            color: "#FFB6C1"

                            Rectangle {
                                width: slider.visualPosition * parent.width
                                height: parent.height
                                color: "#FF6B9D"
                                radius: 3
                            }
                        }
                        handle: Rectangle {
                            x: slider.leftPadding + slider.visualPosition * (slider.availableWidth - width)
                            y: slider.topPadding + slider.availableHeight / 2 - height / 2
                            implicitWidth: 20
                            implicitHeight: 20
                            radius: 10
                            color: slider.pressed ? "#FF1493" : "#FF6B9D"
                            border.color: "#FFFFFF"
                            border.width: 2
                        }
                    }

                    Text {
                        text: qsTr("值: ") + Math.round(slider.value)
                        font.pixelSize: 14
                        color: "#4A4A4A"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
