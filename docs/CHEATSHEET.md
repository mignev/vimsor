# Vimsor Cheatsheet

> Cursor-like Vim with Claude AI Integration

Leader key: `,`

---

## File Navigation

| Key | Action |
|-----|--------|
| `Ctrl+p` | Fuzzy file finder |
| `,f` | Search in project (ripgrep) |
| `,P` | Command palette |
| `Ctrl+b` or `,b` | Toggle sidebar (NERDTree) |
| `,bl` | List open buffers |

---

## Claude Code Integration

| Key | Action |
|-----|--------|
| `,cc` | Open Claude Code chat (side panel) |
| `,ce` | Explain current file |
| `,ca` | Ask Claude about selection (visual mode) |
| `,cr` | Rewrite/edit selection with Claude (visual mode) |
| `,cf` | Fix bugs in selection (visual mode) |

**Commands:**
- `:Claude` - Open Claude Code chat
- `:ClaudeExplain` - Explain current file
- `:ClaudeAsk` - Ask about selection
- `:ClaudeEdit` - Edit selection
- `:ClaudeFix` - Fix selection

---

## Editing

| Key | Action |
|-----|--------|
| `Ctrl+s` | Save |
| `,d` | Duplicate line |
| `,k` | Delete line |
| `,/` or `Ctrl+/` | Toggle comment |
| `Alt+Up` | Move line up |
| `Alt+Down` | Move line down |
| `>` | Indent (visual mode, repeatable) |
| `<` | Outdent (visual mode, repeatable) |
| `u` | Undo |
| `Ctrl+r` | Redo |

---

## Multi-Cursor (vim-visual-multi)

| Key | Action |
|-----|--------|
| `Ctrl+n` | Select word, add next match |
| `Ctrl+x` | Skip current match |
| `,A` | Select all matches |
| `Esc` | Exit multi-cursor mode |

---

## Search

| Key | Action |
|-----|--------|
| `/` or `Ctrl+f` | Search in file |
| `n` | Next match |
| `N` | Previous match |
| `Esc Esc` or `, Space` | Clear search highlight |
| `,f` | Search in project (ripgrep) |
| `*` | Search word under cursor |

---

## Navigation

| Key | Action |
|-----|--------|
| `Ctrl+j` | Move down 5 lines |
| `Ctrl+k` | Move up 5 lines |
| `Ctrl+d` | Half page down |
| `Ctrl+u` | Half page up |
| `gg` | Go to top of file |
| `G` | Go to bottom of file |
| `50G` | Go to line 50 |
| `0` | Go to start of line |
| `$` | Go to end of line |
| `w` | Next word |
| `b` | Previous word |
| `%` | Jump to matching bracket |
| `10j` | Move down 10 lines |
| `10k` | Move up 10 lines |

---

## Splits & Panes

| Key | Action |
|-----|--------|
| `:vs` | Vertical split |
| `:sp` | Horizontal split |
| `Ctrl+w h` | Go to left pane |
| `Ctrl+w l` | Go to right pane |
| `Ctrl+w j` | Go to pane below |
| `Ctrl+w k` | Go to pane above |
| `Ctrl+w =` | Equal size panes |
| `Ctrl+w >` | Wider |
| `Ctrl+w <` | Narrower |
| `,=` | 10 columns wider |
| `,-` | 10 columns narrower |
| `Ctrl+w q` | Close pane |

---

## Tabs & Buffers

| Key | Action |
|-----|--------|
| `,t` | New tab |
| `,[` | Previous tab |
| `,]` | Next tab |
| `gt` | Next tab (vim default) |
| `gT` | Previous tab (vim default) |
| `,w` | Close buffer |
| `,bn` | Next buffer |
| `,bp` | Previous buffer |
| `,bl` | List buffers (FZF) |

**Note:** Files open in new tabs by default (NERDTree and Ctrl+p)

---

## NERDTree (Sidebar)

| Key | Action |
|-----|--------|
| `Ctrl+b` or `,b` | Toggle sidebar |
| `Enter` | Open file (in new tab) |
| `s` | Open in vertical split |
| `i` | Open in horizontal split |
| `m` | Show menu (create/delete/rename) |
| `R` | Refresh |
| `I` | Toggle hidden files |

---

## Git (vim-fugitive & gitgutter)

| Key | Action |
|-----|--------|
| `:Git` | Git status |
| `:Git blame` | Git blame |
| `:Git diff` | Git diff |
| `:Git commit` | Git commit |
| `]c` | Next git change |
| `[c` | Previous git change |

---

## Visual Mode (Selection)

| Key | Action |
|-----|--------|
| `v` | Character selection |
| `V` | Line selection |
| `Ctrl+v` | Block selection |
| `,l` | Select line |
| `vv` | Select line content |

---

## Copy/Paste

| Key | Action |
|-----|--------|
| `yy` | Copy current line |
| `5yy` | Copy 5 lines |
| `y` | Copy selection (visual mode) |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `,nn` | Toggle line numbers (for clean mouse copy) |

**Tip:** Yanked text goes to system clipboard - paste anywhere with `Cmd+v`

**Tip:** In iTerm2, hold `Option` while dragging to do rectangular selection (skip line numbers)

---

## Config

| Key | Action |
|-----|--------|
| `,ev` | Edit vimrc |
| `,sv` | Reload vimrc |

---

## Essential Vim Commands

| Command | Action |
|---------|--------|
| `:w` | Save |
| `:q` | Quit |
| `:wq` | Save and quit |
| `:q!` | Quit without saving |
| `:e filename` | Open file |
| `:PlugInstall` | Install plugins |
| `:PlugUpdate` | Update plugins |
| `:PlugClean` | Remove unused plugins |

---

## Modes

| Key | Mode |
|-----|------|
| `i` | Insert mode (before cursor) |
| `a` | Insert mode (after cursor) |
| `o` | Insert mode (new line below) |
| `O` | Insert mode (new line above) |
| `Esc` | Normal mode |
| `v` | Visual mode |
| `:` | Command mode |

---

## Status Line

```
┌──────────────────────────────────────────────────────────────────┐
│ NORMAL │ ⑂ master │ » filename.py ● │ ◆ python │ ↕ 50% │ ☰ 10:5 │
└──────────────────────────────────────────────────────────────────┘
```

| Symbol | Meaning |
|--------|---------|
| ⑂ | Git branch (red) |
| » | File |
| ● | Modified (unsaved) |
| ◆ | File type |
| ↕ | Position % |
| ☰ | Line:Column |

---

## Tips

- `;` is mapped to `:` for easier commands
- Use `.` to repeat last action
- Use `*` to search for word under cursor
- Spelling corrections are automatic (teh → the, funciton → function, etc.)
- Trailing whitespace is removed on save
- Persistent undo - your undo history survives vim restarts
