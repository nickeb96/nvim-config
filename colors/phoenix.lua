
-- if vim.o.background == "dark" then
-- end


vim.g.colors_name = "phoenix"

local function h(group, settings)
  vim.api.nvim_set_hl(0, group, settings)
end


-- color names came from: https://coolors.co

local palette = {
  blush =         "#E7688C",
  rose =          "#E9819E",
  cerise =        "#E43F6F",
  jasper =        "#ED6A5A",
  tangerine =     "#FF8C57",
  orange_peel =   "#FFAC4D", -- special strings & special chars
  fawn =          "#FBBA72", -- strings & chars
  sunset =        "#FFD19C", -- string escape
  saffron =       "#FACA70",
  maize =         "#FAE870",
  mindaro =       "#C6DC78", -- traits
  pistachio =     "#A4C98F", -- types
  celadon =       "#AEE0AF",
  turquoise =     "#43D7AB", -- builtin types
  robin_egg =     "#65D5C9",
  sky =           "#86D2E6", -- functions
  moonstone =     "#75B8C8",
  celestial =     "#008DD5",
  vista =         "#7796CB", -- keywords & constructors
  powder_blue =   "#93ADC4", -- operator & text literal
  gray =          "#A8B3BD", -- punctuation
  mauve =         "#BDACFA", -- literals & builtin constants
  periwinkle =    "#E3DBFF", -- constants

  ice =           "#C6EBF5",

  bright_white =  "#FFFFFF",

  amaranth1 =     "#D595B4",
  amaranth =      "#E0A3C1",

  fairy_tale =    "#F0C5CD",

  melon =         "#FFA79C",
  melon2 =        "#FCB9B1",

  coral =         "#FF8E80",

  coffee =        "#644536",
  redwood =       "#B2675E",
  beaver =        "#B67B6A",

  peach =         "#FFBB9C",

  indian =        "#E15554",
  imperial =      "#E54747",


  -- coral =         "#F59589",
  -- peach = "#ffbe99",
  -- lime =          "#AEF78E",
  -- arylide =       "#E9D66B",
  -- robin_egg = "#36C9C6", -- too dim
  -- aquamarine = "#42E2B8", -- too bright
  -- builtin_type = "#2BC2B1",
  -- old_keyword = "#DB5375",
  -- type = "#7EA16B",
}

local accent = {
  viridian =      "#478978",
  viridian2 =     "#619084",
  prussian =      "#2D5882",
  kagi_link =     "#8AB4F8",
  inset_bg_soft = "#0e1319",
  inset_bg =      "#0c1016",
}

local heading_shades = {
  "#FF8C57",
  "#FDA075",
  "#FAB392",
  "#F8C7B0",
  "#F8C7B0",
  "#F8C7B0",
}


local foreground = "#FFE7D9"
local background = "#12171d"
local dim_foreground = "#b1978a"

local very_dim_foreground = "#735b4f"


-- local com = "#667f58"
-- local com = "#8ca87b"
-- local com = "#a4c98f"


local tan_wide = {
  "#735b4f", -- very_dim_foreground
  "#7b6357",
  "#836a5e",
  "#8b7266",
  "#92796d",
  "#9a8175",
  "#a2887c",
  "#aa9083",
  "#b1978a", -- dim_foreground
  "#bba194",
  "#c5ab9e",
  "#cfb5a8",
  "#d8bfb2",
  "#e2c9bc",
  "#ecd3c6",
  "#f6ddd0",
  "#ffe7d9", -- foreground
}

local tan = {
  "#735b4f", -- very_dim_foreground
  "#836a5e",
  "#92796d",
  "#a2887c",
  "#b1978a", -- dim_foreground
  "#c5ab9e",
  "#d8bfb2",
  "#ecd3c6",
  "#ffe7d9", -- foreground
}

local gray = {
  "#12171d",
  "#21272e",
  "#2f363e",
  "#3e464e",
  "#4c555e",
  "#5a636d",
  "#67717c",
  "#6e7884",
  "#757f8b",
  "#7c8692",
  "#828c99",
}

