# vim-tfsecurity

## What is it?

Vim plugin for tfsecurity to install and run tfsecurity.

## Install

1. add the plugin to our list of plugins

  ```
  Plug 'khulnadsoft-labs/vim-tfsecurity'
  ```

2. restart vim and run `:PlugInstall` to install


## Usage

If you don't have `tfsecurity` already install then you can run `:TFsecurityInstall` to get the latest version.

If you already hav it, you can run `TFsecurityUpdate` to get the latest version.

Run `:TFsecurity` to get a list of the current tfsecurity issues in your current directory. The issues will be added to the QuickFix list.


## Example usage

![Usage](using-vim-tfsecurity.gif)
