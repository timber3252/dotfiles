import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Variable from 'resource:///com/github/Aylur/ags/variable.js';
import { exec, execAsync } from 'resource:///com/github/Aylur/ags/utils.js';

const alt = Variable(true);

export const Clock = () => Widget.Button({
  className: 'clock',
  onClicked: () => alt.value = !alt.value,
  child: Widget.Box({
    spacing: 10,
    children: [
      Widget.Label({
	label: '󱑍'
      }),
      Widget.Label({
        connections: [
          [1000, self => execAsync(['date', '+%a %b %d, %I:%M %p'])
            .then(date => self.label = `${alt.value ? date : date.split(', ')[1]}`).catch(console.error)],
          [alt, self => execAsync(['date', '+%a %b %d, %I:%M %p'])
            .then(date => self.label = `${alt.value ? date : date.split(', ')[1]}`).catch(console.error)],
        ],
      }),
    ],
  }),
});
