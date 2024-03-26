import subprocess

ip = ""
result = subprocess.run(["curl", "ifconfig.me"], stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)

if result.returncode == 0:
    ip = result.stdout.decode("utf-8")

print(ip, flush=True)
