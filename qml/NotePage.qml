import QtQuick 1.1

Rectangle {
    id: notePage

    height: window.height
    width: window.width
    color: window.color

    property int noteId: -1

    property alias tittle: tittleTxt.text
    property alias content: contentTxt.text

    HeaderBar {
        id: headerBar

        TextInput {
            id: tittleTxt

            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter

            width: noteId ===-1 ? parent.width - 180 : parent.width - 270

            color: mainTextColor

            font.pointSize: 32

            //autoScroll : false

            selectByMouse: true
        }

        Rectangle {
            id: btnDelete

            visible: noteId ===-1 ? false : true

            color: "#00000000"

            anchors.bottom: parent.bottom
            anchors.right: btnBack.left
            anchors.margins: 5

            border.color: mainTextColor
            border.width: 2

            width: 80
            height: parent.height-10

            Text {
                text: qsTr("Delete")

                anchors.centerIn: parent

                color: mainTextColor

                font.pointSize: 20
            }

            MouseArea {

                anchors.fill: parent

                onClicked: {
                    Noter.deleteNote(noteId)
                    showNotes();
                }
            }
        }

        Rectangle {
            id: btnBack

            color: "#00000000"

            anchors.bottom: parent.bottom
            anchors.right: btnSave.left
            anchors.margins: 5

            border.color: mainTextColor
            border.width: 2

            width: 80
            height: parent.height-10

            Text {
                text: qsTr("Back")

                anchors.centerIn: parent

                color: mainTextColor

                font.pointSize: 20
            }

            MouseArea {

                anchors.fill: parent

                onClicked: {
                    showNotes();
                }
            }
        }

        Rectangle {
            id: btnSave

            color: "#00000000"

            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5

            border.color: mainTextColor
            border.width: 2

            width: 80
            height: parent.height - 10

            Text {
                text: qsTr("Save")

                anchors.centerIn: parent

                color: mainTextColor

                font.pointSize: 22
            }

            MouseArea {

                anchors.fill: parent

                onClicked: {
                    if (noteId===-1){
                        Noter.addNote(tittle,contentTxt.text);
                        showNotes();
                    }else{
                        Noter.updateNote(noteId,tittle,content);
                        showNotes();
                    }
                }
            }
        }
    }

    Flickable {
        id: flick

        anchors.top: headerBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 10
//        anchors.topMargin: 10
//        anchors.leftMargin: 10
//        anchors.rightMargin: 10
//        anchors.bottomMargin: 10

        //contentWidth: contentTxt.paintedWidth
        contentHeight: contentTxt.paintedHeight
        clip: true

        function ensureVisible(r)
        {
            if (contentX >= r.x)
                contentX = r.x;
            else if (contentX+width <= r.x+r.width)
                contentX = r.x+r.width-width;
            if (contentY >= r.y)
                contentY = r.y;
            else if (contentY+height <= r.y+r.height)
                contentY = r.y+r.height-height;
        }

        TextEdit {
            id: contentTxt

            width: flick.width
            height: flick.height

            focus: true

            wrapMode: TextEdit.Wrap

            onCursorRectangleChanged: flick.ensureVisible(cursorRectangle)

            font.pointSize: fontSize

            color: selectedColor=="#ffff00" || selectedColor=="#ffc0cb" ? "white" : "black"
        }
    }
}
