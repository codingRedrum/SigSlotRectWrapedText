import QtQuick 2.0

Item {

    property int counter: 0
    width: myRectId.width
    height: myRectId.height
    property alias mColor: myRectId.color
    signal passCounter(string counter) // declaring signal
    property MyReceiver target: null
    property MyReceiver target2: null

    onTargetChanged: {
        passCounter.connect(target.receiveSignal)
    }

    Rectangle {
        id: myRectId
        width: 200
        height: 100
        color: "beige"
        radius: 10
        border {
            width: 2
            color: "black"
        }
        Text {
            id: myRectTextId
            anchors.centerIn: myRectId
            text: counter
        }
            MouseArea {
                anchors.fill: myRectId
                onClicked: {
                    counter++
                    console.log(counter)
                    passCounter(counter)
                }
            }
    }
}
