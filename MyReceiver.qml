import QtQuick 2.0

Item {
    property alias mColor: myReceiverId.color
    property alias mText: myReceiverTextId.text
    function receiveSignal(counter) {
        myReceiverTextId.text = counter
    }

    Rectangle {
        id: myReceiverId
        width: 200
        height: 100
        color: "beige"
        radius: 10
        border {
            width: 2
            color: "black"
        }
        Text {
            id: myReceiverTextId
            anchors.centerIn: myReceiverId
            text: "0"
        }

    }
}