local terminal = {
  dim = {
    black = "#000000",
    white = "#828c99",
    red = "#d14955",
    orange = "#d57950",
    yellow = "#d9a94a",
    chartreuse = "#a49d56",
    green = "#6e9161",
    spring = "#4a9692",
    cyan = "#259bc2",
    azure = "#4490d7",
    blue = "#6385eb",
    violet = "#7073d7",
    magenta = "#7d61c2",
    rose = "#a7558c",
  },
  normal = {
    black = "#2c2f33",
    white = "#ede3d6",
    red = "#ff5a55",
    orange = "#fea269",
    yellow = "#fce97d",
    chartreuse = "#d4ea87",
    green = "#abeb91",
    spring = "#6edfb2",
    cyan = "#31d3d3",
    azure = "#5acae9",
    blue = "#82c1ff",
    violet = "#9b8bfb",
    magenta = "#b354f7",
    rose = "#d957a6",
  },
  bright = {
    black = "#4c555e",
    white = "#ffffff",
    red = "#ff9794",
    orange = "#ffcba5",
    yellow = "#ffffb5",
    chartreuse = "#e4f3ba",
    green = "#c9e6be",
    spring = "#b9e9d5",
    cyan = "#a9ebeb",
    azure = "#b2e4f5",
    blue = "#baddff",
    violet = "#dbc2f1",
    magenta = "#fca7e3",
    rose = "#fe9fbc",
  }
}



h("Normal", {fg = foreground, bg = background})
h("Visual", {bg = gray[4]})
h("SpellBad", {sp = terminal.bright.red, undercurl = true})
h("SpellCap", {sp = terminal.bright.yellow, undercurl = true})
h("SpellRare", {sp = terminal.bright.magenta, undercurl = true})
h("SpellLocal", {sp = terminal.bright.magenta, undercurl = true})

-- Literals
h("@boolean", {fg = palette.mauve})
h("@character", {link = "@string"})
h("@character.special", {link = "@string.special"})
h("@string", {fg = palette.fawn})
h("@string.escape", {fg = palette.sunset, bold = true})
h("@string.special", {fg = palette.orange_peel})
h("@number", {fg = palette.mauve})
h("@float", {fg = palette.mauve})

-- Constant Identifiers
h("@constant", {fg = palette.periwinkle})
h("@constant.builtin", {fg = palette.mauve})
h("@constant.macro", {fg = palette.beaver, italic = true})
h("@constant.parameter", {fg = palette.periwinkle, italic = true})

-- Variable Identifiers
h("@variable", {fg = foreground})
h("@variable.builtin", {fg = foreground, bold = true})
h("@parameter", {fg = foreground, italic = true})
h("@field", {fg = palette.ice})
h("@property", {link = "@field"})
h("@namespace", {fg = palette.sky})
h("@namespace.builtin", {fg = palette.sky, bold = true})

-- Callable Identifiers
h("@function", {fg = palette.sky})
h("@function.call", {link = "@function"})
h("@function.builtin", {fg = palette.sky, bold = true})
h("@function.macro", {fg = palette.beaver, italic = true})
h("@method", {fg = palette.sky})
h("@method.call", {link = "@method"})
h("@constructor", {fg = palette.vista})

-- Type Identifiers
h("@type", {fg = palette.pistachio})
h("@type.builtin", {fg = palette.turquoise})
h("@type.qualifier", {fg = palette.coral})
-- "@type.struct"
-- "@type.enum"
-- "@type.enum.variant"
-- "@type.union"
-- "@type.class"
h("@type.interface", {fg = palette.mindaro})
h("@type.definition", {link = "@type"})
h("@type.parameter", {fg = palette.pistachio, italic = true})
h("@interface", {link = "@type.interface"})

h("@attribute", {fg = accent.viridian})
-- "@preproc"
-- "@define"
h("@macro", {})

h("@comment", {fg = gray[8], italic = true})
h("@comment.documentation", {fg = gray[6], nocombine = true})

h("@storageclass", {link = "@type.qualifier"})
h("@storageclass.lifetime", {fg = palette.orange_peel, italic = true})


h("@punctuation", {fg = palette.gray})
-- "@punctuation.bracket"
-- "@punctuation.delimiter"
-- "@punctuation.special"


h("@keyword", {fg = palette.vista})
h("@keyword.operator", {link = "@keyword"})
h("@conditional", {link = "@keyword"})
h("@repeat", {link = "@keyword"})
h("@exception", {link = "@keyword"})
h("@include", {link = "@keyword"})

h("@label", {fg = palette.jasper})

h("@operator", {fg = palette.powder_blue})

h("@tag", {fg = palette.jasper})
h("@tag.attribute", {fg = palette.tangerine})
h("@tag.delimiter", {fg = palette.powder_blue})

-- highlight("@debug", {fg = bright.magenta})


-- Default vim groups linked to treesitter groups

h("Comment", {link = "@comment"})

