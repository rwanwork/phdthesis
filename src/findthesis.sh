#!/bin/bash
find ./ -type f -name '*.tex' -exec grep -H -n "$1" {} \;