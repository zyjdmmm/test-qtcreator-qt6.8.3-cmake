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

    ScrollView {
        anchors.fill: parent
        clip: true

        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        ScrollBar.vertical.policy: ScrollBar.AsNeeded

        ColumnLayout {
            width: parent.width
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
                    text: qsTr("6. ComboBox (下拉框)")
                    font.pixelSize: 16
                    font.bold: true
                    color: "#FF6B9D"
                }

                ComboBox {
                    id: comboBox
                    Layout.fillWidth: true
                    model: ["选项一", "选项二", "选项三", "选项四"]
                    currentIndex: 0
                    font.pixelSize: 14
                    background: Rectangle {
                        color: "#FFFFFF"
                        radius: 6
                        border.color: comboBox.pressed ? "#FF6B9D" : "#FFB6C1"
                        border.width: comboBox.pressed ? 2 : 1
                    }
                    contentItem: Text {
                        text: comboBox.displayText
                        color: "#4A4A4A"
                        verticalAlignment: Text.AlignVCenter
                        leftPadding: 10
                    }
                    delegate: ItemDelegate {
                        width: comboBox.width
                        contentItem: Text {
                            text: modelData
                            color: "#4A4A4A"
                            verticalAlignment: Text.AlignVCenter
                            leftPadding: 10
                        }
                        background: Rectangle {
                            color: parent.hovered ? "#FFB6C1" : "#FFFFFF"
                        }
                    }
                    popup.background: Rectangle {
                        color: "#FFFFFF"
                        border.color: "#FFB6C1"
                        border.width: 1
                        radius: 6
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
                    text: qsTr("7. RadioButton (单选按钮)")
                    font.pixelSize: 16
                    font.bold: true
                    color: "#FF6B9D"
                }

                Row {
                    spacing: 20

                    RadioButton {
                        id: radioButton1
                        text: qsTr("选项 A")
                        font.pixelSize: 14
                        checked: true
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
                            radius: 10
                            border.color: "#FFB6C1"
                            border.width: 2
                            color: "#FFFFFF"

                            Rectangle {
                                anchors.centerIn: parent
                                width: 10
                                height: 10
                                radius: 5
                                color: "#FF6B9D"
                                visible: parent.parent.checked
                            }
                        }
                    }

                    RadioButton {
                        id: radioButton2
                        text: qsTr("选项 B")
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
                            radius: 10
                            border.color: "#FFB6C1"
                            border.width: 2
                            color: "#FFFFFF"

                            Rectangle {
                                anchors.centerIn: parent
                                width: 10
                                height: 10
                                radius: 5
                                color: "#FF6B9D"
                                visible: parent.parent.checked
                            }
                        }
                    }

                    RadioButton {
                        id: radioButton3
                        text: qsTr("选项 C")
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
                            radius: 10
                            border.color: "#FFB6C1"
                            border.width: 2
                            color: "#FFFFFF"

                            Rectangle {
                                anchors.centerIn: parent
                                width: 10
                                height: 10
                                radius: 5
                                color: "#FF6B9D"
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
                    text: qsTr("8. Switch (开关)")
                    font.pixelSize: 16
                    font.bold: true
                    color: "#FF6B9D"
                }

                Row {
                    spacing: 30

                    Switch {
                        id: switch1
                        text: qsTr("开关一")
                        font.pixelSize: 14
                        checked: true
                        contentItem: Text {
                            text: parent.text
                            color: "#4A4A4A"
                            verticalAlignment: Text.AlignVCenter
                            leftPadding: parent.indicator.width + parent.spacing
                        }
                        indicator: Rectangle {
                            implicitWidth: 50
                            implicitHeight: 26
                            x: parent.leftPadding
                            y: parent.height / 2 - height / 2
                            radius: 13
                            color: parent.checked ? "#FF6B9D" : "#FFB6C1"
                            border.width: 0

                            Rectangle {
                                x: parent.checked ? parent.width - width - 3 : 3
                                y: parent.height / 2 - height / 2
                                width: 20
                                height: 20
                                radius: 10
                                color: "#FFFFFF"
                            }
                        }
                    }

                    Switch {
                        id: switch2
                        text: qsTr("开关二")
                        font.pixelSize: 14
                        checked: false
                        contentItem: Text {
                            text: parent.text
                            color: "#4A4A4A"
                            verticalAlignment: Text.AlignVCenter
                            leftPadding: parent.indicator.width + parent.spacing
                        }
                        indicator: Rectangle {
                            implicitWidth: 50
                            implicitHeight: 26
                            x: parent.leftPadding
                            y: parent.height / 2 - height / 2
                            radius: 13
                            color: parent.checked ? "#FF6B9D" : "#FFB6C1"
                            border.width: 0

                            Rectangle {
                                x: parent.checked ? parent.width - width - 3 : 3
                                y: parent.height / 2 - height / 2
                                width: 20
                                height: 20
                                radius: 10
                                color: "#FFFFFF"
                            }
                        }
                    }
                }
            }
        }

        Frame {
            Layout.fillWidth: true
            Layout.preferredHeight: 150
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
                    text: qsTr("9. TabBar (标签栏)")
                    font.pixelSize: 16
                    font.bold: true
                    color: "#FF6B9D"
                }

                TabBar {
                    id: tabBar
                    Layout.fillWidth: true
                    background: Rectangle {
                        color: "#FFF0F5"
                        radius: 6
                    }

                    TabButton {
                        text: qsTr("标签一")
                        font.pixelSize: 14
                        background: Rectangle {
                            color: tabBar.currentIndex === 0 ? "#FF6B9D" : "transparent"
                            radius: 6
                        }
                        contentItem: Text {
                            text: parent.text
                            color: tabBar.currentIndex === 0 ? "#FFFFFF" : "#4A4A4A"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    TabButton {
                        text: qsTr("标签二")
                        font.pixelSize: 14
                        background: Rectangle {
                            color: tabBar.currentIndex === 1 ? "#FF6B9D" : "transparent"
                            radius: 6
                        }
                        contentItem: Text {
                            text: parent.text
                            color: tabBar.currentIndex === 1 ? "#FFFFFF" : "#4A4A4A"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    TabButton {
                        text: qsTr("标签三")
                        font.pixelSize: 14
                        background: Rectangle {
                            color: tabBar.currentIndex === 2 ? "#FF6B9D" : "transparent"
                            radius: 6
                        }
                        contentItem: Text {
                            text: parent.text
                            color: tabBar.currentIndex === 2 ? "#FFFFFF" : "#4A4A4A"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }

                Text {
                    text: qsTr("当前选中: ") + (tabBar.currentIndex === 0 ? "标签一" : (tabBar.currentIndex === 1 ? "标签二" : "标签三"))
                    font.pixelSize: 14
                    color: "#4A4A4A"
                }
            }
        }

        Frame {
            Layout.fillWidth: true
            Layout.preferredHeight: 200
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
                    text: qsTr("10. TableView (表格)")
                    font.pixelSize: 16
                    font.bold: true
                    color: "#FF6B9D"
                }

                ScrollView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true

                    ListView {
                        width: parent.width
                        height: parent.height
                        model: ListModel {
                            ListElement { name: "张三"; age: 25; city: "北京" }
                            ListElement { name: "李四"; age: 30; city: "上海" }
                            ListElement { name: "王五"; age: 28; city: "广州" }
                            ListElement { name: "赵六"; age: 32; city: "深圳" }
                            ListElement { name: "钱七"; age: 27; city: "杭州" }
                        }

                        header: Rectangle {
                            width: parent.width
                            height: 40
                            color: "#FF6B9D"
                            radius: 4

                            Row {
                                anchors.fill: parent
                                spacing: 1

                                Repeater {
                                    model: ["姓名", "年龄", "城市"]
                                    delegate: Text {
                                        width: parent.width / 3
                                        height: parent.height
                                        text: modelData
                                        color: "#FFFFFF"
                                        font.bold: true
                                        font.pixelSize: 14
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            }
                        }

                        delegate: Rectangle {
                            width: parent.width
                            height: 40
                            color: index % 2 === 0 ? "#FFF0F5" : "#FFFFFF"
                            radius: 4

                            Row {
                                anchors.fill: parent
                                spacing: 1

                                Text {
                                    width: parent.width / 3
                                    height: parent.height
                                    text: name
                                    color: "#4A4A4A"
                                    font.pixelSize: 13
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }

                                Text {
                                    width: parent.width / 3
                                    height: parent.height
                                    text: age
                                    color: "#4A4A4A"
                                    font.pixelSize: 13
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }

                                Text {
                                    width: parent.width / 3
                                    height: parent.height
                                    text: city
                                    color: "#4A4A4A"
                                    font.pixelSize: 13
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
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
