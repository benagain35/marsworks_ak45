#!/bin/bash
set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "[mars_ws] Setting up vcan0..."
sudo modprobe vcan
sudo ip link add dev vcan0 type vcan 2>/dev/null || true
sudo ip link set vcan0 up

echo "[mars_ws] Starting Waveshare CAN bridge..."
sudo python3 "$SCRIPT_DIR/waveshare_can_bridge.py" &
BRIDGE_PID=$!
sleep 2

echo "[mars_ws] Sourcing ROS 2..."
source /opt/ros/humble/setup.bash
source "$SCRIPT_DIR/install/setup.bash"

echo "[mars_ws] Launching ak45..."
ros2 launch marsworks_ak45 ak45.launch.py

kill $BRIDGE_PID 2>/dev/null || true
sudo ip link delete vcan0 2>/dev/null || true
