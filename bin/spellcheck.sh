#!/bin/bash

# spell checking for latex files

# find dictionary of added words in home dir
# ~/.aspell.en.pws


# a -> add to dictionary
# usage:
# aspell -t -c file.tex
filename=$1
aspell --home-dir=. --personal=dictionary.txt -t -c $filename


