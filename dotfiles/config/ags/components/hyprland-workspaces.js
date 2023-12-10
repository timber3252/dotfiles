import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Hyprland from 'resource:///com/github/Aylur/ags/service/hyprland.js';
import { exec, execAsync } from 'resource:///com/github/Aylur/ags/utils.js';

export const HyprlandWorkspaces = () => Widget.Box({
  className: 'hyprland-workspaces',
  connections: [
    [Hyprland, self => {
      self.children = Hyprland.workspaces.sort((x, y) => x.id > y.id).map(ws => Widget.Button({
        onClicked: () => execAsync(`hyprctl dispatch workspace ${ws.id}`),
        child: Widget.Label(`${ws.id}`),
        className: Hyprland.active.workspace.id == ws.id ? 'focused' : '',
      }));
    }],
  ],
});
