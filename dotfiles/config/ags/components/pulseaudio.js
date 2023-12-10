import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Variable from 'resource:///com/github/Aylur/ags/variable.js';
import Audio from 'resource:///com/github/Aylur/ags/service/audio.js';
import { exec, execAsync } from 'resource:///com/github/Aylur/ags/utils.js';

const getDefaultSink = () => Audio.control.get_default_sink();
const getDefaultSource = () => Audio.control.get_default_source();

const getAudioTypeIcon = (sink) => {
  const isMuted = sink.get_is_muted();
  const iconName = `${sink.icon_name}`;
  const port = `${sink.port.toLowerCase()}`;

  if (isMuted) {
    return '󰝟';
  } else if (iconName.includes('bluetooth')) {
    return '󰂯';
  } else if (port.includes('headphone')) {
    return '󰋋';
  }

  return '󰕾';
};

export const PulseAudio = () => Widget.Button({
  className: 'pulseaudio',
  onClicked: () => execAsync('pulsemixer --toggle-mute'),
  onScrollUp: () => execAsync('pulsemixer --change-volume +5'),
  onScrollDown: () => execAsync('pulsemixer --change-volume -5'),
  child: Widget.Box({
    spacing: 10,
    children: [
      Widget.Label({
	connections: [[Audio, self => {
	  if (!Audio.speaker) {
	    return;
          } 
	  self.label = getAudioTypeIcon(getDefaultSink());
	}]],
      }),
      Widget.Label({
        connections: [[Audio, self => {
          if (!Audio.speaker) {
	    return;
	  }
          const vol = Math.round(Audio.speaker.volume * 100);
          self.label = `${vol}%`;
        }]],
      }),
    ],
  }),
});
