by [The Valuable Dev](https://thevaluable.dev/vim-expert/)

![Vim for expert users](https://thevaluable.dev/images/2021/vim_expert/vim_expert.jpg)

This is the sixth part of this series to learn Vim from the ground up:

You’re now in your garden, sitting down in your favorite chair, contemplating a fabulous table full of the tastiest food. While delighted by your fantastic breakfast, a fresh breeze refresh your warm skin in this hot summer day. You hear the little birds singing in unison. The vivid smell of the young grass and the delicate and subtle aroma of your tea fill your nostrils. Everything is in perfect harmony; all your annoyances, problems, or negative thoughts are far away from this pure state of bliss.

Suddenly, you hear a strong and imposing voice from the sky. The clouds move quickly. You’re flabbergasted: almost falling from your chair, you recognize the logo of the Sacred Vim formed by the cloud!

The voice, which was only a growl, begins to speak:

“My sweet friend! The time has come. You are now ready to begin the final step of your enlightenment. You will receive the Word of Vim!”

A bright and supernatural light break through the cloud and hit your table. You suddenly understand The Truth of Vim! Quickly, you take a bunch of napkins and begin to write (with some strawberry marmalade) all the knowledge which is given to you at this precise moment.

This article is a transcript of what was called later the Napkins of Power™. It helps customize Vim even further. More precisely, we’ll see:

- Special arguments you can use for your mappings.
- How to create operator pending mappings.
- The command `:execute` and its benefits when combined with the command `:normal`.
- What are autocommands and autocommand groups.
- Why and how to create custom functions.
- What are user commands and how to use them.
- What special strings you can use in your commands.
- A complete example to illustrate most of the ideas described in this article.

We’ve covered many Vim functionalities since the beginning of this series of article, and this new one add even more on these foundations. But it can be daunting to try to add everything to your workflow at once; instead, it’s better to add what can help you in your daily workflow.

You can create a virtuous circle: pick a new and useful functionally, use it in your day-to-day workflow, and, when you feel comfortable with it, reiterate.

Are your ready to receive The Expertise? The knowledge of this article is dangerous; use it with care, always to make the world a better place.

## Verbose Commands

The more pieces of configuration and plugins you’ll add to Vim, the more you’ll wonder where they’ve been created in your config files. The command `:verbose` can help you: it will output at what line of what file a precise configuration have been declared.

More precisely, `:verbose` can output the declarations of:

- Abbreviations
- Options
- Mapping
- User commands

For example, I’ve set the option `undodir` in my vimrc. If I run `:verbose set undodir?`, I’ll get the following output:

```
Last set from ~/.config/nvim/init.vim line 354
```

Keeping your configuration well organized and simple is the best strategy. But everything gets messy overtime, especially when experimenting with new configuration or plugins. I don’t use verbose often but, when I need it, I’m always happy to have it.

#### Vim help
`:help :verbose-cmd`

## Mapping Special Arguments

We’ve seen the basics of mapping [in a previous article](https://thevaluable.dev/vim-intermediate/), but we didn’t speak about the special arguments it can take. Most of them can be used for abbreviations, too.

Here are the most useful ones:

- `<silent>` - Doesn’t output the mapping in the Vim command-line. If you want to also drop the output of the command linked to the mapping, add the command `:silent`.
- `<buffer>` - The mapping’s scope is reduced to the current buffer only. These mappings have the priority on the global ones.
- `<expr>` - The mapping executes a Vimscript expression instead of a Vim command.
- `<unique>` - The mapping fails if it already exists. It’s useful if you don’t want to override any mapping defined previously.
- `<Cmd>` - The mapping can run a command without quitting the current mode you’re in.

A special argument should be used as first argument for any mapping or abbreviation. The argument `<Cmd>` is an exception: it should be used just before the command itself.

To understand how it works, let’s take some examples:

- `:nnoremap <silent> <leader><f6> :source $MYVIMRC<CR>` - The command `:source $MYVIMRC` won’t be displayed in the Vim command-line when hitting `LEADER F6`.
- `:iab <expr> cdate strftime('%Y-%m-%d')` - The Vimscript function `strftime` is executed when the abbreviation `cdate` is used.
- `:inoremap <c-d> <Cmd>delete<cr>` - Execute the command `:delete` without leaving INSERT mode.
- `:nnoremap <leader><f6> :silent :source $MYVIMRC<CR>` - The output of the command `:source $MYVIMRC` will be dropped, thanks to the command `:silent`.

We’ll see a use case for the special argument `<buffer>` below.

#### Vim help
`:help map-arguments`

## Mapping Operator Pending Mode

Operators are NORMAL mode keystrokes which need to be combined with motions or text-objects. For example, `d`, `c`, or `y` are operators. I’ve written about them in [the very first article](https://thevaluable.dev/vim-beginner/) of this series.

When we type one of these operators in NORMAL mode, we switch to OPERATING-PENDING mode. At that point, vim waits for a motion (or text-object), and then come back to NORMAL mode.

Vim let’s you create new mapping for this OPERATOR-PENDING mode with the command `:onoremap`. Concretely, you’ll be able to create new motions for all existing operators.

For example:

```vim
:onoremap ic i{
```

We’ve created here a new text-object `ic` to use an operator `i`nside `c`urly brackets. You can try it out to delete the content between two curly brackets for example, by:

1. Placing the cursor inside the curly brackets.
2. Hitting `dic` in NORMAL mode.

The text-object (or motion) created with `:onoremap` always begins where your cursor is. That’s why we need to place our cursor inside the curly brackets in our previous example. But it would be even better if we could act on the next curly brackets on the current line, without worrying where the cursor is. The following command will make this dream a reality:

```vim
:onoremap nc :normal! f{vi{<cr>
```

Let’s look at this example more closely:

- `:normal!` - Execute keystrokes as if you were in NORMAL mode (see [Vim for Advanced Users](https://thevaluable.dev/vim-advanced/)).
- `f{` - `f`ind the next curly bracket on the line (see [Vim for Beginners](https://thevaluable.dev/vim-beginner/)).
- `vi{` - Switch to VISUAL mode and select `i`nside the curly brackets.
- `<cr>` - Key notation for the `ENTER` key to validate our command (`c`arriage `r`eturn, see [Vim for Intermediate Users](https://thevaluable.dev/vim-intermediate/)).

The operator will be applied on the selection made in VISUAL mode. To illustrate this idea, let’s look at the following content:

```vim
My super┃line {with curly brackets}
```

The symbol `┃` represents the cursor position. If you hit the keystroke `dnc`, you’ll `d`elete what’s inside the `n`ext `c`urly bracket. The result will be:

```vim
My super line {}
```

The cursor will end up on the last curly bracket.

#### Vim help
`:help omap-info`

## The Command Execute

Let’s look again at the mapping we’ve set above:

```vim
:onoremap nc :normal! f{vi{<cr>
```

The key notation `<cr>` is considered a special character when you create a mapping. It works with mappings, but it won’t work with the `:normal` command by itself.

For example, you can try to run the following to replace the next occurrence of “emacs” with “vim”:

```vim
:normal /emacs<cr>ciwvim
```

This time, Vim doesn’t recognize `<cr>` as a special character, so the command won’t work. To go around this limitation, you can use `CTRL+V` (see [Vim for Adept Users](https://thevaluable.dev/vim-adept/)). In that precise case, we would need to hit `CTRL+V ENTER` while writing our command. We would end up with something like this:

```vim
:normal! /emacs^Miwvim
```

The command `:execute` can solve our problem in a more elegant way. It lets you execute a command from a string. You can then use _string constants_ for these special characters, all prefixed with a `\`. Here’s an equivalent of our silly example:

```vim
:execute "normal! /emacs\<cr>ciwvim"
```

All the key notations you can use with `:map` or `:abbreviate` have their string constant equivalents.

When you give multiple arguments to execute, they’re concatenated into one string and separated with spaces. If you don’t want the spaces, use a dot instead. For example:

```vim
:execute 'echo "this" "is" "a" "str"."ing"'
```

The output will be: “this is a string”.

#### Vim help
- `:help execute`
- `:help expr-quote`

## Autocommands

### Basics

Autocommands can automatically run a command when a specific event happens. More precisely, it adds a command to a _list of command_ linked to a precise event. When this event is fired, every command of the list of commands are executed.

An event can be opening Vim, reading any file, or writing a markdown file for example.

Here are the basics to manipulate autocommands:

- `:autocmd <event> <pattern> <cmd>` or `:au <event> <pattern> <cmd>` - Add the command `<cmd>` to the list of commands executed automatically when the event `<event>` is fired. The pattern `<pattern>` filter the files where the autocommand should be applied.
- `:autocmd <event>` or `:au <event>` - Output the list of commands executed when the event `<event>` is fired.
- `:autocmd! <event>` or `:au! <event>` - Delete the list of autocommands of the event `<event>`.

To clarify all this jargon, here are some examples:

- `:autocmd BufWrite * echom "Write..."` - Output “Write” each time any file is saved. The wildcard `*` means “every file”.
- `:autocmd BufNew *.md echom "Read..."` - Output “Read” each time a new markdown buffer is created. Unsurprisingly, The pattern `*.md` means every filename finishing with `.md`.

After running these commands, you can try to write a file (command `:w`) to see if it works. If you don’t see the message in the command-line, run `:messages` to display them.

### Multiple Events and Patterns

You can also create an autocommand with more than one event or pattern, separated with a comma. For example:

```vim
:autocmd BufNew,BufWrite *.md,*.js,*.php echom "Create or write md, js, or php..."
```

The command `echom "Create or write md, js or php..."` will run when a markdown, JavaScript, or PHP buffer is created (`BufNew`) or saved (`BufWrite`).

Note that the pattern can be a bit different depending on the events you listen to. For a description of all events available, see `:help autocommand-events`.

Finally, if you want the scope of the autocmd to be limited to the current buffer, you can use the special pattern `<buffer>`.

## Autocommand Groups

### Why Using Autocommand Groups?

As the name indicates, an autocommand group is a group of one or more autocommands. When you create an autocommand as we did above, it’s added automatically to a default autocommand group without a name. You can create autocommand groups with names and add autocommands to it, too. You can think of it as namespaces for autocommands.

To understand this concept, let’s see where it’s useful to use autocommand groups. As we saw, each time you create an autocommand, it’s added to the list of command triggered when a specific event occurs; _even if this command is already part of the list_.

Let’s look at an example. First, let’s add this autocommand to your vimrc:

```vim
autocmd BufWritePre * echom "Write..."
```

You can then try the following:

1. Source your virmc twice (by running `:source $MYVIMRC` twice).
2. Run `:autocmd BufWrite`.

This last command will output the list of commands executed when the event `BufWrite` is triggered. It will output something like this:

```vim
BufWritePre
    *         echom "Write..."
              echom "Write..."
```

The command `echom "Write..."` appears two times in the command list for the pattern `*`. As a result, each time the event occurs on any file, the command will run _two times_.

More often than not, we want to add our commands to the command list only once. Otherwise, it will impact performances each time the event is fired and, if the command is not [idempotent](https://en.wikipedia.org/wiki/Idempotence), nasty bugs will pop up.

Using autocommand groups can solve this problem. Here are the basic commands you can use to manipulate these groups:

- `:augroup` - Output all autocommand groups.
- `:augroup <name>` or `aug <name>` - Call a new autocommand group named `<name>`. All autocommands created after this command will be part of the group.
- `:augroup! <name>` or `aug! <name>` - Delete the group named `<name>`.
- `:augroup END` - End the autocommand group. If you define an autocommand after this one, it won’t be part of the group.

As always, here’s an example:

```vim
:augroup messages
:autocmd BufWrite * echom "Write..."
:augroup END
```

The autocmd is now part of the autocommand group `messages`.

By itself, it doesn’t solve our problem. If you add the three lines above in your vimrc and source multiple times, the autocommand in the group `messages` will be added to the autocommand list each time.

We saw above that you can delete autocommands with the command `au! <event>`. This will work if the autocommand is not in a named group. If you run `au! BufWrite` for example, it will delete every autocommand in the nameless autocommand group (the default one), but not the one in the group `messages` we’ve created above.

To solve our problem, we could delete every autocommand belonging to the group `messages` after creating the group itself:

```vim
:augroup messages
:au! messages
:autocmd BufWrite * echom "Write..."
:augroup END
```

If these lines are in your vimrc and you source it three times, every autocommand will be deleted from the group `messages` each time, before being added again. In short, our problem is solved: the command `echom "Write..."` will always appear once and only once in our list of command.

When we use `au!` between the initialization of the group (`augroup messages`) and the end of the initialization (`augroup END`), we don’t have to indicate the name of the group. Vim will understand, in that case, that we want to delete every autocommand of the group declared just before. In short, the following commands are equivalent to the ones above:

```vim
:augroup messages
:au!
:autocmd BufWrite * echom "Write..."
:augroup END
```

Redeclaring an autocommand group won’t recreate it, but it will add autocommands in the existing group instead. For example, you can do something like that:

```vim
augroup vimrc
au!
augroup END

augroup vimrc
    autocmd BufWrite * echom "Write..."
augroup END
```

Two things happen here:

1. A group `vimrc` is declared.
2. Autocommands are declared and added to the group `vimrc`.

In short, every autocommand added to the group `vimrc` is merged with the command `:au!`. You can even do better: when you create an autocommand, you can add it to an existing group directly. To do that, you can indicate the name of the group just between the command `autocmd` and the event name as follows:

```vim
augroup vimrc
au!
augroup END

autocmd vimrc BufWrite * echom "Write..."
```

You’re now able to reload your vimrc as much as you want, your autocommands will only appear once in the autocommand list. It applies for other sourced files too, like the ones you might have in your folder `ftplugin` for example.

### Ignoring Events

If you want to run a command without firing any event, you can use the command `:noautocmd`. To take our previous example, if you want to ignore the event `BufWrite` when running the command `:w`, you can run the following:

```
:noautocmd w
```

#### Vim help
- `:help autocmd`
- `:help autocommand-events`
- `:help autocmd-events-abc`

## Custom Functions

Writing custom functions for Vim to make your craziest dreams come true should be the goal of any Vim Follower out there.

It’s true that many functions are already available on the infinite Internet. You can simply copy and paste them without worrying how they work. That said, knowing the basics of Vimscript functions can allow you to adapt them to your needs.

### Checking Existing Functions

Let’s see first how you can display the functions already available:

- `:function` or `:fu` - List all declared function.
- `:function /<pattern>` or `:fu /<pattern>` - Filter all declared functions with the pattern `<pattern>`.

### Creating Or Copying Functions

Looking at a simple function will help us understand how they work. Here’s one:

```vim
function DeleteTrailingWS() abort
    normal mz
    %s/\v\s+$//ge
    normal `z
endfunc
```

This function delete trailing whitespaces in a whole buffer. Let’s look at it in more details:

- `function` - Keyword to declare a function. You can add a bang (`function!`) to overwrite a previously declared function with the same name.
- `DeleteTrailingWS` - Name of the function. It should always begin with an uppercase letter.
- `abort` - Stop the function when an error occurs.

Be careful if you use `function!` (with a bang): you might overwrite a function from one of your plugin. It can open the door to random bugs difficult to fix.

If you look at the body of our function, they are simply Vim commands. They are executed in order:

- `normal mz` - Save the cursor position using the mark `z`.
- `%s/\v\s+$//ge` - Delete every whitespace in the current buffer, using the substitute command.
    - `%` - Range for the whole buffer.
    - `\v` - Use the `v`ery magic mode.
    - `\s` - Represent any whitespace.
    - Flag `e` - Doesn’t output an error if the search pattern fail.
- ``` normal `` `z `` ``` - Go back to the mark `z` (the cursor position when the function was invoked).

I’ve already written about all these commands in [Vim for Advanced Users](https://thevaluable.dev/vim-advanced/). For more details about Vim regexes, see [Vim for Adept Users](https://thevaluable.dev/vim-adept/).

You can then call the function using the command `:call` as follows:

```vim
:call DeleteTrailingWS()
```

You can also create a new mapping for some of your function if you want to:

```vim
nnoremap <leader>ds :call DeleteTrailingWS()
```

### Autoloading Functions

You can create function in your vimrc directly as we did above, but it might create some problems. Imagine that the name of the function conflict with a function from one of your plugin: the bugs occuring can be difficult to debug.

Additionally, all the functions declared in your vimrc will be automatically loaded when you open Vim, even if you never use them. It would be more efficient to load them when you call them the first time.

It’s where the _autoload folder_ comes in handy. This folder is located in the Vim’s runtime paths.

When Vim needs to find something, it will look at the Vim’s runtime paths. The folder containing your vimrc is one of these paths, for example. To display all of them, you can run the command `:set runtimepath?`.

The folder autoload is one of these paths too. Any function created in this folder will have namespaces, and they will be loaded on demand. Exactly what we want!

You can create the autoload folder where your vimrc is. Then, you can create Vimscript files in there; the name of the file will be the namespace for your functions.

For example, you can create the file “general.vim” in the autoload folder. Then, you can write in the file the following function:

```vim
function general#DeleteTrailingWS() abort
    normal mz
    %s/\v\s+$//ge
    normal `z
endfunc
```

When you call the function with `:call general#DeleteTrailingWS()`, Vim will:

1. Look inside the autoload directory for a file called `general`.
2. Search for a function called `DeleteTrailingWS` inside this file.
3. Load and execute the function.

Additionally, you can easily display every function for the namespace `<namespace>` by running the command `:function /<namespace>`. For example, if you want to display all the functions for the namespace `general`, run `:function /general`.

For more fine-grained namespaces, you can add sub-directories in the autoload directory. For example, you can create the following:

```
autoload/my/super/namespace.vim
```

Then, you’ll need to add the namespace “my#super#namespace” to the functions you create in the file `namespace.vim`. For example:

```vim
function my#super#namespace#DeleteTrailingWS() abort
    normal mz
    %s/\v\s+$//ge
    normal `z
endfunc
```

#### Vim help
- `:help functions`
- `:help autoload-function`
- `:help call`
- `:help 'runtimepath'`

## User Commands

Now that we’re able to create our own functions, what about increasing our power with our own custom Vim commands? We’ll then be able to run these user commands using the COMMAND-LINE mode, like any other command.

### Basics

Like functions, custom user commands should always begin with an uppercase letter, to differentiate them from Vim’s built-in commands.

Continuing our ritual, here are three useful commands to manipulate user commands:

- `:command` or `:com` - Output all user commands.
- `:command <command>` or `:com <command>` - Output all user commands starting with `<command>`.
- `:command <attributes> <name> <cmd>` or `:com <attributes> <name> <cmd>` - Define a new user command with the name `<name>` running the command `<cmd>`. The attributes `<attributes>` indicate the number of arguments (among other things).

Similarly to custom functions, you can add a bang when you declare a command (`:command!`). In that case, if a command already exists with the same name, it will be overwritten.

### Attributes for User Commands

There are four different categories of attribute you can use when creating a user command:

- Argument handling
- Range handling
- Completion behavior
- Special cases

We’ll only cover the most important one in this article: the argument handling. It allows us to specify the number of argument a user command can take, with the attribute `-nargs`:

- `-nargs=0` - No argument allowed (default).
- `-nargs=1` - One argument is required.
- `-nargs=*` - Any number of arguments allowed.
- `-nargs=?` - 0 or 1 argument allowed.
- `-nargs=+` - One argument or more are required.

To indicate where the arguments should be inserted in the command, you need to use the placeholder `<args>`. For example, you can write the following in your vimrc:

```vim
function IScream(content)
   echom toupper(a:content)
endfunction

command -nargs=1 Scream call IScream(<args>)
```

As you can see, you can call the arguments of a function in its body using `a:<arg_name>`. To try your new user command, source your vimrc with `:source $MYVIMRC` and run the following:

```vim
:Scream "hello"
```

When a user command call a function which can take multiple arguments, you need to separate them with whitespaces and use the placeholder `<f-args>` instead of `<args>`.

If there is only one argument allowed, Vim will consider the whitespace as part of the argument itself.

Finally, if you need your user command to be only available in the current buffer, you can also add the attribute `-buffer`. It’s mandatory if you create user commands in your runtime folder `ftplugin`.

#### Vim help
- `:help user-commands`

## Special Strings for Vim Commands

Let’s now look at special strings you can use in COMMAND-LINE mode. These placeholders will be replaced under the hood with their representations. Here’s a list of the most useful ones:

- `%` - Relative path of the current file.
- `<cword>` - Word under the cursor.
- `<cWORD>` - WORD under the cursor.
- `<cfile>` - Filepath under the cursor.
- `<afile>` - File open in the buffer when executing autocommands.
- `<sfile>` - Filename of sourced file when used with command `:source`.

You can also use the following with `%`:

- `:p` - Output the absolute path instead of the relative one. Also expand the tilda `~` to the home directory.
- `:.` - Make the file path relative to the working directory.
- `:~` - Make the file path relative to the home directory (if possible).
- `:h` - Keep the `h`ead of the file path (remove the last element).
- `:t` - Keep the `t`ail of the file path (remove everything except the last element).
- `:r` - Keep the `r`oot of the file name (remove its extension).
- `:e` - Remove everything except the `e`xtension of the filename.
- `:s?pat?sub?` - Substitute the first occurrence of “pat” with “sub”.
- `:gs?pat?sub?` - Substitute all occurrences of “pat” with “sub”.

These special strings only work when a command expects a filename as argument; as a result, it makes this functionality quite limited. Fortunately, You can use the function `expand(<special_string>)` to expand these placeholders in any command.

For example, you can try to run the following:

```vim
:echom expand("%")
:echom expand("%:p")
:echom expand("<cword>")
```

Here’s a more useful example we already saw in the article [Vim for Advanced Users](https://thevaluable.dev/vim-advanced/):

```vim
nnoremap gX <silent> execute
            \ "!xdg-open" expand('%:p:h') . "/" . expand("<cfile>") " &"<cr>
```

You should now be able to understand this command:

- `<silent>` - The mapping won’t appear in the command line when used.
- `execute` - Execute a string as a Vim command.
- `expand('%:p:h')` - Output the head of the absolute path.
- `expand("<cfile>")` - Output the filepath under the cursor in the current buffer.

In short, this mapping will open the relative filepath under the cursor using the CLI `xdg-open`.

This command shouldn’t take more than one line, but the backslash `\` allows us to write it on two lines for a better readibility. Its fancy name is “line continuation symbol”.

If you’re used to write shell scripts, remember that the line continuation symbol is not at the end of the line, but at the beginning of the next one.

#### Vim help
- `:help cmdline-special`
- `:help line-continuation`

## A Complete Example

Let’s summarize most of what we saw in this article with a final example. We want to:

1. Create the user command `DevDocs`. This command will automatically open the website [https://devdocs.io/](https://devdocs.io/) and search the word under the cursor.
2. Map the command to `<leader>D` in NORMAL mode. This mapping will be available for python, ruby, JavaScript, go, html, and PHP filetypes.

Here’s a possible solution:

```vim
augroup vimrc
    autocmd!
augroup END

command! -nargs=? DevDocs call system('xdg-open https://devdocs.io/#q=<args>')

autocmd vimrc FileType python,ruby,javascript,go,html,php nnoremap <buffer><leader>D execute "DevDocs " . expand('<cword>')<CR>
```

1. We first declare an autocommand group `vimrc`.
2. We declare the user command `DevDocs`, accepting 0 or 1 argument.
3. We declare an autocommand linked to the event `FileType`. We indicate the filetypes which will trigger the autocommand.
4. We use the special argument `<buffer>` to make the mapping only available in the current buffer. Without that, the mapping would be available in every buffer regardless of the filetype.
5. The autocommand use `expand('<cword>')`, which is replaced by the word under the cursor.

The event `FileType` can be useful to assign precise mappings to a whole range of filetypes. We need, with this event, to give filetypes as autocommand patterns (like `python` or `ruby` for example). Remember that you can output the filetype of the current buffer with `:set filetype?`.

The binary `xdg-open` is only available for Linux-based systems. If you want the autocommand to work on macOS too, you can use the following:

```vim
command -nargs=? DevDocs call system('type open &>/dev/null && open https://devdocs.io/#q=<args> || xdg-open https://devdocs.io/#q=<args>')
```

The autocommand verifies if the binary `open` exists (for macOS) and, if it doesn’t, it uses `xdg-open`.

## Take Control of Your Vim Destiny

Creating your own functions, commands, and mapping for tedious operations will help you focus on more important tasks. Additionally, you’ll bring more efficient in your whole workflow. How great is that?

Let’s summarize what we saw in this article:

- You can use the command `:verbose` to output where an abbreviation, option, mapping, or user command, is defined.
- Special arguments are available for your mappings to extend its power.
- Operator pending map allow you to define motions for operators.
- The command `:execute` can execute a string as if it was a command.
- Autocommands can run a defined command when an event is triggered.
- You can use autocommand groups to organize your autocommand.
- Autocommand groups are mandatory if you don’t want to add multiple times the same command in the autocommand list. It can happen when a Vimscript file is loaded multiple time (like your vimrc).
- Custom functions can execute numerous Vim commands one after the other.
- It’s better to autoload custom functions to be able to use namespaces and for Vim to start quicker.
- User commands are commands you can personalize for your own needs.

A last tip: if you want the list of Vimscript functions you can use, split in different category (like “Variables” or “Date and Time”), you can look at `:help function-list`.