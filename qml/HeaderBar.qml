import QtQuick 1.1

Rectangle {
    id: headerBar

    property alias text: txt.text

    width: parent.width
    height: 80

    color: selectedColor

    Binding { target: headerBar; property: "color"; value: selectedColor }

    Text {
        id: txt

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10

        width: parent.width - 120

        elide: Text.ElideRight

        color: mainTextColor

        font.pointSize: 32
    }
}
