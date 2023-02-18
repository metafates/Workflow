# Workflow 🦋

An opinionated list of programs I use everyday. 
Most of them are better alternatives to the default ones.
(e.g. `ripgrep` instead of `grep`).

Majority of them (if not all) are written in **Rust 🦀**.
Of course it doesn't matter which language the program is written on as long
as it's not *javascript* 💀, but it's just nice to know that what
you are using isn't some ancient crap from 1970s...

First three items in my list are the most important ones.
Terminal emulator, shell and editor.

## Terminal Emulator - Wezterm 📟

**[Site](https://wezfurlong.org/wezterm/)** | **[Github](https://github.com/wez/wezterm)**

> A GPU-accelerated cross-platform terminal emulator and multiplexer 

- Rich Lua configuration. It's probably the most customizable terminal emulator.
- Fast (well, not as fast as [Alacritty](https://alacritty.org/), but still good)
- Tab support, built-in multiplexer

![tabs](https://user-images.githubusercontent.com/62389790/215746711-bc7abab9-97e7-4e67-9426-e612a885a17a.png)

Why native tab support matters?
Why not just use [tmux](https://github.com/tmux/tmux/wiki)
or [zellij](https://github.com/zellij-org/zellij)?

As explained [here](https://github.com/kovidgoyal/kitty/issues/391#issuecomment-638320745)

> Multiplexers add unnecessary overhead, suffer from a complexity cascade,
> because they actually have to *translate* escape codes, modifying them
> in hackish ways to get them to work with their concepts of
> windows/sessions.
>
> Energy/performance wise they are poison, every byte has to be parsed
> twice, once by the middleman and once by the terminal. And they act as a
> drag on the ecosystem as a whole, making it very hard to get any new
> features. Designing features becomes harder because you have to design
> for compatibility with a horrible hack and the diffusion into the
> ecosystem tends to get gated by basically a handful of individuals with,
> let's say, very limited vision.

And I totally agree with it.
It's *should* be a terminal job to have this functionality.
It *does* feel noticeably slower each time I try to use terminal multiplexers.
Very, veryyy slow. Even with [zellij](https://github.com/zellij-org/zellij),
which is supposed to be faster, than tmux.

In my opinion, the only valid use-case terminal multiplexers have is for using them
over ssh. Period.

I would also recommend [kitty terminal](https://sw.kovidgoyal.net/kitty/).
I use it instead of wezterm from time to time.

## Shell - Nushell 🐚

**[Site](https://www.nushell.sh/)** | **[Github](https://github.com/nushell/nushell)**

> Nu pipelines use structured data so you can safely select, filter,
> and sort the same way every time.
> *Stop parsing strings and start solving problems.*

<img width="775" alt="miette-example" src="https://user-images.githubusercontent.com/62389790/219864858-f93b9c14-b352-4d87-9298-e3390ec8b22d.png">

This example is pretty self-descriptive

```nu
# All these commands are built-in with nushell. Yes, even http.
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

Yet, Nushell managed to do *both* pretty well.
It's explicit and implicit, terse and readable, flexible and robust.

 ## Editor - Helix 🧬

**[Site](https://helix-editor.com/)** | **[Github](https://github.com/helix-editor/helix)**

> A post-modern modal text editor

![screenshot](https://user-images.githubusercontent.com/62389790/219864951-1fbb233d-dfdb-4bab-9394-0faa4d935a3a.png)

**(N)vim** alternative.
Tree-sitter integration, multiple selections, lsp support,
many features built-in.

It **doesn't** support plugins *[(yet)](https://github.com/helix-editor/helix/discussions/3806#discussioncomment-4404346)*, but 8/10 plugin
use-cases are already natively implemented. It feels way more responsive
than (n)vim. Once you try it you can't go back 🤯

And it requires almost no config at all, everything works (and works well)
out of the box!

## Tools

### ripgrep 🪦

**[Github](https://github.com/BurntSushi/ripgrep)**

A better grep alternative.
It's faster, smarter and easier. Unlike GNU grep, ripgrep stays fast
while supporting Unicode (which is always on). Ripgrep also supports
different regex engines, such as PCRE2


```bash
rg pattern file
```

### bat 🦇

**[Github](https://github.com/sharkdp/bat)**

> A cat(1) clone with wings.

Syntax highlighting, better pager and faster.

![bat example](https://user-images.githubusercontent.com/62389790/219865017-340cf33e-cedb-4290-b841-89b385643181.png)

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

**[Github](https://github.com/ajeetdsouza/zoxide)**

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

It's richer than ls (e.g. `git` integration), supports icons and colors.

Thought, I don't use it that much since I use nushell and it has a better
`cd` built-in. But that's what was my go-to choice before.

<img width="558" alt="Exa" src="https://user-images.githubusercontent.com/62389790/219865067-659d41c0-6ced-4485-ae94-dc3630af5278.png">

### sd 📝

**[Github](https://github.com/chmln/sd)**

> Intuitive find & replace CLI (sed alternative).

It's just easier and more intuitive.

```bash
# Simpler syntax for replacing all occurrences 
sd before after
sed s/before/after/g

# Replace newlines with commas
sd '\n' ','
sed ':a;N;$!ba;s/\n/,/g' # what is this syntax, seriously...
```

### rargs 🤹

**[Github](https://github.com/lotabout/rargs)**

> xargs + awk with pattern matching support.

```bash
cat download-list.csv | rargs -p '(?P<url>.*),(?P<filename>.*)' wget {url} -O {filename}
```

## Misc

### Starship 🚀

**[Site](https://starship.rs/)** | **[Github](https://github.com/starship/starship)**

> The minimal, blazing-fast, and infinitely customizable prompt for any shell! 

It's looks very nice by default and provides pretty
useful information in a compact format.

![starship](https://user-images.githubusercontent.com/62389790/219865120-99134d75-c4fa-447c-93a4-74f7e87271d4.gif)

### Delta 💬

**[Github](https://github.com/dandavison/delta)**

> A syntax-highlighting pager for git, diff, and grep output

![delta](https://user-images.githubusercontent.com/62389790/219865157-13b3aa72-0ad3-457b-8e34-a5ddf5f5224d.png)

### Tealdeer 🦌

**[Github](https://github.com/dbrgn/tealdeer)**

> A very fast implementation of tldr in Rust. 

What **tldr** is? [Visit the site](https://tldr.sh/)

> Collaborative cheatsheets for console commands 

<img width="537" alt="tldr example with tar" src="https://user-images.githubusercontent.com/62389790/219865208-9de2f467-5a6c-48c5-a84f-f7e909dfa7ab.png">

### Marky 🏭

**[Github](https://github.com/metfates/marky)**

> Convert Markdown documents into themed HTML pages with support for code syntax highlighting, LaTeX and Mermaid diagrams. 

This is my own app that I use very often when working with markdown documents.

```bash
marky README.md
```

### Gign ⚙️

**[Github](https://github.com/metafates/gign)**

> A cute .gitignore generator

Another app that I developed. It allows to generate `.gitignore` files
efficiently by using community defined templates.

```bash
# would generate a predefined gitignore template
# for macOS, JetBrains IDE and python
gign --append macos jetbrains python
```

