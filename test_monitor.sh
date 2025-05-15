#!/bin/bash

#!/bin/bash

# Configuration
PROCESS_NAME="test"
LOG_FILE="/var/log/monitoring.log"
MONITORING_URL="https://test.com/monitoring/test/api"
PID_FILE="/var/run/test_monitor.pid"

# Create log file if it doesn't exist
touch "$LOG_FILE"

# Get current PID of the process (if any)
CURRENT_PID=$(pgrep -x "$PROCESS_NAME")

# Read the last known PID (if exists)
if [ -f "$PID_FILE" ]; then
    LAST_PID=$(cat "$PID_FILE")
else
    LAST_PID=""
fi

# Logic
if [ -n "$CURRENT_PID" ]; then
    # Check if process has restarted
    if [ "$CURRENT_PID" != "$LAST_PID" ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Process '$PROCESS_NAME' restarted (PID: $CURRENT_PID)" >> "$LOG_FILE"
    fi

    # Save the current PID for future comparison
    echo "$CURRENT_PID" > "$PID_FILE"


      # Attempt to "knock" via HTTPS
    curl -fsS --max-time 10 "$MONITORING_URL" > /dev/null
    if [ $? -ne 0 ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Monitoring server unavailable at $MONITORING_URL" >> "$LOG_FILE"
    fi
fi

