#!/bin/bash
brightness=$(light -G | awk '{printf "%.0f%%", $1}')

