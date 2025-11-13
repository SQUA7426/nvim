local ls = require "luasnip"

local snip = ls.snippet
local n = ls.node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

vim.keymap.set({ 'i', 's' }, '<C-j>', function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true, desc = "luasnip change_choice(1)" })

vim.keymap.set({ 'i', 's' }, '<C-k>', function()
    if ls.choice_active() then
        ls.change_choice(-1)
    end
end, { silent = true, desc = "luasnip change_choice(-1)" })


ls.add_snippets({ "tex", "latex" }, {
  snip({
    trig = "doc",
    name = "LaTeX Document",
    desc = "Creates a LaTeX document skeleton",
  }, {
    t({ "\\documentclass{article}", "\\begin{document}" }),
    i(1, "Your text here"),
    t({ "", "\\end{document}" }),
  }),
})
require("luasnip-latex-snippets").extend({
  custom = {
    s("doc", {
      t({ "\\documentclass{article}", "\\begin{document}" }),
      i(1, "Your text here"),
      t({ "", "\\end{document}" }),
    }),
  },
})

