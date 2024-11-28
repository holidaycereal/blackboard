-- colors/blackboard.lua
-- vim: noet nowrap

-- Setup
vim.opt.background = "dark"
vim.cmd("hi clear")
if vim.fn.exists("syntax_on")
	then vim.cmd("syntax reset")
end

-- Config tables
local config = {
	bg = "#181a18",
	fg = "#e0dbd1",

	grey_1 = "#1d201d",
	grey_2 = "#303431",
	grey_3 = "#505653",
	grey_4 = "#606663",
	grey_5 = "#808884",

	dark_red = "#9c3020",
	dark_green = "#2e642a",
	dark_cyan = "#007474",
	dark_blue = "#2f5c78",
	darker_blue = "#0f3c58",

	red = "#ee5b41",
	bright_orange = "#ffba5b",
	bright_green = "#54b254",

	green = "#9bcdb0",
	cyan = "#60d3d3",
	blue = "#60b3d3",
	magenta = "#d5a6c6",
	orange = "#fbcea0",

	highlight = {
		text = { fg = "fg" },
		non_text = { fg = "grey_4" },

		-- Syntax
		keywords = { fg = "blue" },
		directives = { fg = "dark_cyan" },
		types = { fg = "magenta" },
		constants = { fg = "orange" },
		values = { fg = "orange" },
		strings = { fg = "green" },
		variables = { fg = "fg" },
		variables_builtin = { fg = "fg", italic = true },
		functions = { fg = "fg" },
		operators = { fg = "fg" },
		punctuation = { fg = "fg" },
		comments = { fg = "grey_4" },
		annotations = { fg = "red" },

		markup_bold = { bold = true },
		markup_italic = { italic = true },
		markup_underline = { underline = true },
		markup_list = { fg = "blue" },
		markup_headings = { fg = "blue", bold = true },
		markup_raw = { fg = "red" },
		markup_links = { underline = true },
		xml_attributes = { fg = "fg" },
		xml_tags = { fg = "blue" },
		xml_delimiters = { fg = "grey_4" },

		-- User interface
		bad = { fg = "red", bold = true },
		warning = { fg = "bright_orange", bold = true },
		ok = { fg = "bright_green", bold = true },
		other = { fg = "cyan", bold = true },
		message = {},
		diff_add = { bg = "dark_green" },
		diff_change = { bg = "dark_cyan" },
		diff_remove = { bg = "dark_red" },
		folds = { fg = "grey_3", bg = "grey_1" },
		visual_mode = { bg = "darker_blue" },
		search_results = { bg = "darker_blue" },
		search_current = { bg = "dark_blue" },
		alt_bg = { bg = "grey_1" },
		line_nr = { fg = "grey_2" },
		cursor_line_nr = { fg = "grey_3", bg = "grey_1" },
		active = { reverse = true },
		inactive = { fg = "grey_5", bg = "grey_2" },
		p_menu = { fg = "grey_3", bg = "grey_5" },
		p_menu_sel = { fg = "bg", bg = "grey_4" },
	}
}

-- Map the custom colors to the custom groups
for group, property in pairs(config.highlight) do
	local hl = {}
	for key, value in pairs(property) do
		hl[key] = config[value] or value
	end
	vim.api.nvim_set_hl(0, group, hl)
end

-- Set background color
vim.api.nvim_set_hl(0, "Normal", { fg = config.fg, bg = config.bg })

