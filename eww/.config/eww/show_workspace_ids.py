import os
import socket
import subprocess

initial_list = subprocess.run(["hyprctl", "workspaces"], stdout=subprocess.PIPE)
initial_list = initial_list.stdout.decode("utf-8").split('\n')
initial_list = [line for line in initial_list if line.startswith("workspace")]
for i, line in enumerate(initial_list):
    initial_list[i] = int(line.split(' ')[2])
initial_list.sort()
print(initial_list, flush=True)

hyprland_sig = os.environ["HYPRLAND_INSTANCE_SIGNATURE"]
id_list = initial_list

with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as client:
    client.connect(f"/tmp/hypr/{hyprland_sig}/.socket2.sock")

    while True:
        bytes_recved = client.recv(1024)
        events_list = bytes_recved.decode("utf-8").split('\n')[:-1]
        for event in events_list:
            if event.startswith("createworkspace>>"):
                created_workspace_id = event.split(">>")[1]
                id_list.append(int(created_workspace_id))
                if id_list[-1] < id_list[-2]:
                    id_list.sort()
                print(id_list, flush=True)
            elif event.startswith("destroyworkspace>>"):
                destroyed_workspace_id = event.split(">>")[1]
                id_list.remove(int(destroyed_workspace_id))
                print(id_list, flush=True)
