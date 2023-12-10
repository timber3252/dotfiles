import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import SystemTray from 'resource:///com/github/Aylur/ags/service/systemtray.js';

export const SysTray = () => Widget.Box({
  className: 'systray',
  connections: [[SystemTray, self => {
    self.children = SystemTray.items.map(item => Widget.Button({
      className: 'systray-item',
      child: Widget.Icon({
	size: 18,
	binds: [['icon', item, 'icon']],
      }),
      onPrimaryClick: (_, event) => item.activate(event),
      onSecondaryClick: (_, event) => item.openMenu(event),
      binds: [['tooltip-markup', item, 'tooltip-markup']],
    }));
  }]],
});
