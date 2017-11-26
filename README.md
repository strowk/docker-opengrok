### About
#### OpenGrok
OpenGrok is a fast and usable source code search and cross reference engine. You can learn more about it in 
http://opengrok.github.io/OpenGrok/
#### Docker 
Docker is a convenient way to start any service (like OpenGrok) live in a few minutes. You can learn more about it in 
https://www.docker.com/what-docker
#### Build 
This OpenGrok package is of version 1.1-rc17 which includes newest features. It includes newest build of universal-ctags instead widely spread exuberant-ctags which is not fully supported according to OpenGrok docs. As a base image it uses tomcat:9 which in it's turn based on Jessie Debian.
#### Alternatives
Here is a few alternatives to current docker package and difference between current:

| Link                                           | Difference |
| -----------------------------------------------| ---------- |
| https://hub.docker.com/r/scue/docker-opengrok/ | Last pushed: 2 years ago, version is opengrok-0.12.1.5 , uses exuberant-ctags |
| https://hub.docker.com/r/dieterplex/docker-opengrok/ | Last pushed: 2 years ago, version is opengrok-0.13, based on ubuntu, uses exuberant-ctags |
| https://hub.docker.com/r/opengrok/docker/ | Includes cron scheduled reindex, uses exuberant-ctags |

### Usage
A few scripts in scripts/external are usable to manage containered OpenGrok:
```
export SOURCES_FOR_OPENGROK_TO_INDEX=
export OPENGROK_DATA_STORAGE=
export OPENGROK_CONFIGURATION_STORAGE=
start-docker-opengrok.sh 
```
starts OpenGrok in container, to run it you have to configure next variables:
 - SOURCES_FOR_OPENGROK_TO_INDEX - path to catalog where sources would be located
 - OPENGROK_DATA_STORAGE - path to catalog where OpenGrok would store it's data
 - [Optional] OPENGROK_CONFIGURATION_STORAGE - path to storage where custom.xml file would be created and could be used as [read only OpenGrok configuration](https://github.com/OpenGrok/OpenGrok/wiki/OpenGrok-Advanced-Configuration#read-only-configuration)
 ```
safe-stop-docker-opengrok.sh 
```
safely stops every OpenGrok container present
```
reindex-docker-opengrok.sh 
```
calls reindexing of all OpenGrok containers
```
goinside-docker-opengrok.sh 
```
runs shell inside one of OpenGrok containers

