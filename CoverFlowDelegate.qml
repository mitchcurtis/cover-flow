import QtQuick 2.0

Rectangle {
    id: rectDelegate
    width: PathView.view.picSize
    height: width
    z: PathView.zOrder
    color: colors[index % colors.length]
    transform: [
        Rotation {
            angle: rectDelegate.PathView.rotateY
            origin.x: rectDelegate.PathView.angle > 0 ? 0 : 1
            origin.y: rectDelegate.height * 0.3
            axis.x: 0
            axis.y: 1
            axis.z: 0
        },
        Scale {
            xScale: 1.0
            yScale: rectDelegate.PathView.scale
            origin.x: rectDelegate.width / 2
            origin.y: rectDelegate.height * 0.4
        }
    ]

    Text {
        anchors.centerIn: parent
        font.pointSize: 32
        text: index + 1
        color: "white"
    }
}
