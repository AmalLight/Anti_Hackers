#!/bin/bash

echo "old PATH: $PATH"

PATH=$PATH:/usr/local/bin:/opt/homebrew/bin/

echo "new PATH: $PATH"

export PATH