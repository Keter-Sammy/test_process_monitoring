#!/bin/bash

#!/bin/bash

# Configuration
PROCESS_NAME="test"
LOG_FILE="/var/log/monitoring.log"
MONITORING_URL="https://test.com/monitoring/test/api"
PID_FILE="/var/run/test_monitor.pid"

# Create log file if it doesn't exist
touch "$LOG_FILE"