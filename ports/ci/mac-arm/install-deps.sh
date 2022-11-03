#!/bin/bash

# Webcamoid, webcam capture application.
# Copyright (C) 2017  Gonzalo Exequiel Pedone
#
# Webcamoid is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Webcamoid is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Webcamoid. If not, see <http://www.gnu.org/licenses/>.
#
# Web-Site: http://webcamoid.github.io/

#qtIinstallerVerbose=--verbose

if [ ! -z "${USE_WGET}" ]; then
    export DOWNLOAD_CMD="wget -nv -c"
else
    export DOWNLOAD_CMD="curl --retry 10 -sS -kLOC -"
fi

arch -arm64 brew update
arch -arm64 brew upgrade
arch -arm64 brew link --overwrite numpy
arch -arm64 brew install \
    ccache \
    cmake \
    ffmpeg \
    p7zip \
    pkg-config \
    python \
    qt@5 \
    vlc
arch -arm64 brew link --overwrite python
arch -arm64 brew link --force qt@5

if [ "${UPLOAD}" != 1 ]; then
    arch -arm64 brew install \
        gstreamer \
        gst-plugins-base \
        gst-plugins-good \
        pulseaudio \
        jack \
        libuvc
fi

arch -arm64 brew link python
