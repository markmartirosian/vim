-- 'wincent/terminus'
-- 'ojroques/vim-oscyank'

vim.cmd([[
if !empty(&viminfo)
  set viminfo^=!
endif

filetype plugin on
filetype plugin indent on
syntax off
au FileType help,qf setl nowrap nofen nospell nocul nolist

cmap WQ wq
cmap wQ wq
cmap w!! w !sudo tee % >/dev/null

nnoremap <silent><Down> n
nnoremap <silent><expr> n (v:searchforward ? 'n' : 'N')
nnoremap <silent><Up> N
nnoremap <silent><expr> N (v:searchforward ? 'N' : 'n')
]])

local function python3_path()
  local stat = vim.loop.fs_stat(vim.fn.expand('~/.vim/.venv/bin'))
  if not stat then
    return nil
  end

  if stat.type == 'directory' then
    return vim.fn.expand('~/.vim/.venv/bin/python3')
  end

  return nil
end

vim.g.python3_host_prog = python3_path()

if vim.loader then
  vim.loader.enable()
end

vim.api.nvim_set_keymap(
  'n',
  '<c-j>',
  '<c-w>j',
  { noremap = true, silent = true, desc = 'Go to the down window' }
)
vim.api.nvim_set_keymap(
  'n',
  '<c-k>',
  '<c-w>k',
  { noremap = true, silent = true, desc = 'Go to the up window' }
)
vim.api.nvim_set_keymap(
  'n',
  '<c-l>',
  '<c-w>l',
  { noremap = true, silent = true, desc = 'Go to the right window' }
)
vim.api.nvim_set_keymap(
  'n',
  '<c-h>',
  '<c-w>h',
  { noremap = true, silent = true, desc = 'Go to the left window' }
)

-- Using expression mappings for conditional behavior

-- vim.o.wildmode = 'list:longest,full'
-- vim.o.guicursor = 'a:blinkon0'
-- vim.o.mouse = 'nvi'
-- vim.o.complete = ''
vim.o.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:Cursor/lCursor'
vim.g.loaded_matchit = 1
vim.g.have_nerd_font = false
vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true
vim.o.mousemoveevent = true
vim.o.autoindent = true
vim.o.autoread = true
vim.o.background = 'dark'
vim.o.backspace = 'indent,eol,start'
vim.o.backup = true
vim.o.showmatch = false
vim.o.backupcopy = 'yes'
vim.o.backupdir = vim.fn.expand('~/.vim/tmp/backup')
vim.o.clipboard = 'unnamedplus'
vim.o.cmdheight = 2
vim.o.colorcolumn = ''
vim.o.compatible = false
vim.o.cursorline = false
vim.o.directory = vim.fn.expand('~/.vim/tmp/sessions')
vim.o.display = 'lastline,truncate'
vim.o.encoding = 'utf-8'
vim.o.errorbells = false
vim.o.expandtab = true
vim.o.fileencoding = 'utf-8'
vim.o.foldenable = false
vim.o.formatoptions = 'jcroqln'
vim.o.hidden = true
vim.o.history = 5000
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.inccommand = 'split'
vim.o.incsearch = true
vim.o.joinspaces = false
vim.o.langremap = false
vim.o.laststatus = 3
vim.o.lazyredraw = false
vim.o.linebreak = true
vim.o.ttyfast = true
vim.o.list = false
vim.o.listchars = 'tab:¨¨,eol:¬,trail:·'
vim.o.matchtime = 2
vim.o.mouse = 'a'
vim.o.nrformats = 'bin,hex'
vim.o.number = false
vim.o.numberwidth = 6
vim.o.pumblend = 10
vim.o.pumheight = 20
vim.o.relativenumber = false
vim.o.ruler = false
vim.o.scrolljump = 1
vim.o.scrolloff = 0
vim.o.secure = true
vim.o.shada = "'100,<50,s10,:1000,/100,@100,h"
vim.o.shiftwidth = 2
vim.o.shortmess = 'AIOTWacfilmnortxs'
vim.o.showbreak = '↳ '
vim.o.showmode = false
vim.o.showmode = false
vim.o.sidescroll = 1
vim.o.sidescrolloff = 4
vim.o.signcolumn = 'no'
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.softtabstop = 2
vim.o.spell = false
vim.o.splitbelow = true
vim.o.splitkeep = 'screen'
vim.o.splitright = true
vim.o.startofline = false
vim.o.swapfile = false
vim.o.tabpagemax = 50
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.timeout = true
vim.o.timeoutlen = 400
vim.o.undodir = vim.fn.expand('~/.vim/tmp/undo')
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.virtualedit = 'block'
vim.o.virtualedit = 'block'
vim.o.virtualedit = 'onemore'
vim.o.visualbell = false
vim.o.whichwrap = '<,>,h,l'
vim.o.wildignore =
  '*/.git/*,*/.hg/*,*/.svn/*,*.aux,*.out,*.toc,*.jpg,*.bmp,*.gif,*.luac,*.o,*.obj,*.exe,*.dll,*.manifest,*.spl,*.py[co]'
vim.o.wildmenu = true
vim.o.wildmode = 'longest:full,full'
vim.o.winblend = 10
vim.o.wrap = false
vim.o.wrapscan = false
vim.opt.iskeyword:append('-')

local noop = function() end

vim.diagnostic.config({
  float = {
    border = 'rounded',
    -- focusable = true,
    -- header = '',
    -- prefix = '',
    -- source = 'always',
    -- style = 'minimal',
    -- format = function(diagnostic)
    --   return string.format('%s: %s', diagnostic.source, diagnostic.message)
    -- end,
  },
  underline = {
    severity = { min = vim.diagnostic.severity.WARN },
  },
  virtual_text = false,
  signs = true,
  update_in_insert = false,
  severity_sort = false,
})

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
  vim.fn.system({ 'git', '-C', lazypath, 'checkout', 'tags/stable' }) -- last stable release
end
vim.opt.rtp:prepend(lazypath)

vim.keymap.set('n', ' ', '<Nop>', { silent = true, remap = false })
vim.g.mapleader = ' '
vim.opt.rtp:prepend(lazypath)
vim.g.editorconfig = true

vim.filetype.add({
  extension = {
    tfvars = 'terraform',
    tfstate = 'json',
  },
  filename = {
    ['go.sum'] = 'go',
    ['yarn.lock'] = 'yaml',
    ['.ansible-lint'] = 'yaml',
  },
  pattern = {
    ['.*%.js%.map'] = 'json',
    ['.*%.postman_collection'] = 'json',
    ['.*/playbooks/.*%.yaml'] = 'yaml.ansible',
    ['.*/playbooks/.*%.yml'] = 'yaml.ansible',
    ['.*/roles/.*%.yaml'] = 'yaml.ansible',
    ['.*/roles/.*%.yml'] = 'yaml.ansible',
  },
})

