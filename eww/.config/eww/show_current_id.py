import os
import socket
import subprocess

current_id = subprocess.run(["hyprctl", "activeworkspace"],  stdout=subprocess.PIPE)
current_id = int(current_id.stdout.decode("utf-8").split(' ')[2])
print(current_id, flush=True)

hyprland_sig = os.environ["HYPRLAND_INSTANCE_SIGNATURE"]

with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as client:
    client.connect(f"/tmp/hypr/{hyprland_sig}/.socket2.sock")

    while True:
        bytes_recved = client.recv(1024)
        events_list = bytes_recved.decode("utf-8").split('\n')[:-1]
        for event in events_list:
            if event.startswith("workspace>>"):
                workspace_id = event.split(">>")[1]
                current_id = int(workspace_id)
                print(current_id, flush=True)
