# Version 1.0

FROM rm3l/dockeroid

MAINTAINER rm3l <armel@rm3l.org>

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /home/r2d2/roms/cm

WORKDIR /home/r2d2/roms/cm

# just to have repo run non interactively the first time it is launched
RUN git config --global user.name 'User Name'
RUN git config --global user.email 'user@ema.il'

# initialize your local repository using the CyanogenMod trees
RUN repo init -u git://github.com/CyanogenMod/android.git -b cm-11.0

# sync everything up
RUN repo sync -j3

CMD "echo Run then 'brunch <your_device_codename>' to build."
CMD "echo --- See http://wiki.cyanogenmod.org/w/Build_Guides for further assistance ---"
CMD "/bin/bash"

