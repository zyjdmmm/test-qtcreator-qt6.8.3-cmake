import QtQuick
import QtQuick.Window
import Qt5Compat.GraphicalEffects
import QtQuick.Controls

Rectangle {

    property int spacingCommon: 10

    //搜索框
    Row {
        id: searchRow
        spacing: spacingCommon
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.verticalCenter: ohterRow.verticalCenter

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

        // 搜索输入框
        TextField {
            id: searchTextField
            height: backForwardRect.height
            width: 240
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

    //一箩筐小图标
    Row{
        id:ohterRow
        spacing: spacingCommon
        anchors.verticalCenter: minMaxExit.verticalCenter
        anchors.right: minMaxExit.left
        anchors.rightMargin: 10

        // 圆形用户头像
        Rectangle {
            id: userIconRect
            width: 25
            height: width  // 保证是正方形
            radius: width / 2  // 设置为圆形
            color: "#d2d3d7"

            // 用户图标
            Image {
                // 只设置一个维度，另一个维度自动等比缩放
                width: 15
                fillMode: Image.PreserveAspectFit  // 核心：等比缩放

                //抗锯齿
                smooth: true
                mipmap: true

                anchors.centerIn: parent  // 图标在圆形中居中
                source: "qrc:/image/user.svg"

            }
        }

        // 未登录文本
        Text {
            id: loadStateText
            text: "未登录"
            color: "#75777f"
            font.pixelSize: 14
            font.family: "微软雅黑 Light"
            anchors.verticalCenter: userIconRect.verticalCenter  // 与图标垂直居中对齐

            // 文本鼠标悬停交互
            MouseArea {
                anchors.fill: parent  // 覆盖整个文本区域
                hoverEnabled: true  // 启用悬停检测

                // 鼠标进入时文本变白色
                onEntered: {
                    loadStateText.color = "white"
                }
                // 鼠标离开时恢复原颜色
                onExited: {
                    loadStateText.color = "#75777f"
                }
            }
        }

        //vip
        Item {
            height: userIconRect.height
            width: loadStateText.implicitWidth * 1.2
            anchors.verticalCenter: parent.verticalCenter

            // VIP 标签背景
            Rectangle {
                id: vipRect
                width: parent.width
                height: 12
                radius: height / 2
                color: "#dadada"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter

                // VIP 标签文本
                Label {
                    text: "VIP开通"
                    anchors.left: parent.left
                    anchors.leftMargin: parent.radius * 2 + 5
                    color: "#f9f9f9"
                    font.pixelSize: parent.height / 2 + 2
                    font.family: "微软雅黑 Light"
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            // 外层边框矩形
            Rectangle {
                id: bgBordRect
                width: vipRect.height + 4
                height: width
                radius: width / 2
                color: "#dadada"
                border.width: 1
                border.color: "#13131a"
                anchors.verticalCenter: parent.verticalCenter
            }
        }


        // 下拉图标
        Image {
            id: loginImg
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/image/downButton.svg"
            // rotation: -90
            layer.enabled: false

            // 只设置一个维度，另一个维度自动等比缩放
            width: 15
            fillMode: Image.PreserveAspectFit  // 核心：等比缩放

            //抗锯齿
            smooth: true
            mipmap: true

            // 颜色叠加效果
            layer.effect: ColorOverlay {
                color: "white"
            }

            // 鼠标悬停交互
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                // 鼠标进入时显示白色叠加效果
                onEntered: {
                    loginImg.layer.enabled = true
                }

                // 鼠标离开时隐藏叠加效果
                onExited: {
                    loginImg.layer.enabled = false
                }
            }
        }

        //消息
        Image {
            id: message
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/image/message.svg"
            // rotation: -90
            layer.enabled: false

            // 只设置一个维度，另一个维度自动等比缩放
            width: 15
            fillMode: Image.PreserveAspectFit  // 核心：等比缩放

            //抗锯齿
            smooth: true
            mipmap: true

            // 颜色叠加效果
            layer.effect: ColorOverlay {
                color: "white"
            }

            // 鼠标悬停交互
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                // 鼠标进入时显示白色叠加效果
                onEntered: {
                    message.layer.enabled = true
                }

                // 鼠标离开时隐藏叠加效果
                onExited: {
                    message.layer.enabled = false
                }
            }
        }

        //设置
        Image {
            id: settings
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/image/settings.svg"
            // rotation: -90
            layer.enabled: false

            // 只设置一个维度，另一个维度自动等比缩放
            width: 15
            fillMode: Image.PreserveAspectFit  // 核心：等比缩放

            //抗锯齿
            smooth: true
            mipmap: true

            // 颜色叠加效果
            layer.effect: ColorOverlay {
                color: "white"
            }

            // 鼠标悬停交互
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                // 鼠标进入时显示白色叠加效果
                onEntered: {
                    settings.layer.enabled = true
                }

                // 鼠标离开时隐藏叠加效果
                onExited: {
                    settings.layer.enabled = false
                }
            }
        }

        //皮肤
        Image {
            id: clothes
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/image/clothes.svg"
            // rotation: -90
            layer.enabled: false

            // 只设置一个维度，另一个维度自动等比缩放
            width: 15
            fillMode: Image.PreserveAspectFit  // 核心：等比缩放

            //抗锯齿
            smooth: true
            mipmap: true

            // 颜色叠加效果
            layer.effect: ColorOverlay {
                color: "white"
            }

            // 鼠标悬停交互
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                // 鼠标进入时显示白色叠加效果
                onEntered: {
                    clothes.layer.enabled = true
                }

                // 鼠标离开时隐藏叠加效果
                onExited: {
                    clothes.layer.enabled = false
                }
            }
        }

        //分割线
        Rectangle{
            height: 24
            width: 1
            color: "#2d2d37"
            anchors.verticalCenter: parent.verticalCenter

        }

    }


    //缩小放大退出
    //尽量用Item而不是Rectangle布局，性能更高，而且Item是透明的
    Item {

        id:minMaxExit
        // anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 50
        width: 120

        //行布局
        Row {
            id: minRow
            spacing: spacingCommon
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 0.02*window.width


            //缩小模式
            Image {
                id:minModeImg
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/image/min.svg"

                // 只设置一个维度，另一个维度自动等比缩放
                width: 15
                fillMode: Image.PreserveAspectFit  // 核心：等比缩放

                //抗锯齿
                smooth: true
                mipmap: true

                //实现图片高亮(没办法只能用qt5，qt6连ai都没搞明白怎么弄)
                layer.enabled: false
                layer.effect: ColorOverlay {
                    source: minModeImg
                    color: "white"
                }
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true

                    onEntered: {
                        minModeImg.layer.enabled = true
                    }
                    onExited: {
                        minModeImg.layer.enabled = false
                    }
                    onPressed: {
                        Qt.quit()
                    }
                }

            }

            // 最小化按钮
            Rectangle {
                id: miniRect
                width: 15
                height: 2
                anchors.verticalCenter: parent.verticalCenter
                color: "#75777f"

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        miniRect.color = "white"
                    }
                    onExited: {
                        miniRect.color = "#75777f"
                    }
                    onPressed: {
                        window.showMinimized()
                    }
                }
            }

            // 最大化按钮
            Rectangle {
                id:maxiRect
                width: 15
                height: width
                radius: 2
                border.color: "#75777f"
                color: "transparent"
                anchors.verticalCenter: parent.verticalCenter

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        maxiRect.border.color = "white"
                    }
                    onExited: {
                        maxiRect.border.color = "#75777f"
                    }
                    onPressed: {
                        window.showFullScreen()
                    }
                }
            }

            //关闭按钮
            Image {
                id:closeImg
                anchors.verticalCenter: parent.verticalCenter
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
                    onPressed: {
                        Qt.quit()
                    }
                }



            }





        }
    }

}
