# is_stationary_pad
A bash script for checking if a file is a Stationary Pad in macOS

What is a Stationary Pad?
-

A little known feature in macOS is that if you open the Get Info dialog (cmd+i in Finder with a file selected), you can enable the "Stationary Pad" checkbox to turn the file into a Stationary Pad.

Stationary Pads behave differently to other files. When double-clicked, they duplicate themselves to the current directory, and then open the duplicate. Thus, you can use a Stationary Pad to make **any** file into a template.

What does this script do?
-

Apart from using the Finder GUI (or prehaps AppleScript), there is no easy way to tell if a specific file is a Stationary Pad. This, in my opinion, narrows their use-cases significantly - what is the point of having a template if I cannot easily find it to make a new file using it?

This shell script sets out to change that. It can be run on any file from the terminal, and quickly tell you weither it is or is not a Stationary Pad.

Internally, checks the extended metadata of the file for the `kMDItemFSFinderFlags` tag, which contains an integer which tells you data about the file (it is mainly used to store data about tags). However, the value will have `2048` added to it if the file is a Stationary Pad. Thus, we can determine a Stationary Pad by checking if this metadata property is greater than or equal to `2048`.

Usage
-

Simply call the script and give it the path to the file that you want to check as the first attribute. For example,

    ./is_stationary_pad.sh ./test.txt

will determine if `./test.txt` is a Stationary Pad (assuming the path to `is_stationary_pad.sh` is correct, of course).

The script will echo nothing if the file is not a Stationary Pad, but it will echo the file name back if the file *is* a Stationary Pad. This is to make searching for Stationary Pads easy:

    find ./ -exec ./is_stationary_pad.sh {} \;
    
will echo out the names of all Stationary Pads in the current folder (once again, assuming the path to `is_stationary_pad.sh` is correct). This is the main reason that I wrote this utility, as functionailty like this was not easily possible before (it is not possible to search specifically for just Stationary Pads using the Finder interface).

Files and Licence
-

There is only one file, `is_stationary_pad.sh`. It contains the entire script. Installation should be fairly easy, just download it, put it in a directory you remember the path to (so you can call it from the terminal later), and make sure to give it read and execution privileges so it can run.

Licensed under [cc-by-sa](https://creativecommons.org/licenses/by-sa/4.0/)
