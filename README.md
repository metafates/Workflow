# Workflow 🦋

An opinionated list of programs I use everyday. 
Most of them are better alternatives to the default ones. (e.g. `ripgrep` instead of `grep`).

Majority of them (if not all) are written in **Rust 🦀**.
Of course it doesn't matter what language the program is written on as long as it's not *javascript* 💀,
but it's just nice to know that what you are using isn't some ancient crap from 1970s...

## Table of Contents

<!--toc:start-->
  - [Table of Contents](#table-of-contents)
  - [Nushell 🐚](#nushell-🐚)
  - [Helix 🧬](#helix-🧬)
  - [Tools](#tools)
    - [ripgrep 🪦](#ripgrep-🪦)
    - [bat 🦇](#bat-🦇)
    - [fd 🔍](#fd-🔍)
    - [skim 🔭](#skim-🔭)
    - [zoxide 🐇](#zoxide-🐇)
    - [exa 📁](#exa-📁)
    - [sd 📝](#sd-📝)
  - [Misc](#misc)
    - [Starship 🚀](#starship-🚀)
<!--toc:end-->


## Nushell 🐚

**[Site](https://www.nushell.sh/)** | **[Github](https://github.com/nushell/nushell)**

> Nu pipelines use structured data so you can safely select, filter, and sort the same way every time. *Stop parsing strings and start solving problems.*

This example is pretty self-descriptive

```nu
ls | where size > 10mb | sort-by modified
http get https://api.github.com/repos/nushell/nushell | get license
```

From the article [Shells are Two things](https://borretti.me/article/shells-are-two-things)

> The fundamental problem of shells is they are required to be two things.
>
>    - A high-frequency REPL, which requires terseness, short command names, little to no syntax, implicit rather than explicit, so as to minimize the duration of REPL cycles.
>    - A programming language, which requires readable and maintainable syntax, static types, modules, visibility, declarations, explicit configuration rather than implicit conventions.
>
> And you can’t do both. You can’t be explicit and implicit, you can’t be terse and readable, you can’t be flexible and robust.

Yet, Nushell managed to do both pretty well.
It's explicit and implicit, terse and readable, flexible and robust.

And, of courseeeeeee it's written in a modern-language 🦀,
and not some spaghetti disaster like C ***IMHO***

## Helix 🧬

**[Site](https://helix-editor.com/)** | **[Github](https://github.com/helix-editor/helix)**

> A post-modern modal text editor

**(N)vim** alternative.
Tree-sitter integration, multiple selections, lsp support, many features built-in.

It **doesn't** support plugins *(yet)*, but 8/10 plugin use-cases are already natively implemented.
It feels way more responsive than (n)vim. Once you try it you can't go back 🤯

And it requires almost no config at all, everything works (and works nice) out of the box!

## Tools

### ripgrep 🪦

**[Github](https://github.com/BurntSushi/ripgrep)**

A better grep alternative.
It's faster, smarter and easier.
Unlike GNU grep, ripgrep stays fast while supporting Unicode (which is always on).
Ripgrep also supports different regex engines, such as PCRE2


```bash
rg pattern file
```

### bat 🦇

**[Github](https://github.com/sharkdp/bat)**

> A cat(1) clone with wings.

Syntax highlighting, better pager and faster.

```bash
bat test.md
```

### fd 🔍

**[Github](https://github.com/sharkdp/fd)**

> A simple, fast and user-friendly alternative to 'find' 

Again, faster, easier, cooler... 

```bash
# Search for a particular file extension
fd -e md

# Regular expression search
fd '^x.*rc$'
```

### skim 🔭

**[Github](https://github.com/lotabout/skim)**

> fzf-like fuzzy finder

```bash
rg --files | sk --preview="bat {} --color=always"
sk -i -c "rg {} --color=always" --ansi  
```

### zoxide 🐇

> A smarter `cd` command. Supports all major shells. 

It remembers which directories you use most frequently,
so you can "jump" to them in just a few keystrokes.

```bash
z foo      # cd into highest ranked directory matching foo
z foo bar  # cd into highest ranked directory matching foo and bar
z foo /    # cd into a subdirectory starting with foo

z ~/foo    # z also works like a regular cd command
z foo/     # cd into relative path
z ..       # cd one level up
z -        # cd into previous directory

zi foo     # cd with interactive selection (using fzf)
```

Also, what I like to use is **PWD update hook** in my shell.
E.g. I prefer to use `cd` to navigate between directories
and I use `z` only when I need to jump.
But without using `z` regurally it won't remember my directories. 
So, I use something like this (example from my nushell config):

```nu
env_change: {
  PWD: [{|before, after|
    # Increment directory ranking each time $PWD is changed
    zoxide add $after
  }]
}
```

### exa 📁

**[Github](https://github.com/ogham/exa)**

> A modern replacement for `ls`. 

It's richer than ls (e.g. `git` integration), supports icons and faster, of course.

Thought, I don't use that much since I use nushell and it has a better `cd` built-in.
But that's what was my go-to choice before.

```bash
# print files in the cwd with icons
exa --icons
```

### sd 📝

**[Github](https://github.com/chmln/sd)**

> Intuitive find & replace CLI (sed alternative).

Not only it's easier, it's also just faster (of course it is)!

```bash
# Simpler syntax for replacing all occurrences 
sd before after
sed s/before/after/g

# Replace newlines with commas
sd '\n' ','
sed ':a;N;$!ba;s/\n/,/g'
```

## Misc

### Starship 🚀

**[Site](https://starship.rs/)** | **[Github](https://github.com/starship/starship)**

> The minimal, blazing-fast, and infinitely customizable prompt for any shell! 

It's looks very nice by default
and provides pretty useful information in a nice format.
