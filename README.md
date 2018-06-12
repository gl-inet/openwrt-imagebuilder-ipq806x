# Imagebuilder for ipq806x  

## System Requirement  

- x86_64 platform  
- ubuntu or other linux  
- You need to install necessary software  

```bash  
$ sudo apt-get update
$ sudo apt-get install device-tree-compiler subversion build-essential git-core libncurses5-dev zlib1g-dev gawk flex quilt libssl-dev xsltproc libxml-parser-perl mercurial bzr ecj cvs unzip git wget
```  

## Download the Source  

```bash  
$ git clone https://github.com/gl-inet/openwrt-imagebuilder-ipq806x.git
$ cd openwrt-imagebuilder-ipq806x
```  

## Configuration  

You can change images.json file to install or remove packages for your  
preference. Note that "-pkgname" in the package list means remove "pkgname"  
from the package list.

## Create Image  

We can use gl_image utility to create image quickly. You can issue  
`gl_image --help` for help.  

```bash  
Stoke firmware:  
$ ./gl_image
$ make si

Clean firmware with files directory and custom packages:
$ ./gl_image -t clean -p '-wpad-mini wpad' -f ./files
$ make si
```  

Note that kernel and rootfs is separated with imagebuilder, we should issue  
`make si` to merge them, and create single image.  

Available image or profile is listed in images.json.  

__Flash image using bin file located at single_img_dir.__  

