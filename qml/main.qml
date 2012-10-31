import QtQuick 1.1
import "UI.js" as UI

Rectangle {
    id: window

    property string headerText: "Noter"
    property int fontSize: UI.fontSizes[selectedFontSize]
    property color selectedColor: UI.colors[selectedUIColor]
    property color mainTextColor: selectedColor=="#ffff00" || selectedColor=="#ffc0cb" ? Qt.darker(selectedColor,5) : Qt.lighter(selectedColor,5)

    property int noteIdForLoader: -1
    property string tittleForLoader
    property string contentForLoader

    function newNote(){
        noteIdForLoader = -1
        tittleForLoader = "Insert tittle for your note.."
        contentForLoader = ""
        loader.sourceComponent = notePage
    }

    function showNotes(){
        Noter.readNotes();
        loader.sourceComponent = undefined
    }

    function openNote(id,tittle,content){
        noteIdForLoader = id
        tittleForLoader = tittle
        contentForLoader = content
        loader.sourceComponent = notePage
    }

    width: 800
    height: 480

    color: selectedColor=="#ffff00" || selectedColor=="#ffc0cb" ? "#333333" : "#f2f1f0"

    HeaderBar {
        id: headerBar

        text: headerText

        Text {

            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 10

            text: "+"
            color: mainTextColor
            font.pointSize: 54

            MouseArea {

                anchors.fill: parent

                onClicked: {
                    newNote();
                }
            }
        }
    }

    Notes {

        anchors.left: parent.left
        anchors.right: menu.left
        anchors.top: headerBar.bottom
        anchors.bottom: parent.bottom
    }

    MenuButton {

        anchors.right: parent.right
        anchors.bottom: parent.bottom

        color: window.color=="#333333" ? "#FDFDFD" : "black"

        MouseArea {

            anchors.fill: parent

            onClicked: {
                enterAnimation.restart()
            }
        }
    }

    Menu {
        id: menu

        x: window.width

        onRequestHide: {
            exitAnimation.restart()//x = window.width+width
        }
    }

    Loader {
        id: loader

        anchors.fill: parent

        //sourceComponent: notePage
    }

    Component {
        id: notePage

        NotePage {
            tittle: tittleForLoader
            content: contentForLoader
            noteId: noteIdForLoader
        }
    }

    ParallelAnimation {
        id: enterAnimation;
        PropertyAnimation { target: menu; property: "x"; to: window.width-menu.width; easing.type: Easing.InQuad; duration: 300}
        PropertyAnimation { target: menu; property: "opacity"; to: 1; duration: 300}
    }

    ParallelAnimation {
        id: exitAnimation;
        PropertyAnimation {target: menu; property: "x"; to: window.width; easing.type: Easing.OutQuad; duration: 300}
        PropertyAnimation { target: menu; property: "opacity"; to: 0; duration: 300}
    }
}
