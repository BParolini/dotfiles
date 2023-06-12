by [The Valuable Dev](https://thevaluable.dev/i3-config-mouseless/)

![It's more comfortable without mouse](https://thevaluable.dev/images/2020/i3_windows_manager/mouseless.jpg)

You thought that having icons everywhere on your desktop with a beautiful start menu was the better and only way to interact with your computer?

Many Linux distributions, and many Operating Systems (OS) in general, like Windows or macOS, have their own desktop environment. It’s basically a set of icons, windows, toolbars, widgets, wallpaper and other functionalities which give to the users “easy” ways to do what they want.

These desktops are meant to be used by everybody. But everybody has different needs when using a computer ; a developer won’t have the same needs as a designer.

If you use the terminal pretty often (and you should), a desktop environment might be useless for you, even if you don’t realize it. Thanks to the terminal, a developer have already access to a powerful tool to get things done, without the need of a full blown desktop.

Today, I’ll show you an alternative: the i3 windows manager (i3wm). It will give you a great flexibility and a increased control on your system, without even using the mouse!

“But I love my mouse!” you might think, while sadness feels your heart. Trust me, if your fingers don’t have to leave your keyboard, your happiness will go through the roof. You just need to experiment to see if it works for you, and i3 is perfect for that. It became an essential tool for me when I began to build my Mouseless Development Environment.

In this article, we will:

- Learn how to install i3.
- Learn why using i3 can be very efficient.
- Learn how work i3.
- Write a scalable i3 config.

Are you ready to see an alternative reality to the desktop environment world? Follow me, then!

## Installing i3

First things first: i3 is only available for Linux. Sorry, fellow Mac users.

If you already have a Linux distribution installed and you want to try i3, you might be able to do it on top of your actual desktop. Depending on your distribution, it will be more or less easy.

Using [Lubuntu](https://lubuntu.net/) with i3, for example, is pretty straightforward: the option to log in with i3 will be given automatically after install. If you use another distribution, you might have to do some minor configuration.

You can also use virtual machines to install Linux and try i3 on top of Windows, macOS or whatever else you have. The free [Virtualbox](https://www.virtualbox.org/) is the best option if you want to take this path. Tested and approved!

To install i3 itself, simply use your package manager. For example:

- Debian / Ubuntu / Lubuntu: `sudo apt-get install i3`
- Arch Linux: `sudo pacman -S i3`

After installing and launching i3, a popup will ask you if you would like to create a config file automatically. Answer with a big “yes”. We will directly modify this config below.

The talkative i3 might ask you if `mod4` is the modifier you want. Again, answer “yes”. We will come back to this modifier later.

## Why Using i3?

### Light But Powerful

The first advantage using a Windows Manager (WM) instead of a full desktop environment is its lightness. i3 doesn’t use much resource, which let you spare memory and CPU for everything else. In short, it doesn’t get in your way.

My experience show me that we never have enough resource, especially if you’re used to run 23098832 docker containers at the same time. Many desktop environment (Unity?) are very heavy and buggy nowadays.

The simplicity of i3 will procure to your mind the peace it deserves to focus on more important problems. You know, your code for example.

### Minimalist

A desktop environment has many functionalities we don’t necessarily use. The funny thing is: I didn’t know it was a problem before trying something as light as i3.

My experience with i3 is very similar to my experience with Vim: IDE and desktop environments come with a full package of software and options you didn’t choose by yourself. In the contrary, Vim, tmux or i3 come with a pretty blank state you need to personalize.

Instead of trying to shut off cumbersome functionalities (which is not always possible), you just add the functionalities you truly need.

A Windows Manager like i3 showed me that a status bar and an application launcher are enough. Thankfully, i3 comes with both.

### Flexible

Another annoyance with regular desktop environments: the positioning of the windows, especially when you open a new window.

It always felt random to me, which means that you always need to position your windows manually after opening them with the sacrosanct mouse. We’re all used to do this, of course; it doesn’t mean that there are no better, more efficient and comfortable ways to manage windows.

The great i3 will always position windows following a specific layout. No surprise, windows positioning become highly consistent.

Even better, you can change this layout easily with specific keystrokes. It might look constraining at first glance, but at the end it makes the system way simpler than traditional desktop environments. It’s faster, too.

This is one of the greatest strength of i3. Stop spending your time moving windows and get important things done!

Finally, as many tools I use on a daily basis, you can configure easily i3 to answer your own personal needs. As stated above, you can change any keystroke you want, launch specific application at startup, always launch specific applications on specific virtual desktop (called _workspaces_) and configure everything you need.

This article will show a possible config for i3 while explaining each step, for you to be able to personalize it afterward.

### The Mouse Is Not Your Best Friend

Long time readers of The Valuable Dev won’t be surprised to see that i3 can be entirely used without a mouse. Having your hand constantly on your keyboard is a comfort you can’t give away after tasting it for enough time.

To be honest with you, this is one of the most profound discovery I made regarding my programming workflow for the last decade.

With i3, it’s quick to launch applications, move windows through workspaces, resizing them, and do many other actions using a couple of keystrokes.

## How To Use i3?

### Writing Your Own Cheatsheet

Writing i3’s keystrokes somewhere as you learn and modify them is helpful. Not only for i3, but for any application using keystrokes extensively such as [Vim](https://thevaluable.dev/vim-for-beginnners/) or [tmux](https://thevaluable.dev/tmux-boost-productivity-terminal/).

In order to do so, I personally use [Joplin](https://joplinapp.org/), a free, open source, and powerful note taking application, similar to evernote, to write every keystroke I need. It serves as my reference when I forget what keystroke do what action.

### General Organisation

Like tmux, i3 store its information in a tree data structure. Let’s see what each node can represent.

![Final i3 config](https://thevaluable.dev/images/2020/i3_windows_manager/i3-tree-structure.jpg)

#### Workspaces

At the top of the tree data structure, you’ll find the workspaces. It’s simply the equivalent of a [virtual desktop](https://en.wikipedia.org/wiki/Virtual_desktop). You can have as many workspaces as you want.

Creating a workspaces is simple: you just need to switch to a new one and add _containers_ to make it persistent.

#### Containers

A container contains one or multiple windows. Its windows will be positioned depending on the container’s layout.

There are three different layouts possible:

- **Split** - Each window share the container space and are split horizontally (_splith_) or vertically (_splitv_). This is the default layout.
- **Stacked** - The focused window is visible and the other ones are stacked behind. You can change the window’s focus via keystrokes easily. You have access to the list of windows open too, at the top of the container itself.
- **Tabbed** - This layout is similar as the stacked layout, except that the windows’ list is vertically split, and not horizontally.

A container can contain other containers but, in practice, you won’t often think about containers but more about windows.

#### Windows

A window, where an application is running, can be created in a container. It will automatically position itself and be in focus, depending on the container’s layout. You can move them around or even change the layout of the container using keystrokes.

There are two different sorts of windows: _fixed windows_ (by default) and _floating windows_. You can precise which application should use a floating window. In that case, the window will act like any other window in any other desktop environment: you can focus on them and move them with your mouse.

Note that a floating window is not affected by a container’s layout.

Floating windows are useful for applications which don’t need a fullscreen window, like pop ups or color grabbers, for example.

### The Default Shortcuts

Like tmux or Vim, i3 use a special key for (almost) every keystroke. This key is called a `modifier`. By default, it’s the windows or _cmd_ key. On most keyboard, it has a Windows sign on it.

You can change this modifier in the config. Personally, I like to use the windows key.

In this article, the modifier key will be designed as `$mod` for every keystroke using it.

Enough mumbling, let’s practice. I strongly advise you now to have i3 open to follow along with me, and to try the modifications we do by yourself.

Let’s create a new terminal by typing `$mod+ENTER`. You know what? Let’s create another one! Hit `$mod+ENTER` again. As you can see, the default layout of your container will automatically fit the two windows running two terminals on your workspaces.

Now, try to focus on the second windows by using `$mod+ARROW KEY`. Simple, isn’t it?

You can now move the windows around and see how they resize themselves automatically: hit `$mod+SHIFT+arrow key`.

You might think at that point that this system is totally dumb. Don’t lie! I was pretty disappointed the first time I tried it, since I was very much used to move my windows around with my mouse. Now, it’s difficult for me to use something else than a window manager like i3!

Let’s try to change the layout of your container. You can use:

- `$mod+e` - Switch to _split_ layout (splith or splitv depending on your screen)
- `$mod+s` - Switch to _stacked_ layout
- `$mod+w` - Switch to _tabbed_ layout

You can try to create and move windows using each layout to see the differences.

Finally, let’s see other useful keystrokes which will be essential to write and try our new i3 config:

- `$mod+SHIFT+c` - Reload i3’s configuration. You need to use it each time you modify your configuration file, to apply the changes to the current i3 session.
- `$mod+SHIFT+r` - Restart i3 in case of bugs or weird state.
- `$mod+SHIFT+e` - Logout and quit i3. We will modify that later.

## i3 Config

### Config Files

Different config files will be loaded by i3 in a precise order, overriding each other:

1. `~/.config/i3/config` (or `$XDG_CONFIG_HOME/i3/config` if set)
2. `~/.i3/config`
3. `/etc/xdg/i3/config` (or `$XDG_CONFIG_DIRS/i3/config` if set)
4. `/etc/i3/config`

If you choose to generate your config file when you run i3 for the first time, you’ll need to modify the file `~/.i3/config`.

### Default i3 Config

Let’s dive a bit more into i3’s config, for you to understand its possibilities. First, open your config file with whatever editor you want.

We’ll review in this subsection the beginning of the config file.

If you want a good and complete documentation of i3, [it’s just here](https://i3wm.org/docs/userguide.html). This article is a quick overview of i3 for you to understand why it can be useful for you. After that, the documentation should be your reference for everything else.

The first line of the config will define your modifier key (`$mod`), as I explained above. You can modify it if you like here.

You can see that you can define variable in i3’s config using the keyword `set` followed by the variable name (`$mod` here) and its value (`Mod4`). It’s very practical not to have to modify every single keystroke each time you change your modifier.

To see every possible value for i3’s modifier key, you can run in your terminal `xmodmap`.

Below in the file, you’ll see the line `bindsym $mod+Return exec i3-sensible-terminal`. `bindsym` allows you to bind a symbol to a command. Internally, a symbol is mapped to a keycode (a key on your keyboard). To see this mapping, you can run in your terminal `xmodmap -pke | less`.

Here, the symbol `Return` is used. If you prefer using directly a keycode instead of a symbol, you can use the command `bindcode` instead of `bindsym`.

This keystroke will execute (using the command `exec`) `i3-sensible-terminal`, a [wrapper script](https://build.i3wm.org/docs/i3-sensible-terminal.html) which will try to find and open an instance of your terminal.

Let’s continue our exploration. Below you’ll find the line `bindsym $mod+Shift+q kill`, which allows you to kill a window. Depending on the application running in that window, some operation might be done before closing. For example, Firefox will save the current session.

### Program Launcher

With i3, there is no start menu where you can find the applications installed on your system. Instead, you can launch your favorite software using a program launcher.

The line `bindsym $mod+d exec dmenu_run` define a keystroke to launch `dmenu`, a simple and powerful application to create menus. We will use it again below.

To launch the program launcher, simply hit `$mod+d`. You’ll see at the top of your screen a discrete bar appearing. From there, you can search an application and launch it by searching it and hitting `Enter`.

If you don’t like this way of launching software, you can add your own launcher or even a start menu if you want later.

### Focusing and Moving i3 Windows

You can focus or move the different windows in your current workspaces using `$mod+jkl;` or `$mod+SHIFT+jkl;`. However, since I use Vim pretty extensively, I like to use `hjkl` to move around. Don’t forget that many other CLI uses these keys too!

We will now modify i3 default config. Don’t forget to hit `$mod+SHIFT+c` to reload the config and apply the changes.

Let’s modify the binding for focusing windows as following:

```
# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right
```

Below in the file, you’ll find the keystrokes to move windows. You can also change them:

```
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right
```

That’s all! Now, you can use Vim keys to change focus or move your windows.

### Splitting i3 Containers

![Two windows in a container split horizontally](https://thevaluable.dev/images/2020/i3_windows_manager/i3-split-horizontally.jpg)

Two windows in a container split horizontally

Sometimes, you’ll want to open new windows on the side or below the windows already open. By default, to open a windows horizontally, we would need to hit `$mod+h`. However, we use this keystroke to focus windows.

Let reconfigure the splits as following:

```
# split in horizontal orientation
bindsym $mod+Ctrl+h split v

# split in vertical orientation
bindsym $mod+Ctrl+v split h
```

Note that changing orientation will create a new container. You can see its delimitation by changing its layout. I personally like to have only one container (it’s easier to manage). Therefore, I never use these keystrokes.

We can now continue to modify our config: let’s go into the workspaces section.

### Workspaces

#### Defining Workspaces

You can open and switch to workspaces with the same keystrokes. Here’s the default config you’ll normally find in your current config file:

```
# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# switch to workspace
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+0 workspace number $ws10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9
bindsym $mod+Shift+0 move container to workspace number $ws10
```

What does it mean?

- The first part defines the variables for each workspaces. You have 10 of them by default.
- The second part define keystrokes to switch to these workspaces.
- The third part define keystrokes to move windows to specific workspaces.

From there, you can configure your workspaces as you wish. Here’s my own config as an example:

```
set $terms "1: terms"
set $web "2: web"
set $db "3: db"
set $file_manager "4: files"
set $mail "5: mails"
set $documents "6: documents"
set $mindmap "7: mindmap"

# switch to workspace
bindsym $mod+1 workspace $terms
bindsym $mod+2 workspace $web
bindsym $mod+3 workspace $db
bindsym $mod+4 workspace $file_manager
bindsym $mod+5 workspace $mail
bindsym $mod+6 workspace $documents
bindsym $mod+7 workspace $mindmap
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $terms
bindsym $mod+Shift+2 move container to workspace $web
bindsym $mod+Shift+3 move container to workspace $db
bindsym $mod+Shift+4 move container to workspace $file_manager
bindsym $mod+Shift+5 move container to workspace $mail
bindsym $mod+Shift+6 move container to workspace $documents
bindsym $mod+Shift+7 move container to workspace $mindmap
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9
bindsym $mod+Shift+0 move container to workspace 10
```

If you have [Font Awesome](https://fontawesome.com/cheatsheet) installed, you can even add some fancy icons.

Another functionality I find practical: the possibility to come back to your last workspaces with the same keystroke. For example, if you are on the _workspace 1_ and you hit `$mod+2`, you’ll switch to _workspace 2_.

Then, if you hit `$mod+2` again, you’ll go back to your previous workspaces, _workspace 1_.

To enable this functionality, you need to add to your config:

```
workspace_auto_back_and_forth yes
```

#### Opening Applications in a Specific Workspace

You also have the possibility to always assign precise application to defined workspaces. Let’s say that you always want to open Firefox in the _workspace 2_, `$web`, from the example just above. You can add in your config:

```
assign [class="firefox" instance="Navigator"] → $web
```

You can assign the application using its class (its general identifier), its instance (an identifier which is specific to some windows), or both.

To get the `class` name and the `instance` name of a precise application’ window, you need to run the application itself, open a terminal and run the following:

```
xprop | grep WM_CLASS
```

Then, click on the window where the application is running. Something similar to the following line will appear in your terminal:

```
WM_CLASS(STRING) = "Navigator", "firefox"
```

The first element is always the `instance`, the second always the `class`. Be careful: the case matters.

### Resizing i3 Windows

If you continue to go through the config, you’ll find keystrokes for fullscreen and diverse ways to reload i3’s config.

Below, you’ll find keystrokes to resize windows. Let’s modify them, again to match the Vim key bindings _hjlk_.

```
bindsym h resize shrink width 10 px or 10 ppt
bindsym j resize grow height 10 px or 10 ppt
bindsym k resize shrink height 10 px or 10 ppt
bindsym l resize grow width 10 px or 10 ppt
```

You’ll notice that your first need to go in mode resize before being able to resize. It means that you first need to hit `$mod+r` (you’ll see the word _resize_ appearing at the bottom of the screen), then you can use `$mod+hjkl`.

We can also set `focus_follows_mouse` to `no`. Otherwise, each time you’ll hover on a windows, it will be automatically focused. Pretty annoying to me.

### Locking Screen

To lock your screen for your coworkers not sending embarrassing messages on Slack on your behalf, you’ll need the software `i3lock`. You can try to launch it to see if it’s installed; if it’s not, simply install it.

By default, the lock screen is a boring white screen which will destroy your eyes. If you don’t care, you can let it as it is.

Otherwise, you can configure it to display a wonderful wallpaper as follow:

```
set $i3lockwall i3lock -i /path/to/my-wonderful-image.png -t
```

It’s important to note that you can only use _png_ files with `i3lock`. No _jpeg_ supported!

My own wallpaper is a bit more complex. I use a script to take a screenshot of the current screen, automatically “pixelize” it, save it, and use it as a lock screen. With a lock screen that good, every coworker will pray your skills and your swag. Expect a big salary increase, too.

To run the script, you’ll need to install `imagemagick` and `scrot`. Here it is:

```
img=/tmp/i3lock.png

scrot -o $img
convert $img -scale 10% -scale 1000% $img

i3lock -u -i $img
```

Simply save this script somewhere (I like to have a `script` subdirectory in `~/.config/i3`) and create a new variable in the i3 config file:

```
set $i3lockwall sh ~/.config/i3/scripts/lock.sh
```

Finally, add a keystroke to lock your screen:

```
bindsym $mod+Ctrl+Shift+l exec --no-startup-id $i3lockwall
```

We’ll see that it’s possible to lock your screen using `dmenu` too. More on that below.

Last but certainly not least: to unlock your computer, type your user’s password and press _Enter_.

### Lock, Shutdown and Reboot Menu

Let’s find and delete the following line:

```
bindsym Mod1+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"
```

This allows you to log out of i3. However, we’ll now implement a better way to do so.

Let’s create a menu with `dmenu` to have a nice and discrete way to lock your screen, log out i3, suspend your computer, hibernate, reboot, shutdown everything, or conquering the world.

Simply add the following to your config:

```
# shutdown / restart / suspend...
set $mode_system System (l) lock, (e) logout, (s) suspend, (h) hibernate, (r) reboot, (CTRL+s) shutdown

mode "$mode_system" {
    bindsym l exec --no-startup-id $i3lockwall, mode "default"
    bindsym e exec --no-startup-id i3-msg exit, mode "default"
    bindsym s exec --no-startup-id $i3lockwall && systemctl suspend, mode "default"
    bindsym h exec --no-startup-id $i3lockwall && systemctl hibernate, mode "default"
    bindsym r exec --no-startup-id systemctl reboot, mode "default"
    bindsym Ctrl+s exec --no-startup-id systemctl poweroff -i, mode "default"

    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}

bindsym $mod+BackSpace mode "$mode_system"
```

Now, after reloading the config, if you hit `$mod+BackSpace`, you’ll see at the bottom of your screen a message which precise what you can do. You can hit `l`, `e`, `s`, `h`, `r` or `CTRL+s` depending on what you want to do.

If you want to just close the menu, hit _Escape_ or _Return_.

### Wallpaper

When you switch to a workspaces which doesn’t have any window yet, it’s nice to have a wonderful wallpaper. The easiest solution: using `feh`, a simple software which can display images.

First, You need to install it.

Then, you can add to your config:

```
exec --no-startup-id feh --no-fehbg --bg-fill '/path/to/favorite-picture.jpg'
```

Don’t use `~` if you want to point to your home directory. The variable `$HOME` will normally work.

### Floating windows

Some applications are easier to use with floating windows. In short, it’s a window you can move with your mouse.

For example, pop-up and task dialog should be floating. To do so, add these two lines in your config file:

```
# floating pop up automatically
for_window [window_role="pop-up"] floating enable
for_window [window_role="task_dialog"] floating enable
```

You can specify what application should be open with a floating window automatically, using the `class` and `instance` of the application, as explained above (see the workspaces section).

For example:

```
for_window [class="Keepassx"] floating enable
```

Thanks to this line, the application `Keepassx` will automatically be opened in a floating window.

### Colors and Style

You can configure colors and style for i3 directly in the config file. If you have your terminal colors defined in the Xresources file (typically `~/.Xresources`), you can reuse them directly with i3 if you use the `set_from_resource` directive.

For example, `set_from_resource $foreground foreground #C6C6C6` will define a variable `$foreground` which will use the `foreground` color defined in `Xresources` or, if it’s not defined, the fallback color `#C6C6C6`.

You can then use the variable `$foreground` everywhere you need it in the config. Here’s an example of my own:

```
# get color from XResource config - variable_name XResource fallback

# special
set_from_resource $foreground foreground #C6C6C6
set_from_resource $background background #1C1C1C
set_from_resource $cursorColor cursorColor #C6C6C6

# black
set_from_resource $black1 color0 #303030
set_from_resource $black2 color8 #444444
set $trueblack #000000

# red
set_from_resource $red1 color1 #d75f5f
set_from_resource $red2 color9 #d75f5f

# green
set_from_resource $green1 color2 #87AF87
set_from_resource $green2 color10 #87AF87

# yellow
set_from_resource $yellow1 color3 #ffd75f
set_from_resource $yellow2 color11 #ffd75f

# blue
set_from_resource $blue1 color4 #87afd7
set_from_resource $blue2 color12 #87afd7

# magenta
set_from_resource $cyan1 color5 #afafd7
set_from_resource $cyan2 color13 #afafd7

# cyan
set_from_resource $cyan1 color6 #afd7ff
set_from_resource $cyan2 color14 #afd7ff

# white
set_from_resource $white1 color7 #4E4E4E
set_from_resource $white2 color15 #ffffff
```

Instead of `set_from_resource`, you can of course define your own variables, such as `set $black #000000`.

### Config of the i3 Bar

You can configure the status bar at the bottom of the screen too of course, using a different config file. You’ll find below an example you can copy in a new file, for example `~/.config/i3/i3status.conf`. Feel free to modify it, of course.

You can customize the data displayed in the bar using shell scripts, too.

```
# i3status configuration file.
# see "man i3status" for documentation.

# It is important that this file is edited as UTF-8.
# The following line should contain a sharp s:
# ß
# If the above line is not correctly displayed, fix your editor first!

general {
    interval = 1
    colors = true
    color_good="#FFFFFF"
    color_degraded="#ffd75f"
    color_bad="#d75f5f"
}

order += "volume master"
order += "battery 0"
order += "disk /"
order += "disk /home"
order += "cpu_usage"
order += "load"
order += "tztime local"

tztime local {
        format = " %Y-%m-%d %H:%M:%S "
}

disk "/home" {
     format = " %avail "
}

disk "/" {
     format = " %avail "
}

cpu_usage {
    format = " %usage "
}

load {
    format = " %5min 5min "
}

volume master {
    format = " %volume "
    format_muted = " %volume "
    device = "default"
    mixer = "Master"
    mixer_idx = 0
}

battery 0 {
    format = "%status %percentage "
    format_down = " DOWN "
    status_chr = " CHARGING "
    status_bat = " BATTERY "
    status_unk = " UNKNOWN "
    #last_full_capacity = true
    status_full = " FULL "
    path = "/sys/class/power_supply/BAT%d/uevent"
}
```

To use this status bar, you need to specify the file path in i3 config file. Normally, the block `bar {` is already there, you just need to modify it according to your needs.

For example:

```
bar {
    status_command i3status --config ~/.i3/i3status.conf
    # Disable all tray icons
    tray_output none
    colors {
        background $black2
        statusline $white2
        separator $white2

        #                  border background text
        focused_workspace  $background $background $red1
        active_workspace   $black2 $black1 $white2
        inactive_workspace $black1 $black2 $foreground
        urgent_workspace   $red1 $red1 $white2
        binding_mode       $background $red2 $white2
    }
}
```

You can notice that we use the color variables defined above, to make the bar even prettier! Wonderful.

### Managing Your Screen

If you have two, three or 389 screens, you might notice that you have no way to configure them.

Installing ARandR can help you in that regard. You need to install it.

Then, let’s make its window floating:

```
for_window [class="Arandr"] floating enable
```

You can now run it (using your application launcher, remember?) and configure your screen orientation and placement as you wish.

This is nice and all, but this config is not persistent. Here’s a way to fix that:

1. Configure ARandR as you wish
2. Save the layout from ARandR. This will create a script similar to the following:

```
xrandr --output VGA-1 --off --output eDP-1 --primary --mode 1600x900 --pos 0x0 --rotate normal --output HDMI-2 --off --output HDMI-1 --off --output DP-2 --off --output DP-1 --off
```

I then use `dmenu` to create a menu to manage my different screen config. For example, you can add in the i3’s config:

```
set $mode_display Config monitor resolution - My first config (d) - My second config (t)

mode "$mode_display" {
    bindsym d exec --no-startup-id xrandr --output VGA-1 --off --output eDP-1 --primary --mode 1600x900 --pos 0x0 --rotate normal --output HDMI-2 --off --output HDMI-1 --off --output DP-2 --off --output DP-1 --off && ~/.fehbg, mode "default"
    bindsym t exec --no-startup-id xrandr --output eDP-1 --primary --mode 1600x900 --pos 0x809 --rotate normal --output VGA-1 --mode 1920x1080 --pos 2800x420 --rotate normal --output DP-1 --off --output HDMI-1 --mode 1920x1200 --pos 1600x0 --rotate left --output DP-2 --off --output HDMI-2 --off

    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}

bindsym $mod+x mode "$mode_display"
```

1. First, we set a variable `$mode_display` which will display the menu we want.
2. Then, we bind `d` and `t` to the content of the script created before.

With this method, you can create many screen conifg and switch from one to another easily.

![Final config of i3](https://thevaluable.dev/images/2020/i3_windows_manager/i3-config.jpg)

i3 final config

## Will You Stick With i3?

That’s all folks! With this first overview of i3, you should be able to do whatever you want without having a cumbersome desktop environment going in your way.

In this article, we learned:

- i3 is a very light and minimalist windows manager, yet powerful and flexible.
- What are workspaces, containers, fixed and floating windows.
- How to configure i3.
- How to configure the lock screen i3lock.
- How to create a shutdown menu.
- How to personalize the status bar.
- How to manage your screen config with ARandR.

There’s much more to discover about i3 and I invite you again to go through its very complete documentation.