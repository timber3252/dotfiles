import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import App from 'resource:///com/github/Aylur/ags/app.js';
import * as Utils from 'resource:///com/github/Aylur/ags/utils.js'
import { TopBar } from './components/topbar.js';

const monitor = Utils.monitorFile(`${App.configDir}/style.css`, (file, event) => {
  const css = `${App.configDir}/style.css`;
  App.resetCss();
  App.applyCss(css);
});

export default {
  style: `${App.configDir}/style.css`,
  windows: [
    TopBar()
  ],
}
