import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

ApplicationWindow {
    id: window
    visible: true
    width: 900
    height: 700
    title: qsTr("Qt 6.8 Material Style - Pink Theme")

    Material.theme: Material.Light
    Material.primary: "#E91E63"
    Material.accent: "#FF80AB"
    Material.background: "#FCE4EC"

    FontLoader {
        id: fontLoader
        source: "qrc:/fonts/Roboto-Regular.ttf"
    }

    ScrollView {
        anchors.fill: parent
        clip: true

        ColumnLayout {
            width: parent.width
            spacing: 20
            // padding: 20

            Label {
                text: "Qt 6.8 Material Style - Pink Theme"
                font.pixelSize: 28
                font.bold: true
                color: "#880E4F"
                Layout.alignment: Qt.AlignHCenter
                Layout.bottomMargin: 10
            }

            GroupBox {
                title: "Buttons"
                Layout.fillWidth: true
                Material.foreground: "#880E4F"

                RowLayout {
                    spacing: 15
                    anchors.fill: parent

                    Button {
                        text: "Filled Button"
                        Material.background: "#E91E63"
                        highlighted: true
                    }

                    Button {
                        text: "Outlined Button"
                        highlighted: false
                        Material.foreground: "#E91E63"
                    }

                    Button {
                        text: "Text Button"
                        flat: true
                        Material.foreground: "#E91E63"
                    }

                    RoundButton {
                        text: "R"
                        Material.background: "#E91E63"
                        highlighted: true
                    }

                    ToolButton {
                        text: "★"
                        Material.foreground: "#E91E63"
                        font.pixelSize: 24
                    }
                }
            }

            GroupBox {
                title: "Text Inputs"
                Layout.fillWidth: true
                Material.foreground: "#880E4F"

                GridLayout {
                    columns: 2
                    anchors.fill: parent
                    columnSpacing: 20
                    rowSpacing: 15

                    TextField {
                        id: textField
                        placeholderText: "Enter text..."
                        Layout.fillWidth: true
                        Material.accent: "#E91E63"
                    }

                    TextField {
                        placeholderText: "Password field"
                        echoMode: TextInput.Password
                        Layout.fillWidth: true
                        Material.accent: "#E91E63"
                    }

                    TextArea {
                        placeholderText: "Multi-line text area..."
                        Layout.fillWidth: true
                        Layout.columnSpan: 2
                        Material.accent: "#E91E63"
                    }
                }
            }

            GroupBox {
                title: "Selection Controls"
                Layout.fillWidth: true
                Material.foreground: "#880E4F"

                RowLayout {
                    spacing: 30
                    anchors.fill: parent

                    ColumnLayout {
                        spacing: 10

                        Label {
                            text: "Checkboxes"
                            font.bold: true
                            color: "#880E4F"
                        }

                        CheckBox {
                            text: "Option 1"
                            checked: true
                            Material.accent: "#E91E63"
                        }

                        CheckBox {
                            text: "Option 2"
                            Material.accent: "#E91E63"
                        }

                        CheckBox {
                            text: "Option 3"
                            checked: true
                            enabled: false
                            Material.accent: "#E91E63"
                        }
                    }

                    ColumnLayout {
                        spacing: 10

                        Label {
                            text: "Radio Buttons"
                            font.bold: true
                            color: "#880E4F"
                        }

                        RadioButton {
                            text: "Choice A"
                            checked: true
                            Material.accent: "#E91E63"
                        }

                        RadioButton {
                            text: "Choice B"
                            Material.accent: "#E91E63"
                        }

                        RadioButton {
                            text: "Choice C"
                            Material.accent: "#E91E63"
                        }
                    }

                    ColumnLayout {
                        spacing: 10

                        Label {
                            text: "Switches"
                            font.bold: true
                            color: "#880E4F"
                        }

                        Switch {
                            text: "Toggle 1"
                            checked: true
                            Material.accent: "#E91E63"
                        }

                        Switch {
                            text: "Toggle 2"
                            Material.accent: "#E91E63"
                        }

                        Switch {
                            text: "Disabled"
                            enabled: false
                            Material.accent: "#E91E63"
                        }
                    }
                }
            }

            GroupBox {
                title: "Sliders & Progress"
                Layout.fillWidth: true
                Material.foreground: "#880E4F"

                ColumnLayout {
                    spacing: 15
                    anchors.fill: parent

                    Label {
                        text: "Horizontal Slider: " + slider.value.toFixed(0)
                        color: "#880E4F"
                    }

                    Slider {
                        id: slider
                        from: 0
                        to: 100
                        value: 50
                        Layout.fillWidth: true
                        Material.accent: "#E91E63"
                    }

                    Label {
                        text: "Progress Bar"
                        color: "#880E4F"
                    }

                    ProgressBar {
                        value: 0.7
                        Layout.fillWidth: true
                        Material.accent: "#E91E63"
                    }

                    Label {
                        text: "Circular Progress"
                        color: "#880E4F"
                    }

                    RowLayout {
                        spacing: 20

                        ProgressBar {
                            from: 0
                            to: 1
                            value: 0.6
                            indeterminate: false
                            Material.accent: "#E91E63"
                        }

                        ProgressBar {
                            indeterminate: true
                            Material.accent: "#E91E63"
                        }
                    }
                }
            }

            GroupBox {
                title: "ComboBox & SpinBox"
                Layout.fillWidth: true
                Material.foreground: "#880E4F"

                RowLayout {
                    spacing: 30
                    anchors.fill: parent

                    ColumnLayout {
                        spacing: 10

                        Label {
                            text: "ComboBox"
                            color: "#880E4F"
                        }

                        ComboBox {
                            model: ["Pink Rose", "Cherry Blossom", "Coral Pink", "Hot Pink", "Baby Pink"]
                            currentIndex: 0
                            Material.accent: "#E91E63"
                        }

                        ComboBox {
                            editable: true
                            model: ListModel {
                                ListElement { text: "Custom Pink" }
                                ListElement { text: "Deep Pink" }
                            }
                            Material.accent: "#E91E63"
                        }
                    }

                    ColumnLayout {
                        spacing: 10

                        Label {
                            text: "SpinBox"
                            color: "#880E4F"
                        }

                        SpinBox {
                            from: 0
                            to: 100
                            value: 42
                            Material.accent: "#E91E63"
                        }

                        SpinBox {
                            from: -50
                            to: 50
                            value: 0
                            editable: true
                            Material.accent: "#E91E63"
                        }
                    }
                }
            }

            GroupBox {
                title: "TabBar & Cards"
                Layout.fillWidth: true
                Material.foreground: "#880E4F"

                ColumnLayout {
                    spacing: 15
                    anchors.fill: parent

                    TabBar {
                        id: tabBar
                        Layout.fillWidth: true
                        Material.accent: "#E91E63"

                        TabButton {
                            text: "Tab 1"
                        }

                        TabButton {
                            text: "Tab 2"
                        }

                        TabButton {
                            text: "Tab 3"
                        }
                    }

                    StackLayout {
                        currentIndex: tabBar.currentIndex
                        Layout.fillWidth: true
                        Layout.preferredHeight: 150

                        Rectangle {
                            color: "#F8BBD0"
                            radius: 8
                            border.color: "#E91E63"
                            border.width: 1

                            Label {
                                anchors.centerIn: parent
                                text: "Tab 1 Content"
                                font.pixelSize: 18
                                color: "#880E4F"
                            }
                        }

                        Rectangle {
                            color: "#F48FB1"
                            radius: 8
                            border.color: "#E91E63"
                            border.width: 1

                            Label {
                                anchors.centerIn: parent
                                text: "Tab 2 Content"
                                font.pixelSize: 18
                                color: "#880E4F"
                            }
                        }

                        Rectangle {
                            color: "#FCE4EC"
                            radius: 8
                            border.color: "#E91E63"
                            border.width: 1

                            Label {
                                anchors.centerIn: parent
                                text: "Tab 3 Content"
                                font.pixelSize: 18
                                color: "#880E4F"
                            }
                        }
                    }
                }
            }

            GroupBox {
                title: "Cards"
                Layout.fillWidth: true
                Material.foreground: "#880E4F"

                RowLayout {
                    spacing: 15
                    anchors.fill: parent

                    Rectangle {
                        Layout.preferredWidth: 200
                        Layout.preferredHeight: 120
                        color: "#F8BBD0"
                        radius: 12
                        border.color: "#E91E63"
                        border.width: 2

                        ColumnLayout {
                            anchors.centerIn: parent
                            spacing: 5

                            Label {
                                text: "🌸"
                                font.pixelSize: 32
                                Layout.alignment: Qt.AlignHCenter
                            }

                            Label {
                                text: "Pink Card"
                                font.bold: true
                                color: "#880E4F"
                                Layout.alignment: Qt.AlignHCenter
                            }

                            Label {
                                text: "Beautiful pink theme"
                                font.pixelSize: 12
                                color: "#C2185B"
                                Layout.alignment: Qt.AlignHCenter
                            }
                        }
                    }

                    Rectangle {
                        Layout.preferredWidth: 200
                        Layout.preferredHeight: 120
                        color: "#FCE4EC"
                        radius: 12
                        border.color: "#FF80AB"
                        border.width: 2

                        ColumnLayout {
                            anchors.centerIn: parent
                            spacing: 5

                            Label {
                                text: "💕"
                                font.pixelSize: 32
                                Layout.alignment: Qt.AlignHCenter
                            }

                            Label {
                                text: "Love Card"
                                font.bold: true
                                color: "#880E4F"
                                Layout.alignment: Qt.AlignHCenter
                            }

                            Label {
                                text: "Material design"
                                font.pixelSize: 12
                                color: "#C2185B"
                                Layout.alignment: Qt.AlignHCenter
                            }
                        }
                    }

                    Rectangle {
                        Layout.preferredWidth: 200
                        Layout.preferredHeight: 120
                        color: "#F48FB1"
                        radius: 12
                        border.color: "#C2185B"
                        border.width: 2

                        ColumnLayout {
                            anchors.centerIn: parent
                            spacing: 5

                            Label {
                                text: "🌷"
                                font.pixelSize: 32
                                Layout.alignment: Qt.AlignHCenter
                            }

                            Label {
                                text: "Flower Card"
                                font.bold: true
                                color: "#880E4F"
                                Layout.alignment: Qt.AlignHCenter
                            }

                            Label {
                                text: "Qt 6.8 style"
                                font.pixelSize: 12
                                color: "#880E4F"
                                Layout.alignment: Qt.AlignHCenter
                            }
                        }
                    }
                }
            }

            GroupBox {
                title: "Dialog & Busy Indicator"
                Layout.fillWidth: true
                Material.foreground: "#880E4F"

                RowLayout {
                    spacing: 30
                    anchors.fill: parent

                    Button {
                        text: "Show Dialog"
                        Material.background: "#E91E63"
                        highlighted: true

                        onClicked: dialog.open()
                    }

                    ColumnLayout {
                        spacing: 10

                        Label {
                            text: "Busy Indicator"
                            color: "#880E4F"
                        }

                        BusyIndicator {
                            running: true
                            Material.accent: "#E91E63"
                        }
                    }
                }
            }

            Item {
                Layout.preferredHeight: 20
            }
        }
    }

    Dialog {
        id: dialog
        title: "Pink Theme Dialog"
        modal: true
        standardButtons: Dialog.Ok | Dialog.Cancel
        Material.background: "#FCE4EC"
        Material.primary: "#E91E63"

        Label {
            text: "This is a beautiful pink-themed dialog!\n\nQt 6.8 Material Design"
            color: "#880E4F"
            font.pixelSize: 14
        }
    }
}
