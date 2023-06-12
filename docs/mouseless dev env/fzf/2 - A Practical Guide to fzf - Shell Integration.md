by [The Valuable Dev](https://thevaluable.dev/fzf-shell-integration/)

![](https://thevaluable.dev/images/2023/fzf-shell-integration/darth_vador_searching_skywalker.jpg)

This article is part of a series about fzf:

In the [previous article of this series](https://thevaluable.dev/practical-guide-fzf-example/), Davina (your colleague developer) explained how powerful fzf can be to create our own fuzzy search and, to an extent, our own TUIs.

Good news everyone: Davina is back! This time, her mission is to explain how to integrate fzf with the shell. This integration adds many new functionalities to your favorite shell, making it even more powerful.

You can use fzf’s shell integration if you use either Bash, [Zsh](https://thevaluable.dev/zsh-install-configure-mouseless/), or Fish. I’m not the biggest fan of Fish (it’s not POSIX compatible), so I will focus mostly on Bash and Zsh in this article.

More specifically, we’ll see:

- What keystrokes we can use to fuzzy search through files and directories.
- How to use a completion using fzf in the shell.
- How to customize keybindings and completions.
- How to launch fzf in tmux panes automatically.

I encourage you to try out the different configurations described in this article. To follow along, you can download the [companion project](https://github.com/Phantas0s/the_valuable_dev_companion/tree/main/guide-fzf) and run the different commands from there. Most of the screenshots are executed from this `guide-fzf` directory.

Keybinding and completion are possible thnaks to a couple of files which need to be sourced in your shell. I’m using Arch Linux (by the way), so for me these files are located in the directory `/usr/share/fzf/`. You can also find them in the [official repository of fzf](https://github.com/junegunn/fzf/tree/master/shell). The files with the extension `.bash` need to be sourced if you use Bash; the same for Zsh.

Here’s how I source them in my `zshrc`:

```bash
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
```

Depending on what OS you’re running and how you’ve installed fzf on your machine, these files might be in a different place. You can also copy them manually somewhere in your system and source them, too.

Let’s now dive in these files to see what secrets they hold!

## Keybinding with fzf

Let’s begin by the keybindings: what keystrokes can we hit in our shells to invoke the power of fzf?

### Keystrokes Available

If you open the file “key-bindings.bash”, you’ll see the different binding declared at the end of the file, using the commands `bind`.

Here’s the list of all keystrokes available:

|Keystroke|Description|
|---|---|
|`CTRL-t`|Fuzzy find all files and subdirectories of the working directory, and output the selection to STDOUT.|
|`ALT-c`|Fuzzy find all subdirectories of the working directory, and run the command “cd” with the output as argument.|
|`CTRL-r`|Fuzzy find through your shell history, and output the selection to STDOUT.|

My life would be grimmer without `CTRL-r`. I’m searching in my shell history all the time, to run similar commands I ran in the past. Here’s how it looks in my shell:

![Using fzf in the shell to search the history](https://thevaluable.dev/images/2023/fzf-shell-integration/fzf-search-history.jpg)

The keystroke `CTRL-t` is also very useful if you want to quickly edit a file. I just have to type `vim` in my terminal followed by `CTRL-t` to search the file I want to edit.

![Using fzf in the shell to search the files and directories](https://thevaluable.dev/images/2023/fzf-shell-integration/fzf-search-files-dirs.jpg)

Finally, `ALT-c` is useful if you want to search for and move into a subdirectory.

![Using fzf in the shell to search the files](https://thevaluable.dev/images/2023/fzf-shell-integration/fzf-search-dirs.jpg)

This is great, but what I’d like to do now is to configure all of these keystrokes according to my own specific needs.

### Customizing fzf Keybindings

If you look a bit closer at the completion file, you’ll find three functions called by our three keystrokes:

|Keystroke|Bash function|Zsh function|
|---|---|---|
|`CTRL-t`|`__fzf_select__`|`__fsel`|
|`CTRL-r`|`__fzf_history__`|`fzf-history-widget`|
|`ALT-c`|`__fzf_cd__`|`fzf-cd-widget`|

The body of these functions will give you the commands executed each time you hit one of the keystrokes. For example, here’s the command running when you hit `CTRL-t`:

```bash
cmd="${FZF_CTRL_T_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
-o -type f -print \
-o -type d -print \
-o -type l -print 2> /dev/null | cut -b3-"}"
```

Here, the command `find` is used with many different expressions to filter the result of the search. If you want to know more about find, I’ve [written an article about it here](https://themouseless.dev/posts/find-guide-example-mouseless/).

We can also see that the command itself can be overwritten with the value of the environment variable `FZF_CTRL_T_COMMAND`. There are more environment variables available to overwrite commands; you can find them at the beginning of the completion file. Here’s the list:

|Environment variable|Keystroke|
|---|---|
|`FZF_CTRL_T_COMMAND`|`CTRL-t`|
|`FZF_ALT_C_COMMAND`|`ALT-c`|

We can’t change the default command for `CTRL-r`, to search through the shell history. It’s because there are some scripts involved here; an AWK script for Zsh, a Perl script for Bash.

Looking at the beginning of the “keystroke” file, you’ll see other environment variables allowing us to set fzf’s default options depending on the keystroke we use:

|Environment variables|Keystroke|
|---|---|
|`FZF_CTRL_T_OPTS`|`CTRL-t`|
|`FZF_CTRL_R_OPTS`|`CTRL-r`|
|`FZF_ALT_C_OPTS`|`ALT-c`|

Here’s an example:

```bash
export FZF_CTRL_T_OPTS="--height 60% \
--border sharp \
--layout reverse \
--prompt '∷ ' \
--pointer ▶ \
--marker ⇒"
```

If you run the above in your shell, these options will be given to fzf each time you hit `CTRL-t`.

What about changing the keystrokes themselves? If you look at the end of the file “key-bindings.bash”, you’ll see their definitions. For example:

```bash
bind -m emacs-standard '"\ec": " \C-b\C-k \C-u`__fzf_cd__`\e\C-e\er\C-m\C-y\C-h\e \C-y\ey\C-x\C-x\C-d"'
bind -m vi-command '"\ec": "\C-z\ec\C-z"'
bind -m vi-insert '"\ec": "\C-z\ec\C-z"'
```

The keystroke itself is `\ec` here, meaning `ALT-c`. Let’s say that we don’t like to use `ALT-c`, but instead we’d like to use `CTRL-e`. First, we need to find in the file `key-bindings.bash` the good keystroke:

```bash
bind -m emacs-standard '"\ec": " \C-b\C-k \C-u`__fzf_cd__`\e\C-e\er\C-m\C-y\C-h\e \C-y\ey\C-x\C-x\C-d"'
```

Next, we need to add the following to our bashrc:

```bash
bind -m emacs-standard '"\C-e": " \C-b\C-k \C-u`__fzf_cd__`\e\C-e\er\C-m\C-y\C-h\e \C-y\ey\C-x\C-x\C-d"'
```

Here, we create a new keystroke using `CTRL-e` (represented by `\C-e`), which will do the same as `ALT-c`.

For Zsh, if you look into the file “key-bindings.zsh”, you’ll see the different keybindings set in the different functions themselves. The idea stays the same; first, we need to find the different keystrokes we want to change:

```bash
zle     -N             fzf-cd-widget
bindkey -M emacs '\ec' fzf-cd-widget
bindkey -M vicmd '\ec' fzf-cd-widget
bindkey -M viins '\ec' fzf-cd-widget
```

Then, we can add the following to our zshrc:

```bash
zle     -N            fzf-cd-widget
bindkey -M emacs '\C-e' fzf-cd-widget
bindkey -M vicmd '\C-e' fzf-cd-widget
bindkey -M viins '\C-e' fzf-cd-widget
```

It’s also possible to unbind `ALT-c` if you want to. I’ve already written an [article about Zsh and keybindings](https://thevaluable.dev/zsh-line-editor-configuration-mouseless/) if you want to know more about that. For now, here’s how to unbind the default keystroke `ALT-c`:

```bash
bindkey -rM emacs '\ec'
bindkey -rM vicmd '\ec'
bindkey -rM viins '\ec'
```

## Completion Using fzf

Having some keystrokes to fire fzf and search through your files, directories, or history is really useful, but it’s only half the functionalities fzf gives us to make the shell even more powerful. The other half is about completion.

### Command and Trigger

Let’s type the following in our shell, followed by the `TAB` key:

```bash
vim **
```

![We can trigger fzf's completion with two stars followed by hitting tab](https://thevaluable.dev/images/2023/fzf-shell-integration/fzf-completion-vim.jpg)

You can then select the files and directories you want (multi-selection is enabled here), and Vim will open them all.

There are two important elements in the command above: `vim` (the command itself), and `**`, which fzf recognizes as a trigger for completion. Said differently, if you don’t write `**`, hitting `TAB` won’t trigger fzf.

The completion will be different depending on the command. For example, we just saw that triggering the completion with Vim will give you files and directories (the default behavior for most commands). But if you try to complete “cd” for example, you’ll get only directories:

```bash
cd **
```

Here’s the result:

![The completion for cd will only display directories](https://thevaluable.dev/images/2023/fzf-shell-integration/fzf-completion-cd.jpg)

Whatever is put before the trigger will be used as query for fzf. For example:

```bash
cd mouseless-book-behind-scene**
```

The result:

![It's possible to add a query before the completion trigger](https://thevaluable.dev/images/2023/fzf-shell-integration/fzf-completion-cd-query.jpg)

You’ll notice that you can’t have multiple selections here; after all, “cd” needs only one argument.

When you think about it, most commands get some paths (files or directories) as arguments; as a result, fzf’s give you paths by default for the completion. As we just saw, other commands will only give you directories. Here’s the complete list of these commands:

- `cd`
- `pushd`
- `rmdir`

If you look in the file “completion.bash”, you can search for the two variables `a_cmds` and `d_cmds`. The first is used for completing paths, the second to only complete directories. For Zsh it’s the same, except that everything which is not part of the value of the variable `d_cmds` will be completed with paths.

Of course, there are commands expecting other arguments than file or directory paths. Some of them are supported out of the box; here’s the complete list:

|Command|Completion|
|---|---|
|`export`|Environment variables|
|`unset`|Environment variables|
|`unalias`|Aliases (use the command `alias` under the hood).|
|`ssh`|Hosts (grep entries from `~/.ssh/config`, `~/.ssh/config.d/*` , and `/etc/ssh/ssh_config`).|
|`telnet`|Hosts (grep entries from `/etc/hosts`).|
|`kill`|Processes (use the command `ps -ef` under the hood).|

Looking at the completion files, how do we know what command triggers what completion? The name of the functions can help here; for example, `_fzf_complete_export` will trigger the completion after the command `export`, at least for Zsh. For Bash, the functions are called differently, referencing what they complete instead of what command they complete; for example `_fzf_var_completion()` complete environment variables.

### Customizing the Completion

If you look at one of the completion files, you’ll see again at the very top of the file all the environment variables you can use to customize the completion.

```bash
# - $FZF_TMUX               (default: 0)
# - $FZF_TMUX_OPTS          (default: '-d 40%')
# - $FZF_COMPLETION_TRIGGER (default: '**')
# - $FZF_COMPLETION_OPTS    (default: empty)
```

There’s one environment variable missing, however: `$FZF_COMPLETION_DIR_COMMANDS`. It allows us to specify the commands which should only be completed with directories. For example:

```bash
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree"
```

Here, I’ve added back the three commands which should have directory paths as completion (`cd`, `pushd`, and `rmdir`), and I’ve added `tree`. Next, if we try to complete `tree **`, we’ll get the following:

![We can assign new commands to fzf directory-only completion](https://thevaluable.dev/images/2023/fzf-shell-integration/fzf-completion-tree.jpg)

Here are the two other interesting environment variables referenced at the beginning of the file (let’s forget about the tmux related ones for now):

```bash
$FZF_COMPLETION_TRIGGER (default: '**')
$FZF_COMPLETION_OPTS    (default: empty)
```

It’s self-explanatory enough: the first one allow us to change the completion trigger, and the second one can let us add some options to fzf each time we trigger the completion.

What about changing the different commands used for the completion themselves? You can create two functions to do so:

- `_fzf_compgen_path`
- `_fzf_compgen_dir`

Here are the default commands:

```bash
_fzf_compgen_path() {
find -L "$1" \
      -name .git -prune -o -name .hg -prune -o -name .svn -prune -o \( -type d -o -type f -o -type l \) \
      -a -not -path "$1" -print 2> /dev/null | sed 's@^\./@@'
}

_fzf_compgen_dir() {
    find -L "$1" \
      -name .git -prune -o -name .hg -prune -o -name .svn -prune -o -type d \
      -a -not -path "$1" -print 2> /dev/null | sed 's@^\./@@'
}
```

Instead of using `find`, we could use [ripgrep](https://github.com/BurntSushi/ripgrep) or [fd](https://github.com/sharkdp/fd) for example:

```bash
_fzf_compgen_path() {
    rg --files --glob "!.git" . "$1"
}

_fzf_compgen_dir() {
   fd --type d --hidden --follow --exclude ".git" . "$1"
}
```

We change here the default completion “path” to only complete files, and not files _and_ directories.

## Managing your Own Completion

The first way to create our own custom completion is to simply create a new function named `_fzf_complete_<cmd_name>`. For example, to create a completion for the “git” command:

```bash
_fzf_complete_git() {
  _fzf_complete -- "$@" < <(
    echo log
    echo diff
  )
}
```

With this, you can run `git **`, and you’ll have the choice between `log` or `diff` for the completion. That’s a naive approach however, because you need to add here all the completions possible. Here’s a more useful function:

```bash
_fzf_complete_git() {
  _fzf_complete -- "$@" < <(
    git --help -a | grep -E '^\s+' | awk '{print $1}'
  )
}
```

This will allow you to complete all git subcommands using fzf!

There is another interesting function allowing us to give any command for completing any CLI out there: the “comprun” function. For example, if we want to run a specific command to complete the CLI “tree”, we can run the following:

```bash
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    tree)         find . -type d | fzf --preview 'tree -C {}' "$@";;
    *)            fzf "$@" ;;
  esac
}
```

Then, if you try to complete `tree **`, it will run the corresponding commands (the `find . -type d` command). The `$@` at the end pass all the arguments given to fzf. The result:

![We can customize fzf's completion with the comprun function](https://thevaluable.dev/images/2023/fzf-shell-integration/fzf-completion-comprun-tree.jpg)

## fzf and tmux

If you’re using [tmux](https://thevaluable.dev/tmux-config-mouseless/) already, you can force fzf to open in a new pane of your tmux session. To do so, you need to use a script wrapping fzf, called `fzt-tmux`. Of course, you already need to be in a tmux session for the following to work:

```bash
fzf-tmux --height 50%
```

![fzf can run in a tmux pane](https://thevaluable.dev/images/2023/fzf-shell-integration/fzf-completion-tmux-pane.jpg)

Do you remember the environment variables at the beginning of the completion files? Two of them are directly about tmux:

|Environment variable|Description|Default when empty|
|---|---|---|
|`FZF_TMUX`|If set to 1, fzf’s will open in a new tmux pane when using a keystroke or the completion.|`0`|
|`FZF_TMUX_OPTS`|Gives default options to fzf; automatically use a new pane for keystrokes or the completion if the value of the variable is not empty.|`-d 40%`|

Said differently, if you already give a value to `FZF_TMUX_OPTS`, there is no need to set `FZF_TMUX` to `1`; keybindings and completion will always open in a new tmux pane in that case.

There’s even a short man page you can read: `man fzf-tmux`. The most noticeable option is `-p`, to open fzf in a tmux floating pane. You can try it by yourself easily:

```bash
fzf-tmux -p
```

![fzf can run in a floating tmux pane](https://thevaluable.dev/images/2023/fzf-shell-integration/fzf-completion-tmux-floating-pane.jpg)

How fancy!

## More Power to the Shell

You can now configure and customize fzf following your craziest wishes. You can adapt it to match your workflow in the holy shell!

What did we see in this article?

- We can use multiple keystrokes in our shell to launch fzf: `CTRL-t`, `CTRL-r`, and `ALT-c`. We can customize the options given to fzf, as well as the commands used to populate fzf’s list.
- We can also complete some shell commands using fzf, by default triggered with `**` (followed by `TAB`). Really handy to find files or directory quickly, or anything else you want!
- We have different ways to create our own completion: using the “comprun” function, or by defining our own custom functions.
- We can also open fzf inside a tmux pane automatically (even a floating one), when using keybindings or completion, using the wrapper script `fzf-tmux`.

The shell is already a powerful environment, and fzf makes it even more useful. It has been a huge game changer for my own workflow throughout the years.

Don’t hesitate to share in the comments your favorite hacks for fzf to behave exactly as you want it to.