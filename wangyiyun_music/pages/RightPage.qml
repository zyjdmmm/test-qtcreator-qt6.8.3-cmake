import QtQuick
import QtQuick.Window
import Qt5Compat.GraphicalEffects


Rectangle {
    // id: leftRect//似乎不需要

    //右侧的顶部
    Item {//尽量用Item而不是Rectangle布局，性能更高，而且Item是透明的
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 50

        //行布局
        Row {
            id: minRow
            spacing: 15
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 0.02*window.width






            //缩小模式
            Image {
                id:minModeImg
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/image/min.png"

                // 只设置一个维度，另一个维度自动等比缩放
                width: 15
                fillMode: Image.PreserveAspectFit  // 核心：等比缩放

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
                source: "qrc:/image/close.png"

                // 只设置一个维度，另一个维度自动等比缩放
                width: 20
                fillMode: Image.PreserveAspectFit  // 核心：等比缩放

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
