by [The Valuable Dev](https://thevaluable.dev/tmux-config-mouseless/)

![screenshot of insane productivity with tmux](https://thevaluable.dev/images/2019/tmux_boost/tmux-insane-productivity.jpg)

Do you want a powerful, flexible, and automated terminal experience?

Let me introduce you to tmux. It’s one of the most important tool for my [Mouseless Development Environment](https://thevaluable.dev/efficient-development-environment/). If you never heard about it, fear not! This article will explain the core ideas:

- What’s tmux and why you should care about it.
- How to configure tmux, step by step.
- What are the best tmux plugins out there.
- How to automate the creation of tmux sessions.

To get a maximum from this article, I advise you to open tmux while reading it, and try the many commands and tmux config we’ll discuss. You can also create your own cheatsheet with the commands we’ll see today. They’ll be easier to memorize if you write them, and you’ll have a personalized reference when your memory will fail you.

Enough rambling. Let’s go!

## What’s tmux?

### Installing tmux

Before using tmux, we need to install it. How surprising! If you use a Unix/Linux based system, you can find it via your usual package manager:

- Arch linux: `sudo pacman -S tmux`
- Ubuntu / Debian: `sudo apt-get install tmux`
- Fedora / CentOS: `sudo dnf install tmux`
- Mac OS: `brew install tmux`

### What’s tmux?

![Screenshot of tmux opened](https://thevaluable.dev/images/2019/tmux_boost/tmux-opened.jpg)

tmux in action

With tmux, you can create multiple _sessions_ which are totally independent from your terminal. That’s why it’s called a _terminal multiplexer_. If you already know GNU screen (another terminal multiplexer), tmux is similar but more powerful, and easier to config.

To understand the concept, let’s try to create a tmux session. Open a terminal and type `tmux`. A new session will be created and attached to a client, your terminal.

You can list every session currently running by typing `tmux list-sessions`. In that case, you would only have one session, with the sweet name “0”.

Now, let’s run this in your terminal:

```bash
while :; do echo 'This will never end, except if you hit CTRL+C'; sleep 1; done
```

You’ve just created an infinite loop! Now, close the terminal. Did the loop stopped? Not at all! It continues to run _in the background_, because the tmux session itself is still alive.

![Tmux is still alive!](https://thevaluable.dev/images/2019/tmux_boost/tmux-alive.jpg)

You don’t believe me? You’re right; you need to experiment by yourself.

1. Again, open a new terminal and type `tmux list-sessions`. You’ll see the `session_name` displayed before a colon (`:`). Normally, it’s `0`.
2. Reattach the session to your freshly opened terminal by typing `tmux attach-session <session name>`.

Your infinite loop is back, and you can see that it was still running in the background. Let’s really kill it this time, by pressing `CTRL+c`.

“That’s nice and all your zombie stories, but what’s the point?” could ask many readers. Well, let’s find out.

## Why Using tmux?

### Background Operations

As we saw above, you can detach a tmux `session` from a client (the terminal) and you can attach it back later. It means that you can run whatever you want in the background, even if you have no terminal open.

Let’s imagine that you need to run a very long script on your remote server. You could:

1. Connect to your remote server via SSH.
2. Launch tmux on the remote server.
3. Run a script which takes hours.
4. Close the SSH connection. The script will still run on the remote server, thanks to tmux!
5. Switch off your computer and go home.

### More Terminals! Everywhere!

With tmux, we can also create open multiple shell on a single screen. This is the functionality I use the most.

You might think: “Well, great, many terminal emulators can do the same, like terminator”.

That’s true, but tmux is more powerful and consume less resources. You can configure it easily and precisely, according to your specific needs.

It works very well with Vim too, which makes it almost mandatory if you want to build a coherent Mouseless Development Environment.

Speaking of which...

If you want to build a complete Mouseless Development Environment, [you might be interested by this book](https://themouseless.dev/).

### Protection Against Terminal Crashes

Since your tmux session is independent from your terminal, you don’t need to worry anymore if you close it or even if it crashes. You can always reattach your session afterward without any problem.

### Saving tmux Sessions

It’s possible to save tmux sessions in a file and reopen them later, even after switching off your computer.

### Remote Pair Programming

A tmux session can be attached to many clients (terminals), even via SSH. It means that you can do pair programming with another developer using tmux and Vim, by sharing the same session.

## How to use tmux?

### General Organization

So, how do we use tmux? Here’s an example of what kind of hierarchy you can create:

![tmux organizational diagram](https://thevaluable.dev/images/2019/tmux_boost/tmux-working-diagram.jpg)

When you launch tmux, it will create a _tmux server_, a session, a _window_, and a _pane_.

#### The tmux Server

The tmux server manage every single tmux session. If you kill it, you kill every session too. To do so, you can run the command `tmux kill-server`.

#### Sessions

We’ve seen what are tmux sessions above. You can detach them from a client (and let them run in the background), and attach them back.

#### Windows

A tmux window represent an entire screen. You can have multiple windows open in one session. These windows are represented by tabs in the tmux status bar, at the bottom. To switch from one window to another, you can use some keystrokes or even your mouse. More on that below.

#### Panes

You can split your windows in panes to have multiple shell on one screen. It’s really practical, I love it.

### tmux Workflow

#### tmux Keystrokes

It’s very easy to use tmux with the keyboard only: that’s why it’s part of my [Mouseless Development Environment](https://thevaluable.dev/efficient-development-environment/). However, tmux needs a way to separate its own shortcuts with the CLIs’s shortcuts running in the different panes.

Imagine, for example, that you have Vim running in tmux: the keystrokes you use in Vim should be different from the ones you use in tmux. If they overlap, you might trigger different behaviors in tmux and in Vim at the same time. It’s confusing, most of the time.

That’s why most of the keystrokes in tmux need to be hit _after_ hitting a prefix key. You can think about it as a namespace for your keystrokes. By default, this prefix key is `CTRL+b`.

We can try it: go back to a tmux session and press `CTRL+b`, then hit double quote `"`. Congratulations! You just opened a new pane. You can close it by simply typing exit (or hitting `CTRL+d`).

If you think that the keystrokes are awkward and difficult to remember, no worries: we’ll change them later.

In this article, I’ll represent the keystrokes which have to be hit after the prefix key as follows: `prefix key -> "`. In this example, it means that you need to hit the prefix key, then the double quote `"`.

#### The tmux Command Prompt

We can also execute special tmux commands via a command prompt. For example, you can:

1. Type the prefix key `ctrl+b`.
2. Type `:`.
3. Welcome to the command prompt! Now, type `split-window` to create a pane.

You can execute many commands in tmux via some keystrokes or via this command prompt.

![tmux command prompt](https://thevaluable.dev/images/2019/tmux_boost/tmux-command-prompt.jpg)

tmux prompt

### Managing tmux Sessions

Here are the most useful tmux commands to manage your `sessions`:

- `tmux list-sessions` - List tmux `sessions`
- `tmux new-session -s hello` - Create a new `session` named “hello”
- `tmux kill-session -t hello` - Kill the `session` named “hello”
- `tmux kill-server` - Kill the tmux server and, as a result, every `session`

If you use a tool to automate the creation of your sessions, like [tmuxp](https://tmuxp.git-pull.com/quickstart.html), you’ll barely need to use these commands. More on that later!

## Configuring tmux

Let’s now create our own configuration to make tmux keystrokes more user-friendly. This configuration is not the best-configuration-in-the-universe-and-beyond, but adding step by step what you need and playing with tmux at the same time will teach you how tmux works. Since you’ll understand the tmux config, you’ll be able to modify it easily afterward to your own preferences.

Let’s first create the configuration file `~/.tmux.conf`. It’s where all the tmux config will reside.

### Changing The Default Prefix Key

The default prefix key `CTRL+b` (`C-b` in tmux notation) is not very easy to type or to remember. I prefer using `CTRL+SPACE` (`C-space`). Because my Vim leader key is `SPACE`, I can remember it easily, and it’s easier to type. It’s always nice to try to stay consistent when choosing your keystrokes.

Let’s modify the prefix key by adding the following in our tmux.conf:

```tmux
unbind C-b
set -g prefix C-Space
```

Here, the `-g` flag means `g`lobal: the prefix key will be set for every tmux session, window, and pane. You could set the option only for a specific window for example, directly in the command prompt, by running `set -w prefix C-Space`. It can be useful if you want to try multiple prefix key on the fly.

### Reloading the tmux Config File

Each time you change your config file, you need to reload it to apply the changes. It’s a keystroke you’ll hit often while you’re configuring everything, so let’s set a keystroke to do it more easily:

```tmux
unbind r
bind r source-file ~/.tmux.conf \; display "Reloaded ~/.tmux.conf"
```

Here, on the second line, we have two commands combined into one:

1. We bind the key `r` to reload the config file.
2. We display a message when we hit `prefix -> r`.

Let’s now stop tmux by running the `exit` command. Then, let’s run tmux again: if you hit `prefix key -> r`, you’ll normally see the message `Reloaded ~/.tmux.conf` displayed at the bottom of your tmux session. Each time you want to apply the changes you’re making in your tmux.conf, you need to hit that keystroke.

### The tmux Mouse Mode

I never use the mouse with tmux personally, but you can if you want to. After enabling it, you can use it for:

- Selecting windows (via the tabs in the status line).
- Selecting, scrolling, and resizing panes.
- Copying text.

To enable it, you need to add to your file tmux.conf:

```tmux
set -g mouse on
```

Again, I encourage you to use your keyboard as much as possible. It’s quite tiring to switch between your keyboard and your mouse all the time. Not only for your wrists, but for your cognitive energy too.

### Splitting Panes

![Tmux with two panes](https://thevaluable.dev/images/2019/tmux_boost/tmux-two-panes.jpg)

A tmux window split in two panes

One of the most common operation we can do in tmux: splitting a window into multiple panes. Let’s add some useful keystrokes in our tmux config:

```tmux
# v and h are not bound by default, but we never know in the next versions...
unbind v
unbind h

unbind % # Split vertically
unbind '"' # Split horizontally

bind v split-window -h -c "#{pane_current_path}"
bind h split-window -v -c "#{pane_current_path}"
```

You might think that something is reversed here, between my keystroke `v` (for vertical) and the tmux flag `-h` (for horizontal). Well, [it’s complicated](https://github.com/tmux/tmux/issues/213).

The flag `-c` execute a shell command, and `#{pane_current_path}` make the current working directory of your new pane the same as the one you’ve just left.

### Resizing Panes

You can resize the panes with your mouse or by typing `prefix key -> ALT + ARROW KEY`.

### Navigating Panes

To navigate from pane to pane, you can use `prefix key -> ARROW KEY` by default. But, since I’m a Vim Believer™, I prefer using `hjkl`. If you’re like me, you can add the following to your tmux.conf file:

```tmux
bind -n C-h select-pane -L
bind -n C-j select-pane -D
bind -n C-k select-pane -U
bind -n C-l select-pane -R
```

The flag `-n` indicated that we don’t want to use the prefix key for these keystrokes.

Why using `hjkl`? As I explained in my article [Vim for beginners](https://thevaluable.dev/vim-for-beginnners/), it’s always better to keep your fingers on the [home row keys](https://en.wikipedia.org/wiki/Touch_typing), to easily access all the other keys in the blink of an eye. Using the arrow keys force you to move your hands, and it’s not what we want. If you manage to get used to `hjkl`, I bet that you’ll find this new way of navigating more comfortable and efficient.

### More History! MORE!

Being able to have thousands of lines of output history is something I love. To make this dream a reality, you can add the following to your tmux.conf file:

```tmux
set -g history-limit 100000
```

You can then search in your terminal output very easily, especially if you use the search plugins I describe below.

### Opening tmux Windows

![tmux with two windows](https://thevaluable.dev/images/2019/tmux_boost/tmux-two-windows.jpg)

a tmux session with two windows

We know how to split the current window, but we don’t know yet how to create new ones, and how to navigate between them. Let’s not wait longer, by adding these keystrokes to our tmux.conf file:

```tmux
unbind n  #DEFAULT KEY: Move to next window
unbind w  #DEFAULT KEY: change current window interactively

bind n command-prompt "rename-window '%%'"
bind w new-window -c "#{pane_current_path}"
```

The keystroke `prefix key -> w` will create a new window, and `prefix key -> n` will allow you to rename the current one.

Remember: a window is represented by a tab in the status line, at the bottom left of your tmux session. When you have more than one of them, you can select the one you want with `prefix key -> <number>`, `<number>` being the window’s number.

A little star in the window’s tab indicate what window is currently displayed in your terminal. If you think that it’s not really readable, no worries: we will also improve the status bar later.

You can also notice that the windows’ numbers begin by 0. However, I find it more practical to set the first window to 1 instead. To stay consistent, let’s do the same with the panes by adding to the tmux.conf file:

```tmux
set -g base-index 1
set-window-option -g pane-base-index 1
```

You might think it’s annoying to always hit `prefix key -> <number>` if you want to change window. I like to use `alt+k` to go to the next `window`, and `alt+j` to go to the previous one, without using the prefix key:

```tmux
bind -n M-j previous-window
bind -n M-k next-window
```

You can now go through all your windows at the speed of light, if not faster.

### The tmux Copy Mode

![tmux copy mode](https://thevaluable.dev/images/2019/tmux_boost/tmux-copy-mode.jpg)

tmux in copy mode

Let’s speak briefly about tmux modes. There are two of them:

- The default mode
- The copy mode

Till now, we only used use tmux’s default mode. You can think of it as the equivalent of the Insert Mode in Vim. It allows you to type whatever you want in the different panes.

When you are in copy mode, you have the possibility to navigate in your terminal, using Emacs or Vi key bindings. You know now my love toward Vim, that’s why I like to have the following in my tmux.conf file:

```tmux
set-window-option -g mode-keys vi
```

Now let’s try the copy mode! You can hit `prefix key -> [` to switch to it. Hitting `q` will bring you back to the default mode.

You can see that you’re in copy mode thanks to the two numbers on the top right corner of your pane. They represent the total number of lines which are below the visible output (the number on the left) and the ones which are above (the number on the right).

From there, you can use the vanilla Vim keystrokes to navigate your current terminal output. Again, I wrote about the basic Vim keystrokes in [this article](https://thevaluable.dev/vim-for-beginners/). You can use, for example:

- `Ctrl-u` - Scroll up.
- `Ctrl-d` - Scroll down.
- `/` - Search.

Unsurprisingly, you can use copy mode to copy some content. But if you tried to copy terminal outputs already from tmux with your mouse, you might be confused: it doesn’t really work.

Indeed, tmux by default doesn’t copy anything in your system clipboard, but in one of its _paste buffer_. But, for convenience, I prefer using the system clipboard each time I copy something from the terminal. Let’s configure that now:

```tmux
unbind -T copy-mode-vi Space; #Default for begin-selection
unbind -T copy-mode-vi Enter; #Default for copy-selection

bind -T copy-mode-vi v send-keys -X begin-selection
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xsel --clipboard"
```

To stay consistent with Vim’s default keybindings, we did the following:

1. We changed the keystroke to select text from `space` to `v`.
2. We changed the keystroke to copy text from `enter` to `y`.

Then, we pipe the content copied to `xsel`, to copy the selection to the X clipboard. If you prefer using `xclip`, you can replace the last line in your tmux.conf with this one:

```tmux
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -i -f -selection primary | xclip -i -selection clipboard"`
```

The CLIs `xsel` or `xclip` will work well on Linux systems using X. For mac, [you can apparently use pbcopy](https://thoughtbot.com/blog/tmux-copy-paste-on-os-x-a-better-future). If you use Wayland, [wl-keyboard](https://github.com/bugaevc/wl-clipboard) is the way to go.

If you don’t want to use the system clipboard directly, you can past what’s in the tmux paste buffer with the keystroke `prefix key -> ]`.

And voila! Now, copy and pasting in tmux will normally work like a charm. You can also copy your content using the mouse: select what you want and enter `y` without releasing the mouse button. If you release it, the selection will disappear before you have the chance to copy it.

### Integrate Your tmux With Vim

There are more changes we need in our tmux.conf file for tmux to work seemingly with Vim. First, if you use Neovim in tmux, you might experience a cursor problem: it might not change from block to pipe when you go from NORMAL Mode to INSERT Mode.

Adding this line in your configuration might help:

```tmux
set -g -a terminal-overrides ',*:Ss=\E[%p1%d q:Se=\E[2 q'
```

What about navigating between tmux panes and Vim windows seemingly, using the same keystrokes, the famous `CTRL+hjkl`? You can add these lines to your file tmux.config to do so:

```tmux
# Smart pane switching with awareness of Vim splits.
# See: https://github.com/christoomey/vim-tmux-navigator

is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind -n C-h if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
bind -n C-j if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
bind -n C-k if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
bind -n C-l if-shell "$is_vim" "send-keys C-l"  "select-pane -R"
bind -n C-\\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"
```

Now, you have a customized tmux config you can modify to fit your precise needs. You might think that it will take you forever to remember these keystrokes, but I believe they are quite logical overall. Additionally, if you have written your own cheatsheet, I bet you know most of them already.

### The Colors of tmux

![tmux with solarized theme](https://thevaluable.dev/images/2019/tmux_boost/tmux-solarized-theme.jpg)

the status bar looks finally better

Let’s face it without fear: the status bar of tmux is quite ugly. You can’t really see properly the `windows` displayed and it’s very… green. So boring! Thankfully, you can customize the status bar of tmux, like everything else.

Changing tmux’s colors can bring welcome clarity in the status bar. One popular theme you can try is `solarized`: you can copy past [this file](https://github.com/seebi/tmux-colors-solarized/blob/master/tmuxcolors-dark.conf) in your config.

You can also look at my own [custom design](https://github.com/Phantas0s/.dotfiles/blob/master/tmux/tmux.conf) if you need some inspiration.

## Enhancing tmux With Plugins

Even if we have now a powerful tool, we can improve tmux even more by adding some useful plugins.

### The tmux Plugins Manager

To manage our tmux plugins, we need the [tmux Plugin Manager](https://github.com/tmux-plugins/tpm). To install it, follow these steps:

1. Clone the project into your home directory: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
2. Add this line in your tmux.conf file: `set -g @plugin 'tmux-plugins/tpm'`
3. Add this **at the end** of your tmux.conf file: `run -b '~/.tmux/plugins/tpm/tpm'`

You can add any plugin you want in your config and install them by hitting `prefix key -> I` in tmux, after reloading the config, as always.

### A Better Search With copycat

As we saw, tmux copy mode allow you to search in the output of the current `pane`. But, if you want advanced search capabilities, you can try [tmux copycat](https://github.com/tmux-plugins/tmux-copycat). Here are some benefits:

- You can search using regex or plain strings.
- You have new keystrokes to select and copy more easily filepaths, git status output, urls, and IP addresses.
- Your search is automatically selected. You can copy it using yank (the `y` key we configured earlier) directly.

Like in Vim, you can use `n` and `N` to jump to the next or previous result, respectively. To install copycat, copy this line to your config:

```tmux
set -g @plugin 'tmux-plugins/tmux-copycat'`
```

Then, you need to reload your tmux config and hit `prefix key -> I`.

### Fuzzy Search With fzf And Extrakto

You’ll need [fzf](https://github.com/junegunn/fzf) installed to use this plugin. If you don’t have it already, I advise you to install it: it’s another powerful tool which will grandly enhance your terminal experience.

In order to install [extrakto](https://github.com/laktak/extrakto), add the following to your config file:

```tmux
set -g @plugin 'laktak/extrakto'
```

Then, as we saw already, reload your tmux.conf file, and hit `prefix key -> I` to install the new plugin.

You can now fuzzy search the output of your terminal using `prefix key -> tab`. Pressing `ENTER` will copy the search in your clipboard.

## Creating tmux Sessions Automatically

The power of tmux doesn’t stop here. There are many tools out there allowing you to automate the creation of tmux session. You can automate everything, from the number of windows and panes you want to the command lines you want to run in each pane. It’s really useful to have a session for each project you’re working on: you can automatically run all the docker containers you need, some Vim instances, some useful CLIs… the sky’s the limit!

The two most common tools to create sessions from YAML or JSON config files are [tmuxinator](https://github.com/tmuxinator/tmuxinator) and [tmuxp](https://tmuxp.git-pull.com/en/latest/).

Here’s a simple example of a tmuxp config file:

```tmux
session_name: dotfiles
start_directory: $HOME/.dotfiles

windows:
  - window_name: nvim dotfiles
    layout: tiled
    panes:
      - nvim +FZF
  - window_name: terms
    layout: tiled
    panes:
      - 
  - window_name: example
    layout: tiled
    panes:
      - shell_command:
          - ls
          - ls -lah
```

This configuration set up a session named `dotfiles` with 3 windows containing one pane each. In the first window, `nvim` will be launched. The second pane of the second window will stay empty. In the third window, two commands will run one after the other: `ls` and `ls -lah`.

You need to create every tmuxp config file in the directory `~/.tmuxp`. You can then load them using `tmuxp load <session_name>`. The configuration above is quite simple, but you can personalize your tmux sessions way more if you want to.

## Welcome to tmux’s World

Now that you’ve played around with tmux, you can use it to improve your workflow. Don’t hesitate to try new configurations or new plugins; experimenting is key, for you to find what fits the best.

What did we learn in this article?

- A tmux server manage all your tmux sessions. These sessions include windows and panes.
- You can configure tmux depending on your own workflow, needs and personality.
- Most of tmux keystrokes include the prefix key. It’s easier to remember, and it avoids conflicts with other CLI’s keystrokes.
- You can enhance tmux even further with useful plugins.

To dig more into tmux, I would definitely recommend you to look at the well written manual, by running `man tmux` in your shell.