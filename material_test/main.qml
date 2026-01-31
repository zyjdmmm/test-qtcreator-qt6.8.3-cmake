import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

ApplicationWindow {
    id: window
    visible: true
    width: 900
    height: 700
    title: qsTr("Qt 6.8 Material Style - " + (isPinkTheme ? "Pink Theme" : "Sci-Fi Blue Theme"))

    property bool isPinkTheme: true

    property color primaryColor: isPinkTheme ? "#E91E63" : "#00BCD4"
    property color accentColor: isPinkTheme ? "#FF80AB" : "#00E5FF"
    property color backgroundColor: isPinkTheme ? "#FCE4EC" : "#E0F7FA"
    property color foregroundColor: isPinkTheme ? "#880E4F" : "#006064"
    property color secondaryColor: isPinkTheme ? "#F8BBD0" : "#B2EBF2"
    property color tertiaryColor: isPinkTheme ? "#F48FB1" : "#80DEEA"
    property color darkColor: isPinkTheme ? "#C2185B" : "#0097A7"
    property color textColor: isPinkTheme ? "#880E4F" : "#006064"
    property color borderColor: isPinkTheme ? "#E91E63" : "#00BCD4"

    Material.theme: Material.Light
    Material.primary: primaryColor
    Material.accent: accentColor
    Material.background: backgroundColor

    FontLoader {
        id: fontLoader
        source: "qrc:/fonts/Roboto-Regular.ttf"
    }

    Row {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 15
        spacing: 10
        z: 1000

        Button {
            text: isPinkTheme ? "🌸 Pink Theme" : "🚀 Sci-Fi Blue"
            Material.background: primaryColor
            highlighted: true
            onClicked: {
                isPinkTheme = !isPinkTheme
                console.log("Theme switched to:", isPinkTheme ? "Pink" : "Blue")
            }
        }
    }

    ScrollView {
        anchors.fill: parent
        anchors.topMargin: 60
        clip: true

        ColumnLayout {
            width: parent.width
            spacing: 20

            Label {
                text: "Qt 6.8 Material Style - " + (isPinkTheme ? "Pink Theme" : "Sci-Fi Blue Theme")
                font.pixelSize: 28
                font.bold: true
                color: foregroundColor
                Layout.alignment: Qt.AlignHCenter
                Layout.bottomMargin: 10
                Layout.topMargin: 10
            }

            GroupBox {
                title: "Buttons"
                Layout.fillWidth: true
                Material.foreground: foregroundColor

                RowLayout {
                    spacing: 15
                    anchors.fill: parent

                    Button {
                        text: "Filled Button"
                        Material.background: primaryColor
                        highlighted: true
                    }

                    Button {
                        text: "Outlined Button"
                        highlighted: false
                        Material.foreground: primaryColor
                    }

                    Button {
                        text: "Text Button"
                        flat: true
                        Material.foreground: primaryColor
                    }

                    RoundButton {
                        text: "R"
                        Material.background: primaryColor
                        highlighted: true
                    }

                    ToolButton {
                        text: "★"
                        Material.foreground: primaryColor
                        font.pixelSize: 24
                    }
                }
            }

            GroupBox {
                title: "Text Inputs"
                Layout.fillWidth: true
                Material.foreground: foregroundColor

                GridLayout {
                    columns: 2
                    anchors.fill: parent
                    columnSpacing: 20
                    rowSpacing: 15

                    TextField {
                        id: textField
                        placeholderText: "Enter text..."
                        Layout.fillWidth: true
                        Material.accent: primaryColor
                    }

                    TextField {
                        placeholderText: "Password field"
                        echoMode: TextInput.Password
                        Layout.fillWidth: true
                        Material.accent: primaryColor
                    }

                    TextArea {
                        placeholderText: "Multi-line text area..."
                        Layout.fillWidth: true
                        Layout.columnSpan: 2
                        Material.accent: primaryColor
                    }
                }
            }

            GroupBox {
                title: "Selection Controls"
                Layout.fillWidth: true
                Material.foreground: foregroundColor

                RowLayout {
                    spacing: 30
                    anchors.fill: parent

                    ColumnLayout {
                        spacing: 10

                        Label {
                            text: "Checkboxes"
                            font.bold: true
                            color: foregroundColor
                        }

                        CheckBox {
                            text: "Option 1"
                            checked: true
                            Material.accent: primaryColor
                        }

                        CheckBox {
                            text: "Option 2"
                            Material.accent: primaryColor
                        }

                        CheckBox {
                            text: "Option 3"
                            checked: true
                            enabled: false
                            Material.accent: primaryColor
                        }
                    }

                    ColumnLayout {
                        spacing: 10

                        Label {
                            text: "Radio Buttons"
                            font.bold: true
                            color: foregroundColor
                        }

                        RadioButton {
                            text: "Choice A"
                            checked: true
                            Material.accent: primaryColor
                        }

                        RadioButton {
                            text: "Choice B"
                            Material.accent: primaryColor
                        }

                        RadioButton {
                            text: "Choice C"
                            Material.accent: primaryColor
                        }
                    }

                    ColumnLayout {
                        spacing: 10

                        Label {
                            text: "Switches"
                            font.bold: true
                            color: foregroundColor
                        }

                        Switch {
                            text: "Toggle 1"
                            checked: true
                            Material.accent: primaryColor
                        }

                        Switch {
                            text: "Toggle 2"
                            Material.accent: primaryColor
                        }

                        Switch {
                            text: "Disabled"
                            enabled: false
                            Material.accent: primaryColor
                        }
                    }
                }
            }

            GroupBox {
                title: "Sliders & Progress"
                Layout.fillWidth: true
                Material.foreground: foregroundColor

                ColumnLayout {
                    spacing: 15
                    anchors.fill: parent

                    Label {
                        text: "Horizontal Slider: " + slider.value.toFixed(0)
                        color: foregroundColor
                    }

                    Slider {
                        id: slider
                        from: 0
                        to: 100
                        value: 50
                        Layout.fillWidth: true
                        Material.accent: primaryColor
                    }

                    Label {
                        text: "Progress Bar"
                        color: foregroundColor
                    }

                    ProgressBar {
                        value: 0.7
                        Layout.fillWidth: true
                        Material.accent: primaryColor
                    }

                    Label {
                        text: "Circular Progress"
                        color: foregroundColor
                    }

                    RowLayout {
                        spacing: 20

                        ProgressBar {
                            from: 0
                            to: 1
                            value: 0.6
                            indeterminate: false
                            Material.accent: primaryColor
                        }

                        ProgressBar {
                            indeterminate: true
                            Material.accent: primaryColor
                        }
                    }
                }
            }

            GroupBox {
                title: "ComboBox & SpinBox"
                Layout.fillWidth: true
                Material.foreground: foregroundColor

                RowLayout {
                    spacing: 30
                    anchors.fill: parent

                    ColumnLayout {
                        spacing: 10

                        Label {
                            text: "ComboBox"
                            color: foregroundColor
                        }

                        ComboBox {
                            model: isPinkTheme ? ["Pink Rose", "Cherry Blossom", "Coral Pink", "Hot Pink", "Baby Pink"] : ["Cyan", "Teal", "Sky Blue", "Ocean", "Aqua"]
                            currentIndex: 0
                            Material.accent: primaryColor
                        }

                        ComboBox {
                            editable: true
                            model: isPinkTheme ? pinkComboModel : blueComboModel
                            Material.accent: primaryColor
                        }
                    }

                    ColumnLayout {
                        spacing: 10

                        Label {
                            text: "SpinBox"
                            color: foregroundColor
                        }

                        SpinBox {
                            from: 0
                            to: 100
                            value: 42
                            Material.accent: primaryColor
                        }

                        SpinBox {
                            from: -50
                            to: 50
                            value: 0
                            editable: true
                            Material.accent: primaryColor
                        }
                    }
                }
            }

            GroupBox {
                title: "TabBar & Cards"
                Layout.fillWidth: true
                Material.foreground: foregroundColor

                ColumnLayout {
                    spacing: 15
                    anchors.fill: parent

                    TabBar {
                        id: tabBar
                        Layout.fillWidth: true
                        Material.accent: primaryColor

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
                            color: secondaryColor
                            radius: 8
                            border.color: borderColor
                            border.width: 1

                            Label {
                                anchors.centerIn: parent
                                text: "Tab 1 Content"
                                font.pixelSize: 18
                                color: foregroundColor
                            }
                        }

                        Rectangle {
                            color: tertiaryColor
                            radius: 8
                            border.color: borderColor
                            border.width: 1

                            Label {
                                anchors.centerIn: parent
                                text: "Tab 2 Content"
                                font.pixelSize: 18
                                color: foregroundColor
                            }
                        }

                        Rectangle {
                            color: backgroundColor
                            radius: 8
                            border.color: borderColor
                            border.width: 1

                            Label {
                                anchors.centerIn: parent
                                text: "Tab 3 Content"
                                font.pixelSize: 18
                                color: foregroundColor
                            }
                        }
                    }
                }
            }

            GroupBox {
                title: "Cards"
                Layout.fillWidth: true
                Material.foreground: foregroundColor

                RowLayout {
                    spacing: 15
                    anchors.fill: parent

                    Rectangle {
                        Layout.preferredWidth: 200
                        Layout.preferredHeight: 120
                        color: secondaryColor
                        radius: 12
                        border.color: borderColor
                        border.width: 2

                        ColumnLayout {
                            anchors.centerIn: parent
                            spacing: 5

                            Label {
                                text: isPinkTheme ? "🌸" : "🚀"
                                font.pixelSize: 32
                                Layout.alignment: Qt.AlignHCenter
                            }

                            Label {
                                text: isPinkTheme ? "Pink Card" : "Sci-Fi Card"
                                font.bold: true
                                color: foregroundColor
                                Layout.alignment: Qt.AlignHCenter
                            }

                            Label {
                                text: isPinkTheme ? "Beautiful pink theme" : "Futuristic blue theme"
                                font.pixelSize: 12
                                color: darkColor
                                Layout.alignment: Qt.AlignHCenter
                            }
                        }
                    }

                    Rectangle {
                        Layout.preferredWidth: 200
                        Layout.preferredHeight: 120
                        color: backgroundColor
                        radius: 12
                        border.color: accentColor
                        border.width: 2

                        ColumnLayout {
                            anchors.centerIn: parent
                            spacing: 5

                            Label {
                                text: isPinkTheme ? "💕" : "⚡"
                                font.pixelSize: 32
                                Layout.alignment: Qt.AlignHCenter
                            }

                            Label {
                                text: isPinkTheme ? "Love Card" : "Tech Card"
                                font.bold: true
                                color: foregroundColor
                                Layout.alignment: Qt.AlignHCenter
                            }

                            Label {
                                text: "Material design"
                                font.pixelSize: 12
                                color: darkColor
                                Layout.alignment: Qt.AlignHCenter
                            }
                        }
                    }

                    Rectangle {
                        Layout.preferredWidth: 200
                        Layout.preferredHeight: 120
                        color: tertiaryColor
                        radius: 12
                        border.color: darkColor
                        border.width: 2

                        ColumnLayout {
                            anchors.centerIn: parent
                            spacing: 5

                            Label {
                                text: isPinkTheme ? "🌷" : "🌌"
                                font.pixelSize: 32
                                Layout.alignment: Qt.AlignHCenter
                            }

                            Label {
                                text: isPinkTheme ? "Flower Card" : "Space Card"
                                font.bold: true
                                color: foregroundColor
                                Layout.alignment: Qt.AlignHCenter
                            }

                            Label {
                                text: "Qt 6.8 style"
                                font.pixelSize: 12
                                color: foregroundColor
                                Layout.alignment: Qt.AlignHCenter
                            }
                        }
                    }
                }
            }

            GroupBox {
                title: "Dialog & Busy Indicator"
                Layout.fillWidth: true
                Material.foreground: foregroundColor

                RowLayout {
                    spacing: 30
                    anchors.fill: parent

                    Button {
                        text: "Show Dialog"
                        Material.background: primaryColor
                        highlighted: true

                        onClicked: dialog.open()
                    }

                    ColumnLayout {
                        spacing: 10

                        Label {
                            text: "Busy Indicator"
                            color: foregroundColor
                        }

                        BusyIndicator {
                            running: true
                            Material.accent: primaryColor
                        }
                    }
                }
            }

            GroupBox {
                title: "TableView"
                Layout.fillWidth: true
                Material.foreground: foregroundColor

                ColumnLayout {
                    spacing: 10
                    anchors.fill: parent

                    Rectangle {
                        Layout.fillWidth: true
                        height: 35
                        color: primaryColor
                        radius: 4

                        Row {
                            anchors.fill: parent
                            spacing: 1

                            Rectangle {
                                width: parent.width / 3
                                height: parent.height
                                color: primaryColor

                                Text {
                                    anchors.centerIn: parent
                                    text: "Color Name"
                                    color: "white"
                                    font.bold: true
                                    font.pixelSize: 13
                                }
                            }

                            Rectangle {
                                width: parent.width / 3
                                height: parent.height
                                color: primaryColor

                                Text {
                                    anchors.centerIn: parent
                                    text: "Hex Code"
                                    color: "white"
                                    font.bold: true
                                    font.pixelSize: 13
                                }
                            }

                            Rectangle {
                                width: parent.width / 3
                                height: parent.height
                                color: primaryColor

                                Text {
                                    anchors.centerIn: parent
                                    text: "Category"
                                    color: "white"
                                    font.bold: true
                                    font.pixelSize: 13
                                }
                            }
                        }
                    }

                    ListView {
                        id: tableView
                        Layout.fillWidth: true
                        Layout.preferredHeight: 200
                        clip: true
                        model: isPinkTheme ? tableModel : blueTableModel
                        spacing: 1

                        delegate: Rectangle {
                            width: tableView.width
                            height: 40
                            color: index % 2 === 0 ? backgroundColor : secondaryColor
                            border.color: borderColor
                            border.width: 1

                            Row {
                                anchors.fill: parent
                                spacing: 1

                                Rectangle {
                                    width: parent.width / 3
                                    height: parent.height
                                    color: "transparent"

                                    Text {
                                        anchors.centerIn: parent
                                        text: model.colorName
                                        color: textColor
                                        font.pixelSize: 13
                                    }
                                }

                                Rectangle {
                                    width: parent.width / 3
                                    height: parent.height
                                    color: "transparent"

                                    Text {
                                        anchors.centerIn: parent
                                        text: model.hexCode
                                        color: textColor
                                        font.pixelSize: 13
                                    }
                                }

                                Rectangle {
                                    width: parent.width / 3
                                    height: parent.height
                                    color: "transparent"

                                    Text {
                                        anchors.centerIn: parent
                                        text: model.category
                                        color: textColor
                                        font.pixelSize: 13
                                    }
                                }
                            }
                        }
                    }

                    Label {
                        text: isPinkTheme ? "Pink-themed table with 3 columns and header" : "Sci-Fi blue-themed table with 3 columns and header"
                        color: darkColor
                        font.pixelSize: 11
                    }
                }
            }

            GroupBox {
                title: "TreeView"
                Layout.fillWidth: true
                Material.foreground: foregroundColor

                ColumnLayout {
                    spacing: 10
                    anchors.fill: parent

                    ListView {
                        id: treeView
                        Layout.fillWidth: true
                        Layout.preferredHeight: 220
                        clip: true
                        model: isPinkTheme ? treeModel : blueTreeModel
                        spacing: 2

                        delegate: Rectangle {
                            width: treeView.width
                            height: 35
                            color: model.expanded ? backgroundColor : secondaryColor
                            border.color: borderColor
                            border.width: 1
                            radius: 4
                            visible: model.visible

                            Row {
                                anchors.fill: parent
                                spacing: 8
                                leftPadding: model.level * 20 + 10

                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: model.hasChildren ? (model.expanded ? "▼" : "▶") : "  "
                                    color: primaryColor
                                    font.pixelSize: 12
                                }

                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: model.name
                                    color: textColor
                                    font.pixelSize: 13
                                    font.bold: model.hasChildren
                                }
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    if (model.hasChildren) {
                                        model.expanded = !model.expanded
                                        for (var i = 0; i < treeView.model.count; i++) {
                                            var item = treeView.model.get(i)
                                            if (item.level > model.level && i > index) {
                                                if (item.level === model.level + 1) {
                                                    item.visible = model.expanded
                                                } else if (item.level > model.level + 1) {
                                                    item.visible = false
                                                }
                                            } else if (item.level <= model.level && i > index) {
                                                break
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Label {
                        text: isPinkTheme ? "Expandable tree with 3 main categories and sub-items" : "Expandable tree with 3 blue categories and sub-items"
                        color: darkColor
                        font.pixelSize: 11
                    }
                }
            }

            Item {
                Layout.preferredHeight: 20
            }
        }
    }

    ListModel {
        id: tableModel
        ListElement { colorName: "Pink Rose"; hexCode: "#FF66B2"; category: "Light" }
        ListElement { colorName: "Cherry"; hexCode: "#DE3163"; category: "Medium" }
        ListElement { colorName: "Coral"; hexCode: "#FF7F50"; category: "Medium" }
        ListElement { colorName: "Hot Pink"; hexCode: "#FF69B4"; category: "Vibrant" }
        ListElement { colorName: "Baby Pink"; hexCode: "#F4C2C2"; category: "Light" }
        ListElement { colorName: "Deep Pink"; hexCode: "#FF1493"; category: "Vibrant" }
        ListElement { colorName: "Light Pink"; hexCode: "#FFB6C1"; category: "Light" }
        ListElement { colorName: "Pale Pink"; hexCode: "#FFD1DC"; category: "Light" }
        ListElement { colorName: "Rose Pink"; hexCode: "#FF007F"; category: "Vibrant" }
        ListElement { colorName: "Salmon Pink"; hexCode: "#FF91A4"; category: "Medium" }
    }

    ListModel {
        id: blueTableModel
        ListElement { colorName: "Cyan"; hexCode: "#00BCD4"; category: "Light" }
        ListElement { colorName: "Teal"; hexCode: "#009688"; category: "Medium" }
        ListElement { colorName: "Sky Blue"; hexCode: "#87CEEB"; category: "Medium" }
        ListElement { colorName: "Ocean"; hexCode: "#006994"; category: "Vibrant" }
        ListElement { colorName: "Aqua"; hexCode: "#00FFFF"; category: "Light" }
        ListElement { colorName: "Deep Blue"; hexCode: "#00008B"; category: "Vibrant" }
        ListElement { colorName: "Light Blue"; hexCode: "#ADD8E6"; category: "Light" }
        ListElement { colorName: "Pale Blue"; hexCode: "#B0E0E6"; category: "Light" }
        ListElement { colorName: "Royal Blue"; hexCode: "#4169E1"; category: "Vibrant" }
        ListElement { colorName: "Steel Blue"; hexCode: "#4682B4"; category: "Medium" }
    }

    ListModel {
        id: treeModel
        ListElement { name: "Light Pinks"; level: 0; hasChildren: true; expanded: false; visible: true }
        ListElement { name: "Baby Pink"; level: 1; hasChildren: false; expanded: false; visible: false }
        ListElement { name: "Pale Pink"; level: 1; hasChildren: false; expanded: false; visible: false }
        ListElement { name: "Light Pink"; level: 1; hasChildren: false; expanded: false; visible: false }
        ListElement { name: "Medium Pinks"; level: 0; hasChildren: true; expanded: false; visible: true }
        ListElement { name: "Cherry"; level: 1; hasChildren: false; expanded: false; visible: false }
        ListElement { name: "Coral"; level: 1; hasChildren: false; expanded: false; visible: false }
        ListElement { name: "Salmon Pink"; level: 1; hasChildren: false; expanded: false; visible: false }
        ListElement { name: "Vibrant Pinks"; level: 0; hasChildren: true; expanded: false; visible: true }
        ListElement { name: "Hot Pink"; level: 1; hasChildren: false; expanded: false; visible: false }
        ListElement { name: "Deep Pink"; level: 1; hasChildren: false; expanded: false; visible: false }
        ListElement { name: "Rose Pink"; level: 1; hasChildren: false; expanded: false; visible: false }
    }

    ListModel {
        id: blueTreeModel
        ListElement { name: "Light Blues"; level: 0; hasChildren: true; expanded: false; visible: true }
        ListElement { name: "Cyan"; level: 1; hasChildren: false; expanded: false; visible: false }
        ListElement { name: "Aqua"; level: 1; hasChildren: false; expanded: false; visible: false }
        ListElement { name: "Light Blue"; level: 1; hasChildren: false; expanded: false; visible: false }
        ListElement { name: "Medium Blues"; level: 0; hasChildren: true; expanded: false; visible: true }
        ListElement { name: "Teal"; level: 1; hasChildren: false; expanded: false; visible: false }
        ListElement { name: "Sky Blue"; level: 1; hasChildren: false; expanded: false; visible: false }
        ListElement { name: "Steel Blue"; level: 1; hasChildren: false; expanded: false; visible: false }
        ListElement { name: "Vibrant Blues"; level: 0; hasChildren: true; expanded: false; visible: true }
        ListElement { name: "Ocean"; level: 1; hasChildren: false; expanded: false; visible: false }
        ListElement { name: "Deep Blue"; level: 1; hasChildren: false; expanded: false; visible: false }
        ListElement { name: "Royal Blue"; level: 1; hasChildren: false; expanded: false; visible: false }
    }

    ListModel {
        id: pinkComboModel
        ListElement { text: "Custom Pink" }
        ListElement { text: "Deep Pink" }
    }

    ListModel {
        id: blueComboModel
        ListElement { text: "Custom Blue" }
        ListElement { text: "Deep Blue" }
    }

    Dialog {
        id: dialog
        title: isPinkTheme ? "Pink Theme Dialog" : "Sci-Fi Blue Dialog"
        modal: true
        standardButtons: Dialog.Ok | Dialog.Cancel
        Material.background: backgroundColor
        Material.primary: primaryColor

        Label {
            text: isPinkTheme ? "This is a beautiful pink-themed dialog!\n\nQt 6.8 Material Design" : "This is a futuristic blue-themed dialog!\n\nQt 6.8 Material Design"
            color: foregroundColor
            font.pixelSize: 14
        }
    }
}
