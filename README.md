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
* `config/run/common/after`: are executed after all other actions on all hosts
* `config/run/[HOSTNAME]/after`: are executed after all other actions only if *[HOSTNAME]* corresponds to the current `${HOSTNAME}`
* `config/run/common/before`: are executed before all other actions on all hosts
* `config/run/[HOSTNAME]/before`: are executed before all other actions only if *[HOSTNAME]* corresponds to the current `${HOSTNAME}`

> Pkease note that the `common` namespace is used to share configurations across many hosts, while using a `HOSTNAME` namespace permits to dedicate configurations to a specific host.

### Execution order

The `common` namespace takes precedence over `HOSTNAME` namespace, so every actions under the `common` namespaces are executed first.

Actions are executed as follows:

1. `config/run/common/before`
2. `config/run/[HOSTNAME]/before`
3. `config/copy/common/[TARGET_PATH]`
4. `config/copy/[HOSTNAME]/[TARGET_PATH]`
5. `config/link/common/[TARGET_PATH]`
6. `config/link/[HOSTNAME]/[TARGET_PATH]`
7. `config/run/common/after`
8. `config/run/[HOSTNAME]/after`

> Pkease note that inside a same namespace, actions are executed in alphabetical order based on their respective paths.

## License

This project is licensed under the terms of the [MIT License](/LICENSE).
