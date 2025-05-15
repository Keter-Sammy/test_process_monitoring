# test_process_monitoring

**Process Monitoring Setup (Linux):**


This repository provides a Bash script and systemd timer for monitoring the test process on Linux. It checks every minute if the process is running, knocks a monitoring URL, and logs restarts or server issues.

**Requirements:**

- Linux system with systemd

- curl installed

- sudo access

_**Installation Steps:**_


**1. Clone the Repository;**

```git clone https://github.com/Keter-Sammy/test_process_monitoring.git```

**2. Install the Script**

Copy the script to your system and make it executable:

```sudo cp test_monitor.sh /usr/local/bin/test_monitor.sh```
```sudo chmod +x /usr/local/bin/test_monitor.sh```

**3. Install systemd Service and Timer**

Copy the systemd unit files:

```sudo cp systemd/test-monitor.service /etc/systemd/system/test-monitor.service```
```sudo cp systemd/test-monitor.timer /etc/systemd/system/test-monitor.timer```


**4. Enable and Start the Timer**

Reload and start the timer:

```sudo systemctl daemon-reexec```
```sudo systemctl daemon-reload```
```sudo systemctl enable --now test-monitor.timer```

**5. Verification**

Check timer status:

```systemctl status test-monitor.timer```

Manually trigger the check:

```sudo systemctl start test-monitor.service```


View logs:

```cat /var/log/monitoring.log```
