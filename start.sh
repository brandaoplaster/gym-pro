#!/bin/sh

PID_FILE=tmp/pids/server.pid

if [ -f "$PID_FILE" ]; then
  echo "Removing existing server.pid..."
  rm "$PID_FILE"
fi

echo "Starting Rails server..."
bin/rails server -b 0.0.0.0 -p 3000 &

echo "Starting TailwindCSS watcher..."
bin/rails tailwindcss:watch

wait
