import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io

PanelWindow {
    id: bar
    property bool barVisible: true
    visible: barVisible

    Launcher {}

    IpcHandler {
        target: "bar"

        function toggle(): void {
            bar.barVisible = !bar.barVisible
        }
    }

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 24
    color: "#000000"
    exclusiveZone: 24

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 0
        anchors.rightMargin: 8
        spacing: 0

        Row {
            spacing: 0
            Layout.alignment: Qt.AlignVCenter

            Repeater {
                model: Hyprland.workspaces

                delegate: Rectangle {
                    id: workspaceBox

                    required property HyprlandWorkspace modelData

                    visible: modelData.toplevels.values.length > 0
                          || modelData.focused

                    color: modelData.focused ? "#ffffff" : "#000000"

                    implicitWidth: workspaceText.implicitWidth + 14
                    implicitHeight: 24

                    Text {
                        id: workspaceText

                        anchors.centerIn: parent

                        text: String(workspaceBox.modelData.id)
                        color: workspaceBox.modelData.focused
                               ? "#000000" : "#ffffff"

                        font.family: "monospace"
                        font.pixelSize: 16
                        font.bold: workspaceBox.modelData.focused
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: workspaceBox.modelData.activate()
                        cursorShape: Qt.PointingHandCursor
                    }
                }
            }
        }

        Item {
            Layout.fillWidth: true
        }

        Text {
            id: clock

            color: "#ffffff"
            text: Qt.formatDateTime(new Date(), "dddd, dd MMMM yyyy  hh:mm AP")

            font.family: "monospace"
            font.pixelSize: 12

            Layout.alignment: Qt.AlignVCenter

            Timer {
                interval: 1000
                running: true
                repeat: true

                onTriggered: {
                    clock.text = Qt.formatDateTime(
                        new Date(), "dddd, dd MMMM yyyy  hh:mm AP"
                    )
                }
            }
        }
    }

    // Rectangle {
    //     anchors {
    //         left: parent.left
    //         right: parent.right
    //         bottom: parent.bottom
    //     }
    //
    //     height: 1
    //     color: "#ffffff"
    //     z: 100
    // }
}
