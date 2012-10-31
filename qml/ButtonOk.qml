import QtQuick 1.1

Rectangle {
    id: buttonOk

    signal clicked;

    width: 100
    height: 62

    color: "#00000000"

    border.color: mainTextColor
    border.width: 2
    radius: 2

    Text {
        id: name

        anchors.centerIn: parent

        text: qsTr("Ok")
        color: mainTextColor
        font.pointSize: 34
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            buttonOk.clicked();
        }
    }
}
