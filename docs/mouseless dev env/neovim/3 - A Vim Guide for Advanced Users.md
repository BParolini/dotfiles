by [The Valuable Dev](https://thevaluable.dev/vim-advanced/)

![Vim for advanced users](https://thevaluable.dev/images/2021/02_vim_advanced/vim-advanced.jpg)

Welcome to the third part of this series aimed to help you unleash a power never seen on Earth using the Almighty Vim.

We’ll see together in this article:

- Some nice keystrokes beginning with `g`.
- What ranges are and how to use them.
- The quickfix list and the location lists.
- The marvelous substitute command.
- The crazy useful `:global` (or `:g`) command.
- What marks are and what you can do with them.
- How to increase and decrease numbers with a single keystroke.
- How to sort text with a nice command.

But before going into the juicy content of this article, I’ve some recommendations for you, dear reader:

1. Fire up your Vim and play around with the commands and keystrokes while reading. It’s the best way for you to remember everything which blew you away. You’ll then be able to be blown away whenever you like for the rest of your life.
2. Don’t use a cheatsheet; write your own as you read. It will allow you to come back easily to the commands you find the most useful for _your own needs_.

Enough rambling. Let’s begin!

## Useful “g” Keystrokes

Let’s begin gently with a mixed bag of keystrokes starting with `g`. There are many of these “g” commands in Vim, and we already saw some of them in the previous articles. Can you recall them?

You can use these keystrokes in NORMAL mode:

- `gf` - Edit the file located at the filepath under your cursor.
    - You can use `CTRL+W CTRL+F` to open the file in a new window.
    - It can open the URL under your cursor if you have the plugin `netrw`.
- `gx` - Open the file located at the filepath under your cursor.
    - It will use the default application used by your OS for this filetype.
    - It works with URLs too. It will open your favorite browser and load the website.
    - It only works if you have the plugin `netrw`.
- `gi` - Move to the last insertion you did and switch to INSERT mode.
    - Pretty useful if you stopped your editing to look at some other file.
    - It uses marks under the hood: more on that later in this article.
- `gv` - Start VISUAL mode and use the selection made during the last VISUAL mode.
- `gn` - Select the match of your last search:
    1. Move to the last searched match.
    2. Switch to VISUAL mode (if you weren’t in VISUAL mode already).
    3. Select the match.
    4. You can continue to hit `n` (or `gn`) to select the area between the current match and the next match.
- `gI` - Insert text at the beginning of the line, no matter what the first characters are.
    - The keystroke `I` insert text _just before the first non-blank characters_ of the line.
- `ga` - Print the `a`scii value of the character under the cursor in decimal, hexadecimal or octal.
- `gu` - Lowercase using a motion (for example, `guiw`).
- `gU` - Uppercase using a motion (for example, `gUiw`).

To try out `gf` and `gx`, you can write for example `https://www.google.com/` in Vim, place your cursor on it, and hit the keystrokes. Don’t forget the trailing slash in your URL.

You’ll soon discover an inconvenience with `gx`: when you use it on a filepath, Vim will hang till you close the file. That’s why I’ve created the following mapping you can add to your `.vimrc`:

```
nnoremap gX :silent :execute
            \ "!xdg-open" expand('%:p:h') . "/" . expand("<cfile>") " &"<cr>
```

It maps the keystroke `gX` to use `xdg-open` with a relative filepath under your cursor. It will open the file with your favorite application _in the background_. The program `xdg-open` will only work on Linux-based systems; for MacOS, try `open` instead.

Vim help

- `:help reference`
- `:help g`

## Ranges

Now that we’re done with the appetizers, let’s discover the first real dish of our Vim feast: the ranges. You can apply them to many commands, making them terribly powerful.

### Basics

In Vim’s help, every command accepting a range will have the string of characters `[range]` in front of them. Multiple line specifiers are possible, separated by commas `,`.

Here are the most interesting ranges you can use:

- `<number>` - Any number `<number>` in your range refers to a line number.
- `.` - Represent the current line (often the default range).
- `$` - Represent the last line of the current buffer.
- `%` - Represent the entire file (same as `1,$`).
- `*` - Use the last selection you’ve made during the last VISUAL mode.

For example, using the command `:d`:

- `:1,40d` - Delete line 1 to 40 included.
- `:2,$d` - Delete every line from the second one till the end of the file.
- `:.,$d` - Delete every line from the current one till the end of the file.
- `:%d` - Delete every line.

You can also do some arithmetic with ranges if you want. For example, let’s imagine your cursor is on the line 60: the range `.,.+10` will be equivalent to the range `60,70`.

### Visual Mode and Range

If you switch to COMMAND-LINE mode after doing some selection in VISUAL mode, you’ll see these two symbols appearing: `'<` and `'>` with a comma `,` in between. This is a range too!

The symbols `'<` represents the first line you’ve selected and `'>` the last line. Each of these are marks; again, we’ll see more about marks below.

In practice, the ranges `'<,'>` and `*` are synonym, but you’ll have more flexibility with the first. For example, you can execute a command from the first line you’ve selected till the end of the file with the range `'<,$`.

#### Vim help
- `:help [range]`
- `:help v_:`
- `:help '<`
- `:help '>`

## Vim’s Quickfix And Location List

Now, let’s talk about a very useful data structure available in Vim, the quickfix list.

Don’t confuse the quickfix list and the quickfix window: these are two different entities. The first is a data structure, the second can display this data structure.

### Quickfix Lists

You can think of a quickfix list as a set of positions in one or multiple files.

#### Basics

Let’s take an example: what happens if you run the command `:vimgrep hello *`?

1. It will search the pattern “hello” in every file of your working directory.
2. It will populate a quickfix list with every position matching your pattern “hello”.
3. It will move your cursor to the first position of the quickfix list.

If you want to know more about vimgrep and other tools you can search with, I [wrote an article about that](https://thevaluable.dev/vim-search-find-replace/). Other commands (like `:make` or `:grep`) also populate automatically a quickfix list.

Let’s expand the mystery around marks: these positions in the quickfix list are in fact hidden mark!

The quickfix list is often used to display specific errors in a codebase, often spit out from a compiler or a linter (via the command `:make` for example), but not only, as we just saw. I call the entries of a quickfix list “positions” to be more general, but sometimes Vim’s help will refer to them as “errors”. Don’t be confused: it’s the same idea.

Among other conditions, a quickfix list entry needs to have a filename for you to be able to jump to its position. Otherwise, the entry doesn’t point to anything. Difficult to move to anything.

#### Useful Commands

Here are the commands you can use to navigate through the current quickfix list:

- `:cl` or `:clist` - Display all valid entries of the current quickfix list. You can add a range as argument (only numbers).
- `:cc <number>` - Move to the `<number>`th entry of the current quickfix list.
- `:cnext` or `:cn` - Move to the next entry of the current quickfix list.
- `:cprevious` or `:cp` - Move to the previous entry of the current quickfix list.
- `:cfirst` or `:cfir` - Move to the first entry of the current quickfix list.
- `:clast` or `:clas` - Move to the last entry of the current quickfix list.

Here are additional commands which make quickfix lists really powerful:

- `:cdo <cmd>` - Execute a command `<cmd>` on each valid entry of the current quickfix list.
- `:cexpr <expr>` or `:cex <expr>` - Create a quickfix list using the result of evaluating the Vimscript expression `<expr>`.
- `:caddexpr <expr>` or `:cadde <expr>` - Appends the result of evaluating the Vimscript expression `<expr>` to the current quickfix list.

If you have no clue how to use the last two commands, you can do for example:

- `:cex []` - Empty the current quickfix list.
- `:cex system("<cmd>")` - Populate your quickfix list with any shell command `<cmd>`. You can try it with `ls` for example.

### The Quickfix Window

What about displaying the current quickfix list in a new buffer? You can do that with the following command:

- `:copen` or `:cope` - Open a window (with a special buffer) to show the current quickfix list.

You can only have one quickfix window open. To move to the position of the selected entry of the quickfix list in the quickfix window, hit `ENTER` or `.cc`.

### Location Lists

A location list is similar to a quickfix list, except that the first is local to a window and the second is global to your Vim instance. In other words, you can have multiple location lists available at the same time (one per window open), but you can only have access to one quickfix list.

The commands for location lists are similar to the ones for the quickfix lists; often, you’ll only have to replace the first `c` (qui`c`fix) of the command with `l` (`l`ocation).

For example:

- `:lli` or `:llist` - Display all valid entries of the current location list. You can add a range as argument (only numbers).
- `:ll <number>` - Move to the entry `<number>` of the current location list.
- `:lnext` or `:lne` - Move to the next entry of the current quickfix list.

To populate your location list you can also use the commands `:lvimgrep` or `:lmake` for example.

Often, Vim users will use the quickfix list for anything related to errors in their codebase, and the location list for search results. But it’s up to you at the end of the day. With Vim, you’re the master of your destiny.

#### Vim help
- `:help quickfix`
- `:help quickfix-window`
- `:help location-list`
- `:help location-list-window`
- `:help expr`
- `:help system()`

## Vim’s Registers

The registers are another big dish in our Vim feast. You can think of registers as places where you can read or write some text. I like to think about them as Vim’s clipboards.

### Specifying a Register

Here’s a command and a NORMAL mode keystroke to display and _specify_ registers:

- `:registers` or `:reg` - Display the content of your registers.
- `"<reg>` - This keystroke _specifies_ the register `<reg>` to be read or written.

How do you know when the register `<reg>` is read or written using the keystroke `"`? It depends of the keystroke you use afterward. For example:

- To write the register `a`:
    1. Hit `"a` in NORMAL mode to specify what register you want to write on.
    2. Yank, change, or delete some content (for example by using `dd` in NORMAL mode) to write it to `a`.
- To read the register `a`:
    1. Hit `"a` in NORMAL mode to specify what register you want to read.
    2. Use a put keystroke in NORMAL mode (for example `p` or `P`) to spit out the content of the register in your current buffer.

We take the example of register `a` here, but it will work for any writable register.

### The Types of Registers

There are 10 different types of registers in Vim:

1. **The unnamed register** (`"`) - Contain the last deleted, changed, or yanked content, _even if_ one register was specified.
2. **The numbered registers** (from `0` to `9`)
    - `0` contains the content of the last yank.
    - `1` to `9` is a stack containing the content you’ve deleted or changed.
        1. Each time you delete or change some content, it will be added to the register `1`.
        2. The previous content of the register `1` will be assigned to register `2`, the previoius content of `2` to `3`…
        3. When something is added to the register `1`, the content of the register `9` is lost.
    - None of these registers are written if you’ve specified one before with the keystroke `"`.
3. **The small delete register** (`-`)
    - Contains any deleted or changed content smaller than one line.
    - It’s not written if you specified a register with `"`.
4. **The named registers** (range from `a` to `z`)
    - Vim will never write to them if you don’t specify them with the keystroke `"`.
    - You can use the uppercase name of each register to append to it (instead of overwriting it).
5. **The read only registers** (`.`, `%` and `:`)
    - `.` contains the last inserted text.
    - `%` contains the name of the current file.
    - `:` contains the most recent command line executed.
6. **The alternate buffer register** (`#`) - Contain the alternate buffer for the current window.
7. **The expression register** (`=`) - Store the result of an expression. More about this register below.
8. **The selection registers** (`+` and `*`)
    - `+` is synchronized with the system clipboard.
    - `*` is synchronized with the selection clipboard (only on Unix\Linux systems).
9. **The black hole register** (`_`) - Everything written in there will disappear forever.
10. **The last search pattern register** (`/`) - This register contains your last search.

As you can see, even if you don’t specify any register with the keystroke `"`, the content you delete, change, or yank will automatically overwrite one (or multiple) of them. So if you don’t want the content you write to your registers to be silently overwritten by Vim, _always write in the named registers_.

Using a put command without specifying any register will spit the content of the unnamed register by default. But you might have this line in your `vimrc`:

```
clipboard+=unnamedplus
```

In that case, the content you change, delete, or yank will go directly in the unnamed register _and_ the `+` register. Using put commands will directly output the `+` register too. Many find it useful (including me) to access your OS clipboard more easily, without the need to specify the `+` register for reading or writing it.

### Appending a Recording

We’ve seen in the [previous article](https://thevaluable.dev/vim-intermediate/) that you can record your keystrokes using `q`. Now that you know how to use registers, you can manipulate these keystrokes:

- If you made a mistake during the recording, you can spit the whole register, modify it, and save it back.
- You can append to your recording by using the uppercase variant of your register. For example:
    1. Hit `qa` and record whatever keystrokes you want. Stop the recording by hitting `q` again.
    2. You realize that you forgot a couple of keystrokes.
    3. Execute your keystrokes to be sure you’re at the last position of your recording.
    4. Hit `qA` to _append_ to your register `a`. When you’re done, hit `q` again.

You’ve just gained even more flexibility for your macros.

### Using Registers in INSERT and COMMAND LINE modes

The magical keystroke `"` is great for NORMAL mode, but what about spitting the content of a register in INSERT mode or COMMAND LINE mode? For that, you can use `CTRL+R <reg>` to put the content of register `<reg>` in your current buffer.

For example, if you hit `CTRL+R %` in INSERT mode, you’ll put the content of the register `%` in your current buffer.

### The Insane Expression Register

If you don’t know the expression register, I’m about to revolution your life. I hope you’re ready.

Try this:

1. Switch to INSERT mode and hit the keystroke `CTRL+r =`. You’ll move to Vim’s command-line.
2. From there, you can type any Vimscript expression you want, like `system("ls")` we saw above, or `4+4`.
3. Hit `ENTER` to run the expression, and you’ll see the output of the shell command `ls` directly inserted in your buffer!

It’s useful to evaluate some custom functions you’ve defined while staying in insert mode. If you use Neovim, you can use the function `luaeval()` to evaluate some Lua too.

### Clearing a Register

A last little trick about registers: if you want to empty one, you can do:

```
qaq
```

Beginning a recording also deletes everything which is in this register. So you just need to stop the recording by hitting `q` again to have an empty register.

#### Vim help
- `:help registers`
- `:help clipboard`
- `:help clipboard-unnamed`
- `:help clipboard-unnamedplus`

## The Substitute Commands

Let’s continue our ascension to become The Vim God (or Goddess). The substitute command is next on the menu.

### Basics

If you’re already familiar with the CLI `sed`, this command will remind you some good old memories.

A substitution is a way to replace some content with some other content, using a range and a count. The count will decide how many lines is affected by your substitution from the last line of your range.

Like many other commands, the default range is the current line if you don’t specify it.

Here’s the pattern of the command itself:

```
:s/pattern/replacement/flags
```

What does this mean?

- The `pattern` is the search you want to match.
- The `replacement` will replace the _first match_ of the pattern on each line.
- The `flag` modify the behavior of the command.

There’s another element, represented here with a slash `/`: the separator. It doesn’t have to be a slash, it can be any character except:

- An alphanumerical character (a character included in the range `a-z`, `A-Z`, and `0-9`).
- A double quote`"`.
- A pipe `|`.

The `replacement` is not mandatory: if you omit it, the substitute command will delete the pattern matched.

You can also run `:s` without any range, pattern, replacement, flags, or count. In that case, it will repeat the last substitution you’ve done without the flags; you can add new flags (except `&`) and a count if you want to.

Let’s see some examples to understand how it works:

- `:s/pattern/replacement/` - Substitute the first occurrence of `pattern` on the current line with `replacement`.
- `:s#pattern#replacement#` - Equivalent substitution to the one just above. Handy if you have some URLs in your `pattern` or your `replacement`.
- `:s/pattern/` - delete the first occurrence of `pattern` on the current line.
- `:s/pattern/replacement/g` - Substitute every occurrence of `pattern` on the current line.

You can also add a range as prefix and a count as suffix:

- `:%s/pattern/replacement/` - Substitute every _first_ occurrence of `pattern` on each line of the current buffer.
- `:%s/pattern/replacement/g` - Substitute every occurrence of `pattern` on each line of the current buffer.
- `:1,10s/pattern/replacement/` - Substitute every _first_ occurrence of `pattern` on the first ten lines of the current buffer.
- `:s/pattern/replacement/ 10` - Substitute every _first_ occurrence of `pattern` for the current line and the 10 next lines.
- `:1,10s/pattern/replacement/ 5` - Substitute every _first_ occurrence of `pattern` on the first ten lines and on the five lines below the last line of the range.
- `:s g 10` - Repeat the last substitution without its flag, and add a new flag `g`. It will affect the 10 lines after the last line of the last substitute command.

### Vim’s “Magical” Patterns

A `pattern` in that case is a regular expression. But it’s not the good old regex engine you’re familiar with from high level programming languages. Vim has its own regex engine (actually, it has two!) which can be quite confusing.

Regexes in Vim are more or less magic. You think I’m kidding? I’m not. Here’s what I find useful to remember:

- To have access to _all_ regex metacharacters, you can prefix your pattern with `\v` (`v`ery magic).
- To have access to _almost all_ regex metacharacters (except `(`, `)` and `|`), use the command `:sm` instead of `:s` (`s`ubstitute `m`agic).
- To have access to _none_ of the metacharacters (except `$`), use `:sno` instead of `:s` (`s`ubstitute `no`magic).
- To have access to _none_ of the metacharacters, you can prefix your pattern with `\V` (`V`ery nomagic).

For example, if I want to delete all opening parenthesis in my buffer, I can run one of these three equivalent commands:

```
:%s/\V(/
:%sm/(/
:%s/\(/
```

If you know your regex metacharacters, you might wonder what’s the metacharacter `~`. It’s the latest substituted string in Vim’s world. In fact, you can use many more metacharacters (called _atoms_) and character classes in your Vim’s regex.

If don’t know the most common regex metacharacters, I’ve already [written about them in this article](https://thevaluable.dev/regular-expression-basics-vim-grep/). I also [recorded a couple of videos](https://www.youtube.com/watch?v=LIVBktatfQI) explaining the basics of Grep regular expressions.

The [next article](https://thevaluable.dev/vim-adept/) in this series dive into Vim’s regexes a bit deeper.

### Additional Commands

Here are two other commands I find useful:

- `:&&` - Repeat the last substitute with its flags.
- `:~` - Repeat the last substitute command with the same replacement, but with the last used _search_ pattern.

For example, let’s say that you execute successively the following in Vim:

```
:s/pattern/replacement/
/hello
:~
```

The last command will substitute `hello` with `replacement`.

You can also use these useful keystrokes in NORMAL mode:

- `&` - Repeat the last substitute, without its range and its flags.
- `g&` - Repeat the last substitute with the same flags but without the same range (it’s global), and replace its pattern with the last _search_ pattern.

### The Substitutes Flags

Here are some flags which can be useful:

- `&` - Use the flag(s) from the previous substitute command.
- `c` - Ask you to confirm each substitution.
- `g` - Replace all occurrences in each line (not only the first one).
- `i` - The pattern is case-insensitive.
- `I` - The pattern is case-sensitive.
- `n` - Only report the number of match without substitute.

You can now substitute like crazy to your heart’s content!

#### Vim help
- `:help :substitute`
- `:help :sm`
- `:help :sno`
- `:help :s_flags`

## The Global Command

You don’t have enough? You want even more power? Behold the Holy Global Command! It works similarly to the substitute command, except that it will execute a command instead of replacing a pattern.

### Basics

Here’s the pattern of the command itself:

```
:g/pattern/command
```

You can also prefix it with a range if you want to.

As an example, let’s imagine that you have the urge to delete all the lines of your current buffer containing the pattern “useless”. To do that, you can run:

```
:g/useless/d
```

Nice, but I can give you _even more_ power.

### Normal mode Commands

Do you know the command `:norm`? You can give to it some NORMAL mode keystrokes and it will apply them for you, _as if you were hitting them in NORMAL mode_. For example, the following will delete the word under the cursor:

```
:norm daw
```

Let’s now combine a normal mode command with the global command:

```
:g/useless/norm gu$
```

This will lowercase every line containing the pattern `useless`.

When I first heard about that, I saw the Universe, the Big Bang, the cycle of creation and destruction. I understood life and death. I became blessed, chanting the power of Vim in every free cities.

A last tip: `:norm` use the key mappings you’ve defined. If you only want to use Vim’s default mapping, you can use `norm!` instead.

If you write a plugin, _always_ use `norm!`. You don’t know what mappings have your users.

#### Vim help
- `:help :global`
- `:help :normal`

## Marks

It’s time to answer the question haunting your incredible mind: what are marks?

### Basics

You can think of a mark as a specific position in a buffer. To set one, you can use `m` in NORMAL mode followed by a character in the following ranges:

- `a-z` - These marks are local to one buffer.
- `A-Z` - These marks are global to multiple buffers.

If you have a “viminfo” file set via the option `viminfo` in Vim, or if you have a “shada” file set via the option `shada` in Neovim, these marks are persisted. This means that you can come back to them even if you closed the file.

If you wonder what are Vim’s options and how to display their values, [I wrote about it in the first article of this series](https://thevaluable.dev/vim-beginners/).

There are also read-only marks in the range `0-9`. They are only available when using a `viminfo` file (for Vim) or a `shada` file (for Neovim). They store the position of your cursor each time you quit a file: the mark `0` has the last position, the mark `1` has the position before the last one, and so on.

To move to a mark, you can use these keystrokes in NORMAL mode:

- `'<mark>` - Move to the _first non-blank character_ of the line where the mark `<mark>` was set.
- `` ` `` - Move to the _exact position_ where the mark `<mark>` was set.
- `g' <mark>` ``g` <mark>`` - Move to the mark `<mark>` without changing the jump list (I’ve written about the jump list [in the previous article of this series](https://thevaluable.dev/vim-intermediate/)).

### Useful Commands

As you might imagine, there are also some useful commands for displaying or manipulating marks:

- `:marks` - Display the marks set.
- `:marks <marks>` - Display some specific marks `<marks>`.
- `:delmarks <mark>` or `:delm <mark>` - Delete the mark `<mark>`.
- `:delmarks!` or `delm!` - Delete all the marks in the range `a-z`.

For example, `:marks <>` will display the two marks `<` and `>`.

You can also use marks as ranges. For example:

```
:`a,`bs/pattern/replacement/
```

This will substitute the first match of `pattern` with `replacement` from the exact position of the mark `a` to the exact position of the mark `b`.

### Special Marks

Let’s now introduce special marks with these keystrokes:

- `m<` or `m>` - Set the marks `'<` and `'>` we saw above. It can be handy for the keystroke `gv`.
- `` `[ `` - Move to the first character of the previously changed, deleted, or yanked content.
- `` `] `` - Move to the last character of the previously changed, deleted, or yanked content.
- ` `` ` - Move to the position before the latest jump from the jump list (or where you’ve set it with `m'` or `` m` `` ).
- `` `" `` - Move to the position were you’ve closed the current file for the last time.
- `` `^ `` - Move to the position where you’ve used INSERT mode for the last time (this mark is used by the keystroke `gi` under the hood).

For every keystroke described above using `` ` `` , you can use `'` instead with the differences we saw above.

#### Vim help
`:help mark-motions`

## Manipulating Numbers

After these register, substitution, and mark shenanigans, here’s a lighter subject: adding (or subtracting) numbers.

Here’s a bunch of NORMAL mode keystrokes to do exactly that:

- `CTRL+a` - Increase _the first digit or number_ on the line.
- `CTRL+x` - Decrease _the first digit or number_ on the line.

You can also use these keystrokes in VISUAL mode:

- `g CTRL+a` - Same as `CTRL+a` unless you have several lines selected. In that case, the first number of each line will be _incremented sequentially_.
- `g CTRL+x` - Same as `CTRL+x` unless you have several lines selected. In that case, the first number of each line will be _decremented sequentially_.

To illustrate a bit better the last two keystrokes, let’s say that you have this amazing content in your beloved Vim:

```
1. Take some red flowers.
1. Add some eggs.
1. Forget about it and go back to your computer.
```

If you select in VISUAL mode the last two lines and hit `g CTRL+a`, you’ll get:

```
1. Take some red flowers.
2. Add some eggs.
3. Forget about it and go back to your computer.
```

You can also prefix a count to the command to add a precise amount. For example, `12 CTRL+a` will add 12 to the first number of the current line.

An important note: these keystrokes can also work on unsigned binary, octal, and hexadecimal numbers, as well as _alphabetical characters_. Their behaviors depend on the value of the option `nrformats`. For these keystrokes to behave as described in this article, you shouldn’t have `alpha` as part of the value of `nrformats`, or you’ll increment (or decrement) the first _alphabetical character_ of the line.

Personally, I think it’s better to exclude alphabetical characters, but in any case, I would recommend you to read Vim’s help to learn more about that. As always.

#### Vim help
- `:help CTRL-A`
- `:help CTRL-X`
- `:help nrformats`

## Sorting Text

What about a little dessert? A nice command to sort text directly in Vim, perhaps? Here are the commands:

`:sort` or `:sor` - Sort lines depending on a range. If no range is given, all lines are sorted. `:sort!` or `:sor!` - Reverse the order.

You can add some options to this command. Here are the most useful ones:

- `i` - Ignore Case.
- `n` - Sort depending on the first decimal on the line.
- `f` - Sort depending on the first float on the line.
- `/pattern/` - Sort depending on what comes after the match.
- `r` - Combined with `/pattern/`, the sort depending on the matching pattern.

For example, if you have a CSV (with comma `,` as separator) and you want to sort every line depending on the second column, you can run something like this:

```
:sort /[^,]*,/
```

How about sorting the following list depending on the numbers of each line?

```
Take some red flowers (1).
Forget about it and go back to your computer (3).
Add some eggs (2).
```

Running `:sort n` will have the following result:

```
Take some red flowers (1).
Add some eggs (2).
Forget about it and go back to your computer (3).
```

As always, there are many subtleties involved here. If you want to dig deeper, you know what you should do: fire up this Vim’s help and enjoy the depth of its infinity!

#### Vim help
`:help sort`

## Are You a Vim Master Now?

We can now make two assumptions:

1. Compared to your old self, you might be more of a master than before.
2. Compared to many, you still have a long road ahead of practice and learning.

But here’s the most important: you shouldn’t care about the second point. Always compare yourself to your past self, not to the others. Continue to walk on your own road, and you’ll get your enlightenment. You’ll then build your own Mouseless Development environment, you’ll move to a comfy cave in the Himalaya, alone, living a life of vow, giving your whole soul to the study of the Almighty Vim.

Speaking of mouseless...

If you want to build a complete Mouseless Development Environment, [you might be interested by this book](https://themouseless.dev/).

What did we learn in this article?

- The letter “g” in Vim is a bit like a magic wand:
    - There are many useful keystrokes which begin with “g”.
    - The flag `g` is often used with the substitute command.
    - The global command `:g` is really powerful to apply a command to some precise content.
- Ranges allow you to execute many commands on a bunch of contiguous lines.
- The quickfix list is a global list of positions in different files. You can apply any command to them with `:cdo`.
- You can see the entries of a quickfix list using the quickfix window.
- Location lists are similar to quickfix lists, except that you can have one location list (and one location window) per window open.
- You can use the substitute command `:s` to replace a pattern (regex) with a replacement. Prefer `:sm` if you want to use a regex or `:sno` if you don’t.
- You can use marks to add some surgical precision in what you want to do.

To reward your tenacity and resilience for reading the whole article, I’ve a last tip for you: `:help ex-cmd-index` will list all the commands available in Vim.

Vim is easy to learn but hard to master: that’s great, because we never stop improving!