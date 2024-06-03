LOCKFILE=/tmp/my.lock

if [ -f "$LOCKFILE" ]; then
    PID=$(cat "$LOCKFILE")
    
    if ps -p $PID > /dev/null; then
        echo "Previous instance (PID: $PID) is still running. Exiting."
        exit 0
    fi
    
    echo "Removing stale lock file..."
    rm -f "$LOCKFILE"
fi

echo $$ > "$LOCKFILE"

SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)";
cd $SCRIPT_DIR/..

date
echo 'test'
date

echo "Removing lock file $LOCKFILE"
rm -f "$LOCKFILE"
