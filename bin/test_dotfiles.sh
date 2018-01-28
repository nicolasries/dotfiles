#!/bin/bash
cd ~ || exit

# test shell scripts
git ls-files | grep "\.sh" | xargs shellcheck 
shellcheck -s bash .zshrc .zshenv .xinitrc 

