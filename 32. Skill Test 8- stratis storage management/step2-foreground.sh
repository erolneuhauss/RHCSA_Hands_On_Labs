#!/bin/bash
FILE=/mnt/fs1/very_important_file
[ -f "${FILE}" ] && rm "${FILE}"
