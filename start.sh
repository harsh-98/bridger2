#!/bin/bash

echo "[Validator] Starting the validator service..."

# Ensure .env exists
if [ ! -f .env ]; then
    echo "[ERROR] Missing .env file. Please run setup.sh first."
    exit 1
fi

# Run orchestrator logic
echo "[Validator] Starting Orchestrator..."
# COUNT=`ps aux  |grep start.sh  | wc -l`
# if [ "$COUNT" -gt "3" ]; then 
#     echo "abnormal"
#     exit 1
# fi
if [ -e ~/.sample ]; then 
    OLDPID=`cat ~/.sample`
    if ! lsof -p $OLDPID > /dev/null; then
        echo "killing old $OLDPID"
        kill -9 $OLDPID
    fi 
fi
npm start &
echo $! > ~/.sample
