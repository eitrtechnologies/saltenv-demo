# saltenv Demonstration
This repo contains some artifacts to show off some basic saltenv functionality.
This example uses works with some basic dotfiles for vim and kubectl, but could
certainly be changed/extended for more robust use cases.

## About saltenv
[saltenv](https://github.com/eitrtechnologies/saltenv) is a Salt binary
installation and management tool, inspired by
[tfenv](https://github.com/tfutils/tfenv)

saltenv allows users to easily install multiple salt binaries built with tiamat.
This is useful for standalone machine (desktop/laptop) configuration where the
full Salt installation isn't warranted or necessary.

saltenv is built as a [POP application](https://pop.readthedocs.io/), which
allows it to leverage other POP plugins in the ecosystem or plug into other
applications as necessary.

## Prerequisites

* Python 3.7+
* A Linux system _(or the code can be tweaked for multi-platform support)_

## Installation

1. Create a virtual environment (optional)

```bash
python3 -m venv saltenv
source saltenv/bin/activate
```

2. Install `saltenv`

```bash
pip install saltenv
```

## Initialization
--------

1. Initialize the `saltenv` environment, which installs a `salt` wrapper script
   and a helpful minion configuration for standalone `salt call` use

```bash
saltenv init
```

2. Install the Salt binary for version 3004

```bash
saltenv install 3004
```

3. "Use" the 3004 binary, which points the `salt` wrapper script at the
   downloaded binary

```bash
saltenv use 3004
```

4. Ensure the wrapper script can be used (follow PATH procedures for your shell)

```bash
echo 'export PATH="/home/nmhughes/.saltenv/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

5. Run a quick test! This should return version 3004

```bash
salt call test.version
```

## Configuring a system

**NOTE:** This procedure will overwrite your `.vimrc` file if present. Be sure
to back it up prior to running this command, or you'll need to retrieve it from
the minion cache location in `~/.saltenv`

1. Clone the demo repository

```bash
git clone https://github.com/eitrtechnologies/saltenv-demo.git
cd saltenv-demo
```

2. Run a highstate

```bash
salt call state.apply
```

3. Celebrate!


More information on how this works is on the
[EITR Technologies Blog](https://eitr.tech/blog/2022/03/23/announcing-saltenv.html)
