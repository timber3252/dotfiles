import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Variable from 'resource:///com/github/Aylur/ags/variable.js';
import { exec, execAsync } from 'resource:///com/github/Aylur/ags/utils.js';

const parseMemoryUsage = (meminfo) => {
  const now = {};
  const lines = meminfo.split('\n');
  lines.forEach(line => {
    const [_, k, v] = line.match('(.+):\\s*(\\d+).*');
    if      (k == "MemTotal")     now.total = Math.floor(v / 1024 + 0.5);
    else if (k == "MemFree")      now.free  = Math.floor(v / 1024 + 0.5);
    else if (k == "Buffers")      now.buf   = Math.floor(v / 1024 + 0.5);
    else if (k == "Cached")       now.cache = Math.floor(v / 1024 + 0.5);
    else if (k == "SwapTotal")    now.swap  = Math.floor(v / 1024 + 0.5);
    else if (k == "SwapFree")     now.swapf = Math.floor(v / 1024 + 0.5);
    else if (k == "SReclaimable") now.srec  = Math.floor(v / 1024 + 0.5);
  });

  now.used = now.total - now.free - now.buf - now.cache - now.srec;
  now.percent = Math.floor(now.used / now.total * 100);

  return now;
}

export const Memory = () => Widget.Button({
  className: 'memory',
  child: Widget.Box({
    spacing: 10,
    children: [
      Widget.Label({
	label: ''
      }),
      Widget.Label({
        connections: [
          [2000, self => execAsync(['/bin/cat', '/proc/meminfo'])
            .then(meminfo => {
	      const res = parseMemoryUsage(meminfo);
	      const percent = res.percent;
	      const used = Number(Math.floor(res.used / 1024 * 100) / 100).toFixed(2);
	      self.label = `${percent}% / ${used}GiB`;
	    }).catch(console.error)
	  ],
        ],
      }),
    ],
  }),
});
