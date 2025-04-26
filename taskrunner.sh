#!/bin/bash

declare -A tasks

task() {
    local name="$1"
    local cmd="$2"
    tasks["$name"]="$cmd"
}

run_task() {
    local task_name="$1"

    if [[ -n "${tasks[$task_name]}" ]]; then
        echo "Running task: $task_name"
        eval "${tasks[$task_name]}"
    else
        echo "Task $task_name not found!"
    fi
}

for file in $HOME/coding/bash/bin/tasks/*.sh; do
    [ -f "$file" ] && source "$file"
done
