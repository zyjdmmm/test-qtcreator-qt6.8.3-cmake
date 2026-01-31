import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    id: window
    width: 800
    height: 600
    visible: true
    title: qsTr("Popup测试")

    Row {
        anchors.centerIn: parent
        spacing: 20

        // 歌唱按钮
        Rectangle {
            id: singButton
            width: 100
            height: 50
            radius: 8
            color: "#241c26"
            border.color: "#36262f"
            border.width: 1

            Text {
                anchors.centerIn: parent
                text: "歌唱"
                color: "white"
                font.pixelSize: 16
                font.family: "微软雅黑 Light"
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    singButton.color = "#363640"
                }
                onExited: {
                    singButton.color = "#241c26"
                }
                onClicked: {
                    // testPopup.open()
                }
            }
        }

        // 搜索按钮
        Rectangle {
            id: searchButton
            width: 100
            height: 50
            radius: 8
            color: "#241c26"
            border.color: "#36262f"
            border.width: 1

            Text {
                anchors.centerIn: parent
                text: "搜索"
                color: "white"
                font.pixelSize: 16
                font.family: "微软雅黑 Light"
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    searchButton.color = "#363640"
                }
                onExited: {
                    searchButton.color = "#241c26"
                }
                onClicked: {
                    testPopup.open()
                }
            }


        }

        // Popup组件很独特是浮动窗口，不参与row布局，需要绝对定位
        Popup {
            id: testPopup

            y: singButton.height + 10
            width: parent.width
            height: 1000
            modal: true
            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

            background: Rectangle {
                anchors.fill: parent
                radius: 10
                color: "#2d2d37"
            }

            Column {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 10

                // 标题
                Text {
                    text: "测试数据列表"
                    color: "#7f7f85"
                    font.pixelSize: 18
                    font.family: "微软雅黑 Light"
                    height: 30
                }

                // 可滚动区域
                ScrollView {
                    width: parent.width
                    height: parent.height - 40

                    Column {
                        width: parent.width
                        spacing: 8

                        // 生成100行数据
                        Repeater {
                            model: 100

                            delegate: Rectangle {
                                width: parent.width
                                height: 40
                                radius: 5
                                color: "#393943"
                                border.color: "#45454e"
                                border.width: 1

                                Row {
                                    anchors.fill: parent
                                    anchors.margins: 10
                                    spacing: 10

                                    Text {
                                        text: "序号: " + (index + 1)
                                        color: "#ddd"
                                        font.pixelSize: 14
                                        font.family: "微软雅黑 Light"
                                        width: 80
                                    }

                                    Text {
                                        text: "这是第 " + (index + 1) + " 行测试数据"
                                        color: "white"
                                        font.pixelSize: 14
                                        font.family: "微软雅黑 Light"
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: {
                                        parent.color = "#4a4a55"
                                    }
                                    onExited: {
                                        parent.color = "#393943"
                                    }
                                    onClicked: {
                                        console.log("点击了第 " + (index + 1) + " 行")
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
