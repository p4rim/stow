
import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Io
import Quickshell.Wayland

PanelWindow {
    id: launcher

    anchors {
        top: true
        left: true
        right: true
        bottom: true
    }

    visible: false
    color: "transparent"
    exclusiveZone: 0

    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

    property int selectedIndex: -1

    function moveSelection(direction) {
        const count = apps.count

        if (count === 0)
            return

        let i = selectedIndex

        if (i < 0)
            i = direction > 0 ? -1 : 0

        for (let step = 0; step < count; step++) {
            i = (i + direction + count) % count

            const row = apps.itemAt(i)

            if (row && row.visible) {
                selectedIndex = i

                if (row.y < appList.contentY) {
                    appList.contentY = row.y
                } else if (
                    row.y + row.height >
                    appList.contentY + appList.height
                ) {
                    appList.contentY =
                        row.y + row.height - appList.height
                }

                return
            }
        }
    }

    IpcHandler {
        target: "launcher"

        function toggle(): void {
            launcher.visible = !launcher.visible
        }
    }

    onVisibleChanged: {
        if (visible) {
            search.text = ""
            selectedIndex = -1
            search.forceActiveFocus()
        }
    }

    Item {
        width: 520
        height: 360
        anchors.centerIn: parent

        Rectangle {
            anchors.fill: parent
            color: "#000000"
            border.color: "#ffffff"
            border.width: 1

            Column {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 14

                Text {
                    text: "BLACKBOX"
                    color: "#ffffff"
                    font.family: "monospace"
                    font.pixelSize: 16
                    font.bold: true
                }

                TextField {
                    id: search

                    width: parent.width
                    height: 38

                    placeholderText: "Search applications..."
                    color: "#ffffff"
                    placeholderTextColor: "#777777"
                    selectionColor: "#ffffff"
                    selectedTextColor: "#000000"

                    font.family: "monospace"
                    font.pixelSize: 13

                    background: Rectangle {
                        color: "#000000"
                        border.color: "#ffffff"
                        border.width: 1
                    }

                    onTextChanged: {
                        launcher.selectedIndex = -1
                    }

                    Keys.onPressed: function(event) {
                        if (event.key === Qt.Key_Down) {
                            launcher.moveSelection(1)
                            event.accepted = true
                        } else if (event.key === Qt.Key_Up) {
                            launcher.moveSelection(-1)
                            event.accepted = true
                        } else if (event.key === Qt.Key_Escape) {
                            launcher.visible = false
                            event.accepted = true
                        }
                    }

                    onAccepted: {
                        let selectedRow = null

                        if (launcher.selectedIndex >= 0) {
                            selectedRow =
                                apps.itemAt(launcher.selectedIndex)

                            if (selectedRow && !selectedRow.visible)
                                selectedRow = null
                        }

                        if (!selectedRow) {
                            for (let i = 0; i < apps.count; i++) {
                                const candidate = apps.itemAt(i)

                                if (candidate && candidate.visible) {
                                    selectedRow = candidate
                                    break
                                }
                            }
                        }

                        if (selectedRow) {
                            selectedRow.appEntry.execute()
                            launcher.visible = false
                        }
                    }
                }

                Flickable {
                    id: appList

                    width: parent.width
                    height: 220

                    contentWidth: width
                    contentHeight: results.implicitHeight
                    clip: true
                    boundsBehavior: Flickable.StopAtBounds

                    Column {
                        id: results

                        width: appList.width
                        spacing: 2

                        Repeater {
                            id: apps

                            model: DesktopEntries.applications

                            delegate: Rectangle {
                                required property var modelData
                                required property int index

                                property var appEntry: modelData

                                readonly property string appName:
                                    String(appEntry.name || "")

                                readonly property string appDescription:
                                    String(appEntry.genericName || "")

                                readonly property bool matchesSearch: {
                                    const query =
                                        search.text.trim().toLowerCase()

                                    return query === ""
                                        || appName.toLowerCase().includes(query)
                                        || appDescription.toLowerCase().includes(query)
                                }

                                width: results.width
                                height: matchesSearch ? 28 : 0
                                visible: matchesSearch

                                color: launcher.selectedIndex === index
                                    ? "#ffffff"
                                    : "#000000"

                                Text {
                                    anchors.fill: parent
                                    anchors.leftMargin: 10
                                    anchors.rightMargin: 10

                                    verticalAlignment: Text.AlignVCenter
                                    text: parent.appName

                                    color: launcher.selectedIndex ===
                                           parent.index
                                        ? "#000000"
                                        : "#ffffff"

                                    font.family: "monospace"
                                    font.pixelSize: 13
                                    elide: Text.ElideRight
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    cursorShape: Qt.PointingHandCursor

                                    onEntered: {
                                        launcher.selectedIndex =
                                            parent.index
                                    }

                                    onClicked: {
                                        parent.appEntry.execute()
                                        launcher.visible = false
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

// import QtQuick
// import QtQuick.Controls
// import Quickshell
// import Quickshell.Io
// import Quickshell.Wayland
//
// PopupWindow {
//     id: launcher
//
//     property var anchorWindow
//
//     function moveSelection(direction) {
//       const count = apps.count 
//       if (count === 0) {
//         return
//
//         let i = selectionIndex
//
//         if (i < 0) i = direction > 0 ? -1 : 0
//
//         for (let step = 0; step < count; step++) {
//           i = (i + direction + count) % count
//
//           const row = apps.itemAt(i)
//
//           if (row && row.visible) {
//             selectedIndex = i
//
//             if (row.y < appList.contentY) {
//               appList.contentY = row.y
//
//             } else if (row.y + row.height > appList.contentY + appList.height) {
//               appList.contentY = row.y + row.height - appList.height
//             }
//
//             return
//           }
//         }
//       }
//     }
//
//     IpcHandler {
//         target: "launcher"
//
//         function toggle(): void {
//             launcher.visible = !launcher.visible
//         }
//     }
//
//
//     anchor.window: anchorWindow
//     anchor.rect.x: anchorWindow ? (anchorWindow.width - width) / 2 : 0
//     anchor.rect.y: 100
//
//     implicitWidth: 520
//     implicitHeight: 360
//
//     visible: true 
//     color: "#000000"
//     grabFocus: true
//
//     onVisibleChanged: {
//         if (visible) {
//             search.text = ""
//             search.forceActiveFocus()
//         }
//     }
//
//     Item {
//         width: 520
//         height: 360
//
//         Rectangle {
//             anchors.fill: parent
//             color: "#000000"
//             border.color: "#ffffff"
//             border.width: 1
//
//             Column {
//                 x: 20
//                 y: 20
//                 width: 478
//                 spacing: 14
//
//                 Text {
//                     text: "BLACKBOX"
//                     color: "#ffffff"
//                     font.family: "monospace"
//                     font.pixelSize: 16
//                     font.bold: true
//                 }
//
//                 TextField {
//                     id: search
//
//                     width: parent.width
//                     height: 38
//                     placeholderText: "Search applications..."
//                     color: "#ffffff"
//                     placeholderTextColor: "#777777"
//                     selectionColor: "#ffffff"
//                     selectedTextColor: "#000000"
//                     font.family: "monospace"
//                     font.pixelSize: 13
//
//                     background: Rectangle {
//                         color: "#000000"
//                         border.color: "#ffffff"
//                         border.width: 1
//                     }
//
//                     Keys.onEscapePressed: {
//                         launcher.visible = false
//                     }
//
//                     onAccepted: {
//                         for (let i = 0; i < apps.count; i++) {
//                             const entry = apps.itemAt(i)
//
//                             if (entry && entry.visible) {
//                                 entry.appEntry.execute()
//                                 launcher.visible = false
//                                 return
//                             }
//                         }
//                     }
//                 }
//
//                 Flickable {
//                     width: parent.width
//                     height: 220
//                     contentWidth: width
//                     contentHeight: results.implicitHeight
//                     clip: true
//                     boundsBehavior: Flickable.StopAtBounds
//
//                     Column {
//                         id: results
//                         width: parent.width
//                         spacing: 2
//
//                         Repeater {
//                             id: apps
//                             model: DesktopEntries.applications
//
//                             delegate: Rectangle {
//                                 required property var modelData
//                                 property var appEntry: modelData
//
//                                 readonly property string appName:
//                                     String(appEntry.name || "")
//
//                                 readonly property string appDescription:
//                                     String(appEntry.genericName || "")
//
//                                 property bool matchesSearch: {
//                                     const query = search.text.trim().toLowerCase()
//
//                                     return query === ""
//                                         || appName.toLowerCase().includes(query)
//                                         || appDescription.toLowerCase().includes(query)
//                                 }
//
//                                 width: results.width
//                                 height: matchesSearch ? 28 : 0
//                                 visible: matchesSearch
//                                 color: "#000000"
//
//                                 Text {
//                                     anchors.fill: parent
//                                     anchors.leftMargin: 10
//                                     anchors.rightMargin: 10
//                                     verticalAlignment: Text.AlignVCenter
//
//                                     text: parent.appName
//                                     color: "#ffffff"
//                                     font.family: "monospace"
//                                     font.pixelSize: 13
//                                     elide: Text.ElideRight
//                                 }
//
//                                 MouseArea {
//                                     anchors.fill: parent
//
//                                     onClicked: {
//                                         parent.appEntry.execute()
//                                         launcher.visible = false
//                                     }
//                                 }
//                             }
//                         }
//                     }
//                 }
//             }
//         }
//     }
// }
