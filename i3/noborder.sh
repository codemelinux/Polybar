#!/usr/bin/env python
import i3ipc

EXCLUDE = ['Synapse',]
NEVER_BORDER = ['XXX',]

def on_focus(i3, e):
    for con in i3.get_tree():
        if con.floating != 'user_off' and con.floating != 'auto_off' and con.window_class not in EXCLUDE:
            con.command('border none')
    # Normal border for focused container, even if floating:
    if e.container not in NEVER_BORDER:
        e.container.command('border normal')

i3 = i3ipc.Connection()
i3.on('window::focus', on_focus)
i3.main()
