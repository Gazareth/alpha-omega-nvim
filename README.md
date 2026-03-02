# αω alpha-omega-nvim

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/ellisonleao/nvim-plugin-template/lint-test.yml?branch=main&style=for-the-badge)
![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)

Multiple Alpha dashboards in Neovim

## Installation

<details open>
<summary>Lazy.nvim</summary>

```lua
{
    'Gazareth/AlphaOmega',
    dependencies = { 'goolord/alpha-nvim' },
    config = function ()
        require'alpha-omega-nvim'.setup(require'alpha.themes.startify'.config)
    end
};
```
</details>

<details open>
<summary>Packer</summary>

```lua
use {
    'Gazareth/AlphaOmega',
    requires = { 'goolord/alpha-nvim' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
}
```
</details>

<details open>
<summary>paq</summary>

```lua
require "paq" {
    "Gazareth/AlphaOmega";
    "goolord/alpha-nvim";
}
require'alpha'.setup(require'alpha.themes.startify'.config)
```
</details>

### Config example

See [init.lua](https://github.com/Gazareth/dotfiles/tree/be3c3b81c6f01de2a0a5bd24dc800ffc3de49379/nvim/nvChad/starter/lua/configs/overrides/alpha-omega) and its adjacent files:

- Base
- Project
- Settings

The function in [init.lua](https://github.com/Gazareth/dotfiles/tree/be3c3b81c6f01de2a0a5bd24dc800ffc3de49379/nvim/nvChad/starter/lua/configs/overrides/alpha-omega) must be called as part of alpha-omega's setup.

---

> Plugin generated from  [ellisonleao/nvim-plugin-template](https://github.com/ellisonleao/nvim-plugin-template)