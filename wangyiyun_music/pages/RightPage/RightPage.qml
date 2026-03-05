import QtQuick
import QtQuick.Window
import Qt5Compat.GraphicalEffects
import QtQuick.Controls
import "../../components"
import "../../basic"

Rectangle {
    TopTitle{
        id: topTitleArea
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 40
        color: "#13131a"
    }

    StackView {
        id: mainStackView
        anchors.top: titleArea.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100
        clip: true
        initialItem: "./CherryPickPage.qml"
    }



}
