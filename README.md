# Pyinstaller + signals = 😬

Binaries built with Pyinstaller don't appear to gracefully handle some common
signals, such as SIGHUP and SIGUSR1.

Briefly: the bootloader handles a few termination signals (SIGINT, SIGTERM),
ignores others (SIGABRT, SIGBREAK), and leaves the rest as their default
behavior, which often is to terminate the process. This causes problems with
daemon processes that use other signals for external control. For example,
SIGHUP is commonly used to tell a daemon to reload its configuration from a
file on disk. This test repo exists to demonstrate the issue.

## The test

The included `test.sh` script:

1. Starts up a Python process that sleeps in a loop
   - This process has signal handlers set for the signals
     that the test script will send
1. Sends a signal to the process
1. Notes `pass` if the process exited gracefully; `fail` if it exited with error

The test repeats this for a couple different signals and prints the results.
It also runs the Python process with and without using Pyinstaller to show
the difference in behavior.

## Results

This [TravisCI build] shows the results. Curiously, the signals are handled as expected
on macOS; the crash manifests on Linux.

[TravisCI build]: https://travis-ci.org/brettdh/pyinstaller-signal-handling

## Running the test

### Docker

To run in a Debian-based Docker container:

    $ ./test-docker.sh 3.3.1  # pyinstaller version
       ~ or ~
    $ ./test-docker.sh develop  # latest development version

### Elsewhere

First, make sure you have python and pip installed (in a virtualenv if you like).

Next, install the prerequisites:

    $ pip install -r requirements.txt

as well as the version of pyinstaller you want to test; e.g.

    $ pip install pyinstaller==3.3.1
       ~ or ~
    $ pip install https://github.com/pyinstaller/pyinstaller/archive/develop.zip

Then:

    $ ./test.sh
