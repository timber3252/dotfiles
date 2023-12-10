import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Variable from 'resource:///com/github/Aylur/ags/variable.js';
import Gio from 'gi://Gio';
import { exec, execAsync } from 'resource:///com/github/Aylur/ags/utils.js';

export const Network = () => Widget.Button({
  className: 'network',
  child: Widget.Box({
    spacing: 10,
    children: [
      Widget.Label({
	label: '󰇚',
      }),
      Widget.Label({
	label: '114.0B/s',
      }),
      Widget.Label({
	label: '󰕒',
      }),
      Widget.Label({
	label: '514.0B/s',
      }),
    ],
  }),
  connections: [
  ],
});
