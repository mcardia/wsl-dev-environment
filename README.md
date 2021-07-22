# wsl-dev-environment
Bash and Fish scripts to set up multiple development environments through WSL2

## How to Install
1. Download de release.
2. Install oh-my-fish or oh-my-bash (for fish or bash shell respectivily)
3. If you are using fish and SDKMAN, install [reitzig/sdkman-for-fish](https://github.com/reitzig/sdkman-for-fish)
4. Extract the release into your user directory (usually `c:\User\<username>`)
5. If using fish
6. remove the directories:
```
# rm -fr ~/.config/fish
# rm -fr ~/.config/omf
```
7. create the symbolick links
```
# ln -sf ~/winhome/.wsl/etc/fish/config/fish ~/.config/fish
# ln -sf ~/winhome/.wsl/etc/fish/config/omf ~/.config/omf
```
8. If using bash, edit the .bashrc file and  add the follow line just before the line that loads OMB:
```
source $WIN_HOME/.wsl/etc/bash/default.sh

source $OSH/oh-my-bash.sh
```
9. (warning: security issue) Change the permission to allow your user to write the file 
`C:\Windows\System32\drivers\etc\hosts`

## How to Use
- For each WSL2 distro you have, create a sh or fish file in `.wsl\etc\<shell>` with the (lower case) distro name as the file name.  Example:
    - `.wsl\etc\fish\ubuntu.fish` or
    - `.wsl\etc\sh\ubuntu.sh` 
- For each username you use in your WSL2 distro, create a sh or fish file in `.wsl\etc\<shell>` with the (lower case) username as the file name.  Example:
    - `.wsl\etc\fish\root.fish` or
    - `.wsl\etc\sh\root.sh`

## How it works
- When you log in, the `.wsl\etc\fish\default.fish` or `.wsl\etc\sh\default.sh` will execute.
- This file will execute the <distro>.fish or <distro>.sh and <username>.fish or <username>.sh script.
- Then it will add an entry in the windows hosts file with the `<distro name>` and `<distro name>.wsl` resolving to the wsl IP. This way, you can access your distro through domain. Example:
  ```
  ping ubuntu.wsl
  ```
  
Look at the exemplos provided.
  
