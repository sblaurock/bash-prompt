bash-prompt
===========

![screenshot](https://github.com/sblaurock/bash-prompt/raw/master/screenshot.png "Example screenshot of bash prompt.")

Improved bash prompt with support for Git.

Colors, display options and symbols are fully customizeable. Currently supports:
* 16 colors.
* Username & hostname.
* Working directory (partial or full).
* Git branch (with "dirty" status indicator).

## Installation
Execute the following snippet in your command line. See [install.sh](https://github.com/sblaurock/bash-prompt/blob/master/install.sh) for more details.
```bash
(cd ~ && git clone --depth 1 https://github.com/sblaurock/bash-prompt.git && cd bash-prompt && chmod +x install.sh && ./install.sh) && source ~/.bashrc
```

Project inspired by [twolfson/sexy-bash-prompt](https://github.com/twolfson/sexy-bash-prompt).
