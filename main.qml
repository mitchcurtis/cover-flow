import QtQuick 2.0
import QtQuick.Window 2.0

Window {
    width: 1200
    height: 800
    visible: true

    property var colors: ["salmon", "steelblue", "navajowhite"]

    PathView {
        id: view
        anchors.fill: parent
        model: 100
        flickDeceleration: 190
        highlightRangeMode: PathView.StrictlyEnforceRange
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        pathItemCount: 9

        property real centerX: width / 2
        property real vertOff: height / 2
        property real picSize: 200

        path: CoverFlowPath {
            pathView: view
        }
        delegate: CoverFlowDelegate {
            //
        }
    }
}
