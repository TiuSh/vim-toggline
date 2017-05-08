# Toggline.vim

Sometimes you need to toggle a specific pattern on the line under cursor:
add/remove a semicolon at the end of line, add/remove a comma at the beggining
of line,... Toggline Vim Plugin provides a set of functions to help you in
these cases.

## Preview

![toggline1](https://cloud.githubusercontent.com/assets/873202/17136544/5649d14a-5336-11e6-9da9-8c6db3c390f7.gif)
![toggline2](https://cloud.githubusercontent.com/assets/873202/17136545/564bfdee-5336-11e6-8702-41cf6bc65b68.gif)

## Installation

This plugin follows the standard runtime path structure, and as such it can
be installed with a variety of plugin managers:

- Pathogen

`git clone https://github.com/TiuSh/vim-toggline ~/.vim/bundle/vim-toggline`

- Vundle:

`Plugin 'TiuSh/vim-toggline'`

## Usage

Use this plugin by setting your own mappings in your `.vimrc`:

```
nmap <silent> <leader>; :call toggline#End(';')<CR>
inoremap <silent> <leader>; <C-\><C-O>:call toggline#End(';')<CR>
```

Consider this line of code (where [*] represent the position of the cursor):

```
var foo = { ba[r]: 1 }
```

Pressing `<leader>;` will result to:

```
var foo = { ba[r]: 1 };
```

Pressing `<leader>;` again:

```
var foo = { ba[r]: 1 }
```

Note that you can add spaces around the toggled string:

```
nmap <silent> <leader>, :call toggline#Start(', ')<CR>
```

Now consider this code:

```
var foo = 1
    ,ba[r] = 0;
```

Pressing `<leader>,` will result to:

```
var foo = 1
    ba[r] = 0;
```

Pressing `<leader>,` again:

```
var foo = 1
    , ba[r] = 0;
```

Available helper functions:

### toggline#End( str )

Toggle the given string at the end of the line.

### toggline#Start( str )

Toggle the given string at the beginning of the line.

### toggline#With( enabledPat, disableSub, disabledPat, enableSub )

Toggle the current line using the given expresions and substitutions:

- **enabledPat**: Pattern on which the line will be tested. If it
matches, the line will be considered as "enabled"
and this pattern will be replaced by the
"disableSub" argument.
- **disableSub**: Substition string applied on "enablePat" if the
line is considered "enabled"
- **disabledPat**: If the line is considered as "disabled", this
pattern will be replaced by the "enableSub"
argument.
- **enableSub**: Substition string applied with the "enablePat" if the
line is considered "disabled"


## License

MIT