-- Mappings to real groups
local mappings = {
	text = { "@property", "NormalNC", "NormalFloat", "FloatBorder", "Special", "SpecialChar", "FloatTitle", "FloatFooter", "@string.css", "@number.css" },
	non_text = { "@conceal", "Conceal", "Ignore", "TabLineFill",  "NonText", "SpecialKey", "Whitespace", "FoldColumn", "SignColumn", "CursorLineFold", "CursorLineSign", "EndOfBuffer" },

	-- Syntax
	keywords = { "Statement", "Conditional", "Repeat", "Keyword", "Exception", "@keyword", "@keyword.coroutine", "@keyword.function", "@keyword.operator", "@keyword.type", "@keyword.modifier", "@keyword.repeat", "@keyword.return", "@keyword.debug", "@keyword.exception", "@keyword.conditional", "@keyword.conditional.ternary", "@property.css", "@function.macro.commonlisp" },
	directives = { "PreProc", "Include", "Define", "Macro", "PreCondit", "@keyword.directive", "@keyword.directive.define", "@keyword.import" },
	types = { "Type", "StorageClass", "Structure", "Typedef", "@type", "@type.builtin", "@type.definition", "@module", "@module.builtin", "@tag.css" },
	values = { "Number", "Float", "Boolean", "@constant.builtin", "@boolean", "@number", "@number.float" },
	constants = { "Constant", "@constant", "@constant.macro" },
	strings = { "String", "Character", "@string", "@character", "@string.documentation", "@string.regexp", "@string.escape", "@string.special", "@string.special.symbol", "@string.special.path", "@string.special.url" },
	variables = { "Identifier", "@variable", "@variable.parameter", "@variable.member" },
	variables_builtin = { "@variable.builtin", "@variable.parameter.builtin" },
	functions = { "Function", "@function", "@function.call", "@function.macro", "@function.method", "@function.method.call", "@function.builtin", "@constructor" },
	operators = { "Operator", "@operator" },
	punctuation = { "Delimiter", "@punctuation", "@punctuation.delimiter", "@punctuation.bracket", "@punctuation.special" },
	comments = { "Comment", "SpecialComment", "@comment", "@comment.documentation", "DiagnosticUnnecessary" },
	annotations = { "@attribute", "@attribute.builtin", "Label", "@label" },

	markup_bold = { "@markup.strong" },
	markup_italic = { "@markup.italic" },
	markup_strikethrough = { "@markup.strikethrough" },
	markup_underline = { "Underlined", "DiffText", "@markup.underline" },
	markup_list = { "@markup.list", "@markup.list.checked", "@markup.list.unchecked" },
	markup_headings = { "@markup.heading", "@markup.heading.1", "@markup.heading.2", "@markup.heading.3", "@markup.heading.4", "@markup.heading.5", "@markup.heading.6", },
	markup_raw = { "@markup.quote", "@markup.math", "@markup.raw", "@markup.raw.block" },
	markup_links = { "@markup.link", "@markup.link.label", "@markup.link.url" },
	xml_attributes = { "@tag.attribute" },
	xml_tags = { "@tag", "@tag.builtin" },
	xml_delimiters = { "@tag.delimiter", "@tag.delimiter.html" },

	-- User interface
	bad = { "Error", "DiagnosticError", "DiagnosticVirtualTextError", "DiagnosticFloatingError", "DiagnosticSignError", "ErrorMsg", "@comment.error", "@comment.warning" },
	warning = { "DiagnosticWarn", "DiagnosticVirtualTextWarn", "DiagnosticFloatingWarn", "DiagnosticSignWarn", "WarningMsg" },
	ok = { "DiagnosticOk", "DiagnosticVirtualTextOk", "DiagnosticFloatingOk", "DiagnosticSignOk" },
	other = { "Debug", "Todo", "Directory", "Tag", "@comment.todo", "@comment.note", "DiagnosticInfo", "DiagnosticHint" },
	message = { "ModeMsg", "MsgArea", "MoreMsg", "Question" },
	diff_add = { "DiffAdd", "Added" },
	diff_change = { "DiffChange", "Changed" },
	diff_remove = { "DiffDelete", "Removed" },
	folds = { "Folded" },
	visual_mode = { "Visual", "VisualNOS" },
	search_results = { "Search", "Substitute" },
	search_current = { "CurSearch", "IncSearch", "QuickFixLine", "SnippetTabstop", "MatchParen" },
	alt_bg = { "CursorLine", "CursorColumn", "ColorColumn" },
	line_nr = { "LineNr", "LineNrAbove", "LineNrBelow" },
	cursor_line_nr = { "CursorLineNr" },
	active = { "StatusLine", "TabLineSel", "WinBar"},
	inactive = { "StatusLineNC", "TabLine", "WinBarNC" },
	p_menu = { "Pmenu", "PmenuKind", "PmenuExtra", "WildMenu" },
	p_menu_sel = { "PmenuSel", "PmenuKindSel", "PmenuExtraSel", "PmenuThumb" },
}

-- Finally, apply the mappings
for custom_group, target_group in pairs(mappings) do
	for _, target_group in ipairs(target_group) do
		vim.api.nvim_set_hl(0, target_group, { link = custom_group })
	end
end

vim.g.colors_name = "blackboard"
