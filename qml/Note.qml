import QtQuick 1.1
import "UI.js" as UI

Rectangle {

    property alias tittle: txtTittle.text
    property alias content: txtContent.text
    property alias date: txtDate.text
    property int noteId: -1

    signal requestShow(int id)

    height: 120
    width: parent.width

    color: "#00000000"

    Rectangle {

        anchors.top: parent.top
        anchors.topMargin: -4

        width: parent.width
        height: 4
        color: window.color=="#333333" ? "black" : "white"
    }

    Text {
        id: txtTittle

        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 10

        width: parent.width - 20

        elide: Text.ElideRight

        font.pointSize: UI.fontSizes[1]
        font.bold: true

        color: selectedColor=="#ffff00" || selectedColor=="#ffc0cb" ? "white" : "black"
    }

    Text {
        id: txtContent

        anchors.top: txtTittle.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 10

        width: parent.width - 20

        elide: Text.ElideRight

        font.pointSize: UI.fontSizes[0]

        color: selectedColor=="#ffff00" || selectedColor=="#ffc0cb" ? "white" : "black"
    }

    Text {
        id: txtDate

        anchors.top: txtContent.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 10

        width: parent.width - 20

        elide: Text.ElideRight

        font.pointSize: UI.fontSizes[0]-8
        color: selectedColor
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            openNote(noteId,tittle,content)
        }
    }
}
