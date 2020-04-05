#!/bin/sh 

echo "$(date) Entering Entrypoint"

echo "-- Starting OVS"
service openvswitch-switch start >/dev/null #This command may cause errors that do not interferre with at least 'mn --test pingall'
ovs-vsctl set-manager ptcp:6640 1>/dev/null

echo "-- Got Command and Arguments: '$@'"
exec "$@"

echo "-- Stopping OVS"
service openvswitch-switch stop 1>/dev/null
echo "$(date) Leaving Entrypoint" 