#!/bin/bash

# status.sh
#
# Copyright 2023 (C) Benjamin Paul Suntrup. All rights reserved.
#
# quickly shows terminal status, jobs, tmux sessions, and dirs

function status()
{
    echo "dirs:"
    dirs
    echo
    echo "jobs:"
    jobs
    echo
    echo "tmux sessions:"
    tmux list-sessions
}
