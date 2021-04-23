_Previous version archived at https://github.com/CraigJPerry/dotfiles (I lost access to CraigJPerry a good while ago)_

My cross platform (Linux, MacOS, ~~Solaris~~, Windows, FreeBSD, ~~OpenBSD~~)
user configuration files. _2021 Update: some more OS's join AIX & OpenVMS in succumbing to inevitable attrition_


### Changes for 2021 ###

* vim is replaced with neovim
* I've ditched bash, i'm now a zsh kinda guy:
  * I prefer the completion facilities
  * I really like the glob extensions, i can replace find so no more tripping over differences between GNU find and BSD find
  * The zmv, zcalc stuff i'm undecided on whether it's useful
  * The zftp and the zsh modules stuff i will not use - that's taking shell too far IMO, i'd rather use a more ergonomic language like Python for more advanced scripting
  * The more ergonomic parameter expansion could be handy
  * The above is all lies to justify rocking a bling eye-candy powerline10k prompt
* screen is gone, tmux won
* I'm more assertive about using vim keybindings everywhere so i don't need to learn new keybindings for every tool


### Philosophy ###

1. Document everything, use long-hand options where possible. I want
   to be able to grok even the obscure bits months from now.
2. Don't be too opinionated, don't go remapping keys willy-nilly,
   it'll just cause pain when you have to use someone else's session.


### Installation ###

Comes with (optional) [ansible playbook](http://www.ansibleworks.com)
install.yml to automate the installation of dotfiles and associated
setup tasks.

    [testing@r4 ~]$ git clone https://github.com/CraigJPerry/dotfiles.git .dotfiles
    [testing@r4 ~]$ cd .dotfiles
    [testing@r4 .dotfiles]$ ansible-playbook --connection=local --inventory-file=localhost, install.yml

    PLAY [localhost] **************************************************************

    GATHERING FACTS ***************************************************************
    ok: [localhost]

    TASK: [INSTALL DOTFILES | Link New Dotfiles] **********************************
    ok: [localhost] => (item={'dest': '.bashrc', 'source': 'bashrc'})
    ok: [localhost] => (item={'dest': '.bash_profile', 'source': 'bash_profile'})
    ok: [localhost] => (item={'dest': '.bash_logout', 'source': 'bash_logout'})
    ok: [localhost] => (item={'dest': '.gitconfig', 'source': 'gitconfig'})
    ok: [localhost] => (item={'dest': '.vimrc', 'source': 'vimrc'})
    ok: [localhost] => (item={'dest': '.conkyrc', 'source': 'conkyrc'})
    ok: [localhost] => (item={'dest': '.config/autostart/conky.desktop', 'source': 'conky.desktop'})

    TASK: [CONKY | Install Conky] *************************************************
    ok: [localhost]

    TASK: [INSTALL VIM PLUGINS | Pre-requisite RPMs] ******************************
    ok: [localhost] => (item=vim-enhanced,python-pip)

    TASK: [INSTALL VIM PLUGINS | Pre-requisite Python Modules] ********************
    ok: [localhost] => (item=jedi)
    ok: [localhost] => (item=pylint)
    ok: [localhost] => (item=pep8)

    TASK: [INSTALL VIM PLUGINS | Vim Bundle Directory] ****************************
    ok: [localhost]

    TASK: [INSTALL VIM PLUGINS | Vundle Plugin Manager] ***************************
    ok: [localhost]

    TASK: [INSTALL VIM PLUGINS | Install Vundle Bundles] **************************
    skipping: [localhost]

    TASK: [DIRS | Github] *********************************************************
    ok: [localhost]

    TASK: [DIRS | Gists] **********************************************************
    ok: [localhost]

    TASK: [DIRS | Local] **********************************************************
    ok: [localhost]

    TASK: [SSH | Check Key] *******************************************************
    ok: [localhost]

    TASK: [SSH | Make dir] ********************************************************
    skipping: [localhost]

    TASK: [SSH | Generate Key] ****************************************************
    skipping: [localhost]

    PLAY RECAP ********************************************************************
    localhost                  : ok=11   changed=0    unreachable=0    failed=0

You could copy the files instead, but you'll have to do any other setup manually.


### Tools ###

* Shell: zsh
* Editor: neovim, VSCode (with VSCodeVim for now but considering the neovim plugin, i miss my :g command)
* File Manager: nnn _i recompile this with O_NERD=1_
* Terminal Multiplexer: tmux
* Keyboard Macros
  * Windows: AHK
  * MacOS: Karabiner Elements + MacOS Keyboard Text shortcuts (which i discovered iCloud sync to iOS, natch!!)
* Misc CLI Handy Tools
  * GNU units: the ultimate conversion calculation tool
  * JSON
    * jq: I still use this as if its only feature were python -m json.tool, i should invest some time
    * gron: Make json grep-able
  * pipx: Don't manually manage virtualenvs for python tools
    * datasette: sqlite+web tool for data analysis
    * poetry: Python dependency management automation
    * httpie: Convenience for working with APIs
    * ansible: i still occasionally have nightmares about CFEngine3, the GitOps ideas are bringing iterative convergence back and i'm *shook*
  * lnav: logfile navigator, you don't regexp your way to the next minute/hour/error/whatever in a log, it has keybindings and teleports you instantly. The real killer feature is annotating logs with comments. Why did it take me so long to find this tool...

