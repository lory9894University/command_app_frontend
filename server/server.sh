#!/bin/bash

# Set the port
PORT=80

# Stop any program currently running on the set port
echo 'preparing port' $PORT '...'

# Start the server
echo 'Server starting on port' $PORT '...'
python3 -m http.server $PORT