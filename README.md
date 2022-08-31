# Config Installer

This project aims to provide a bash installer script to help in the installation of configuration files.

## How to use

Copy/paste the `./install.sh` script into your project and starting from the directory level where you copied the script, use the whole or just a part of the following subtree:

![Configuration Directory Tree](/images/config-tree.png)

> So the `config` directory is at the same level as the `install.sh` script.

## How it works

Every files in:

* `config/copy/common/[TARGET_PATH]`: are copied to *[TARGET_PATH]*
* `config/copy/[HOSTNAME]/[TARGET_PATH]`: are copied to *[TARGET_PATH]* only if *[HOSTNAME]* corresponds to the current `${HOSTNAME}`
* `config/link/common/[TARGET_PATH]`: are symlinked to *[TARGET_PATH]*
* `config/link/[HOSTNAME]/[TARGET_PATH]`: are symlinked to *[TARGET_PATH]* only if *[HOSTNAME]* corresponds to the current `${HOSTNAME}`
* `config/run/common`: are executed
* `config/run/[HOSTNAME]`: are executed only if *[HOSTNAME]* corresponds to the current `${HOSTNAME}`

> Pkease note that the `common` namespace is used to share configurations across many hosts, while using a `HOSTNAME` namespace permits to dedicate configurations to a specific host.

## License

This project is licensed under the terms of the [MIT License](/LICENSE).
