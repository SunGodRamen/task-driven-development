#!/usr/bin/env  bash

# Get the current branch name
branch_name=$(git rev-parse --abbrev-ref HEAD)

# Read the task IDs from the pending.data file
task_ids=$(grep -oP '(?<=uuid:")[^"]*' .task/pending.data)

# Check if the branch name matches any task ID
branch_name_is_task_id=false
for task_id in $task_ids; do
  if [ "$branch_name" == "$task_id" ]; then
    branch_name_is_task_id=true
    break
  fi
done

# If the branch name is not a valid task ID, reject the commit
if ! $branch_name_is_task_id; then
  echo "Error: Branch name must be linked to a Taskwarrior task ID."
  exit 1
fi

# If everything is fine, allow the commit
exit 0
