import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: win1
    width: 640
    height: 480
    visible: true
    title: qsTr("My first project")


    Column {
    MyRectangle {
        id: myRect1
        target: myReceiver1
        x: 10 ; y: 10
        mColor: "#ffe4c4"

    }

    MyReceiver {
        id: myReceiver1
        anchors.top: myRect1.bottom
        anchors.left: myRect1.left
        anchors.topMargin: 30
    }

    MyReceiver {
        id: myReceiver2
        anchors.top: myReceiver1.bottom
        anchors.left: myReceiver1.left
        anchors.topMargin: 130
        mText: "Welcome"
        mColor: "#b8860b"
    }

}

    Rectangle { // this one will show us a specified below rect with some info
        x: 380
        id: firstRectId
        width: firstRectTextId.width + 20
        height: firstRectTextId.height + 10
        radius: 10
        border.color: "black"
        border.width: 2


        Text {
            id: firstRectTextId
            anchors.centerIn: firstRectId
            text: qsTr("Type your name below:")
            font.pixelSize: 20
        }

     }

    Rectangle { // this one will show us a specified below rect with some info

        id: secRectId
        width: secRectTextId.width + 20
        height: secRectTextId.height + 10
        radius: 10
        border.color: "black"
        border.width: 2
        anchors.top: firstRectId.bottom
        anchors.left: firstRectId.left
        anchors.topMargin: 20

        TextInput {
            id: secRectTextId
            anchors.centerIn: secRectId
            text: qsTr("Type in your first name:")
            font.pixelSize: 20
            //focus: true
                onEditingFinished: {
                console.log("You have just typed " + text)
            }
        }

     }

    Flickable {
            id: flickableId
            width: textInputId.width
            contentHeight: textInputId.implicitHeight
            height: 250
            anchors.left: secRectId.left
            anchors.top: secRectId.bottom
            anchors.topMargin: 10
            clip: true

            TextEdit {
                id: textInputId
                width: 240

                text: "Qt (pronounced [7][8][9]) is a <b>widget</b> toolkit for creating graphical user interfaces as " +
                      "well as cross-platform applications that run on various software and hardware platforms " +
                      "such as <font color = 'red'> Linux, Windows, macOS, Android </font> or <font color = 'red'> embedded systems </font> with little or no change " +
                      "in the underlying codebase while still being a native application with native capabilities " +
                      "and speed."

                wrapMode: TextEdit.Wrap // owija tekst / zawija
                textFormat: TextEdit.RichText // processing text
                font.family: "Helvetica"
                font.pointSize: 20
                color: "blue"
                focus: true

                onEditingFinished: { // capturing text but to do it you need to take focus from Flickable
                    console.log("The current text is: " + text)
                }
            }

        }

        Rectangle {
            id: rectButonBelowTextRangeId
            width: textInputId.width
            height: rectButonBelowTextRangeTextId.height + 10
            radius: 10
            color: "beige"
            border {
                color: "black"
                width: 2
            }
            anchors.top: flickableId.bottom
            anchors.left: flickableId.left
            anchors.topMargin: 10

            Text {
                id: rectButonBelowTextRangeTextId
                anchors.centerIn: rectButonBelowTextRangeId
                text: qsTr("EXIT")
            }
            MouseArea {
                anchors.fill: rectButonBelowTextRangeId
                onClicked: {
                //rectButonBelowTextRangeId.focus = true
                console.log("The new text is " + textInputId.text)
                Qt.quit()
                }
            }
        }

    }
