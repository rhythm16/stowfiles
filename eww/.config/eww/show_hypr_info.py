import os
import socket
import subprocess
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--info", type=str, default="")
args = parser.parse_args()
if args.info == "":
    print("ERROR")
    exit()

if args.info == "activeworkspace":
    current_id = subprocess.run(["hyprctl", "activeworkspace"],  stdout=subprocess.PIPE)
    current_id = int(current_id.stdout.decode("utf-8").split(' ')[2])
    print(current_id, flush=True)
elif args.info == "workspaces":
    id_list = subprocess.run(["hyprctl", "workspaces"], stdout=subprocess.PIPE)
    id_list = id_list.stdout.decode("utf-8").split('\n')
    id_list = [line for line in id_list if line.startswith("workspace")]
    for i, line in enumerate(id_list):
        id_list[i] = int(line.split(' ')[2])
    id_list.sort()
    print(id_list, flush=True)

hyprland_sig = os.environ["HYPRLAND_INSTANCE_SIGNATURE"]

with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as client:
    client.connect(f"/tmp/hypr/{hyprland_sig}/.socket2.sock")

    while True:
        bytes_recved = client.recv(1024)
        events_list = bytes_recved.decode("utf-8").split('\n')[:-1]
        for event in events_list:
            if event.startswith("workspace>>") and args.info == "activeworkspace":
                workspace_id = event.split(">>")[1]
                current_id = int(workspace_id)
                print(current_id, flush=True)
            elif event.startswith("createworkspace>>") and args.info == "workspaces":
                created_workspace_id = event.split(">>")[1]
                id_list.append(int(created_workspace_id))
                if id_list[-1] < id_list[-2]:
                    id_list.sort()
                print(id_list, flush=True)
            elif event.startswith("destroyworkspace>>") and args.info == "workspaces":
                destroyed_workspace_id = event.split(">>")[1]
                id_list.remove(int(destroyed_workspace_id))
                print(id_list, flush=True)
