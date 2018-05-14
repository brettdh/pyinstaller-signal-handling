#!/usr/bin/env python

import signal
import time
from signal import SIGHUP, SIGUSR1, SIGUSR2

import requests

running = True


def handler(sig, *args):
    print('  | got signal {}; exiting cleanly'.format(sig))
    global running
    running = False


signals = [SIGHUP, SIGUSR1, SIGUSR2]
for sig in signals:
    signal.signal(sig, handler)

while running:
    r = requests.get('https://httpbin.org/get')
    print('  | {} {} {}'.format(r.status_code, r.reason, r.url))

    for _ in range(60):
        time.sleep(1)