require('lazy').setup({
  {
    'wincent/terminus',
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.TerminusCursorShape = 1
      vim.g.TerminusInsertCursorShape = 0
      vim.g.TerminusNormalCursorShape = 1
      vim.g.TerminusReplaceCursorShape = 1
      vim.g.TerminusMouse = 1
      vim.g.TerminusFocusReporting = 1
      vim.g.TerminusBracketedPaste = 0
    end,
  },
  {
    'farmergreg/vim-lastplace',
    lazy = false,
    priority = 1000,
  },
  {
    'echasnovski/mini.base16',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    branch = 'stable',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      local opts = {
        palette = {
          base00 = '#1d2021',
          base01 = '#3c3836',
          base02 = '#504945',
          base03 = '#665c54',
          base04 = '#bdae93',
          base07 = '#d5c4a1',
          base05 = '#ebdbb2',
          base06 = '#fbf1c7',
          base08 = '#fb4934',
          base09 = '#83a598',
          base0A = '#fabd2f',
          base0B = '#b8bb26',
          base0C = '#8ec07c',
          base0D = '#fe8019',
          base0E = '#d3869b',
          base0F = '#d65d0e',
        },
        use_cterm = not vim.o.termguicolors,
        plugins = {
          default = false,
          ['echasnovski/mini.nvim'] = true,
          ['folke/lazy.nvim'] = true,
          ['folke/which-key.nvim'] = true,
          ['hrsh7th/nvim-cmp'] = true,
          ['lukas-reineke/indent-blankline.nvim'] = true,
          ['nvim-lualine/lualine.nvim'] = true,
          ['nvim-telescope/telescope.nvim'] = true,
          ['williamboman/mason.nvim'] = true,
        },
      }

      require('mini.base16').setup(opts)

      -- stylua: ignore start

      local p = opts.palette
      local hi = function(name, data) vim.api.nvim_set_hl(0, name, data) end
      local hm = function(name, data) local d = vim.tbl_extend('force', vim.api.nvim_get_hl(0, { name = data.link, link = false, create = false }), data) d.link = nil hi(name, d) end

      hi('Cursor',                               { force = true,     nocombine = true,             fg=p.base00,      bg=p.base06 })
      hi('Identifier',                           { link = 'Normal',  force = true })
      hi('Comment',                              { italic = true,    fg = p.base03,                nocombine = true })
      hi('Delimiter',                            { fg = p.base0C,    bg = nil,                     attr = nil,       sp = nil })
      hi('Delimiter',                            { fg = p.base0C,    bg = nil,                     attr = nil,       sp = nil })
      hi('Boolean',                              { fg = p.base0F,    bg = nil,                     attr = nil,       sp = nil })
      hi('Float',                                { fg = p.base0D,    bg = nil,                     attr = nil,       sp = nil,     italic = true })
      hi('Number',                               { fg = p.base0B,    bg = nil,                     attr = nil,       sp = nil,     italic = true })

      -- FIXME https://github.com/microsoft/vscode/issues/97063
      -- TreeSitter Highlights https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md

      -- Identifiers

      hi('@variable',                            { force = true,     fg = p.base05,                bg = nil })
      hm('@variable.builtin',                    { force = true,     link = '@variable',           bold = true })
      hi('@variable.member',                     { force = true,     link = 'Identifier' })
      hi('@variable.parameter',                  { force = true,     link = 'Identifier' })
      hm('@variable.parameter.builtin',          { force = true,     link = '@variable.parameter', bold = true })

      hi('@constant',                            { force = true,     link = 'Constant' })
      hm('@constant.builtin',                    { force = true,     link = '@constant',           bold = true })
      hi('@constant.macro',                      { force = true,     link = 'Macro' })

      hi('@module',                              { force = true,     link = 'Identifier' })
      hm('@module.builtin',                      { force = true,     link = '@module',             bold = true })
      hi('@label',                               { force = true,     link = 'Label' })

      -- Literals

      hi('@string',                              { force = true,     link = 'String' })
      hi('@string.documentation',                { force = true,     link = '@string' })
      hm('@string.escape',                       { force = true,     link = '@string',             bold = true })
      hm('@string.regexp',                       { force = true,     link = '@string',             italic = true,    bold = true })
      hm('@string.special',                      { force = true,     link = '@string',             italic = true,    bold = true })
      hi('@string.special.path',                 { force = true,     link = 'Directory' })
      hi('@string.special.symbol',               { force = true,     link = '@constant' })
      hi('@string.special.url',                  { force = true,     link = '@markup.link.url' })
      hm('@string.special.url.comment',          { force = true,     link = 'Comment', --[[ underline = true ]] })

      hi('@character',                           { force = true,     link = 'Character' })
      hm('@character.special',                   { force = true,     link = '@character',          bold = true })

      hi('@boolean',                             { force = true,     link = 'Boolean' })
      hi('@number',                              { force = true,     link = 'Number' })
      hi('@number.float',                        { force = true,     link = 'Float' })

      -- Types

      hi('@type',                                { force = true,     link = 'Type' })
      hm('@type.builtin',                        { force = true,     link = '@type',               bold = true })
      hi('@type.definition',                     { force = true,     link = 'Typedef' })
      hi('@type.qualifier',                      { force = true,     link = 'StorageClass' })

      hi('@attribute',                           { force = true,     link = 'Macro' })
      hm('@attribute.builtin',                   { force = true,     link = '@attribute',          bold = true })
      hi('@property',                            { force = true,     link = 'Identifier' })

      -- Functions

      hi('@function',                            { force = true,     link = 'Function' })
      hm('@function.builtin',                    { force = true,     link = '@function',           bold = true })
      hm('@function.call',                       { force = true,     link = '@function',           italic = true })
      hi('@function.macro',                      { force = true,     link = 'Macro' })

      hi('@function.method',                     { force = true,     link = '@function' })
      hi('@function.method.call',                { force = true,     link = '@function.call' })

      hi('@constructor',                         { force = true,     link = 'Special' })
      hi('@operator',                            { force = true,     link = 'Operator' })

      -- Keywords

      hi('@keyword',                             { force = true,     link = 'Keyword' })
      hi('@keyword.coroutine',                   { force = true,     link = '@keyword' })
      hi('@keyword.debug',                       { force = true,     link = '@keyword' })
      hi('@keyword.exception',                   { force = true,     link = '@keyword' })
      hi('@keyword.function',                    { force = true,     link = '@keyword' })
      hi('@keyword.import',                      { force = true,     link = '@keyword' })
      hi('@keyword.modifier',                    { force = true,     link = '@keyword' })
      hi('@keyword.operator',                    { force = true,     link = '@keyword' })
      hi('@keyword.repeat',                      { force = true,     link = '@keyword' })
      hi('@keyword.return',                      { force = true,     link = '@keyword' })
      hi('@keyword.storage',                     { force = true,     link = '@keyword' })
      hi('@keyword.type',                        { force = true,     link = '@keyword' })

      hi('@keyword.conditional',                 { force = true,     link = 'Conditional' })
      hi('@keyword.conditional.ternary',         { force = true,     link = 'Conditional' })

      hi('@keyword.directive',                   { force = true,     link = '@keyword' })
      hi('@keyword.directive.define',            { force = true,     link = '@keyword.directive' })

      -- Punctuation

      hi('@punctuation',                         { force = true,     link = 'Delimiter' })
      hi('@punctuation.bracket',                 { force = true,     link = '@punctuation' })
      hi('@punctuation.delimiter',               { force = true,     link = '@punctuation' })
      hm('@punctuation.special',                 { force = true,     link = '@punctuation',        bold = true })

      -- Comments

      hi('@comment',                             { force = true,     link = 'Comment' })
      hi('@comment.documentation',               { force = true,     link = '@comment' })

      -- TODO: minihipatterns
      hi('@comment.error',                       { force = true,     link = '@text.danger' })
      hi('@comment.note',                        { force = true,     link = '@text.note' })
      hi('@comment.todo',                        { force = true,     link = '@text.todo' })
      hi('@comment.warning',                     { force = true,     link = '@text.warning' })

      -- Markup

      hi('@markup.strong',                       { force = true,     link = '@text.strong' })
      hi('@markup.italic',                       { force = true,     link = '@text.emphasis' })
      hi('@markup.strikethrough',                { force = true,     link = '@text.strikethrough' })
      hi('@markup.underline',                    { force = true,     link = '@text.underline' })

      hi('@markup.heading',                      { force = true,     link = '@text.title' })
      hi('@markup.heading.1',                    { force = true,     link = '@text.title' })
      hi('@markup.heading.2',                    { force = true,     link = '@text.title' })
      hi('@markup.heading.3',                    { force = true,     link = '@text.title' })
      hi('@markup.heading.4',                    { force = true,     link = '@text.title' })
      hi('@markup.heading.5',                    { force = true,     link = '@text.title' })
      hi('@markup.heading.6',                    { force = true,     link = '@text.title' })

      hi('@markup.quote',                        { force = true,     link = '@string.special' })
      hi('@markup.math',                         { force = true,     link = '@string.special' })

      hi('@markup.link',                         { force = true,     link = '@text.reference' })
      hi('@markup.link.label',                   { force = true,     link = '@markup.link' })
      hi('@markup.link.url',                     { force = true,     fg = p.base05,                bg = nil,         underline = true })

      hi('@markup.raw',                          { force = true,     link = '@text.literal' })
      hi('@markup.raw.block',                    { force = true,     link = '@markup.raw' })

      hi('@markup.list',                         { force = true,     link = '@punctuation.special' })
      hi('@markup.list.checked',                 { force = true,     link = 'DiagnosticOk' })
      hi('@markup.list.unchecked',               { force = true,     link = 'DiagnosticWarn' })

      hi('@markup.environment',                  { force = true,     link = '@module' })

      -- Other: Text

      hi('@text.strong',                         { force = true,     fg = nil,                     bg = nil,         bold = true })
      hi('@text.strike',                         { force = true,     fg = nil,                     bg = nil,         strikethrough = true })
      hi('@text.emphasis',                       { force = true,     fg = nil,                     bg = nil,         italic = true })
      hi('@text.underline',                      { force = true,     link = 'Underlined' })

      hi('@text.danger',                         { force = true,     link = 'ErrorMsg' })
      hi('@text.literal',                        { force = true,     link = 'Special' })
      hi('@text.note',                           { force = true,     link = 'MoreMsg' })
      hi('@text.reference',                      { force = true,     link = 'Identifier' })
      hi('@text.title',                          { force = true,     link = 'Title' })
      hi('@text.todo',                           { force = true,     link = 'Todo' })
      hi('@text.uri',                            { force = true,     link = 'Underlined' })
      hi('@text.warning',                        { force = true,     link = 'WarningMsg' })

      -- Other

      hi('@diff.delta',                          { force = true,     link = 'Changed' })
      hi('@diff.minus',                          { force = true,     link = 'Removed' })
      hi('@diff.plus',                           { force = true,     link = 'Added' })

      hi('@symbol',                              { force = true,     link = 'Keyword' })

      hi('@tag',                                 { force = true,     link = 'Tag' })
      hi('@tag.attribute',                       { force = true,     link = '@tag' })
      hm('@tag.builtin',                         { force = true,     link = '@tag',                bold = true })
      hi('@tag.delimiter',                       { force = true,     link = '@punctuation' })

      -- Source: `:h lsp-semantic-highlight`
      hi('@lsp.type.class',                      { force = true,     link = 'Structure' })
      hi('@lsp.type.comment',                    { force = true,     link = '@comment' })
      hi('@lsp.type.decorator',                  { force = true,     link = '@function' })
      hi('@lsp.type.enum',                       { force = true,     link = '@type' })
      hi('@lsp.type.enumMember',                 { force = true,     link = '@constant' })
      hi('@lsp.type.event',                      { force = true,     link = '@type' })
      hi('@lsp.type.function',                   { force = true,     link = '@function' })
      hi('@lsp.type.interface',                  { force = true,     link = '@type' })
      hi('@lsp.type.keyword',                    { force = true,     link = '@keyword' })
      hi('@lsp.type.macro',                      { force = true,     link = '@function.macro' })
      hi('@lsp.type.method',                     { force = true,     link = '@function.method' })
      hi('@lsp.type.modifier',                   { force = true,     link = '@type.qualifier' })
      hi('@lsp.type.namespace',                  { force = true,     link = '@module' })
      hi('@lsp.type.number',                     { force = true,     link = '@number' })
      hi('@lsp.type.operator',                   { force = true,     link = '@operator' })
      hi('@lsp.type.parameter',                  { force = true,     link = '@variable.parameter' })
      hi('@lsp.type.property',                   { force = true,     link = '@property' })
      hi('@lsp.type.regexp',                     { force = true,     link = '@string.regexp' })
      hi('@lsp.type.string',                     { force = true,     link = '@string' })
      hi('@lsp.type.struct',                     { force = true,     link = 'Structure' })
      hi('@lsp.type.type',                       { force = true,     link = '@type' })
      hi('@lsp.type.typeParameter',              { force = true,     link = '@type.definition' })
      hi('@lsp.type.variable',                   { force = true,     link = '@variable' })
      hi('@lsp.typemod.variable.readonly',       { force = true,     link = '@constant' })
      hm('@lsp.typemod.function.async',          { force = true,     link = '@function',           bold = true })

      hi('@lsp.mod.defaultLibrary',              {})
      hi("@lsp.typemod.function.defaultLibrary", { link = "@function.builtin" })
      hi("@lsp.typemod.method.defaultLibrary",   { link = "@function.builtin" })
      hi("@lsp.typemod.variable.defaultLibrary", { link = "@variable.builtin" })
      hi('@lsp.mod.deprecated',                  { fg = p.base08,    bg = nil })
      hi('@lsp.mod.documentation',               { link = '@string.documentation' })

      -- hi('@lsp.mod.abstract',                 {})
      -- hi('@lsp.mod.async',                    {})
      -- hi('@lsp.mod.declaration',              {})
      -- hi('@lsp.mod.definition',               {})
      -- hi('@lsp.mod.deprecated',               {})
      -- hi('@lsp.mod.modification',             {})
      -- hi('@lsp.mod.readonly',                 {})
      -- hi('@lsp.mod.static',                   {})

      hi('EyelinerPrimary',                      { underline = true, bold = true })
      hi('EyelinerSecondary',                    { bold = false,     underline = true })
      hi('IndentBlanklineChar',                  { nocombine = true, ctermbg = nil,                ctermfg = 8,      bg = nil,     fg = '#332E33' })
      hi('IndentBlanklineCharScope',             { nocombine = true, ctermbg = nil,                ctermfg = 8,      bold = false, bg = nil, fg = '#474247' })
      hi('MiniJump',                             { link = 'SpellRare' })
      hi('MiniJump2dSpot',                       { reverse = true,   bold = true,                  nocombine = true, sp = nil })
      hi('MiniJump2dSpotUnique',                 { link = 'MiniJump2dSpot' })

      hi('Todo',                                 { force = true,     link ='MiniHipatternsTodo' })
      hi('@comment.todo',                        { force = true,     link ='MiniHipatternsTodo' })
      hi('NormalFloat',                          { force = true,     link ='Normal' })
      hi('FloatBorder',                          { force = true,     link ='Normal' })
      hi('FloatBorder',                          { force = true,     link ='Normal' })
      hi('NormalFloat',                          { force = true,     link ='Normal' })
      hi('DiagnosticFloatingError',              { force = true,     link ='Normal' })
      hi('DiagnosticFloatingHint',               { force = true,     link ='Normal' })
      hi('DiagnosticFloatingInfo',               { force = true,     link ='Normal' })
      hi('DiagnosticFloatingWarn',               { force = true,     link ='Normal' })
      hi('WinSeparator',                         { force = true,     link ='Normal' })
      hi('WhichKeySeparator',                    { force = true,     link ='String' })
      hi('WhichKeyFloat',                        { force = true,     link ='Normal' })
      hi('WhichKeyBorder',                       { force = true,     link ='Normal' })
      hi('ZenBg',                                { force = true,     link ='Normal' })
      hi('LazyButton',                           { force = true,     link ='Comment' })
      hi('LazyButtonActive',                     { force = true,     link ='Normal' })
      hi('LazyH1',                               { force = true,     link ='Normal' })

      -- hi('@conditional',                      { force = true,     link = 'Conditional' })
      -- hi('@debug',                            { force = true,     link = 'Debug' })
      -- hi('@define',                           { force = true,     link = 'Define' })
      -- hi('@exception',                        { force = true,     link = 'Exception' })
      -- hi('@field',                            { force = true,     link = 'Identifier' })
      -- hi('@float',                            { force = true,     link = 'Float' })
      -- hi('@include',                          { force = true,     link = 'Include' })
      -- hi('@macro',                            { force = true,     link = 'Macro' })
      -- hi('@method',                           { force = true,     link = 'Function' })
      -- hi('@method.call',                      { force = true,     link = 'Function' })
      -- hi('@namespace',                        { force = true,     link = 'Identifier' })
      -- hi('@none',                             { force = true,     link = 'Normal' })
      -- hi('@preproc',                          { force = true,     link = 'PreProc' })
      -- hi('@repeat',                           { force = true,     link = 'Repeat' })
      -- hi('@storageclass',                     { force = true,     link = 'StorageClass' })
      -- hi('@structure',                        { force = true,     link = 'Structure' })

      -- stylua: ignore end
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'echasnovski/mini.base16' },
    event = 'VimEnter',
    priority = 800,
    opts = {
      extensions = { 'mason', 'lazy', 'man' },
      options = {
        always_divide_middle = true,
        component_separators = '',
        globalstatus = true,
        icons_enabled = false,
        section_separators = '',
        -- theme = 'gruvbox',
        disabled_filetypes = {
          -- TelescopePrompt = {},
          -- mason = {},
          -- lazy = {},
          statusline = {},
          winbar = {},
          help = {},
        },
      },

      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    name = 'ibl',
    event = 'VeryLazy',
    dependencies = { 'echasnovski/mini.base16' },
    config = function()
      require('ibl').setup({
        indent = {
          smart_indent_cap = true,
          highlight = { 'IndentBlanklineChar' },
          char = {
            '╎',
            '╏',
            '┆',
            '┇',
            '┊',
            '┋',
          },
        },
        exclude = { filetypes = {} },
        whitespace = {
          --highlight = highlight,
          remove_blankline_trail = false,
        },
        scope = {
          highlight = { 'IndentBlanklineCharScope' },
          enabled = true,
          show_start = false,
          show_end = false,
          show_exact_scope = false,
        },
      })

      local hooks = require('ibl.hooks')
      hooks.register(
        hooks.type.WHITESPACE,
        hooks.builtin.hide_first_space_indent_level
      )
      hooks.register(
        hooks.type.WHITESPACE,
        hooks.builtin.hide_first_tab_indent_level
      )
    end,
  },
  {
    'echasnovski/mini.hipatterns',
    event = 'VeryLazy',
    dependencies = { 'echasnovski/mini.base16' },
    config = function()
      local hipatterns = require('mini.hipatterns')

      hipatterns.setup({
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = {
            pattern = '%f[%w]()FIXME()%f[%W]',
            group = 'MiniHipatternsFixme',
          },
          hack = {
            pattern = '%f[%w]()HACK()%f[%W]',
            group = 'MiniHipatternsHack',
          },
          todo = {
            pattern = '%f[%w]()TODO()%f[%W]',
            group = 'MiniHipatternsTodo',
          },
          note = {
            pattern = '%f[%w]()NOTE()%f[%W]',
            group = 'MiniHipatternsNote',
          },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
    end,
  },
  {
    'williamboman/mason.nvim',
    dependencies = { 'echasnovski/mini.base16' },
    -- lazy = false,
    cmd = {
      'Mason',
      'MasonInstall',
      'MasonUninstall',
      'MasonUninstallAll',
      'MasonLog',
    },
    build = function()
      pcall(function()
        require('mason-registry').refresh()
      end)
    end,
    opts = {
      PATH = 'append',
      log_level = vim.log.levels.WARN,
      max_concurrent_installers = 10,
      ui = {
        border = 'rounded',
        width = 0.8,
        height = 0.8,
        icons = {
          package_installed = '●',
          package_pending = '◒',
          package_uninstalled = '·',
        },
        keymaps = {
          toggle_server_expand = '<CR>',
          install_server = 'i',
          update_server = 'u',
          check_server_version = 'c',
          update_all_servers = 'U',
          check_outdated_servers = 'C',
          uninstall_server = 'X',
          cancel_installation = '<C-c>',
        },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        init = function()
          -- Disable automatic setup, we are doing it manually
          vim.g.lsp_zero_ui_float_border = 0
          vim.g.lsp_zero_ui_signcolumn = 0
          vim.g.lsp_zero_extend_cmp = 0
          vim.g.lsp_zero_extend_lspconfig = 0
        end,
        config = noop,
      },
      {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        config = noop,
      },
      {
        'folke/neodev.nvim',
        dependencies = { 'williamboman/mason-lspconfig.nvim' },
        config = noop,
      },
      {
        'b0o/schemastore.nvim',
        dependencies = { 'williamboman/mason-lspconfig.nvim' },
        config = noop,
      },
      {
        'stevearc/dressing.nvim',
        opts = {},
        dependencies = { 'nvim-telescope/telescope.nvim' },
      },
    },
    config = function()
      vim.lsp.set_log_level('ERROR')
      vim.lsp.handlers['textDocument/hover'] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
      vim.lsp.handlers['textDocument/signatureHelp'] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

      require('lspconfig.ui.windows').default_options.border = 'rounded'
      require('neodev').setup({})
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()
      local capabilities = lsp_zero.get_capabilities()

      if capabilities ~= nil then
        capabilities.textDocument.completion.completionItem = {
          documentationFormat = { 'markdown', 'plaintext' },
          snippetSupport = true,
          preselectSupport = true,
          insertReplaceSupport = true,
          labelDetailsSupport = true,
          deprecatedSupport = true,
          commitCharactersSupport = true,
          tagSupport = { valueSet = { 1 } },
          resolveSupport = {
            properties = {
              'documentation',
              'detail',
              'additionalTextEdits',
            },
          },
        }
      end

      lsp_zero.set_sign_icons({
        error = '◆',
        warn = '◇',
        hint = '•',
        info = '∙',
      })

      local on_init = noop
      -- local on_init = function(client, _)
      --   if client.supports_method('textDocument/semanticTokens') then
      --     client.server_capabilities.semanticTokensProvider = nil
      --   end
      -- end

      -- require('inc_rename').setup({
      --   cmd_name = 'Rename'
      -- })

      lsp_zero.on_attach(function(client, bufnr)
        vim.api.nvim_buf_set_keymap(
          bufnr,
          'n',
          '<C-k>',
          '<cmd>lua vim.lsp.buf.signature_help()<cr>',
          { noremap = true, silent = true, desc = 'Signature Help' }
        )

        vim.api.nvim_buf_set_keymap(
          bufnr,
          'n',
          'K',
          '<cmd>lua vim.lsp.buf.hover()<cr>',
          { noremap = true, silent = true, desc = 'Hover' }
        )
        vim.api.nvim_buf_set_keymap(
          bufnr,
          'n',
          '<leader>r',
          -- ':Rename ',
          '<cmd>lua vim.lsp.buf.rename()<cr>',
          { noremap = true, silent = true, desc = 'Rename' }
        )

        vim.api.nvim_buf_set_keymap(
          bufnr,
          'n',
          '<leader>A',
          '<cmd>lua vim.lsp.buf.code_action()<cr>',
          { noremap = true, silent = true, desc = 'Code Action' }
        )
        vim.api.nvim_buf_set_keymap(
          bufnr,
          'x',
          '<leader>A',
          '<cmd>lua vim.lsp.buf.code_action()<cr>',
          { noremap = true, silent = true, desc = 'Code Action' }
        )

        vim.api.nvim_buf_set_keymap(
          bufnr,
          'n',
          '<C-Up>',
          '<cmd>lua vim.diagnostic.goto_prev()<cr>',
          { noremap = true, silent = true, desc = 'Previous Diagnostic' }
        )

        vim.api.nvim_buf_set_keymap(
          bufnr,
          'n',
          '<C-Down>',
          '<cmd>lua vim.diagnostic.goto_next()<cr>',
          { noremap = true, silent = true, desc = 'Next Diagnostic' }
        )

        require('lsp-fix').on_attach(client, bufnr)

        if client.name == 'ruff_lsp' then
          client.server_capabilities.hoverProvider = false
        end
      end)

      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          lsp_zero.default_setup,
          dockerls = function()
            require('lspconfig').dockerls.setup({})
          end,
          yamlls = function()
            require('lspconfig').yamlls.setup({
              capabilities = capabilities,
              on_init = on_init,
              settings = {
                yaml = {
                  schemas = vim.list_extend(
                    {
                      [vim.fn.expand('~/.vim/empty-schema.json')] = 'contents.yaml',
                      -- ['https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/tasks'] = 'tasks/*.yml',
                      -- ['https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/handlers'] = {
                      --   'handlers/*.yml',
                      --   'handlers/*.yaml',
                      -- },
                      -- ['https://github.com/ansible/ansible-lint/blob/main/src/ansiblelint/schemas/requirements.json'] = {
                      --   'requirements.yml',
                      -- },
                      -- ['https://github.com/ansible/ansible-lint/blob/main/src/ansiblelint/schemas/meta.json'] = {
                      --   'meta/main.yml',
                      --   'meta/main.yaml',
                      -- },
                      -- ['https://github.com/ansible/ansible-lint/blob/main/src/ansiblelint/schemas/vars.json'] = {
                      --   'playbooks/vars/*.yml',
                      --   'playbooks/vars/*.yaml',
                      --   'vars/*.yml',
                      --   'vars/*.yaml',
                      --   'defaults/*.yml',
                      --   'defaults/*.yaml',
                      --   'host_vars/*.yml',
                      --   'host_vars/*.yaml',
                      --   'group_vars/*.yml',
                      --   'group_vars/*.yaml',
                      -- },
                      -- ['https://github.com/ansible/ansible-lint/blob/main/src/ansiblelint/schemas/ansible-lint-config.json'] = {
                      --   '.ansible-lint',
                      --   '.config/ansible-lint.yml',
                      --   '.config/ansible-lint.yaml',
                      -- },
                      -- ['https://github.com/ansible/ansible-lint/blob/main/src/ansiblelint/schemas/molecule.json'] = {
                      --   'molecule/*/molecule.yml',
                      -- },
                      -- ['https://github.com/ansible/ansible-lint/blob/main/src/ansiblelint/schemas/galaxy.json'] = {
                      --   'galaxy.yml',
                      -- },
                    },
                    require('schemastore').yaml.schemas({
                      ignore = {
                        'IMG Catapult PSP',
                      },
                    })
                  ),
                  validate = { enable = true },
                },
              },
            })
          end,
          jsonls = function()
            require('lspconfig').jsonls.setup({
              capabilities = capabilities,
              on_init = on_init,
              settings = {
                json = {
                  schemas = require('schemastore').json.schemas(),
                  validate = { enable = true },
                },
              },
            })
          end,
        },
      })

      require('lspconfig').lua_ls.setup(
        vim.tbl_deep_extend('force', {}, lsp_zero.nvim_lua_ls(), {
          capabilities = capabilities,
          on_init = on_init,
        })
      )

      require('lspconfig').pyright.setup({
        capabilities = capabilities,
        on_init = on_init,
        fix = {
          function(bufnr, client)
            client.request_sync('workspace/executeCommand', {
              command = 'pyright.organizeimports',
              arguments = { vim.uri_from_bufnr(bufnr) },
            }, 3000, bufnr)
          end,
        },
      })

      require('lspconfig').ruff_lsp.setup({
        capabilities = capabilities,
        on_init = on_init,
        fix = {
          function(bufnr, client)
            client.request_sync('workspace/executeCommand', {
              command = 'ruff.applyOrganizeImports',
              arguments = { { uri = vim.uri_from_bufnr(0) } },
            }, 3000, bufnr)
          end,
          function(bufnr, client)
            client.request_sync('workspace/executeCommand', {
              command = 'ruff.applyAutofix',
              arguments = { { uri = vim.uri_from_bufnr(0) } },
            }, 3000, bufnr)
          end,
        },
      })

      require('lspconfig').tsserver.setup({
        capabilities = capabilities,
        on_init = on_init,
        fix = {
          function(bufnr, client)
            local params = {
              command = '_typescript.organizeImports',
              arguments = { vim.api.nvim_buf_get_name(bufnr) },
            }

            client.request_sync('workspace/executeCommand', params, 3000, bufnr)
          end,
        },
        settings = {
          completions = {
            completeFunctionCalls = true,
          },
        },
      })

      require('lspconfig').eslint.setup({
        capabilities = capabilities,
        on_init = on_init,
        fix = {
          function(bufnr, client)
            local params = {
              command = 'eslint.applyAllFixes',
              arguments = {
                {
                  uri = vim.uri_from_bufnr(bufnr),
                  version = vim.lsp.util.buf_versions[bufnr],
                },
              },
            }

            client.request_sync('workspace/executeCommand', params, 3000, bufnr)
          end,
        },
      })
    end,
  },
  {
    dir = '~/.vim/local/lsp-fix',
    dependencies = { 'neovim/nvim-lspconfig' },
    keys = {
      {
        '<leader>F',
        function()
          require('lsp-fix').fix()
        end,
        desc = 'Fix',
      },
    },
    config = function()
      local fix = require('lsp-fix')

      fix.setup({
        typescript = {
          order = {
            'tsserver',
            'eslint',
          },
        },
        python = {
          order = {
            'pyright',
            'ruff_lsp',
          },
        },
        vue = {
          order = { 'volar', 'eslint' },
        },
        -- css = {
        --   order = { 'stylelint_lsp' },
        --   tab_width = function()
        --     return vim.opt.shiftwidth:get()
        --   end,
        -- }
      })
    end,
  },
  {
    'stevearc/conform.nvim',
    cmd = { 'ConformInfo' },
    dependencies = { 'neovim/nvim-lspconfig', 'williamboman/mason.nvim' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format({ async = true, lsp_fallback = true })
        end,
        desc = 'Format',
      },
    },
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          typescript = { { 'prettier' } },
          javascript = { { 'prettier' } },
          markdown = { { 'prettier' } },
          sh = { { 'shfmt' } },
          lua = { { 'stylua' } },
          yaml = { { 'prettier' } },
        },
        formatters = {
          shfmt = {
            prepend_args = { '-i', '2' },
          },
        },
      })
    end,
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      {
        'saadparwaiz1/cmp_luasnip',
        config = noop,
        dependencies = {
          {
            'L3MON4D3/LuaSnip',
            dependencies = { 'rafamadriz/friendly-snippets' },
            build = 'make install_jsregexp',
            config = noop,
          },
        },
      },
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      local cmp_action = lsp_zero.cmp_action()

      local luasnip = require('luasnip')
      luasnip.config.setup()

      vim.api.nvim_create_autocmd('InsertLeave', {
        callback = function()
          if
            require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
            and not require('luasnip').session.jump_active
          then
            require('luasnip').unlink_current()
          end
        end,
      })

      require('luasnip.loaders.from_vscode').lazy_load({
        exclude = { 'html', 'all' },
      })

      cmp.setup({
        preselect = cmp.PreselectMode.None,
        completion = {
          completeopt = 'menu,menuone,noinsert,noselect',
          -- scrollbar = false,
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body, {})
          end,
        },
        sources = cmp.config.sources({
          { priority = 16, name = 'nvim_lsp' },
          { priority = 2, name = 'buffer' },
          { priority = 8, name = 'luasnip' },
          { priority = 8, name = 'path' },
        }, {}),
        sorting = {
          priority_weight = 10,
          comparators = {
            cmp.config.compare.score,
            cmp.config.compare.exact,
            cmp.config.compare.scopes,
            cmp.config.compare.locality,
            cmp.config.compare.recently_used,
            cmp.config.compare.sort_text,
          },
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = lsp_zero.cmp_format({ details = true }),
        mapping = cmp.mapping.preset.insert({
          -- ['<C-e>'] = cmp.mapping(function( --[[ fallback ]]) if cmp.visible() then cmp.abort() else cmp.complete() end end),
          -- ['<C-f>'] = cmp.mapping.scroll_docs(5),
          -- ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          -- ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          -- ['<C-u>'] = cmp.mapping.scroll_docs(-5),
          -- ['<C-y>'] = cmp.mapping.confirm({ select = false }),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
          ['<Up>'] = cmp.mapping.select_prev_item({
            behavior = cmp.SelectBehavior.Insert,
          }),
          ['<Down>'] = cmp.mapping.select_next_item({
            behavior = cmp.SelectBehavior.Insert,
          }),
          ['<Tab>'] = cmp_action.luasnip_supertab(),
          ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
          -- ['<Tab>'] = cmp.mapping(function(fallback)
          --   if cmp.visible() then
          --     cmp.select_next_item()
          --   elseif require('luasnip').expand_or_jumpable() then
          --     vim.fn.feedkeys(
          --       vim.api.nvim_replace_termcodes(
          --         '<Plug>luasnip-expand-or-jump',
          --         true,
          --         true,
          --         true
          --       ),
          --       ''
          --     )
          --   else
          --     fallback()
          --   end
          -- end, { 'i', 's' }),
          --
          -- ['<S-Tab>'] = cmp.mapping(function(fallback)
          --   if cmp.visible() then
          --     cmp.select_prev_item()
          --   elseif require('luasnip').jumpable(-1) then
          --     vim.fn.feedkeys(
          --       vim.api.nvim_replace_termcodes(
          --         '<Plug>luasnip-jump-prev',
          --         true,
          --         true,
          --         true
          --       ),
          --       ''
          --     )
          --   else
          --     fallback()
          --   end
          -- end, { 'i', 's' }),
        }),
      })
    end,
  },
  {
    'Wansmer/treesj',
    keys = {
      { '<leader>j', '<cmd>TSJToggle<cr>', desc = 'Join Toggle' },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = {
      'TSInstall',
      'TSUninstall',
      'TSUpdate',
      'TSUpdateSync',
      'TSInstallInfo',
      'TSInstallSync',
      'TSInstallFromGrammar',
    },
    -- init = function(plugin)
    --   require('lazy.core.loader').add_to_rtp(plugin)
    --   require('nvim-treesitter.query_predicates')
    -- end,
    -- lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
        playground = {
          enable = true,
        },
        matchup = {
          enable = true,
          disable_virtual_text = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = 'vv',
            node_incremental = '<Right>',
            scope_incremental = '<Up>',
            node_decremental = '<Left>',
          },
        },
        textobjects = {
          swap = {
            enable = false,
          },
          move = {
            enable = false,
          },
          select = {
            enable = false,
          },
        },
        ensure_installed = {
          'bash',
          'bibtex',
          'cmake',
          'comment',
          'css',
          'dockerfile',
          'dot',
          'eex',
          'elixir',
          'erlang',
          'fish',
          'git_config',
          'git_rebase',
          'gitattributes',
          'gitcommit',
          'gitignore',
          'glsl',
          'go',
          'graphql',
          'hcl',
          'heex',
          'html',
          'http',
          'jq',
          'javascript',
          'jsdoc',
          'sql',
          'json',
          'json5',
          'jsonc',
          'latex',
          'lua',
          'make',
          'mermaid',
          'markdown',
          'markdown_inline',
          'perl',
          'proto',
          'prisma',
          'python',
          'r',
          'rust',
          'terraform',
          'toml',
          'tsx',
          'typescript',
          'vim',
          'vue',
          'wgsl',
          'yaml',
        },
        lsp_interop = {
          enable = true,
        },
      })

      vim.o.foldmethod = 'expr'
      vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
      vim.o.indentexpr = 'nvim_treesitter#indent()'
    end,
  },
  {
    'andymass/vim-matchup',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'echasnovski/mini.base16',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    init = function()
      -- vim.g.matchup_matchparen_offscreen =
      --   { method = 'popup', syntax_hl = 1, border = 'rounded', highlight = 'Normal' }
      vim.g.matchup_matchparen_offscreen = {}
      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_matchparen_hi_surround_always = 0
      vim.g.matchup_mouse_enabled = 1
      vim.g.matchup_motion_override_Npercent = 0
      vim.g.matchup_matchpref = { html = { nolists = 1, tagnameonly = 1 } }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    -- init = function(plugin)
    --   require('lazy.core.loader').add_to_rtp(plugin)
    -- end,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  {
    'windwp/nvim-ts-autotag',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = { 'VeryLazy' },
  },
  {
    'jinh0/eyeliner.nvim',
    event = { 'VeryLazy' },
    config = function()
      require('eyeliner').setup({
        highlight_on_key = false, -- this must be set to true for dimming to work!
        dim = false,
      })
    end,
  },
  {
    'numToStr/Comment.nvim',
    event = { 'VeryLazy' },
    -- keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      require('Comment').setup({
        toggler = {
          line = '<leader>cc',
          block = '<leader>Cc',
        },
        opleader = {
          line = '<leader>c',
          block = '<leader>C',
        },
        extra = {
          above = '<leader>cO',
          below = '<leader>co',
          eol = '<leader>cA',
        },
        mappings = {
          basic = true,
          extra = true,
        },
        pre_hook = require(
          'ts_context_commentstring.integrations.comment_nvim'
        ).create_pre_hook(),
      })
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup({
        check_ts = true,
        enable_afterquote = true,
        enable_moveright = true,
        enable_check_bracket_line = true,
        disable_filetype = { 'TelescopePrompt', 'mason', 'lazy', 'vim' },
      })

      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    'gbprod/yanky.nvim',
    event = 'InsertEnter',
    keys = {
      { 'Y', '<Plug>(YankyYank)', mode = { 'n', 'x' }, desc = 'Yank text' },
      { 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' }, desc = 'Yank text' },
    },
    config = function()
      require('yanky').setup({
        ring = {
          history_length = 100,
          storage = 'shada',
          sync_with_numbered_registers = true,
          cancel_event = 'update',
        },
        picker = {
          select = {
            action = nil, -- nil to use default put action
          },
          telescope = {
            mappings = nil, -- nil to use default mappings
          },
        },
        system_clipboard = {
          sync_with_ring = true,
        },
        highlight = {
          on_put = false,
          on_yank = true,
          timer = 300,
        },
        preserve_cursor_position = {
          enabled = true,
        },
      })
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
      'nvim-treesitter/nvim-treesitter',
      'neovim/nvim-lspconfig',
      'gbprod/yanky.nvim',
    },
    cmd = { 'Telescope' },
    keys = {
      {
        '<leader>Tt',
        '<cmd>Telescope treesitter<cr>',
        desc = 'Treesitter Symbols',
      },
      {
        '<leader>Td',
        '<cmd>Telescope lsp_document_symbols<cr>',
        desc = 'Document Symbols',
      },
      {
        '<leader>Tw',
        '<cmd>Telescope lsp_workspace_symbols<cr>',
        desc = 'Workspace Symbols',
      },
      { '<leader>g', '<cmd>Telescope live_grep<cr>', desc = 'Grep' },
      { '<leader>y', '<cmd>Telescope yank_history<cr>', desc = 'Yank History' },
      { '<leader>e', '<cmd>Telescope find_files<cr>', desc = 'Edit' },
      { '<leader>b', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
      {
        '<leader>d',
        '<cmd>Telescope lsp_definitions<cr>',
        desc = 'Definition',
      },
      {
        '<leader>i',
        '<cmd>Telescope lsp_implementations<cr>',
        desc = 'Implementations',
      },
      {
        '<leader>t',
        '<cmd>Telescope lsp_type_definitions<cr>',
        desc = 'Type Definitions',
      },
      { '<leader>R', '<cmd>Telescope lsp_references<cr>', desc = 'References' },
    },
    config = function()
      local telescope = require('telescope')

      require('telescope.pickers.layout_strategies').horizontal_untitled = function(
        picker,
        max_columns,
        max_lines,
        layout_config
      )
        local layout =
          require('telescope.pickers.layout_strategies').horizontal(
            picker,
            max_columns,
            max_lines,
            layout_config
          )

        layout.results.title = ''
        layout.prompt.title = ''
        layout.preview.title = ''
        return layout
      end

      telescope.setup({
        defaults = {
          layout_strategy = 'horizontal_untitled',
          mappings = {},
          winblend = 10,
          prompt_prefix = ' ',
          selection_caret = '  ',
          entry_prefix = '  ',
          initial_mode = 'insert',
          path_display = { 'truncate' },
          set_env = { ['COLORTERM'] = 'truecolor' },
        },
        pickers = {
          find_files = {
            find_command = {
              'rg',
              '-L',
              '--files',
              '--color',
              'never',
              '--hidden',
              '--glob',
              '!.git',
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
          },
        },
      })

      telescope.load_extension('fzf')
      telescope.load_extension('yank_history')
    end,
  },
  {
    'echasnovski/mini.ai',
    version = '*',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      local gen_spec = require('mini.ai').gen_spec

      -- TODO: add more queries
      require('mini.ai').setup({
        n_lines = 1024,
        custom_textobjects = {
          o = gen_spec.treesitter({
            a = { '@block.outer', '@conditional.outer', '@loop.outer' },
            i = { '@block.inner', '@conditional.inner', '@loop.inner' },
          }, {}),
          f = gen_spec.treesitter(
            { a = '@function.outer', i = '@function.inner' },
            {}
          ),
          c = gen_spec.treesitter(
            { a = '@class.outer', i = '@class.inner' },
            {}
          ),
          t = { '<([%p%w]-)%f[^<%w][^<>]->.-</%1>', '^<.->().*()</[^/]->$' },
        },
        mappings = {
          around = '',
          inside = '',
          around_next = 'an',
          around_last = 'aN',
          inside_next = 'in',
          inside_last = 'iN',
          goto_left = '',
          goto_right = '',
        },
      })
    end,
  },
  {
    'echasnovski/mini.surround',
    -- event = 'InsertEnter',
    event = { 'VeryLazy' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    opts = {
      mappings = {
        add = '<leader>sa', -- Add surrounding in Normal and Visual modes
        delete = '<leader>sd', -- Delete surrounding
        find = '<leader>sf', -- Find surrounding (to the right)
        find_left = '<leader>sF', -- Find surrounding (to the left)
        highlight = '', -- Highlight surrounding
        replace = '<leader>sr', -- Replace surrounding
        update_n_lines = '<leader>sn', -- Update `n_lines`
        suffix_last = '', -- Suffix to search with "prev" method
        suffix_next = '', -- Suffix to search with "next" method
      },
      n_lines = 500,
    },
    config = function(_, opts)
      opts.custom_surroundings = nil
      require('mini.surround').setup()
    end,
  },
  {
    'echasnovski/mini.jump2d',
    dependencies = { 'echasnovski/mini.base16' },
    keys = { '<CR>' },
    config = function()
      require('mini.jump2d').setup({
        view = {
          dim = false,
          n_steps_ahead = 0,
        },
      })
    end,
  },
  {
    'max397574/better-escape.nvim',
    event = 'InsertEnter',
    keys = { 'jj', mode = 'i' },
    config = function()
      require('better_escape').setup({
        -- timeout = 300,
        mapping = { 'jj' },
        clear_empty_lines = false,
        keys = '<Esc>',
      })
    end,
  },
  {
    'christoomey/vim-sort-motion',
    event = 'InsertEnter',
    keys = {
      { '<leader>S', '<Plug>SortMotion', desc = 'Sort' },
      {
        '<leader>S',
        '<Plug>SortMotionVisual',
        desc = 'Sort',
        mode = 'x',
      },
      { '<leader>Ss', '<Plug>SortLines', desc = 'Sort Lines' },
    },
  },
  {
    'echasnovski/mini.align',
    version = '*',
    keys = { { '<leader>a', mode = { 'n', 'x' } } },
    config = function()
      require('mini.align').setup({
        mappings = {
          start = '',
          start_with_preview = '<leader>a',
        },
        --  ['s'] = --<function: enter split pattern>,
        --  ['j'] = --<function: choose justify side>,
        --  ['m'] = --<function: enter merge delimiter>,
        --
        --  -- Modifiers adding pre-steps
        --  ['f'] = --<function: filter parts by entering Lua expression>,
        --  ['i'] = --<function: ignore some split matches>,
        --  ['p'] = --<function: pair parts>,
        --  ['t'] = --<function: trim parts>,
        --
        --  -- Delete some last pre-step
        --  ['<BS>'] = --<function: delete some last pre-step>,
        --
        --  -- Special configurations for common splits
        --  ['='] = --<function: enhanced setup for '='>,
        --  [','] = --<function: enhanced setup for ','>,
        --  [' '] = --<function: enhanced setup for ' '>,
      })
    end,
  },
  {
    'folke/which-key.nvim',
    cmd = 'WhichKey',
    event = 'VeryLazy',
    config = function(_, opts)
      local presets = require('which-key.plugins.presets')

      presets.motions['ge'] = nil
      presets.motions['gg'] = nil
      presets.operators['g~'] = nil
      presets.operators['gu'] = nil
      presets.operators['gU'] = nil
      presets.operators['!'] = nil
      presets.operators['zf'] = nil

      ---@type table<string, string|table>
      local miniAI = {
        [' '] = 'Whitespace',
        ['"'] = 'Balanced "',
        ["'"] = "Balanced '",
        ['`'] = 'Balanced `',
        ['('] = 'Balanced (',
        [')'] = 'Balanced ) including white-space',
        ['>'] = 'Balanced > including white-space',
        ['<lt>'] = 'Balanced <',
        [']'] = 'Balanced ] including white-space',
        ['['] = 'Balanced [',
        ['}'] = 'Balanced } including white-space',
        ['{'] = 'Balanced {',
        ['?'] = 'User Prompt',
        _ = 'Underscore',
        a = 'Argument',
        b = 'Balanced ), ], }',
        c = 'Class',
        f = 'Function',
        o = 'Block, conditional, loop',
        q = 'Quote `, ", \'',
        t = 'Tag',
      }

      local objects = vim.deepcopy(presets.objects)

      presets.objects = vim.tbl_deep_extend('force', {}, objects, {
        ['a'] = { n = miniAI, N = miniAI },
        ['i'] = { n = miniAI, N = miniAI },
      })

      local wk = require('which-key')
      wk.setup(opts)

      wk.register(
        { s = 'Surround' },
        { prefix = '<leader>', mode = { 'n', 'x' } }
      )
      wk.register({ T = 'Tags' }, { prefix = '<leader>' })
      wk.register({ a = 'Align' }, { prefix = '<leader>', mode = { 'n', 'x' } })
      wk.register({ n = 'Next' })
      wk.register({ N = 'Previous' })
      wk.register({ ['<Down>'] = 'Next' })
      wk.register({ ['<Up>'] = 'Previous' })
      wk.register({ ['<CR>'] = 'Jump' })
      wk.register({ ['<CR>'] = 'Jump' })
    end,
    opts = {
      plugins = {
        marks = false,
        registers = false,
        spelling = {
          enabled = false,
        },
        presets = {
          operators = true, -- adds help for operators like d, y, ...
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = false, -- misc bindings to work with windows
          z = false, -- bindings for folds, spelling and others prefixed with z
          g = false, -- bindings for prefixed with g
        },
      },
      operators = {
        ['<leader>c'] = 'Comment',
        ['<leader>C'] = 'Comment',
        ['<leader>S'] = 'Sort',
        ['<leader>sa'] = 'Surround',
      },
      motions = {
        count = true,
      },
      icons = {
        breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
        separator = '➜', -- symbol used between a key and it's label
        group = '+', -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = '<c-d>', -- binding to scroll down inside the popup
        scroll_up = '<c-u>', -- binding to scroll up inside the popup
      },
      window = {
        border = 'rounded', -- none, single, double, shadow
        position = 'top', -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        zindex = 1000, -- positive value to position WhichKey above other floating windows.
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = 'left', -- align columns left, center or right
      },
      ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
      hidden = {
        '<CR>',
        '<Cmd>',
        '<cmd>',
        '<silent>',
        '^ ',
        '^:',
        '^call ',
        '^lua ',
      }, -- hide mapping boilerplate
      show_help = true, -- show a help message in the command line for using WhichKey
      show_keys = true, -- show the currently pressed key and its label as a message in the command line
      triggers = {
        '<',
        '<c-w>',
        '<leader>',
        '>',
        'c',
        'd',
        'v',
        'y',
      },
      triggers_nowait = {},
      triggers_blacklist = {
        i = { 'j', 'k', 'z' },
        v = { 'j', 'k', 'z' },
        n = { 'z' },
        c = { 'W', 'w' },
      },
      disable = {
        buftypes = {
          'help',
          'nofile',
          'nowrite',
          'quickfix',
          'terminal',
          'prompt',
        },
        filetypes = { 'mason', 'lazy', 'TelescopePrompt' },
      },
    },
  },
  {
    'ghillb/cybu.nvim',
    keys = {
      { '<Left>', '<Plug>(CybuPrev)', desc = 'Previous Buffer' },
      { '<Right>', '<Plug>(CybuNext)', desc = 'Next Buffer' },
      -- { '<C-Left>', '<Plug>(CybuLastusedPrev)', desc = 'Previous Buffer' },
      -- { '<C-Right>', '<Plug>(CybuLastusedNext)', desc = 'Next Buffer' },
      -- vim.cmd [[nnoremap <leader><leader> :]]
      {
        '<leader><leader>',
        '<Plug>(CybuLastusedNext)',
        desc = 'Switch Buffer',
      },
    },
    config = function()
      require('cybu').setup({
        position = {
          relative_to = 'win',
          anchor = 'center',
        },
        style = {
          path = 'relative',
          path_abbreviation = 'none',
          border = 'rounded',
          separator = ' ',
          prefix = '…',
          padding = 1,
          hide_buffer_id = true,
          devicons = {
            enabled = false, -- enable or disable web dev icons
            colored = false, -- enable color for web dev icons
          },
        },
        behavior = { -- set behavior for different modes
          mode = {
            default = {
              switch = 'immediate', -- immediate, on_close
              view = 'rolling', -- paging, rolling
            },
            last_used = {
              switch = 'immediate', -- immediate, on_close
              view = 'rolling', -- paging, rolling
            },
            auto = {
              view = 'rolling',
            },
          },
          show_on_autocmd = false, -- event to trigger cybu (eg. "BufEnter")
        },
        display_time = 500, -- time the cybu window is displayed
        exclude = { -- filetypes, cybu will not be active
          'neo-tree',
          'fugitive',
          'qf',
        },
        filter = {
          unlisted = true, -- filter & fallback for unlisted buffers
        },
      })
      -- vim.keymap.set('n', 'K', '<Plug>(CybuPrev)')
      -- vim.keymap.set('n', 'J', '<Plug>(CybuNext)')
    end,
  },
  {
    'folke/zen-mode.nvim',
    keys = {
      {
        '<leader>z',
        function()
          require('zen-mode').toggle({})
        end,
        desc = 'Zen Mode',
      },
    },
    opts = {
      window = {
        backdrop = 1,
        width = 1,
        height = 1,
      },
      options = {
        signcolumn = 'no',
        number = false,
        relativenumber = false,
        cursorline = false,
        cursorcolumn = false,
        foldcolumn = '0',
        list = false,
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
          laststatus = 0,
          cmdheight = 0,
        },
        twilight = { enabled = false },
        gitsigns = { enabled = false },
        tmux = { enabled = false },
        kitty = {
          enabled = false,
        },
        alacritty = {
          enabled = false,
        },
        wezterm = {
          enabled = false,
        },
      },

      on_open = function(win)
        require('ibl').update({ enabled = false })
        require('eyeliner').disable()
      end,
      on_close = function()
        require('ibl').update({ enabled = true })
        require('eyeliner').enable()
      end,
    },
  },
}, {
  defaults = {
    lazy = true,
  },
  ui = {
    title = '',
    border = 'rounded',
    icons = {
      cmd = '',
      config = '',
      event = '',
      ft = '',
      init = '',
      keys = '',
      plugin = '',
      runtime = '',
      require = '',
      source = '',
      start = '',
      task = '',
      lazy = '',
    },
  },
  profiling = {
    loader = false,
    require = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        '2html_plugin',
        'tohtml',
        'getscript',
        'getscriptPlugin',
        'logipat',
        'netrw',
        'netrwPlugin',
        'netrwSettings',
        'netrwFileHandlers',
        'matchit',
        'rrhelper',
        'spellfile_plugin',
        'vimball',
        'vimballPlugin',
        'tutor',
        'rplugin',
        'syntax',
        'synmenu',
        'optwin',
        'compiler',
        'bugreport',
        'ftplugin',
      },
    },
  },
})

-- TODO: oscyank?
-- let g:oscyank_silent = v:true
-- let g:oscyank_term = 'default'
-- autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankRegister "' | endif
