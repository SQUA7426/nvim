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
        trig = "import",
        name = "import",
        desc = "import scala lib"
    }, {
        c(1, {
            t("import scala.collection.mutable.Array"),
            t("import scala.collection.immutable.Array"),
            t("import scala.collection.mutable.ArrayBuffer"),
            t("import scala.collection.immutable.ArrayBuffer"),
            t("import scala.collection.mutable.List"),
            t("import scala.collection.immutable.List"),
            t("import scala.collection.mutable.Seq"),
            t("import scala.collection.immutable.Seq"),
            t("import scala.collection.mutable.Set"),
            t("import scala.collection.immutable.Set"),
            t("import scala.collection.mutable.Map"),
            t("import scala.collection.immutable.Map"),
        })
    }
    ),
    snip({
        trig = "sortBy",
        name = "sortBy",
        desc = "sortBy either by x=>x (asc), x=>-x (desc), '_._1' or '_._2'"
    }, {
        c(1, { {
            t("sortBy("),
            i(1, "action"),
            t(")")
        }, {
            t("sortBy("),
            i(1, "x"),
            t(" => "),
            i(2, "x"),
            t(")")
        }, {
            t("sortBy("),
            i(1, "x"),
            t(" => "),
            i(2, "-x"),
            t(")")
        }, {
            t("sortBy("),
            i(1, "_._1"),
            t(")")
        }, {
            t("sortBy("),
            i(1, "_._2"),
            t(")")
        } })
    }
    ),
    snip({
        trig = "if",
        name = "if",
        desc = "if"
    }, {
        t("if("),
        i(1, "condition"),
        t(") { "),
        i(2, "do:"),
        t(" }")
    }
    ),
    snip({
        trig = "if...else",
        name = "if...else",
        desc = "if...else"
    }, {
        t("if("),
        i(1, "condition"),
        t(") { "),
        i(2, "do:"),
        t(" } else if("),
        i(3, "condition"),
        t(") { "),
        i(4, "do:"),
        t(" } else { "),
        i(5, "do:"),
        t("}")
    }
    ),
    snip({
        trig = "if...elseif...else",
        name = "ifelse",
        desc = "ifelse"
    }, {
        t("if("),
        i(1, "condition"),
        t(") { "),
        i(2, "do:"),
        t(" } else { "),
        i(3, "do:"),
        t("}")
    }
    ),
    snip({
        trig = "foreach",
        name = "foreach",
        desc = "foreach Loop switching between i => i and (action) with '<C-j>' and '<C-k>'"
    }, {
        t("foreach("),
        c(1, { { i(1, "i"), t(" => "), i(2, "i") }, i(1, "action")}),
        t(")")
    }
    ),
    snip({
        trig = "for",
        name = "for",
        desc = "for Loop"
    }, {
        t("for("),
        i(1, "element"),
        t(" <- "),
        i(2, "elements"),
        t(") { "),
        i(3, "do:"),
        t(" }")
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
        trig = "length",
        name = "length",
        desc = "length"
    }, {
        t("length")
    }
    ),
    snip({
        trig = "toDouble",
        name = "toDouble",
        desc = "toDouble"
    }, {
        t("toDouble")
    }
    ),
    snip({
        trig = "toLong",
        name = "toLong",
        desc = "String to Long"
    }, {
        t("toDouble.toLong")
    }
    ),
    snip({
        trig = "toInt",
        name = "toInt",
        desc = "toInt"
    }, {
        t("toInt")
    }
    ),
    snip({
        trig = "asChar",
        name = "asChar",
        desc = "Int asChar"
    }, {
        t("asChar")
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
        trig = "toSet",
        name = "toSet",
        desc = "toSet"
    }, {
        t("toSet")
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
        trig = "toArray",
        name = "toArray",
        desc = "toArray"
    }, {
        t("toArray")
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
        trig = "to",
        name = "to",
        desc = "from lowerbound (included) to upperbound (included)"
    }, {
        i(1, "_"),
        t(" to "),
        i(2, "_")
    }
    ),
    snip({
        trig = "to ... by",
        name = "to-by",
        desc = "from lowerbound (included) to upperbound (included) by step"
    }, {
        i(1, "_"),
        t(" to "),
        i(2, "_"),
        t(" by "),
        i(3, "step")
    }
    ),
    snip({
        trig = "until",
        name = "until",
        desc = "from lowerbound (included) until upperbound (excluded)"
    }, {
        i(1, "_"),
        t(" until "),
        i(2, "_")
    }
    ),
    snip({
        trig = "until ... by",
        name = "until-by",
        desc = "from lowerbound (included) until upperbound (excluded) by step"
    }, {
        i(1, "_"),
        t(" until "),
        i(2, "_"),
        t(" by "),
        i(3, "step")
    }
    ),
    snip({
        trig = "Range",
        name = "Range",
        desc = "from lowerbound (included) to upperbound (exluded)"
    }, {
        t("Range("),
        i(1, "_"),
        t(","),
        i(2, "_"),
        t(")")
    }
    ),
    snip({
        trig = "Range.inclusive",
        name = "Range.inclusive",
        desc = "from lowerbound (included) to upperbound (included)"
    }, {
        t("Range.inclusive("),
        i(1, "_"),
        t(","),
        i(2, "_"),
        t(")")
    }
    ),
    snip({
        trig = "start",
        name = "start",
        desc = "start of a Range"
    }, {
        t("start")
    }
    ),
    snip({
        trig = "end",
        name = "end",
        desc = "end of a normal Range"
    }, {
        t("end")
    }
    ),
    snip({
        trig = "last",
        name = "last",
        desc = "last of an inclusive Range"
    }, {
        t("last")
    }
    ),
    snip({
        trig = "step",
        name = "step",
        desc = "step of a Range"
    }, {
        t("step")
    }
    ),
    snip({
        trig = "compare",
        name = "compare",
        desc = "compare two Ints"
    }, {
        t("compare("),
        i(1, "value"),
        t(")")
    }
    ),
    snip({
        trig = "compareTo",
        name = "compareTo",
        desc = "compareTo two Strings"
    }, {
        t("compareTo("),
        i(1, "String"),
        t(")")
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
        trig = "Set",
        name = "Set",
        desc = "Create a Set"
    }, {
        c(1, { {
            t("val "),
            i(1, "Seqname"),
            t(": Set["),
            i(2, "type"),
            t("] = Set("),
            i(3, "elements"),
            t(")") }
        , {
            t("var "),
            i(1, "Seqname"),
            t(": Set["),
            i(2, "type"),
            t("] = Set("),
            i(3, "elements"),
            t(")") }
        , {
            t("Set("),
            i(1, "elements"),
            t(")") }
        , {
            t("Set["),
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
