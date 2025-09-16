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

ls.add_snippets("scala", {
    snip({
        trig = "foreach",
        name = "foreach",
        desc = "foreach Loop"
    }, {
        t("foreach("),
        i(1, "action"),
        t(")")
    }
    ),
    snip({
        trig = "groupBy",
        name = "groupBy",
        desc = "Create a groupBy"
    }, {
        t("groupBy("),
        i(1, "identity"),
        t(")")
    }
    ),
    snip({
        trig = "println",
        name = "println",
        desc = "Create a println"
    }, {
        t("println("),
        i(1, "Hello, World!"),
        t(")")
    }
    ),
    snip({
        trig = "filter",
        name = "filter",
        desc = "Create a filter switching between '==', t'!=', '>', '<', '>=' and '<=' with <C-j> and <C-k>"
    }, {
        t("filter("),
        i(1, "variable"),
        t(" "),
        c(2, { t("=="), t("!="), t(">"), t("<"), t(">="), t("<=") }),
        t(" "),
        i(3, "value"),
        t(")")
    }
    ),
    snip({
        trig = "map",
        name = "map",
        desc = "Create a map and choosing between 'i => i', '_._1' and '_._2' with <C-j> and <C-k>"
    }, {
        t("map("),
        c(1, { { i(1, "i"), t(" => "), i(2, "i") }, t("_._1"), t("_._2"), }),
        t(")")
    }
    ),
    snip({
        trig = "maxBy",
        name = "maxBy",
        desc = "Create a maxBy and choosing between 'i => i', '_._1' and '_._2' with <C-j> and <C-k>"
    }, {
        t("maxBy("),
        c(1, { t("_._1"), t("_._2"), }),
        t(")")
    }
    ),
    snip({
        trig = "minBy",
        name = "minBy",
        desc = "Create a minBy and choosing between 'i => i', '_._1' and '_._2' with <C-j> and <C-k>"
    }, {
        t("minBy("),
        c(1, { t("_._1"), t("_._2"), }),
        t(")")
    }
    ),
    snip({
        trig = "zipWithIndex",
        name = "zipWithIndex",
        desc = "zipWithIndex"
    }, {
        t("zipWithIndex"),
    }
    ),
    snip({
        trig = "var",
        name = "var1",
        desc = "Create a var"
    }, {
        t("var "),
        i(1, "varname"),
        t(" = "),
        i(2, "value")
    }
    ),
    snip({
        trig = "var",
        name = "var2",
        desc = "Create a var"
    }, {
        t("var "),
        i(1, "varname"),
        t(": "),
        i(2, "type"),
        t(" = "),
        i(3, "value")
    }
    ),
    snip({
        trig = "val",
        name = "val1",
        desc = "Create a val"
    }, {
        t("val "),
        i(1, "valname"),
        t(" = "),
        i(2, "value")
    }
    ),
    snip({
        trig = "val",
        name = "val2",
        desc = "Create a val"
    }, {
        t("val "),
        i(1, "valname"),
        t(": "),
        i(2, "type"),
        t(" = "),
        i(3, "value")
    }
    ),
    snip({
        trig = "list",
        name = "list1",
        desc = "Create a list"
    }, {
        t("val "),
        i(1, "listname"),
        t(": List["),
        i(2, "type"),
        t("] = List("),
        i(3, "elements"),
        t(")")
    }
    ),
    snip({
        trig = "list",
        name = "list2",
        desc = "Create a list"
    }, {
        t("var "),
        i(1, "listname"),
        t(": List["),
        i(2, "type"),
        t("] = List("),
        i(3, "elements"),
        t(")")
    }
    ),
    snip({
        trig = "List",
        name = "List",
        desc = "Create a List"
    }, {
        t("List("),
        i(1, "elements"),
        t(")")
    }
    ),
    snip({
        trig = "seq",
        name = "seq1",
        desc = "Create a seq"
    }, {
        t("val "),
        i(1, "seqname"),
        t(": Seq["),
        i(2, "type"),
        t("] = Seq("),
        i(3, "elements"),
        t(")")
    }
    ),
    snip({
        trig = "seq",
        name = "seq2",
        desc = "Create a seq"
    }, {
        t("var "),
        i(1, "seqname"),
        t(": Seq["),
        i(2, "type"),
        t("] = Seq("),
        i(3, "elements"),
        t(")")
    }
    ),
    snip({
        trig = "Seq",
        name = "Seq",
        desc = "Create a Seq"
    }, {
        t("Seq("),
        i(1, "elements"),
        t(")")
    }
    ),
    snip({
        trig = "arraybuffer",
        name = "arraybuffer1",
        desc = "Create a arraybuffer"
    }, {
        t("val "),
        i(1, "arraybuffername"),
        t(": ArrayBuffer["),
        i(2, "type"),
        t("] = ArrayBuffer("),
        i(3, "elements"),
        t(")")
    }
    ),
    snip({
        trig = "arraybuffer",
        name = "arraybuffer2",
        desc = "Create a arraybuffer"
    }, {
        t("var "),
        i(1, "arraybuffername"),
        t(": ArrayBuffer["),
        i(2, "type"),
        t("] = ArrayBuffer("),
        i(3, "elements"),
        t(")")
    }
    ),
    snip({
        trig = "ArrayBuffer",
        name = "ArrayBuffer",
        desc = "Create a ArrayBuffer"
    }, {
        t("ArrayBuffer("),
        i(1, "elements"),
        t(")")
    }
    ),
    snip({
        trig = "array",
        name = "array1",
        desc = "Create a array"
    }, {
        t("val "),
        i(1, "arrayname"),
        t(": Array["),
        i(2, "type"),
        t("] = Array("),
        i(3, "elements"),
        t(")")
    }
    ),
    snip({
        trig = "array",
        name = "array2",
        desc = "Create a array"
    }, {
        t("var "),
        i(1, "arrayname"),
        t(": Array["),
        i(2, "type"),
        t("] = Array("),
        i(3, "elements"),
        t(")")
    }
    ),
    snip({
        trig = "Array",
        name = "Array",
        desc = "Create a Array"
    }, {
        t("Array("),
        i(1, "elements"),
        t(")")
    }
    ),
    snip({
        trig = "buffer",
        name = "buffer1",
        desc = "Create a buffer"
    }, {
        t("val "),
        i(1, "buffername"),
        t(": Buffer["),
        i(2, "type"),
        t("] = Buffer("),
        i(3, "elements"),
        t(")")
    }
    ),
    snip({
        trig = "buffer",
        name = "buffer2",
        desc = "Create a buffer"
    }, {
        t("var "),
        i(1, "buffername"),
        t(": Buffer["),
        i(2, "type"),
        t("] = Buffer("),
        i(3, "elements"),
        t(")")
    }
    ),
    snip({
        trig = "Buffer",
        name = "Buffer",
        desc = "Create a Buffer"
    }, {
        t("Buffer("),
        i(1, "elements"),
        t(")")
    }
    ),
})
