import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Variable from 'resource:///com/github/Aylur/ags/variable.js';
import { exec, execAsync } from 'resource:///com/github/Aylur/ags/utils.js';

const batteryPercentage = Variable(0);

const getIcon = (percentage) => {
  if (percentage < 15) {
    return '';
  } else if (percentage < 40) {
    return '';
  } else if (percentage < 60) {
    return '';
  } else if (percentage < 80) {
    return '';
  } else if (percentage <= 100) {
    return '';
  }
}

// no plan for multiple battery support currently
const parseBatteryStatus = (stat) => {
  const percentage = stat.match("^.*, ([0-9]*)%");

  batteryPercentage.value = parseInt(percentage[1]);
  return percentage[1];
}

export const Battery = () => Widget.Button({
  className: 'battery',
  child: Widget.Box({
    spacing: 15,
    children: [
      Widget.Label({
        connections: [
          [batteryPercentage, self => {
            self.label = getIcon(batteryPercentage.value);
          }],
        ],
      }),
      Widget.Label({
        connections: [
          [1000, self => execAsync(['/bin/acpi'])
            .then(stat => {
	            const res = parseBatteryStatus(stat);
	            self.label = `${res}%`;
	          }).catch(console.error)
	        ],
        ],
      }),
    ],
  }),
});
