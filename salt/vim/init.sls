
# pkg doesn't work with the current binary (v3004)
#
#install_vim:
#  pkg.latest:
#    - name: vim

clone_salt_vim:
  git.cloned:
    - name: https://github.com/saltstack/salt-vim.git
    - target: /tmp/salt-vim

{% for dir in ["ftdetect", "ftplugin", "syntax"] -%}
install_salt_vim_{{dir}}:
  file.copy:
    - name: /home/{{ grains.username }}/.vim
    - source: /tmp/salt-vim/{{ dir }}
    - makedirs: true
    - subdir: true

{% endfor -%}
create_vim_plugins_directory:
  file.directory:
    - name: /home/{{ grains.username }}/.vim/pack/plugins/start
    - makedirs: true

install_vim_jinja_syntax:
  git.cloned:
    - name: https://github.com/Glench/Vim-Jinja2-Syntax.git
    - target: /home/{{ grains.username }}/.vim/pack/plugins/start/jinja2.vim

manage_vimrc:
  file.managed:
    - name: /home/{{ grains.username }}/.vimrc
    - mode: "0644"
    - backup: minion
    - contents: |
        color industry
        set expandtab
        set shiftwidth=2
        set softtabstop=2
        set cc=120
        set nofoldenable
        set hlsearch
        syntax on
        set nocompatible
        set modeline
        filetype plugin indent on
        let g:sls_use_jinja_syntax = 1
