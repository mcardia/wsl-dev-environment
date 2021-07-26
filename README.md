# wsl-dev-environment
Bash and Fish scripts to set up multiple development environments through WSL2.

The purpose __is not__ to install the development tools/SDKs in your WSL2 distro, but to provide scripts to keep your multiple environments even/equalized.
To split development environments into several WSL2 distro helps to keep each one clean and lighter.

## How it works/helps
- When you log in, the `.wsl\etc\fish\default.fish` or `.wsl\etc\sh\default.sh` will execute.
    - This file will execute the `<distro name>.fish` or `<distro>.sh` and `<username>.fish` or `<username>.sh` scripts.
    - This way you can set environment variables and execute initial scritps by distro, user or to all of them.
- It sets the DISPLAY environment variable so you can user X apps (you need a windows X server until MS release 21H2)
- It adds an entries in the windows hosts file with the pattern `<distro name>.wsl` resolving to the wsl IP. This way, you can access your distro through domain and don't have to worry if the IP changes. Example:
  ```
  ping ubuntu.wsl
  ```
- The configuration files are all in one place, so it's easy to find and change for all distros.
- The code explains better than me :). Look at the examples provided.

## How to Install
1. Download de release.
2. Install oh-my-fish or oh-my-bash (for fish or bash shell respectivily)
3. If you are using fish and SDKMAN, install [reitzig/sdkman-for-fish](https://github.com/reitzig/sdkman-for-fish)
4. Extract the release into your choosen directory (I've choose `C:\User\<username>`)
![.wsl location](https://github.com/mcardia/wsl-dev-environment/blob/main/screenshot-wsl-location.png?raw=true)
5. If using fish
- remove the directories:
```
# rm -fr ~/.config/fish
# rm -fr ~/.config/omf
```
- create the symbolick links
```
# ln -sf ~/winhome/.wsl/etc/fish/config/fish ~/.config/fish
# ln -sf ~/winhome/.wsl/etc/fish/config/omf ~/.config/omf
# ln -sf ~/winhome/.wsl/etc/fish/default.fish ~/.config/fish/config.fish
```
6. If using bash, edit the .bashrc file and  add the follow line just before the line that loads OMB:
```
source $WIN_HOME/.wsl/etc/bash/default.sh

source $OSH/oh-my-bash.sh
```
7. (warning: security issue) Change the permission to allow your user to write the file 
`C:\Windows\System32\drivers\etc\hosts`
8. Set the environment variables to point `WSL_HOME` to the folder `<drive>:\<wherever you extracted>\.wsl` and `WSLENV` to inform WSL which envvars it should bring from windows to the WSL distro (don't forget the `/p` at end to translate the path. More, [click here](https://devblogs.microsoft.com/commandline/share-environment-vars-between-wsl-and-windows/))
![Windows Environment Variables](https://github.com/mcardia/wsl-dev-environment/blob/main/screenshot-env-vars.png?raw=true)

## How to Use
![Listing WSL Distros](https://github.com/mcardia/wsl-dev-environment/blob/main/screenshot-wsl-list.png?raw=true)
- For each WSL2 distro you have, create a sh or fish file in `.wsl\etc\<shell>` with the (lower case) distro name as the file name.  Example:
    - `.wsl\etc\fish\ubuntu.fish` or
    - `.wsl\etc\sh\ubuntu.sh` 
- For each username you use in your WSL2 distro, create a sh or fish file in `.wsl\etc\<shell>` with the (lower case) username as the file name.  Example:
    - `.wsl\etc\fish\root.fish` or
    - `.wsl\etc\sh\root.sh`

## Screenshots

### Java Environment with [SDKMAN!](https://sdkman.io), [Fast Node Manager](https://github.com/Schniz/fnm) and X IDE
![Java Environment](https://github.com/mcardia/wsl-dev-environment/blob/main/screenshot-java.png?raw=true)
![JetBrains IDEA Community](https://github.com/mcardia/wsl-dev-environment/blob/main/screenshot-X.png?raw=true)

### .Net Core Enviroment   
![.Net Environment](https://github.com/mcardia/wsl-dev-environment/blob/main/screenshot-dotnet.png?raw=true)
    
### DNS Entries
![Hosts File](https://github.com/mcardia/wsl-dev-environment/blob/main/screenshot-hosts.png?raw=true)
![PING](https://github.com/mcardia/wsl-dev-environment/blob/main/screenshot-dns-entry.png?raw=true)

    
