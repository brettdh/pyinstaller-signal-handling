#!/bin/bash

pyinstaller -y main.py

for _bin in "./main.py" "./dist/main/main"; do
    for _sig in "HUP" "USR1" "USR2"; do
        echo "Testing SIG${_sig}..."
        ${_bin} &
        _pid=$!

        sleep 1
        kill -${_sig} ${_pid}
        wait ${_pid}
        if [[ $? == 0 ]]; then
            echo "...pass"
        else
            echo "...fail"
        fi
    done
done
