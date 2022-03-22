
manage_kubectl_aliases:
  file.managed:
    - name: /home/{{ grains.username }}/.kubectl_aliases
    - source: https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases
    - source_hash: fa866865ff12d8126b2ccd97e41217c61a6bd7624a299f4a4cc8d20f2f2bc09f
