#!/bin/bash
set -e -x -u -o pipefail

echo "Hello, World" > index.xhtml
nohup busybox httpd -f -p 8080 &
