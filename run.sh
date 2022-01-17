#!/bin/bash
set -e

fail() {
    printf "\033[1;31merror: %s: %s\033[0m\n" ${FUNCNAME[1]} "${1:-"Unknown error"}"
    exit 1
}

test -f video.mp4 || fail "

Please download any FullHD (1920x1080) video to 'video.mp4'.
For example https://www.pexels.com/video/traffic-flow-in-the-highway-2103099/
"

CONFIG=./configs/tmuxp-no-zero-copy.yaml
if [[ "${1}" == "--zero-copy" ]]
then
  CONFIG=./configs/tmuxp-zero-copy.yaml
fi

tmuxp load ${CONFIG}
