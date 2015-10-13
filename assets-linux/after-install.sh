#!/bin/bash

# Link to the binary
ln -sf /opt/InboxForDesktop/Inbox /usr/local/bin/inboxfordesktop

# Launcher icon
desktop-file-install /opt/InboxForDesktop/inboxfordesktop.desktop
