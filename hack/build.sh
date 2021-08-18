#!/bin/sh
mkdir -p build
find . -not -path '*/\.*' -type f -not -path './build*' -not -path './hack*' | xargs jar cf build/theme.jar
