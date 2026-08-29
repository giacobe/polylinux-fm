# File Manipulation Lab v5

This lab uses a level-based structure: the installer creates one Linux user per level, each level opens with a `README.txt`, and learners move between levels with `nextlevel` and `prevlevel`.

Each level is a small file manipulation task. Learners fix the filesystem state, then run `validate`. The validator prints one key generated from the current level user's home directory. It does not print correct or incorrect status, so the key can be submitted through a form or compared against the instructor answer key.

The validator uses a recursive file listing with `find`, `ls`, `grep`, `awk`, `sed`, `sort`, `sha256sum`, `base64`, and `cut`. It keeps permissions, owner, group, size, and full displayed path, while ignoring date and time fields so timestamps do not break a correct solution.

Levels use hexadecimal characters from the email/date/level hash to choose target files and directories. The visible files use readable incident-response names, while the hash quietly decides which target each learner receives. Generated targets are written directly into that level's `README.txt`.

## Levels

1. Create a file with `touch`
2. Create a case directory with `mkdir`
3. Copy selected evidence with `cp`
4. Quarantine a selected suspicious file with `mv`
5. Remove an out-of-place file from a hash-selected category with `rm`
6. Remove the selected empty directory with `rmdir`
7. Create a backup directory with `mkdir` and `cp`
8. Move selected evidence into an archive directory with `mkdir` and `mv`
9. Build a selected investigation structure with `mkdir` and `cp`
10. Complete a full incident response workflow with `mkdir`, `cp`, `mv`, `rm`, `rmdir`, and `touch`

## Install

Run this from the directory containing the scripts on the Linux training machine:

```sh
sh installfmlab.sh
```

The installer refuses to run over an existing lab install. Use `cleanup.sh` only when you want to remove the `fmlab` users, reset the machine, and install again.

```sh
sh cleanup.sh
```

Grading is intended to happen outside the VM. Students submit the key printed by `validate`, and the external form or Power Automate workflow can compare submitted keys against expected values.

## Build the browser VM

Use the `basic` configuration from
[`giacobe/buildroot-builder2`](https://github.com/giacobe/buildroot-builder2),
validated with Buildroot `2025.02.15`:

```sh
git clone https://github.com/giacobe/buildroot-builder2.git
cd buildroot-builder2
BUILDROOT_VERSION=2025.02.15 scripts/01-setup-buildroot.sh
scripts/02-build-baseline.sh --config basic
scripts/03-package-payload.sh \
  --repo https://github.com/giacobe/polylinux-fm.git \
  --ref main \
  --baseline artifacts/basic-<timestamp> \
  --output artifacts/polylinux-fm \
  --output-prefix polylinux-fm
```

Replace `<timestamp>` with the stage-2 artifact directory. Review the manifest
and boot-test the exact generated image pair in v86 before publishing.

## License

Licensed under the GNU General Public License v3.0. See `LICENSE`.
