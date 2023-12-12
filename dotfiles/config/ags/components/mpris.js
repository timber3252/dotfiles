import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import MP from 'resource:///com/github/Aylur/ags/service/mpris.js';

export const Mpris = () => Widget.Button({
  className: 'mpris',
  onClicked: () => MP.getPlayer('')?.playPause(),
  onScrollUp: () => MP.getPlayer('')?.previous(),
  onScrollDown: () => MP.getPlayer('')?.next(),
  child: Widget.Box({
    spacing: 10,
    children: [
      Widget.Label({
	connections: [[MP, self => {
          const mpris = MP.getPlayer('');
          const icon = mpris && mpris.playBackStatus != 'Playing' ? '' : '';
	  self.label = icon;
	}]],
      }),
      Widget.Label({
	truncate: 'end',
	max_width_chars: 32,
        connections: [[MP, self => {
          const mpris = MP.getPlayer('');
          if (mpris) {
            const artists = mpris.trackArtists.join(', ');
            const title = mpris.trackTitle;
            self.label = `${[artists, title].filter(Boolean).join(' - ')}`;
          } else {
            self.label = 'Nothing is playing';
          }
        }]],
      }),
    ],
  }),
});
