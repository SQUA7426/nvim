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
        trig = "min",
        name = "min",
        desc = "find min"
    }, {
        t("min")
    }
    ),
    snip({
        trig = "max",
        name = "max",
        desc = "find max"
    }, {
        t("max")
    }
    ),
    snip({
        trig = "toList",
        name = "toList",
        desc = "toList"
    }, {
        t("toList")
    }
    ),
    snip({
        trig = "toSeq",
        name = "toSeq",
        desc = "toSeq"
    }, {
        t("toSeq")
    }
    ),
    snip({
        trig = "flatten",
        name = "flatten",
        desc = "flatten"
    }, {
        t("flatten")
    }
    ),
    snip({
        trig = "distinct",
        name = "distinct",
        desc = "distinct removes duplicates"
    }, {
        t("distinct")
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
        trig = "identity",
        name = "identity",
        desc = "identity: i => i"
    }, {
        t("identity")
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
        trig = "mapValues",
        name = "mapValues",
        desc = "mapValues takes a function B => C, where C is the new type for the values."
    }, {
        t("mapValues(("),
        i(1, "C"),
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
        trig = "Buffer",
        name = "Buffer",
        desc = "Create a Buffer"
    }, {
        c(1, { {
            t("val "),
            i(1, "Buffername"),
            t(": Buffer["),
            i(2, "type"),
            t("] = Buffer("),
            i(3, "elements"),
            t(")") }
        , {
            t("var "),
            i(1, "Buffername"),
            t(": Buffer["),
            i(2, "type"),
            t("] = Buffer("),
            i(3, "elements"),
            t(")") }
        , {
            t("Buffer("),
            i(1, "elements"),
            t(")") }
        , {
            t("Buffer["),
            i(2, "type"),
            t("]("),
            i(3, "elements"),
            t(")") }
        }),
    }
    ),
    snip({
        trig = "ArrayBuffer",
        name = "ArrayBuffer",
        desc = "Create a ArrayBuffer"
    }, {
        c(1, { {
            t("val "),
            i(1, "ArrayBuffername"),
            t(": ArrayBuffer["),
            i(2, "type"),
            t("] = ArrayBuffer("),
            i(3, "elements"),
            t(")") }
        , {
            t("var "),
            i(1, "ArrayBuffername"),
            t(": ArrayBuffer["),
            i(2, "type"),
            t("] = ArrayBuffer("),
            i(3, "elements"),
            t(")") }
        , {
            t("ArrayBuffer("),
            i(1, "elements"),
            t(")") }
        , {
            t("ArrayBuffer["),
            i(2, "type"),
            t("]("),
            i(3, "elements"),
            t(")") }
        }),
    }
    ),
    snip({
        trig = "List",
        name = "List",
        desc = "Create a List"
    }, {
        c(1, { {
            t("val "),
            i(1, "Listname"),
            t(": List["),
            i(2, "type"),
            t("] = List("),
            i(3, "elements"),
            t(")") }
        , {
            t("var "),
            i(1, "Listname"),
            t(": List["),
            i(2, "type"),
            t("] = List("),
            i(3, "elements"),
            t(")") }
        , {
            t("List("),
            i(1, "elements"),
            t(")") }
        , {
            t("List["),
            i(2, "type"),
            t("]("),
            i(3, "elements"),
            t(")") }
        }),
    }
    ),
    snip({
        trig = "Array",
        name = "Array",
        desc = "Create a Array"
    }, {
        c(1, { {
            t("val "),
            i(1, "Arrayname"),
            t(": Array["),
            i(2, "type"),
            t("] = Array("),
            i(3, "elements"),
            t(")") }
        , {
            t("var "),
            i(1, "Arrayname"),
            t(": Array["),
            i(2, "type"),
            t("] = Array("),
            i(3, "elements"),
            t(")") }
        , {
            t("Array("),
            i(1, "elements"),
            t(")") }
        , {
            t("Array["),
            i(2, "type"),
            t("]("),
            i(3, "elements"),
            t(")") }
        }),
    }
    ),
    snip({
        trig = "Seq",
        name = "Seq",
        desc = "Create a Seq"
    }, {
        c(1, { {
            t("val "),
            i(1, "Seqname"),
            t(": Seq["),
            i(2, "type"),
            t("] = Seq("),
            i(3, "elements"),
            t(")") }
        , {
            t("var "),
            i(1, "Seqname"),
            t(": Seq["),
            i(2, "type"),
            t("] = Seq("),
            i(3, "elements"),
            t(")") }
        , {
            t("Seq("),
            i(1, "elements"),
            t(")") }
        , {
            t("Seq["),
            i(2, "type"),
            t("]("),
            i(3, "elements"),
            t(")") }
        }),
    }
    ),
})