h("Constant", {link = "@constant"})
h("Boolean", {link = "@boolean"})
h("Character", {link = "@character"})
h("String", {link = "@string"})
h("Number", {link = "@number"})
h("Float", {link = "@float"})

h("Identifier", {link = "@variable"})
h("Function", {link = "@function"})

h("Statement", {link = "keyword"})
h("Keyword", {link = "@keyword"})
h("Conditional", {link = "@conditional"})
h("Repeat", {link = "@repeat"})
h("Exception", {link = "@exception"})
h("Label", {link = "@label"})
h("Operator", {link = "@operator"})

h("PreProc", {link = "@preproc"})
h("Include", {link = "PreProc"})
h("Define", {link = "PreProc"})
h("Macro", {link = "PreProc"})
h("PreCondit", {link = "PreProc"})

h("Type", {link = "@type"})
h("StorageClass", {link = "@storageclass"})
h("Structure", {link = "@type.struct"})
h("Typedef", {link = "@type.definition"})

h("Special", {link = "@string.special"})
h("SpecialChar", {link = "@character.special"})
h("Tag", {link = "Special"})
h("Delimiter", {link = "@punctuation.delimiter"})
h("SpecialComment", {link = "@comment.documentation"})
h("Debug", {link = "@debug"})
h("SpecialKey", {fg = accent.prussian})

-- -- -- --


h("MatchParen", {fg = terminal.bright.white, bold = true})


h("Error", {fg = terminal.normal.blush})
h("Todo", {link = "@text.todo"})
h("Underline", {link = "@text.underline"})
h("Title", {link = "@text.title"})





h("@lsp.type.keyword", {link = "@keyword"})
h("@lsp.type.operator", {link = "@operator"})
h("@lsp.type.macro", {link = "@function.macro"})
h("@lsp.type.function", {link = "@function"})
h("@lsp.type.method", {link = "@method"})
h("@lsp.type.constParameter", {link = "@constant.parameter"})
h("@lsp.type.typeParameter", {link = "@type.parameter"})
h("@lsp.type.typeAlias", {link = "@type.definition"})
h("@lsp.type.type", {link = "@type"})
h("@lsp.type.builtinType", {link = "@type.builtin"})
h("@lsp.type.struct", {link = "@type.struct"})
h("@lsp.type.enum", {link = "@type.enum"})
h("@lsp.type.enumMember", {link = "@type.enum.variant"})
h("@lsp.type.interface", {link = "@type.interface"})
h("@lsp.type.namespace", {link = "@namespace"})
h("@lsp.type.variable", {link = "@variable"})
h("@lsp.type.parameter", {link = "@parameter"})
h("@lsp.type.property", {link = "@field"})

h("@lsp.type.string", {link = "@string"})
h("@lsp.type.character", {link = "@character"})
h("@lsp.type.number", {link = "@number"})
h("@lsp.type.float", {link = "@float"})
h("@lsp.type.boolean", {link = "@boolean"})

h("@lsp.type.comment", {link = "@lsp"})
h("@lsp.type.punctuation", {link = "@punctuation"})

h("@lsp.mod.attribute", {link = "@attribute"})
h("@lsp.mod.documentation", {link = "@comment.documentation"})

h("@lsp.typemod.variable.static", {link = "@constant"})
h("@lsp.typemod.keyword.crateRoot", {link = "@namespace.builtin"})

h("@lsp.typemod.arithmetic.injected", {link = "@operator"})
h("@lsp.typemod.bitwise.injected", {link = "@operator"})
h("@lsp.typemod.logical.injected", {link = "@operator"})
h("@lsp.typemod.comparison.injected", {link = "@operator"})

h("@lsp.type.unresolvedReference", {strikethrough = true, sp = palette.gray})


h("LineNr", {fg = gray[4]})
h("NonText", {fg = gray[4]})
h("EndOfBuffer", {fg = gray[4]})

h("Conceal", {fg = gray[4]})
-- highlight("Whitespace")

h("Folded", {fg = gray[4]})
h("FoldColumn", {link = "LineNr"})

h("IncSearch", {fg = terminal.bright.yellow, bg = terminal.dim.yellow, bold = true})
h("Search", {fg = terminal.bright.yellow, bg = terminal.bright.black})
h("CurSearch", {fg = terminal.dim.yellow, bg = terminal.normal.yellow})
h("Substitute", {fg = background, bg = terminal.normal.orange})


h("Pmenu", {bg = terminal.bright.black})
h("PmenuSel", {bg = terminal.dim.white})
h("PmenuSbar", {bg = terminal.dim.white})
h("PmenuThumb", {bg = terminal.bright.white})
h("StatusLine", {fg = background, bg = foreground, bold = true})
h("StatusLineNC", {fg = background, bg = dim_foreground})
h("WinSeparator", {link = "Normal"})

