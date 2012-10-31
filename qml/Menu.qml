import QtQuick 1.1
import "UI.js" as UI

Rectangle {

    signal requestHide;

    width: 250
    height: parent.height

    color: selectedColor

    Text {
        id: lblColor

        width: parent.width - 20
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter

        font.pointSize: 28
        text: qsTr("Color:")
        horizontalAlignment: Text.AlignLeft

        color: mainTextColor
    }

    Flickable {
        id: colorsFlickable

        anchors.top: lblColor.bottom
        //anchors.bottom: lblFontSize.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10

        height: 160

        clip: true

        contentHeight: colorGrid.height

        Grid {
            id: colorGrid

            columns: 2
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Repeater {
                model: UI.colors.length

                Rectangle {
                    width: 80
                    height: 80
                    color: chooserArea.pressed ? Qt.darker(UI.colors[index]) : UI.colors[index]
                    radius: 2
                    border.color: mainTextColor
                    border.width: 2

                    MouseArea {
                        id: chooserArea
                        anchors.fill: parent
                        onClicked: {
                            Noter.setSelectedColor(index)
                        }
                    }
                }
            }
        }
    }

    Text {
        id: lblFontSize

        width: parent.width - 20

        anchors.top: colorsFlickable.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter

        font.pointSize: 28
        text: qsTr("Font size:")
        horizontalAlignment: Text.AlignLeft

        color: mainTextColor
    }

    Rectangle {
        id: fontSize1

        anchors.top: lblFontSize.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10

        width: 70
        height: 60

        color: "#00000000"

        border.color: mainTextColor
        border.width: 2

        Text {

            anchors.centerIn: parent

            font.pointSize: UI.fontSizes[0]
            text: qsTr("1")

            color: mainTextColor
        }

        MouseArea {

            anchors.fill: parent

            onClicked: {
                Noter.setSelectedFontSize(0);
            }
        }
    }

    Rectangle {
        id: fontSize2

        anchors.top: lblFontSize.bottom
        anchors.topMargin: 10
        anchors.left: fontSize1.right
        anchors.leftMargin: 10

        width: 70
        height: 60

        color: "#00000000"

        border.color: mainTextColor
        border.width: 2

        Text {

            anchors.centerIn: parent

            font.pointSize: UI.fontSizes[1]
            text: qsTr("2")

            color: mainTextColor
        }

        MouseArea {

            anchors.fill: parent

            onClicked: {
                Noter.setSelectedFontSize(1);
            }
        }
    }

    Rectangle {
        id: fontSize3

        anchors.top: lblFontSize.bottom
        anchors.topMargin: 10
        anchors.left: fontSize2.right
        anchors.leftMargin: 10

        width: 70
        height: 60

        color: "#00000000"

        border.color: mainTextColor
        border.width: 2

        Text {

            anchors.centerIn: parent

            font.pointSize: UI.fontSizes[2]
            text: qsTr("3")

            color: mainTextColor
        }

        MouseArea {

            anchors.fill: parent

            onClicked: {
                Noter.setSelectedFontSize(2);
            }
        }
    }


    ButtonOk {
        id: buttonOk

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10

        onClicked: requestHide();
    }
}
