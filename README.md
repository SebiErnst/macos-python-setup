# macOS Python setup
A simple script used to set up conda environments, mostly for Python-related packages, on macOS machines (but should be usable on other *NIX systems as well).

## Prerequisites

You need to have a working Conda installation on your machine. [Miniforge](https://github.com/conda-forge/miniforge) is a good idea for macOS:

```
brew install miniforge
```

## Installation

Download or clone the repository, to a directory of your choice:

```
git clone https://github.com/SebiErnst/macos-python-setup.git
```

### Updating

If the repository has been cloned using Git, you can always pull the code updates (and new definitons) by entering the directory:

```
cd macos-python-setup
```

And doing a Git pull:

```
git pull
```

## Usage

Change into the cloned/downloaded directory, e.g.:

```
cd macos-python-setup
```

Use the script to create the environment according to the given formula:

```
./setup-conda-env.sh [FORMULA_NAME] [ENVIRONMENT_NAME]
```

If `FORMULA_NAME` is supplied, the script will look for `FORMULA_NAME.yml` and use that to set up the formula. Otherwise, `python.yml` will be used to create a basic Python setup, and the environment will be called `python`.

If  `ENVIRONMENT_NAME` is supplied, it will be used as the environment name. Otherwise, `FORMULA_NAME` will be used.

If the environment already exists, it will be deleted and re-created.

Additionally, if `FORMULA_NAME.sh` exists, it will be run inside the newly created environment.

### Examples

#### Set up a basic Python environment

This will create an environment called `python`, using `packages.yml`.

```
./setup-conda-env.sh
```

#### Using a custom definition file

This will create an environment with basic machine learning tools (including [scikit-learn](https://scikit-learn.org) and [Tensorflow](https://www.tensorflow.org)) for Apple Silicon machines, including the [TensorFlow setup recommended by Apple](https://developer.apple.com/metal/tensorflow-plugin/).

```
./setup-conda-env.sh ml-macos-applesilicon
```

#### Specifying the environment name

Same as above, but will call the environment `ml` instead.

```
./setup-conda-env.sh ml-macos-applesilicon ml
```

