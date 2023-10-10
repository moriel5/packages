#!/usr/bin/env zsh

# Goes to the root directory of the solus packages
# git repository from anywhere on the filesystem.
# This function will only work if this script is sourced
# by your zsh shell.

function gotosoluspkgs() {
    SCRIPT_PATH=$functions_source[gotosoluspkgs]
    pushd $(dirname $(readlink "${SCRIPT_PATH}"))/../../
}

# Goes to the root directory of the git repository
function goroot() {
    pushd $(git rev-parse --show-toplevel)
}

# Push into a package directory
function gotopkg() {
    pushd $(git rev-parse --show-toplevel)/packages/*/$1
}

# What provides a lib
function whatprovides() {
    grep $1 $(git rev-parse --show-toplevel)/packages/*/*/abi_libs
}

# What uses a lib
function whatuses() {
    grep $1 $(git rev-parse --show-toplevel)/packages/*/*/abi_used_libs
}


# # zsh completions
# _gotopkg()
# {

#     _list=$(ls $(git rev-parse --show-toplevel)/packages/*/)

#     local cur prev
#     COMPREPLY=()
#     cur=${COMP_WORDS[COMP_CWORD]}
#     prev="${COMP_WORDS[COMP_CWORD-1]}"

#     if [[ $COMP_CWORD -eq 1 ]] ; then
#         COMPREPLY=( $(compgen -W "${_list}" -- ${cur}) )
#         return 0
#     fi
# }

# #  /home/tracey/.bashrc.d/solus-monorepo-helpers.sh:49: command not found: complete
# complete -F _gotopkg gotopkg
