#!/usr/bin/env  bash

# Source this in your shell configuration as an option instead of moving the hooks to the project .git/ dir
# if you rapid prototype, this can save time each time you copy the project as .git cant be tracked
function gitp() {
    GIT_DIR=$(git rev-parse --git-dir)
    git --git-dir="$GIT_DIR" --work-tree="$(pwd)" --exec-path="$GIT_DIR/../.git_hooks" "$@"
}
