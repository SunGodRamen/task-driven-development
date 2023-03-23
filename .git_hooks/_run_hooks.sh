#!/usr/bin/env  bash

# Add this to your shell configuration (e.g., .bashrc or .zshrc)
function gitp() {
    GIT_DIR=$(git rev-parse --git-dir)
    git --git-dir="$GIT_DIR" --work-tree="$(pwd)" --exec-path="$GIT_DIR/../.git_hooks" "$@"
}
