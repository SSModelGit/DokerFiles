#!/bin/bash

echo "Welcome to the Docker container for Computer Architecture! The container has been started successfully."
if ! type java &> /dev/null; then
		echo "[WARNING] Java is not installed by default in the contaner.";
		echo "[WARNING] It is not required to use the container, but it is necessary to run the MARS MIPS simulator.";
fi

exec "$@"
