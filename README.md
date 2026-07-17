# File Manipulation Lab v4

This lab uses a level-based structure: an installer creates one Linux user per level, each level opens with a README.txt, and players can move with nextlevel and prevlevel.

Each level is a file manipulation task. Players fix the filesystem state, then run validate. In v4, each level validator prints a key generated from the current filesystem state. The key can be submitted through a form if needed.

The validator snapshot uses recursive file listing data, keeps permissions, owner, group, size, and name, and ignores date/time fields so timestamps do not break a correct solution.

Levels use hexadecimal characters from the user-specific level hash to choose target files and directories. The visible files use readable scenario names, while the hash quietly decides which target each student receives. Each generated target is written directly into that level's README instructions. Level 5 uses words to choose the category from categories.txt and the out-of-place file from a different category list during installation. Each word list contains 16 entries.

## Levels

1. Create a file with touch
2. Create a case directory with mkdir
3. Copy selected evidence with cp
4. Quarantine a selected suspicious file with mv
5. Remove an out-of-place file from a hash-selected word category with rm
6. Remove the selected empty directory with rmdir
7. Create a backup folder with mkdir and cp
8. Archive selected evidence with mkdir and mv
9. Build a selected investigation structure with mkdir and cp
10. Complete a full incident response workflow with mkdir, cp, mv, rm, rmdir, and touch

## Install

Run this from the folder containing the scripts on the Linux training machine:

```sh
sh installfmlab.sh
```

Use cleanup.sh only when you want to remove the fmlab users and reset the machine.
