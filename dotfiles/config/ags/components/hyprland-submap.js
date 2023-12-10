import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Hyprland from 'resource:///com/github/Aylur/ags/service/hyprland.js';
import { exec, execAsync } from 'resource:///com/github/Aylur/ags/utils.js';

export const HyprlandSubmap = () => Widget.Label({
  className: 'hyprland-submap',
  connections: [[Hyprland, (self, name) => {
    self.label = `${name ?? ''}`;
  }, 'submap']],
});
