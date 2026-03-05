import QtQuick

Item {
    Text {
        id: name
        anchors.centerIn: parent
        color: "white"
        font.pixelSize: 70
        text: qsTr("音乐界面(待做。。。)")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
    }
}
