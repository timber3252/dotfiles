import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import { Clock } from './clock.js';
import { Cpu } from './cpu.js';
import { Darkman } from './darkman.js';
import { HyprlandWorkspaces } from './hyprland-workspaces.js';
import { HyprlandSubmap } from './hyprland-submap.js';
import { Memory } from './memory.js';
import { Mpris } from './mpris.js';
import { PulseAudio } from './pulseaudio.js';
import { Spacer } from './spacer.js';
import { SysTray } from './systray.js';

const Left = () => Widget.Box({
  children: [
    Cpu(),
    Spacer(),
    Memory(),
    Spacer(),
    Mpris(),
    Spacer(),
    SysTray(),
    Spacer(),
  ],
});

const Center = () => Widget.Box({
  children: [
    HyprlandWorkspaces(),
  ],
});

const Right = () => Widget.Box({
  hpack: 'end',
  children: [
    HyprlandSubmap(),
    Spacer(),
    PulseAudio(),
    Spacer(),
    Clock(),
    Spacer(),
    Darkman(),
  ],
});

export const TopBar = ({ monitor } = {}) => Widget.Window({
  name: `bar-${monitor}`,
  className: 'bar',
  monitor,
  anchor: ['top', 'left', 'right'],
  exclusivity: 'exclusive',
  child: Widget.CenterBox({
    startWidget: Left(),
    centerWidget: Center(),
    endWidget: Right(),
  }),
});

