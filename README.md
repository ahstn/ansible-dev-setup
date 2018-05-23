# Ansible Dev
Provision development devices or virtual machines using [Ansible]

### Requirements
* [Ansible] (use bootstrap script if needed)

### Platforms Supported
Currently only CentOS 7 is tested, but it should also work on Debian & Ubuntu. 
In the future more distros will be tested for.

## Usage
Once the playbook has been configured with your preferred roles and variables, 
the provision can be initiated by running the following command:
```bash
$ ansible-playbook -K playbook.yml
```

`-K` is short for telling Ansible to prompt for the user's sudo password, 
which is required when installing packages, modifying system files and such.

### Tasks
The role contains many tasks, each for installing and setting up a specific tool. They are as follows:

| Name                  | Description                                                   |
|-----------------------|---------------------------------------------------------------|
| [`golang`]            | Installs the Go programming language and some common packages |
| [`jetbrains-toolbox`] | Installs Jetbrains' Toolbox                                   |
| [`vim`]               | Installs Vim, [vim-plug] and the template .vimrc              |
| [`vscode`]            | Installs Visual Studio Code                                   |
| [`zsh`]               | Installs ZSH, [zplug] and the template .zshrc                 |

### Variables
The role utilises many variables for running, which can be found in [defaults/main.yml], 
but some of the most important for user customisation are:

| Name                    | Description                                         | Default    |
|-------------------------|-----------------------------------------------------|------------|
| `vimrc_ansible_managed` | Determines whether user vim config should be edited | `true`     |
| `vim_plugins`           | List appended to vim config of plugins for vim-plug | `$array`   |
| `vim_install_plugins`   | Determines whether to install vim plugins or not    | `$array`   |
| `zshrc_ansible_managed` | Determines whether user zsh config should be edited | `true`     |

## Testing and Development
Tests are written in YAML and verified [Goss]. 
These tests specify a base state that will be verified after the provision happens in test environments.
All tests occur in short-lived Docker containers, orchestrated by [Molecule] . 
This allows for provisioning of multiple test environments at once with minimal downtime. (i.e. waiting for VM spinup)
Playbooks and tests are also analysed by YAML Lint and [Ansible Lint]

### Testing Requirements
* [Docker]
* Python
* [Molecule]

With Python installed Molecule can be installed, with it's dependencies using the following command:
```bash
$ pip install pyOpenssl docker molecule
```

### Testing Execution
Tests can now be ran by the following command:
```bash
$ molecule test
```
Setup of the Docker test environments, provisioning and verification can also be ran in seperate steps using
`molecule setup`, `molecule converge` and `molecule verify` respectively.

For more options, view the [Molecule Docs] or run `molecule -h`

[Ansible]: https://www.ansible.com/
[`golang`]: ./tasks/golang.yml
[`jetbrains-toolbox`]: ./tasks/jetbrains-toolbox.yml
[`vim`]: ./tasks/vim.yml
[`vscode`]: ./tasks/vscode.yml
[`zsh`]: ./tasks/zsh.yml
[vim-plug]: https://github.com/junegunn/vim-plug
[zplug]: https://github.com/zplug/zplug
[defaults/main.yml]: ./defaults/main.yml
[Goss]: https://github.com/aelsabbahy/goss
[Docker]: https://docker.com
[Molecule]: https://github.com/metacloud/molecule
[Ansible Lint]: https://github.com/willthames/ansible-lint
[Molecule Docs]: https://molecule.readthedocs.io/en/latest/usage.html
