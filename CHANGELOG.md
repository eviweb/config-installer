# Changelog
All notable changes to this project will be documented in this file. See [conventional commits](https://www.conventionalcommits.org/) for commit guidelines.

- - -

## [0.3.0](https://github.com/eviweb/config-installer/compare/0.2.0..0.3.0) - 2022-09-16

### Features

- ✨ add auto updater - ([1936add](https://github.com/eviweb/config-installer/commit/1936addf186b32150bc976b30dafe78f90e6bcc6)) - [@eviweb](https://github.com/eviweb)
- ✨ add -i flag to initialize the project directory with the default directory structure - ([1652dde](https://github.com/eviweb/config-installer/commit/1652dde4fc3137260881579ce1a5c2946fe43f7c)) - [@eviweb](https://github.com/eviweb)

### Miscellaneous Chores

- 🧹 set version number to 0.3.0 - ([956a4a7](https://github.com/eviweb/config-installer/commit/956a4a742f28a3054cc8173446fbb402ec6b9e0c)) - [@eviweb](https://github.com/eviweb)

### Tests

- ✅ the test runner now accepts a list of test files - ([f7d741a](https://github.com/eviweb/config-installer/commit/f7d741a2f8500b9d83fea8ee2a4e45a75e727d70)) - [@eviweb](https://github.com/eviweb)
- ✅ add assert_dir_exists and assert_file_exists assertions - ([8c3d7b2](https://github.com/eviweb/config-installer/commit/8c3d7b226f7640f2d328df38f2e34a6af52a7c07)) - [@eviweb](https://github.com/eviweb)

- - -


## [0.2.0](https://github.com/eviweb/config-installer/compare/0.1.3..0.2.0) - 2022-09-05

### Bug Fixes

- 🐛 misspelled config_run_dir - ([994a7b1](https://github.com/eviweb/config-installer/commit/994a7b182c1702a6d4d4f0990d3d3ab43f1a5477)) - [@eviweb](https://github.com/eviweb)

### Features

- ✨ enforce execution order to run common namespace first - ([6c19044](https://github.com/eviweb/config-installer/commit/6c19044b2dfcebb99cfd9a13fc4af23d91101c82)) - [@eviweb](https://github.com/eviweb)
- ✨ add before and after hooks for exectuable scripts - ([18629f8](https://github.com/eviweb/config-installer/commit/18629f896ee2fa10bd5a19c62fb164d2273e06d5)) - [@eviweb](https://github.com/eviweb)

### Miscellaneous Chores

- 🧹 set version number to 0.2.0 - ([1ab505d](https://github.com/eviweb/config-installer/commit/1ab505dbb050aed4187cf5cbbbd730578b05fd8e)) - [@eviweb](https://github.com/eviweb)

- - -


## [0.1.3](https://github.com/eviweb/config-installer/compare/0.1.2..0.1.3) - 2022-09-01

### Bug Fixes

- 🐛 success message for symlinks - ([f241039](https://github.com/eviweb/config-installer/commit/f2410397e5cf5aa23eb2750f0e5a020a59b72a96)) - [@eviweb](https://github.com/eviweb)

### Miscellaneous Chores

- 🧹 set version number to 0.1.3 - ([5e35f14](https://github.com/eviweb/config-installer/commit/5e35f1494f3c25552016559a029dd5c9e866cdb9)) - [@eviweb](https://github.com/eviweb)

- - -


## [0.1.2](https://github.com/eviweb/config-installer/compare/0.1.1..0.1.2) - 2022-08-31

### Bug Fixes

- 🐛 find_files now also returns configuration symlinks - ([446ebea](https://github.com/eviweb/config-installer/commit/446ebeafab198464b484cd5340cc702f41fa8433)) - [@eviweb](https://github.com/eviweb)

### Miscellaneous Chores

- 🧹 set version number to 0.1.2 - ([49c39d8](https://github.com/eviweb/config-installer/commit/49c39d8935b81c8074fb375208f07cbbc4e62779)) - [@eviweb](https://github.com/eviweb)

- - -


## [0.1.1](https://github.com/eviweb/config-installer/compare/0.1.0..0.1.1) - 2022-08-31

### Bug Fixes

- 🐛 get_target_file to accept 'common' or current hostname in file path - ([4511484](https://github.com/eviweb/config-installer/commit/451148404cd44bb3e35604c36cc45e4cbd0f893b)) - [@eviweb](https://github.com/eviweb)

### Miscellaneous Chores

- 🧹 set version number to 0.1.1 - ([0268b9c](https://github.com/eviweb/config-installer/commit/0268b9c1efac2ebb997f6b88e53e68bf98927300)) - [@eviweb](https://github.com/eviweb)

### Tests

- ✅ add assert_equals function to check two strings are equal - ([ec2b28f](https://github.com/eviweb/config-installer/commit/ec2b28fce185e074a17e324ea776c7a17eedfab4)) - [@eviweb](https://github.com/eviweb)
- ✅ extract install tests to a dedicated file, revamp tests/run.sh - ([b5b8af9](https://github.com/eviweb/config-installer/commit/b5b8af981b29fa8813b404425d6893be2b7bbcd3)) - [@eviweb](https://github.com/eviweb)

### Typo correction

- ✏️  fix Markdown style in README.md - ([30b3c2f](https://github.com/eviweb/config-installer/commit/30b3c2f86d7fb555b6b6edc8bae553c9bf36fb35)) - [@eviweb](https://github.com/eviweb)

- - -


## [0.1.0](https://github.com/eviweb/config-installer/compare/d9c27528646bb173d175d5687ff76f65761c69bd..0.1.0) - 2022-08-30

### Features

- ✨ add installer script - ([52b3ff7](https://github.com/eviweb/config-installer/commit/52b3ff7fe380b366e5d790d6c1169664d71c384a)) - [@eviweb](https://github.com/eviweb)

### Tests

- ✅ add test runner and configuration tree fixture - ([a7d1036](https://github.com/eviweb/config-installer/commit/a7d1036172b9bd4688e17094a8c25266347c60cd)) - [@eviweb](https://github.com/eviweb)

- - -

Changelog generated by [cocogitto](https://github.com/cocogitto/cocogitto).