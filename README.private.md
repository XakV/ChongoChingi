#Host Info


[all]
kujira.segfawlty.space     #MAIN DESKTOP 10.23.19.91
kotokami.segfawlty.space   #LAPTOP 10.23.19.112
mc.wefartin.space	   #MC Server - VPS
lobby.wefartin.space	   #MC Server - VPS
pi3b0.segfawlty.space      #DNS - a Pi3
f3do2api.segfawlty.space   #Pi 4 running Fedora 32
proxy.segfawlty.space      #VM - not in service

[zach]
kotokami.segfawlty.space
kujira.segfawlty.space

[all:vars]
ansible_python_interpreter=/usr/bin/python3

[control]
kujira.segfawlty.space

[lan-server]
f3do2api.segfawlty.space
kujira.segfawlty.space

[control:vars]
ansible_connection=local 

[server]
mc.wefartin.space

[lobby]
lobby.wefartin.space

[desktops]
kotokami.segfawlty.space
kujira.segfawlty.space

[virtual]
proxy.segfawlty.space

[pi]
pi3b0.segfawlty.space
f3do2api.segfawlty.space

[hassio]
hassio.segfawlty.space
