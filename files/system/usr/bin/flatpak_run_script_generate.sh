#!/bin/sh

if [ "$(whoami)" != "root" ]; then
  echo "MUST BE RUN AS ROOT!"
  exit 1
else
  flatpak list --app | awk 'NR > 1 {print "echo \"#!/bin/sh\nflatpak run " $2 " $@\" > /bin/" tolower($1) "\nchmod +x /bin/" tolower($1)}' | sh
fi
