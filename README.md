

# linuxmint-live-create-respin-kde-plasma




## Home

| Link | GitHub |
| ---- | ------ |
| [linuxmint-live-create-respin-kde-plasma](https://samwhelp.github.io/linuxmint-live-create-respin-kde-plasma/) | [GitHub](https://github.com/samwhelp/linuxmint-live-create-respin-kde-plasma) |




## Subject

* [Combination](#combination)
* [Environment](#environment)
* [Start](#start)
* [Clone](#clone)
* [Usage](#usage)
* [Config Files](#config-files)
* [Package Install List](#package-install-list)
* [Link](#link)




## Combination

| Project |
| ------- |
| [linuxmint-live-create-template](https://github.com/samwhelp/linuxmint-live-create-template) |
| `+` |
| [linuxmint-live-create-remix-kde-plasma](https://github.com/samwhelp/linuxmint-live-create-remix-kde-plasma) |
| `=` |
| [linuxmint-live-create-respin-kde-plasma](https://github.com/samwhelp/linuxmint-live-create-respin-kde-plasma) |




## Environment

* `LinuxMint 23 (Ubuntu 26.04)`




## Start

Open Terminal , and run to install `git` and `make`

``` sh
sudo apt-get install git make
```




## Clone

Run to clone [linuxmint-live-create-respin-kde-plasma](https://github.com/samwhelp/linuxmint-live-create-respin-kde-plasma)

``` sh
git clone https://github.com/samwhelp/linuxmint-live-create-respin-kde-plasma
```

Run to change dir `linuxmint-live-create-respin-kde-plasma`

``` sh
cd linuxmint-live-create-respin-kde-plasma
```




## Usage

* [Help](#help)
* [Prepare](#prepare)
* [Build](#build)
* [Clean](#clean)




## Help

Run

``` sh
make
```

Or run

``` sh
make help
```

Show

```
Usage:
	$ make [action]

Example:
	$ make
	$ make help

	$ make prepare
	$ make build
	$ make clean

```




## Prepare

Run the following command to install the packages required to create an ISO file.

``` sh
make prepare
```




## Build

Only need to execute the following command to create an ISO file.

``` sh
make build
```




## Clean

Run to clean up previous builds.

``` sh
make clean
```




## Config Files

| Config Files |
| ------------ |
| [~/.config](https://github.com/samwhelp/linuxmint-live-create-respin-kde-plasma/tree/main/template/asset/overlay/etc/skel/.config) |
| [/etc/dconf/db/distro.d](https://github.com/samwhelp/linuxmint-live-create-respin-kde-plasma/tree/main/template/asset/overlay/etc/dconf/db/distro.d) |
| [/usr/share/glib-2.0/schemas](https://github.com/samwhelp/linuxmint-live-create-respin-kde-plasma/tree/main/template/asset/overlay/usr/share/glib-2.0/schemas) |




## Package Install List

> Please check the folder

* [template/asset/package/install](https://github.com/samwhelp/linuxmint-live-create-respin-kde-plasma/tree/main/template/asset/package/install)

> Ubuntu Community Help Wiki / [MetaPackages](https://help.ubuntu.com/community/MetaPackages)




## Link

| Link | GitHub |
| ---- | ------ |
| [LinuxMint Kde Plasma Adjustment](https://samwhelp.github.io/linuxmint-kde-plasma-adjustment/) | [GitHub](https://github.com/samwhelp/linuxmint-kde-plasma-adjustment) |
| [LinuxMint Adjustment](https://samwhelp.github.io/linuxmint-adjustment/) | [GitHub](https://github.com/samwhelp/linuxmint-adjustment) |




## Samwhelp

* [GitHub](https://github.com/samwhelp)
