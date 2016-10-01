-- watchscript: onchange src/prompt.moon -- make prompt
package.path ..= '/home/romgrk/lua/share/?/init.lua;'
package.path ..= '/home/romgrk/lua/share/?/?.lua;'
package.path ..= '/home/romgrk/lua/share/?.lua;'
log   = require 'log'
allen = require 'allen'

-- arguments
-- [ mode | ps2 ]
argv = {...}

cursor =
    normal:   "\x1b[1 q" -- block, blink
    replace:  "\x1b[3 q" -- under, blink
    insert:   "\x1b[5 q" -- beam,  blink
    operator: "\x1b[4 q" -- under, no-blink
    visual:   "\x1b[4 q" -- under, no-blink

theme =
    normal:     log.xcolor(20)   -- blue
    insert:     log.xcolor(160)  -- red
    visual:     log.xcolor(128)  -- purple
    replace:    log.xcolor(202)  -- orange

    _normal:    log.xcolor(245)   -- blue
    _insert:    log.xcolor(245)    -- red
    _visual:    log.xcolor(141)  -- purple
    _replace:   log.xcolor(228)  -- orange

    white:      log.xcolor(253)
    med:        log.xcolor(238)  -- gray
    dir:        log.white
    dirbg:      log.gray.bg
    dirsep:     log.xcolor(244)
    char:       log.xcolor(233)
    ok:         log.green
    err:        log.red

-- Options
Opts = 
    psnum: 1
    cursor: os.getenv('CURSOR') or true

-- Environment vars proxy
Env = setmetatable {}, {__index: (k) => os.getenv(k)}

-- Prompt object
Prompt = 
    text:   ''
    escape: (seq) => "%{#{seq}%}" 
    if: (cond, yes, no) => 
        @text ..= "%(#{cond}.#{yes}.#{no})" 
    append: (str) => @text ..= tostring(str)
    write: =>
        codes = '%c.-[mqK]'
        output = string.gsub(@text, codes, @escape)
        io.write output
-- bind functions of Prompt
for n,p in pairs(Prompt)
    if type(p) == 'function' 
        Prompt[n] = (...) -> p(Prompt, ...)

-- Current mode
mode = 'normal'
if #argv > 0 then mode = argv[1]

-- Main color
color = theme[mode] or theme['insert']
if mode == 'PS2' then Opts.psnum = 2
if mode == 'git' then Opts.psnum = 3

bold  = tostring(log.bold)

-- get env ...
user = Env.USER
cwd  = Env.PWD
dir  = string.gsub(cwd, Env.HOME, '~')

-- path substitution
psep = theme['dirsep'] .. '  ' .. theme['dir']
dir1 = (dir[1]=='/') and ('/' .. psep) or dir[1]
dir = dir1 .. string.gsub(dir(2, -1), '/', psep)
dir = string.gsub(dir, '%s*$', '')

if theme['_' .. mode]
    theme['char'] = theme['_' .. mode]

-- separators
sep1 = color       .. theme['dirbg']      .. ''
sep3 = log.RST     .. theme['char']       .. ''
sep2 = log.gray    .. theme['char'].bg    .. ''


if Opts.cursor != 0 and cursor[mode] and mode != 'git'
    Prompt.append cursor[mode]
    Prompt.append '\x1b[1K'

if Opts.psnum == 1
    Prompt.append theme['white'] .. bold .. theme[mode].bg " %n " 
    Prompt.append sep1
    Prompt.append theme['dir'] .. theme['dirbg'] .. " #{dir} " 
    Prompt.append sep2 
    --Prompt.append bold
    Prompt.if '?', theme['ok'], theme['err']
    Prompt.append ' %(!.#.$) ' .. log.RST
    Prompt.append sep3
    Prompt.append log.RST .. ' '
elseif Opts.psnum == 2
    Prompt.append log.gray .. theme['char'].bg .. ' … '
    Prompt.append sep3
    Prompt.append log.RST .. ' '
elseif mode == 'git'
    Prompt.append log.gray .. '' .. theme['dirbg'].bg
    Prompt.append log.xcolor(27) .. '  ' 
    Prompt.append theme['white'] 
    Prompt.append argv[2]
    Prompt.append ' ' .. log.RST

Prompt.write()
