import QtQuick
import QtQuick.Controls

// 主窗口（测试用）
Window {
    width: 400   // 窗口宽度
    height: 500  // 窗口高度
    visible: true
    title: "Column + Item 布局测试"

    // 模拟搜索弹窗（核心布局）
    Rectangle {
        anchors.fill: parent
        color: "#f8f8f8"  // 窗口背景色
        radius: 8

        // 核心垂直布局：Column
        Column {
            id: searchColumn
            anchors.fill: parent        // Column 占满父容器宽度
            anchors.margins: 20         // 内边距，避免内容贴边
            spacing: 15                 // 子元素垂直间距

            // 模块1：搜索历史标题栏（锚点占宽 + 固定高度）
            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: 40  // 固定高度，保证标题栏高度稳定

                // 搜索历史文字
                Label {
                    text: "搜索历史"
                    font.pixelSize: 18
                    color: "#7f7f85"
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }

                // 清除图标（模拟）
                Rectangle {
                    width: 24
                    height: 24
                    color: "#d2d3d7"
                    radius: 12
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    // 模拟清除图标文字
                    Text {
                        text: "×"
                        font.pixelSize: 16
                        anchors.centerIn: parent
                        color: "#333"
                    }
                }
            }

            // 模块2：搜索历史标签流（锚点占宽 + 固定高度）
            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: 120  // 固定高度，限制Flow区域

                // 流式布局：标签自动换行
                Flow {
                    anchors.fill: parent
                    spacing: 10  // 标签之间的间距

                    // 标签数据模型
                    Repeater {
                        model: ["想象之中", "搁浅", "哪里都是你", "入戏太深", "That girl"]
                        delegate: Rectangle {
                            width: childrenRect.width + 20  // 自适应文字宽度+边距
                            height: 40
                            radius: 20
                            color: "#d2d3d7"

                            Label {
                                text: modelData
                                font.pixelSize: 16
                                anchors.centerIn: parent
                                color: "#333"
                            }
                        }
                    }
                }
            }

            // 模块3：热搜榜标题
            Label {
                text: "热搜榜"
                font.pixelSize: 18
                color: "#7f7f85"
                anchors.left: parent.left
            }

            // 模块4：热搜标签流（锚点占宽 + 固定高度）
            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: 120

                Flow {
                    anchors.fill: parent
                    spacing: 10

                    Repeater {
                        model: ["小幸运", "告白气球", "七里香", "晴天", "素颜"]
                        delegate: Rectangle {
                            width: childrenRect.width + 20
                            height: 40
                            radius: 20
                            color: "#f0f0f0"

                            Label {
                                text: modelData
                                font.pixelSize: 16
                                anchors.centerIn: parent
                                color: "#333"
                            }
                        }
                    }
                }
            }

            // 模块5：固定尺寸小控件（仅用固定宽高）
            Item {
                anchors.left: parent.left
                width: 30   // 固定宽度（排名数字专用）
                height: 30  // 固定高度
                // 模拟热搜排名数字
                Label {
                    text: "1"
                    font.pixelSize: 20
                    font.bold: true
                    anchors.centerIn: parent
                    color: "#ff4444"
                }
            }
        }
    }
}
