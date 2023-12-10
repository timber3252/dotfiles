import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Variable from 'resource:///com/github/Aylur/ags/variable.js';
import { exec, execAsync } from 'resource:///com/github/Aylur/ags/utils.js';

const dark = Variable(false);

const updateDarkmanStatus = () => {
  execAsync(['darkmanctl', 'get'])
    .then(res => dark.value = res.includes("dark"))
    .catch(console.error);
};

export const Darkman = () => Widget.Button({
  className: 'darkman',
  onClicked: () => {
    execAsync(['darkmanctl', 'toggle']);
    updateDarkmanStatus();
  },
  child: Widget.Box({
    spacing: 10,
    children: [
      Widget.Label({
        connections: [
          [1000, self => updateDarkmanStatus()],
          [dark, self => self.label = dark.value ? '' : ''],
        ],
      }),
    ],
  }),
});