h("FloatBorder", {fg = terminal.bright.black})
h("NormalFloat", {bg = terminal.normal.black})


-- highlight("MsgArea", {bg = background})
-- highlight("MsgSeparator", {fg = extra.blush, bg = bright.blue})
-- highlight("ModeMsg", {fg = extra.blush})
-- highlight("MoreMsg", {fg = normal.chartreuse})

-- highlight("Question", {fg = normal.chartreuse})


h("ErrorMsg", {link = "DiagnosticError"})
h("WarningMsg", {link = "DiagnosticWarn"})


h("DiagnosticError", {fg = terminal.normal.red})
h("DiagnosticWarn", {fg = terminal.normal.yellow})
h("DiagnosticInfo", {fg = terminal.normal.cyan})
h("DiagnosticHint", {fg = terminal.bright.cyan})
h("DiagnosticOk", {fg = terminal.normal.green})
h("DiagnosticUnnecessary", {})


h("@text", {fg = foreground})
h("@text.title", {fg = palette.cerise, bold = true})

h("@text.title.1", {fg = heading_shades[1]})
h("@text.title.1.marker", {fg = palette.gray})
h("@text.title.2", {fg = heading_shades[2]})
h("@text.title.2.marker", {fg = palette.gray})
h("@text.title.3", {fg = heading_shades[3]})
h("@text.title.3.marker", {fg = palette.gray})
h("@text.title.4", {fg = heading_shades[4]})
h("@text.title.4.marker", {fg = palette.gray})
h("@text.title.5", {fg = heading_shades[5]})
h("@text.title.5.marker", {fg = palette.gray})
h("@text.title.6", {fg = heading_shades[6]})
h("@text.title.6.marker", {fg = palette.gray})

h("@text.literal", {fg = palette.powder_blue})
h("@text.math", {fg = foreground})
h("@text.uri", {fg = palette.sky, underline = true})
h("@text.reference", {fg = palette.pistachio})

h("@text.emphasis", {italic = true})
h("@text.strong", {bold = true})
h("@text.strike", {strikethrough = true})
h("@text.underline", {underline = true})

h("@text.todo", {fg = palette.fawn})
h("@text.note", {fg = palette.powder_blue})
h("@text.warning", {fg = terminal.normal.yellow})
h("@text.danger", {fg = terminal.normal.red})


h("DiffAdd", {fg = terminal.normal.green, bg = gray[2]})
h("DiffDelete", {fg = terminal.normal.red})
h("DiffChange", {})
h("DiffText", {fg = terminal.bright.blue, bg = gray[2]})

h("diffAdded", {fg = terminal.normal.green})
h("diffChanged", {fg = terminal.bright.blue})
h("diffRemoved", {fg = terminal.normal.red})
h("diffLine", {italic = true})


h("Directory", {fg = terminal.normal.blue})

h("netrwDir", {link = "Directory"})
h("netrwSymLink", {fg = terminal.normal.cyan})
h("netrwLink", {fg = terminal.bright.black})
h("netrwSpecial", {fg = terminal.normal.magenta})
h("netrwExe", {fg = terminal.normal.green})
h("netrwPlain", {fg = foreground})
h("netrwClassify", {fg = background})

h("tarDirectory", {link = "Directory"})
h("tarFilename", {link = "Title"})


h("fish_color_normal", {fg = foreground})
h("fish_color_command", {fg = terminal.bright.green})
h("fish_color_keyword", {fg = terminal.bright.green})
h("fish_color_option", {fg = foreground})
h("fish_color_param", {fg = foreground})
h("fish_color_escape", {fg = terminal.bright.yellow, bold = true})
h("fish_color_quote", {fg = terminal.bright.yellow})
h("fish_color_operator", {fg = terminal.bright.cyan})
h("fish_color_redirection", {fg = terminal.bright.blue})
h("fish_color_end", {fg = terminal.dim.cyan})
h("fish_color_comment", {fg = terminal.bright.black, italic = true})


h("healthError", {fg = terminal.normal.red})
h("healthSuccess", {fg = terminal.normal.green})
h("healthWarning", {fg = terminal.normal.yellow})


h("TSDefinitionUsage", {underline = true, sp = palette.tangerine})
h("TSDefinition", {underline = true, sp = palette.tangerine})
h("TSCurrentScope", {bg = accent.inset_bg})

