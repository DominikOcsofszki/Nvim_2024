local function change_name(file_name, search, change_to)
    local find_name = search
    local s
    if string.find(file_name, find_name) then
        s = string.gsub(file_name, find_name, change_to)
    end
    return s
end
local function switch_file(file_name, search)
    local tables = {}
    tables["lexer"] = "parser"
    tables["parser"] = "ast"
    tables["ast"] = "lexer"
    if string.find(file_name, search) then
        local change_to = tables[search]
        local s = change_name(file_name, search, change_to)
        vim.print(s)
        vim.cmd("e " .. s)
    end
end
local function find_name_in_file(file_name, search_name)
    if string.find(file_name, search_name) then
        return search_name
    end
end
local function switch_files()
    local file_name = vim.fn.expand("%:.")
    local search = find_name_in_file(file_name, "lexer")
    if not search then
        search = find_name_in_file(file_name, "parser")
    end
    if not search then
        search = find_name_in_file(file_name, "ast")
    end
    switch_file(file_name, search)
end

vim.keymap.set('n', '<leader>cc', switch_files, {})
vim.keymap.set('n', '<leader><leader>', switch_files, {})
vim.keymap.set('n', '<leader>gc', ':set cms=#%s', {})
-- vim.keymap.set('v', '', switch_files, {})
vim.keymap.set('n', '<leader>cs', switch_files, {})
vim.keymap.set('n', '<leader>co', ":tabnew /Users/dominikocsofszki/ss2024/compiler/projekt/compiler_mod/data.tx <cr>gf", {})
-- vim.keymap.set('n', '<leader>coo', ":tabnew /Users/dominikocsofszki/ss2024/compiler/projekt/compiler_mod/data.tx <cr>", {})
vim.keymap.set('n','<leader>c',':w<cr>:!python3 /Users/dominikocsofszki/ss2024/compiler/projekt/compiler_mod/RUN.py<cr>',{})
vim.keymap.set('n','<leader>cm',':w<cr>:Messages !python3 /Users/dominikocsofszki/ss2024/compiler/projekt/compiler_mod/RUN.py<cr>?\\^\\^\\^<cr>kk',{})
vim.keymap.set('n','<leader>c=','oic("=============================")<esc>',{})












-- extra cmds:
vim.keymap.set('n','<c-j>',':cn<cr>',{})
vim.keymap.set('n','<cr><cr>',':<up><cr>',{})

