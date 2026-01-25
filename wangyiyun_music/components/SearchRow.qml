import QtQuick
import QtQuick.Window
import Qt5Compat.GraphicalEffects
import QtQuick.Controls

//搜索框
    Row {
        // 返回
        Rectangle {
            id: backForwardRect
            width: 24
            height: 35
            radius: 4
            color: "transparent"
            border.width: 1
            border.color: "#2b2b31"

            Image {
                anchors.centerIn: parent
                source: "qrc:/image/return.svg"

                // 只设置一个维度，另一个维度自动等比缩放
                width: 15
                fillMode: Image.PreserveAspectFit  // 核心：等比缩放

                //抗锯齿
                smooth: true
                mipmap: true
            }
        }


        // 搜索输入框容器
        //套一个Item的原因:Item 将事件分发给所有子组件,这样就能鼠标穿透到MouseArea了
        Item {
            height: backForwardRect.height
            width: 240
            
            // 搜索输入框
            TextField {
                id: searchTextField
                anchors.fill: parent
                leftPadding: 40
                topPadding: 0
                bottomPadding: 0
                verticalAlignment: TextInput.AlignVCenter//背景文字居中
                placeholderTextColor: "white"
                placeholderText: "晴天"
                font.pixelSize: 16
                font.family: "微软雅黑 Light"

                // 自定义背景
                background: Rectangle {
                    anchors.fill: parent
                    radius: 8
                    gradient: Gradient {
                        orientation: Gradient.Horizontal
                        GradientStop { color: "#21283d"; position: 0 }
                        GradientStop { color: "#382635"; position: 1 }
                    }

                    // 内部渐变矩形
                    Rectangle {
                        id: innerRect
                        anchors.fill: parent
                        anchors.margins: 1
                        property real gradientStopPos: 1
                        gradient: Gradient {
                            orientation: Gradient.Horizontal
                            GradientStop { color: "#1a1d29"; position: 0 }
                            GradientStop { color: "#241c26"; position: innerRect.gradientStopPos }
                        }

                        // 搜索图标
                        Image {
                            id: searchIcon
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 8
                            source: "qrc:/image/search.svg"

                            // 只设置一个维度，另一个维度自动等比缩放
                            width: 25
                            fillMode: Image.PreserveAspectFit  // 核心：等比缩放

                            //抗锯齿
                            smooth: true
                            mipmap: true
                        }
                    }
                }
            }
            
            // 点击交互区域（放在TextField外部）
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    innerRect.gradientStopPos = 0
                    searchPop.open()
                }
            }
        }




        Popup {
            id: searchPop
            width: parent.width
            height: 1500
            y: searchTextField.height + 10


            background: Rectangle {
                anchors.fill: parent
                radius: 10
                color: "#2d2d37"

                Column{
                    anchors.fill: parent
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 30
                    spacing: 40

                    // //搜索历史标签+垃圾图标+搜索历史流式布局
                    // Item {
                    //     id: historyItem
                    //     // anchors.left: parent.left
                    //     // anchors.right: parent.right
                    //     height: 100

                    //     // 搜索历史标签
                    //     Label {
                    //         id: searchLabel
                    //         color: "#7f7f85"
                    //         text: "搜索历史"
                    //         font.pixelSize: 18
                    //         font.family: "微软雅黑 Light"
                    //         anchors.left: parent.left
                    //         anchors.leftMargin: 30
                    //     }

                    //     // 垃圾图标
                    //     Image {
                    //         id: removeIconImg
                    //         anchors.right: parent.right
                    //         anchors.rightMargin: 38
                    //         anchors.verticalCenter: searchLabel.verticalCenter
                    //         source: "qrc:/image/trash.svg"

                    //         // 只设置一个维度，另一个维度自动等比缩放
                    //         width: 15
                    //         fillMode: Image.PreserveAspectFit  // 核心：等比缩放

                    //         //抗锯齿
                    //         smooth: true
                    //         mipmap: true

                    //         MouseArea{
                    //             anchors.fill: parent
                    //             onClicked: {
                    //                 searchSingModel.clear()
                    //             }

                    //         }
                    //     }

                    //     // 搜索歌曲数据模型
                    //     ListModel {
                    //         id: searchSingModel
                    //         ListElement { singName: "想象之中" }
                    //         ListElement { singName: "搁浅" }
                    //         ListElement { singName: "哪里都是你" }
                    //         ListElement { singName: "入戏太深" }
                    //         ListElement { singName: "That girl" }
                    //         ListElement { singName: "素颜" }
                    //         ListElement { singName: "她说" }
                    //         ListElement { singName: "ABC" }
                    //         ListElement { singName: "daylight" }
                    //         ListElement { singName: "其他" }
                    //     }

                    //     //搜索历史流式布局
                    //     //注意:流式布局就是一个控件，必须要套住才不会被冲散--AI也推荐套一个Item
                    //     Item {
                    //         anchors.top: searchLabel.bottom
                    //         anchors.topMargin: 10
                    //         anchors.left: parent.left
                    //         anchors.right: parent.right
                    //         height: 80
                    //         Flow {
                    //             id: singFlow
                    //             anchors.fill: parent
                    //             spacing: 10//为什么控制每个label的间距要加到这???


                    //             // 基于数据模型的重复器（生成多个标签）
                    //             Repeater {
                    //                 id: historyRep
                    //                 anchors.fill: parent



                    //                 model: searchSingModel


                    //                 //整个区域是个代理
                    //                 delegate: Rectangle {
                    //                     width: dataLabel.implicitWidth + 20
                    //                     height: 30
                    //                     border.width: 1
                    //                     border.color: "#45454e"
                    //                     color: "#2d2d37"
                    //                     radius: 15

                    //                     Label {
                    //                         id: dataLabel
                    //                         text: modelData//只用一个属性用modelData
                    //                         font.pixelSize: 15
                    //                         anchors.centerIn: parent
                    //                         color: "#ddd"
                    //                         font.family: "微软雅黑 Light"
                    //                          // height: 50//无效
                    //                     }

                    //                     MouseArea{
                    //                         anchors.fill: parent
                    //                         hoverEnabled: true
                    //                         onEntered: {
                    //                             dataLabel.color="white"
                    //                             parent.color="#393943"
                    //                             cursorShape=Qt.PointingHandCursor
                    //                         }
                    //                         onExited:  {
                    //                             dataLabel.color="#ddd"
                    //                             parent.color="#2d2d37"
                    //                             cursorShape=Qt.ArrowCursor

                    //                         }
                    //                     }
                    //                 }
                    //             }
                    //         }
                    //     }

                    // }




                    Item {
                        width: 150
                        height: 50
                        // color: "#44dddd"
                        Text {
                            anchors.centerIn: parent
                            text: "第yi行矩形"
                            color: "white"
                        }
                    }

                    Item {
                        width: 150
                        height: 50
                        // color: "#44dddd"
                        Text {
                            anchors.centerIn: parent
                            text: "第er行矩形"
                            color: "white"
                        }
                    }

                    Item {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        // color: "#44dddd"
                        Text {
                            anchors.centerIn: parent
                            text: "第三行矩形"
                            color: "white"
                        }
                    }

                    //热搜榜
                    Item {
                        id: hotSingListItem
                        // height: 50

                        // Label {
                        //     id: hotSearchLabel
                        //     color: "#7f7f85"
                        //     text: "热搜榜"
                        //     anchors.left: parent.left
                        //     anchors.leftMargin: 30
                        //     // 高度与清除图标高度一致
                        //     height: removeIconImg.implicitHeight
                        //     font.pixelSize: 18
                        //     font.family: "微软雅黑 Light"
                        // }

                        // width: 150
                        // height: 50
                        anchors.left: parent.left
                        anchors.right: parent.right
                        Text {
                            anchors.centerIn: parent
                            text: "热搜榜text"
                            color: "white"
                        }
                    }

                }


            }

        }




        //歌唱按钮
        Rectangle {
            id: soundHoundRect
            radius: 8
            height: backForwardRect.height
            width: height
            color: "#241c26"
            border.color: "#36262f"
            border.width: 1
            // z: 100

            // 录音图标
            Image {
                anchors.centerIn: parent
                source: "qrc:/image/singer.svg"

                // 只设置一个维度，另一个维度自动等比缩放
                width: 15
                fillMode: Image.PreserveAspectFit  // 核心：等比缩放

                //抗锯齿
                smooth: true
                mipmap: true

            }

            // 鼠标悬停交互
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onEntered: {
                    soundHoundRect.color = "#241c26"
                }

                onExited: {
                    soundHoundRect.color = "#241c26"
                }
            }
        }


    }
