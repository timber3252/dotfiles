import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Variable from 'resource:///com/github/Aylur/ags/variable.js';
import { exec, execAsync } from 'resource:///com/github/Aylur/ags/utils.js';

const freqInfo = Variable('0.00');
const usageInfo = Variable('0');

const parseCpuFrequencies = (cpuinfo, mode = 'max', filterIdle = true) => {
  const lines = cpuinfo.split('\n');
  let freqs = [];
  
  lines.forEach(line => {
    if (line.includes('cpu MHz')) {
      const [_, freq] = line.match('.+: (.+)');
      freqs.push(freq);
    }
  });

  let ret = .0;

  if (filterIdle)
    freqs = freqs.filter(x => x >= 1000);

  if (mode == 'avg') {
    const sum = freqs.reduce((acc, curr) => acc + parseFloat(curr), 0);
    ret = sum / freqs.length;
  } else if (mode == 'max') {
    ret = freqs.reduce((acc, curr) => Math.max(acc, curr), -Infinity);
  }

  return Number(Math.round(ret / 10) / 100).toFixed(2);
};

let idlePrev = 0;
let totalPrev = 0;

const parseCpuUsage = (stat) => {
  // _, user, nice, system, idle, iowait, irq, softirq, steal
  const res = stat.match('(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)');
  res.shift();

  const idle = parseFloat(res[3]);
  const total = res.reduce((acc, curr) => acc + parseFloat(curr), 0);
  const diffIdle = idle - idlePrev;
  const diffTotal = total - totalPrev;
  const diffUsage = Math.round(1000 * (diffTotal - diffIdle) / diffTotal) / 10;

  idlePrev = idle;
  totalPrev = total;

  return diffUsage;
};

export const Cpu = () => Widget.Button({
  className: 'cpu',
  child: Widget.Box({
    spacing: 10, children: [
      Widget.Label({
	label: ''
      }),
      Widget.Label({
        connections: [
          [2000, self => execAsync(['/bin/head', '-1', '/proc/stat'])
            .then(stat => {
	      usageInfo.value = parseCpuUsage(stat);
	    }).catch(console.error)
	  ],
	  [2000, self => execAsync(['/bin/cat', '/proc/cpuinfo'])
	    .then(cpuinfo => {
	      freqInfo.value = parseCpuFrequencies(cpuinfo, 'avg');
	    }).catch(console.error)
	  ],
	  [freqInfo, self => {
	    self.label = `${usageInfo.value}% / ${freqInfo.value}GHz`;
	  }],
	  [usageInfo, self => {
	    self.label = `${usageInfo.value}% / ${freqInfo.value}GHz`;
	  }],
        ],
      }),
    ],
  }),
});
