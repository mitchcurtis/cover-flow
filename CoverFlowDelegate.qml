import QtQuick 2.0

Item {
    id: root
    width: PathView.view.picSize
    height: width
    z: PathView.zOrder

    transform: [
        Rotation {
            angle: root.PathView.rotateY
            origin.x: rectDelegate.width / 2
            origin.y: rectDelegate.height * 0.3
            axis.x: 0
            axis.y: 1
            axis.z: 0
        },
        Scale {
            xScale: 1.0
            yScale: root.PathView.scale
            origin.x: rectDelegate.width / 2
            origin.y: rectDelegate.height * 0.4
        }
    ]

    // Replace this with an Image, etc.
    Rectangle {
        id: rectDelegate
        anchors.fill: parent
        color: colors[index % colors.length]

        Text {
            anchors.centerIn: parent
            font.pointSize: 32
            text: index + 1
            color: "white"
        }
    }

    ShaderEffectSource {
        id: reflection
        sourceItem: rectDelegate
        y: sourceItem.height
        width: sourceItem.width
        height: sourceItem.height

        transform: [
            Rotation {
                origin.x: reflection.width / 2
                origin.y: reflection.height / 2
                axis.x: 0
                axis.y: 0
                axis.z: 1
                angle: 180
            }
        ]
    }

    Rectangle {
        anchors.fill: reflection

        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "transparent"
            }
            GradientStop {
                position: 1.0
                color: "white"
            }
        }
    }
}
