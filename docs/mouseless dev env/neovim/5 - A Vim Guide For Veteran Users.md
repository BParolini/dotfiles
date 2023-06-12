by [The Valuable Dev](https://thevaluable.dev/vim-veteran/)

![Vim for veteran users](https://thevaluable.dev/images/2021/vim_veteran/vim_veteran.jpg)

This article is the fifth of the series aimed to teach Vim from the ground up:

Can you picture an adventurer, going deeper and deeper into a mysterious cave, knowing what’s waiting for her (mostly rocks and bats) but at the same time wishing to be surprised by some rare gems and abandoned treasures?

This is how I feel when I’m adventuring deeper and deeper into Vim’s world. I know that I’ll always find something valuable: a new keystroke, a fierce command, or a little subtlety, increasing the control I have over my favorite editor.

Over the last few articles, I tried to guide you in the Vim caves helping you discover the finest diamonds. We’ll continue this endeavour in this article by exploring the following:b

- Some keystrokes used for completion in INSERT mode.
- Useful keystrokes we can use in COMMAND-LINE mode.
- What are abbreviations and how to use them.
- How to save the global options and mappings of the current Vim instance into a file.
- How to save and restore Vim sessions.
- What’s the purpose of the viminfo file (or the shada file for Neovim).
- How to redirect Vim command output into a file or a register.

Take your backpack, your headlamp, your rope, and let’s go spot some new treasures for the mind.

## Completion in Insert Mode

We have already looked at useful keystrokes in INSERT mode [in the last article](https://thevaluable.dev/vim-adept/). There are other interesting ones you can use for completion. These keystrokes are all prefixed with another one, `CTRL+x`.

Vim needs to be compiled with the `+insert_expand` feature for these keystrokes to work.

The first couple of them allow you to scroll up and down your buffer without leaving INSERT mode:

- `CTRL+x CTRL+y` - Scroll up
- `CTRL+x CTRL+e` - Scroll down

The others are only useful if you want to complete what you’ve already typed. Here are, in my opinion, the most useful ones:

- `CTRL+x CTRL-l` - Complete a whole line from the content of one of your buffer.
- `CTRL+x CTRL-f` - Complete the filepath under the cursor. It expands environment variables if it contains a filepath too.
- `CTRL+x s` - Complete with spelling suggestions.
- `CTRL+x CTRL+v` - Complete with the command line history.
- `CTRL+x CTRL+i` - Complete with the keywords in the current and included files. These files are in the option `path`.

You can also use the completion from a thesaurus or a dictionary, or even the omni-completion to auto-complete programming languages. If you want to dive deeper in these ideas, Vim’s help is waiting for your curiosity to be unleashed.

#### Vim help
- `:help i_CTRL-x`
- `:help ins-completion`
- `:help compl-omni-filetypes`

## Keystrokes in Command-Line Mode

There was a lot of love poured into INSERT and VISUAL mode keystrokes in this series of article. What about COMMAND-LINE mode? It’s time to pay some respect to this old chap.

First, some good news: The keystrokes in INSERT mode will mostly work in COMMAND-LINE mode too. In one sentence, we already have a bunch of keys we can play with. How sweet is that?

### Copying From the Buffers to the Command-Line

Did you ever have the urge to copy something from your buffer in COMMAND-LINE mode? The boring way would be to come back to your buffer in NORMAL mode, copy what you want in a register, come back to COMMAND-LINE mode, and spit what you want. Like in INSERT mode, you can use `CTRL+r` followed by the name of a register to copy its content in COMMAND-LINE mode.

Or you can use these keystrokes:

- `CTRL+r CTRL+f` - Copy the `f`ilename under the buffer’s cursor.
- `CTRL+r CTRL+w` - Copy the `w`ord under the buffer’s cursor.
- `CTRL+r CTRL+a` - Copy the WORD under the buffer’s cursor.
- `CTRL+r CTRL+l` - Copy the `l`ine under the buffer’s cursor.

### Search

If the option `incsearch` is set, it will highlight the search you’re doing while typing it. That’s not all: you’ll also be able to use `CTRL+g` and `CTRL+t` to go through every match without leaving COMMAND-LINE mode.

### Multiple Commands on One Line

This one is not a keystroke but it can be useful nevertheless. You can run more than one command in one line if you separate them with a pipe. For example:

```
:set filetype?|echo "it's done!"
```

This won’t work if the command accepts a pipe as an argument. For example: `:!ls | wc`.

#### Vim help
- `:help Command-line-mode`
- `:help ex−edit−index`

## Abbreviations

Let’s now look at something totally different: Vim abbreviations. This feature can replace a word with another one automatically after pressing `SPACE`. You can use abbreviations in INSERT and COMMAND-LINE modes.

For example, if you often misspell “the” with “teh” (it happens to the best of us), you can automatically replace “teh” with “the”.

Let’s see the commands you can use to output and manipulate abbreviations:

- `:abbreviate` or `:ab` - List all the abbreviations created.
- `:abbreviate <string>` or `:ab <string>` - List abbreviations beginning with the string `<string>`.
- `:abbreviate <string> <replacement>` or `:ab <string> <replacement>` - Create a new abbreviation for every mode.
- `:unabbreviate <ab>` or `:una <ab>` - Remove the abbreviation `<ab>`.
- `:abclear` or `:abc` - Remove all abbreviations.

When you list abbreviations using `:ab`, you’ll see different letters in the first column of the output. They indicate in what mode you can use them:

- `i` for `i`nsert mode.
- `c` for `c`ommand line mode.
- `!` for both.

If you want to list or create abbreviations for one precise mode, you can use `i` or `c` at the beginning of the command:

- `:iab` - List every abbreviation available in INSERT mode.
- `:cab <string> <replacement>` - Create a new abbreviation only available in COMMAND-LINE mode.
- `iabc` - Remove all abbreviations in INSERT mode.

It works a bit differently if you decide to use the long forms of the commands. For example, `:iabbreviate` won’t work; instead, use “abbrev”, like in `:iabbrev`, `:cabbrev`, or `:iunabbrev`.

You can use abbreviations for different purposes as shown in these different examples:

- `:iab @@ myemail@email.com` - Insert your email
- `:iab BTW by the way` - Expand an acronym
- `:iab sign Jane Doe™<cr>jane@doe.com` - Insert your signature
- `:iab <expr> cdate strftime('%Y-%m-%d')` - Insert the `c`urrent date
- `:cab uuidgen r! uuidgen` - Insert a UUID when running the command `:uuidgen`

Finally, if you’ve typed an abbreviation but you don’t want to expand it when hitting `SPACE`, use `CTRL+v` and then `SPACE` instead.

#### Vim help
`:help abbreviations`

## Saving Vim’s Options and Mapping in a File

Let’s now go into the crux of this article: persisting your current options, keystroke mappings, or your whole sessions into a file.

If you were experimenting in Vim by changing a bunch of options and mappings but you don’t remember what exactly, or if you wonder what command run when you hit a keystroke, you can output every option and global mappings (different from Vim’s defaults) into a file.

To do so, you can run the command `:mkexrc <filepath>` or `:mk <file>` to output these options and mappings into the file `<filepath>`. If you use a relative path, it will be relative to the working directory you’re in (to display it, use `:pwd`).

You can also add a bang `!` to `:mk` to overwrite a file. For example, `:mk! myfile` will create the file `myfile` or overwrite it if it already exists.

From there, you can open the file you’ve written and copy whatever options or mapping you want in your vimrc. You can also source the file directly into another instance of Vim with the command `:source <filepath>`.

I’ve already written about the `:source` command in [Vim for Intermediate Users](https://thevaluable.dev/vim-intermediate/) in order to reload your vimrc. You can source any file containing some Vimscript with this command.

## Vim Sessions

If you want to save and restore much more than options and global mappings, you can use Vim sessions.

### Creating and Loading a Session

A session is constituted of all the views (a view is a collection of settings attached to a window) and the global settings of your current Vim instance.

Wouldn’t it be fun to save your session in a file and open it later in another Vim instance? It would allow you to recover all your buffers, windows, and local settings! Life would be even more colorful then.

To do so, you can use the commands `:mksession <filepath>` or `:mks <filepath>`. You can then source the session in another instance of Vim with `:source <filepath>`.

As usual, you can add a bang `!` to the command to overwrite the file if it already exists.

For example, here are some mappings I’ve written in my `vimrc` to manipulate sessions:

- `nnoremap <leader>ss :mksession! $VIMCONFIG/sessions/` - Mapping to `s`ave a `s`ession
- `nnoremap <leader>sl :source $VIMCONFIG/sessions/` - Mapping to `l`oad a `s`ession

Each time I press `LEADER ss`, I can type the name of the session and save it. All my sessions are gathered in the same directory.

### Fine Tuning Vim’s Sessions

The option `sessionoptions` contains a bunch of values separated with comma `,`. These values will decide what will be saved in your session file and, as a result, what will be restored when the file is sourced.

Here are the most interesting values you can use:

- `blank` - Save windows containing buffers without names.
- `buffers` - Save hidden and unloaded buffers. Only buffers in windows are restored without this value.
- `curdir` - Save the current directory.
- `folds` - Save folds information.
- `globals` - Save the global variables beginning with uppercase and containing at least one uppercase in their names.
- `help` - Save the help windows.
- `localoptions` - Save local options and mappings to a window or a buffer.
- `options` - Save all options and mappings.
- `resize` - Save the size of your windows.
- `tabpages` - Save all the tab open. Without this value, only the current tab is saved.
- `terminal` - Save the terminal window.

Note that the default global options or global mappings are not saved in a session file. It means that if you have an instance of Vim open and you’ve already modified some default values, loading a session won’t reset them to their defaults.

#### Vim help
- `:help :sessionoptions`
- `:help views-sessions`
- `:help :mksession`

## The files viminfo or shada

Vim also saves information automatically into a file when you close the editor. This file is different depending on what you’re using:

- For Vim, it’s the viminfo file.
- For Neovim, it’s the shada file (for `sh`ared `da`ta). It can’t be a symlink.

On Unix systems (Linux and macOS), each file can be found at these file paths:

- viminfo - `$HOME/.viminfo`
- shada - `$XDG_DATA_HOME/nvim/shada/main.shada`

You can change the name for your shada or viminfo file by setting the value of `shadafile` or `viminfofile` respectively. You can also set the value `NONE` if you don’t want to use these files.

Each time you close a Vim instance, you can save the following:

- The command-line history.
- The search history.
- The input-line history.
- Contents of non-empty registers.
- Lowercase marks for several files.
- File marks (uppercase marks).
- Last search or substitute pattern.
- The buffer list.
- The global variables (only if they’re different from the default values).

You can configure what to save more precisely by changing the values of the following option:

- For Vim, the option `viminfo`.
- For Neovim, the option `shada`.

The option’s values are separated with a comma `,`. Here are the most useful:

- `!` - Save and restore global variables (their names should be without lowercase letter).

You can add a number after each of these values:

- `<` - Specify the maximum of lines saved for each register. All the lines are saved if this is not included. If you don’t want to save your registers, use the value `<0`.
- `%` - Save and restore the buffer list. You can specify the maximum number of buffer stored with a number.
- `'` - Specify the maximum number of marked files remembered. It also saves the jump list and the change list we saw in a [previous article](https://thevaluable.dev/vim-intermediate/).
- `/` and `:` - Number of search patterns and entries from the command-line history saved. The option `history` is used if it’s not specified.
- `f0` - Don’t store any uppercase mark.
- `s` - Specify the maximum size of an item’s content in KiB (kilobyte).
    - For the viminfo file, it only applies to register.
    - For the shada file, it applies to all items except for the buffer list and header.

For example, `:set shada=!,'100,<50,s100` save global variables, a maximum of 100 files marked, a maximum of 50 lines per register, and a maximum of 100Kib for each item. The equivalent for vim would be `:set viminfo=!,'100,<50,s100`.

Vim writes the viminfo file when you close the editor, and it’s loaded when you open a new instance. That said, you can also output, save, or load the file with these commands:

For Vim:

- `:oldfiles` or `:ol` - Display all marked files stored in the viminfo file.
- `:rviminfo` or `:rv` - Read the viminfo file.
- `:wviminfo` or `:wv` - Write the viminfo file.

For Neovim:

- `:oldfiles` or `:o` - Display all files with a mark stored in the shada file.
- `:rshada` or `:rs` - Read the shada file.
- `:wshada` or `:ws` - Write the shada file.

Add a bang to these commands (`:rv!` or `:rs!` for example) to allow everything set in your file overwriting everything in your current Vim instance.

The viminfo file is written in its one dialect. You can modify it directly if you feel even more adventurous. The shada file use the [messagepack](https://msgpack.org/) format.

#### Vim help
- `:help viminfo`
- `:help 'viminfo'`
- `:help 'viminfofile'`

#### Neovim help
- `:help shada`
- `:help 'shada'`
- `:help 'shadafile'`

## Redirections

What if you want to save the output of Vim commands in a file or in a register? The command `:redir` is here to fulfill your desires. More precisely:

- `:redir > <file>` - Write every command’s output to the file `<file>`.
    - Use `:redir!` (with a bang `!`) to overwrite the file.
    - Use `>>` instead of `>` to append to the file.
- `:redir @<reg>` - Write every command’s output to the register `<reg>`.
- `:redir @<reg>>>` - Append every command’s output to the register `<reg>`.
- `:redir => <var>` - Write every command’s output to the variable `<var>`.
- `:redir END` - End the redirection.

For example, if you want to set the variable `sessionoptions` in your `.vimrc` with the current value, you can do something like that:

```
:redir >> $VIMCONFIG/.vimrc
:set sessionoptions?
:redir END
```

After running `:redir END`, nothing more will be written into the file. You can only have one redirection going on, so declaring a new one will automatically close the previous one.

Let’s look at another example. You can run the following to append the declaration of the option `sessionoptions` with the current value:

```
:redir @+>>
:set sessionoptions?
:redir END
```

Using the uppercase version of the named registers (the ones from `a` to `z`) will append the output of Vim’s commands without the need to use `>>`. For example, `:redir @A`.

A final example, using a variable to store the output of the command this time:

```
:redir => my_var
:set sessionoptions?
:redir END
:echo my_var
```

Vim help

`:help :redir`

## Filtering Commands Output

It’s nice to be able to save command output in Vim, but what if we want to filter them?

To do so, we can use the command `:filter /<pattern>/ <cmd>`: it will filter the command `<cmd>` according to the pattern `<pattern>`.

Let’s take some examples:

- `:filter /content/ buffers` - Only output the buffers with part of the filepath matching `content`.
- `:filter /archives/ oldfiles` - Only output the marked files with part of the filepath matching `archives`.  
    As you can see, the pattern doesn’t have to match the whole line, only part of it. You can add a bang `!` to the command `filter` (`filter!`) to inverse the match, that is, output everything which _doesn’t match_ the pattern.

This command doesn’t work with all Ex commands. For example, it won’t work with the command `:register`.

#### Vim help
`:help :filter`

## Next Step: Vim for Expert Users

What did we learn in this article?

- You can use a new INSERT mode submenu with the keystroke `CTRL+x` followed by another keystroke.
- You can use most keystrokes for INSERT mode in COMMAND-LINE mode. You can also use `CTRL+r` with a second keystroke to copy what’s in your buffer directly in your command-line.
- Abbreviations are meant to stop beating your keyboard because you can’t stop doing the same spelling mistakes. It’s not the only use case; the sky’s the limit.
- You can source any file containing Vimscript commands using the command `:source`.
- You can save the current settings of your Vim instance with `:mk <file>`.
- You can also save your current Vim session with the command `:mks <file>`.
- Every time you close Vim, your viminfo file is written (if the `viminfo` options is not empty). If you use Neovim, the viminfo file is replaced with the shada file.
- Every time you open Vim, the viminfo file (or shada file) is read.
- You can use the redirection (command `:redir`) to persist in files or registers the output of the different Vim commands.
- You can filter the output of some Vim commands using the command `:filter`.

Throughout this series, we’ve seen many functionalities The Glorious Vanilla Vim offers us on a tasty platter. But the real power of Vim lies in its flexibility. That’s why in the next article, Vim for Expert Users, we’ll become Apprentice Gods (or Goddesses) and look at different ways to shape our Vim world according to our deeper needs.