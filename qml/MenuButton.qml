import QtQuick 1.1

Item {
    id: menuButtom

    property color color

    width: 50
    height: 50

    Flow {

        spacing: 8

        Rectangle {

            y: menuButtom.height-(height/2)

            height: 30
            width: 6

            color: menuButtom.color
        }

        Rectangle {

            y: menuButtom.height-(height/2)

            height: 30
            width: 6

            color: menuButtom.color
        }

        Rectangle {

            y: menuButtom.height-(height/2)

            height: 30
            width: 6

            color: menuButtom.color
        }
    }
}
