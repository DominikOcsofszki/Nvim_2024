local path_spelling = vim.fn.stdpath("config") .. "/spell/de.utf-8"

local spell_de ={}

for word in io.open(path_spelling, "r"):lines()do
    -- print( word)
    table.insert(spell_de, word)
end

return spell_de
-- return{
--     "adiutaByte",
--     "Stipendiengeber",
--     "H-BRS",
--     "MEDIFOXDAN",
--     "Prototypisierung",
-- }

                    -- local ltex_keys =vim.tbl_keys(require("lspconfig").ltex)
