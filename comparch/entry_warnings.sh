#!/bin/bash

if ! type java &> /dev/null; then
		echo "Java is not found in this container, and may not be installed.";
		echo "It is required to run the MARS MIPS simulator.";
fi

exec "$@"
