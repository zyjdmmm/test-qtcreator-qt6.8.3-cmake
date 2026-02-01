import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

ApplicationWindow {
    id: window
    visible: true
    width: 900
    height: 700
    title: qsTr("GenerateMdTitle")

    Material.theme: Material.Light
    Material.primary: "#E91E63"
    Material.accent: "#FF80AB"
    Material.background: "#FCE4EC"

    property color primaryColor: "#E91E63"
    property color accentColor: "#FF80AB"
    property color backgroundColor: "#FCE4EC"
    property color foregroundColor: "#880E4F"
    property color secondaryColor: "#F8BBD0"
    property color tertiaryColor: "#F48FB1"
    property color darkColor: "#C2185B"
    property color textColor: "#880E4F"
    property color borderColor: "#E91E63"

    ColumnLayout {
        anchors.fill: parent
        spacing: 10


        TabBar {
            id: tabBar
            Layout.fillWidth: true
            Material.accent: primaryColor

            TabButton {
                text: "一.99(,)类型"
            }

            TabButton {
                text: "时间类型"
            }

            TabButton {
                text: "整体升降标题"
            }

            TabButton {
                text: "年份序列自动+1"
            }
        }

        StackLayout {
            currentIndex: tabBar.currentIndex
            Layout.fillWidth: true
            Layout.fillHeight: true

            // "一.99(,)类型"
            Item {
                clip: true
                anchors.fill: parent

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 15
                    // Layout.margins: 20
                    anchors.margins:10

                    //诺干用户填写框框
                    GridLayout {
                        id:userInputGridLayout
                        columns: 5
                        columnSpacing: 10
                        rowSpacing: 10
                        Layout.fillWidth: true
                        anchors.top: parent.top


                        Label {
                            text: "本节标题的级数:"
                            color: foregroundColor
                            // Layout.columnSpan: 2//横跨2列
                        }

                        Label {
                            text: "本节标题:"
                            color: foregroundColor
                        }

                         // 占位空位
                        Item {

                        }

                        Label {
                            text: "本节共有多少道题:"
                            color: foregroundColor
                        }

                        // 占位空位
                       Item {

                       }

                        ComboBox {
                            id: seriesComboBox
                            Layout.preferredWidth: 140
                            Material.accent: primaryColor
                            model: ["#", "##", "###", "####", "#####", "######"]
                        }

                        TextField {
                            id: titleTextEdit
                            text: "一"
                            // Layout.preferredHeight: 35
                            Material.accent: primaryColor
                        }

                        Label {
                            text: "点"
                            color: foregroundColor
                        }

                        SpinBox {
                                id: questionNumSpinBox
                                from: 1
                                to: 999999999
                                value: 1
                                editable: true
                                //Layout.preferredWidth: 150
                                Material.accent: primaryColor
                            }

                        CheckBox {
                            id: addSelectStrCheckBox
                            text: "末尾添加\"选择\"字符"
                            Material.accent: primaryColor
                        }


                        Button {
                            //和GridLayout一样宽
                            Layout.fillWidth: true
                            Layout.columnSpan: 5

                            text: "🌸生成文本并自动复制"
                            Material.background: primaryColor
                            highlighted: true
                            // Layout.preferredWidth: 200
                            onClicked: {
                                generateMdTitle.generateNumberSeries(
                                    seriesComboBox.currentIndex,
                                    titleTextEdit.text,
                                    questionNumSpinBox.value,
                                    addSelectStrCheckBox.checked
                                )
                            }
                        }
                    }

                    //生成的文本框
                    ScrollView {

                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.top: userInputGridLayout.bottom


                        clip: true

                        TextArea {
                            id: resultTextBrowser
                            text: generateMdTitle.resultText
                            readOnly: true
                            wrapMode: TextArea.Wrap
                            color: textColor
                            font.family: "Courier New"
                            font.pixelSize: 12
                            Material.background: backgroundColor

                        }
                    }
                }
            }

            // "时间类型"
            Item {
                clip: true
                anchors.fill: parent

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 15
                    // Layout.margins: 20
                    anchors.margins:10

                    GridLayout {
                        id:userInputTimeGridLayout
                        columns: 5
                        columnSpacing: 10
                        rowSpacing: 10
                        Layout.fillWidth: true
                        anchors.top: parent.top

                        Label {
                            text: "本节标题的级数:"
                            color: foregroundColor
                        }

                        Label {
                            text: "本节标题:"
                            color: foregroundColor
                        }

                        Item {

                        }

                        Label {
                            text: "本节共有多少道题:"
                            color: foregroundColor
                        }

                        Item {

                        }

                        ComboBox {
                            id: seriesComboBox2
                            // Layout.preferredWidth: 140
                            Material.accent: primaryColor
                            model: ["#", "##", "###", "####", "#####", "######"]
                        }

                        TextField {
                            id: titleTextEdit2
                            text: "0h59min"
                            // Layout.preferredHeight: 35
                            Material.accent: primaryColor
                        }

                        Label {
                            text: "点"
                            color: foregroundColor
                        }

                        SpinBox {
                                id: questionNumSpinBox2
                                from: 1
                                to: 999999999
                                value: 1
                                editable: true
                                //Layout.preferredWidth: 150
                                Material.accent: primaryColor
                            }

                        CheckBox {
                            id: addSelectStrCheckBox2
                            text: "末尾添加\"选择\"字符"
                            Material.accent: primaryColor
                        }


                        Button {
                            //和GridLayout一样宽
                            Layout.fillWidth: true
                            Layout.columnSpan: 5

                            text: "🚀生成文本并自动复制"
                            Material.background: primaryColor
                            highlighted: true
                            // Layout.preferredWidth: 200
                            onClicked: {
                                generateMdTitle.generateTimeSeries(
                                    seriesComboBox2.currentIndex,
                                    titleTextEdit2.text,
                                    questionNumSpinBox2.value,
                                    addSelectStrCheckBox2.checked
                                )
                            }
                        }
                    }

                    ScrollView {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.top: userInputTimeGridLayout.bottom
                        clip: true

                        TextArea {
                            id: resultTextBrowser2
                            text: generateMdTitle.resultText
                            readOnly: true
                            wrapMode: TextArea.Wrap
                            color: textColor
                            font.family: "Courier New"
                            font.pixelSize: 12
                            Material.background: backgroundColor
                        }
                    }
                }
            }

            // "整体升降标题"
            Item {
                clip: true
                anchors.fill: parent

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 15
                    // Layout.margins: 20
                    anchors.margins:10


                    RowLayout {
                        spacing: 10
                        Layout.fillWidth: true
                        anchors.top: parent.top

                        Button {
                            text: "⬇️ 手中标题降低1级并自动复制(Ctrl+Shift+↓)"
                            Material.background: primaryColor
                            highlighted: true
                            Layout.fillWidth: true
                            onClicked: {
                                generateMdTitle.downTitleLevel()
                            }
                        }

                        Button {
                            text: "⬆️ 手中标题提升1级并自动复制(Ctrl+Shift+↑)"
                            Material.background: primaryColor
                            highlighted: true
                            Layout.fillWidth: true
                            onClicked: {
                                generateMdTitle.upTitleLevel()
                            }
                        }
                    }

                    ScrollView {
                        Layout.fillWidth: true
                        // Layout.preferredHeight: /*200*/
                        clip: true

                        TextArea {
                            id: resultTextBrowser3
                            text: generateMdTitle.resultText
                            readOnly: true
                            wrapMode: TextArea.Wrap
                            color: textColor
                            font.family: "Courier New"
                            font.pixelSize: 12
                            Material.background: backgroundColor
                        }
                    }
                }
            }

            // "年份序列自动+1"
            Item {
                clip: true
                anchors.fill: parent

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 15
                    // Layout.margins: 20
                    anchors.margins:10

                    GridLayout {
                        columns: 4
                        columnSpacing: 10
                        rowSpacing: 10
                        Layout.fillWidth: true

                        Label {
                            text: "本节所有标题的级数:"
                            color: foregroundColor
                            Layout.columnSpan: 2
                        }

                        Label {
                            text: "本节标题:"
                            color: foregroundColor
                        }

                        Label {
                            text: "本节共有多少道题:"
                            color: foregroundColor
                        }

                        ComboBox {
                            id: seriesComboBox4
                            // Layout.preferredWidth: 140
                            Material.accent: primaryColor
                            model: ["#", "##", "###", "####", "#####", "######"]
                        }

                        SpinBox {
                            id: yearsSpinBox
                            from: 1
                            to: 999999999
                            value: 2001
                            editable: true
                            // Layout.preferredWidth: 150
                            Material.accent: primaryColor
                        }

                        SpinBox {
                            id: questionNumSpinBox4
                            from: 1
                            to: 999999999
                            value: 1
                            editable: true
                            // Layout.preferredWidth: 150
                            Material.accent: primaryColor
                        }

                        Label {
                            text: "点"
                            color: foregroundColor
                        }

                        Item {
                            Layout.columnSpan: 4
                            Layout.fillWidth: true
                        }

                        CheckBox {
                            id: addSelectStrCheckBox4
                            text: "末尾添加\"选择\"字符"
                            Material.accent: primaryColor
                        }

                        Item {
                            Layout.fillWidth: true
                        }

                        Button {
                            text: "💕 生成文本并自动复制"
                            Material.background: primaryColor
                            highlighted: true
                            // Layout.preferredWidth: 200
                            onClicked: {
                                generateMdTitle.generateYearSeries(
                                    seriesComboBox4.currentIndex,
                                    yearsSpinBox.value,
                                    questionNumSpinBox4.value,
                                    addSelectStrCheckBox4.checked
                                )
                            }
                        }
                    }

                    ScrollView {
                        Layout.fillWidth: true
                        // Layout.preferredHeight: 200
                        clip: true

                        TextArea {
                            id: resultTextBrowser4
                            text: generateMdTitle.resultText
                            readOnly: true
                            wrapMode: TextArea.Wrap
                            color: textColor
                            font.family: "Courier New"
                            font.pixelSize: 12
                            Material.background: backgroundColor
                        }
                    }
                }
            }
        }
    }
}
