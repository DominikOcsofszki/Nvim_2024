
local M = {}


function M.insertText(text)
        local insert = vim.api.nvim_replace_termcodes("i", true, false, true)
        local textCleaned = vim.api.nvim_replace_termcodes(text, true, false, true)
        local esc = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
        vim.api.nvim_feedkeys(insert .. textCleaned .. esc, 'n', false)
end

function M.insertKeys(text)
        -- local insert = vim.api.nvim_replace_termcodes("i", true, false, true)
        local textCleaned = vim.api.nvim_replace_termcodes(text, true, false, true)
        -- local esc = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
        vim.api.nvim_feedkeys(textCleaned, 'n', false)
end
return M
    -- vim.current.buffer[vim.current.window.cursor[1]] = tostring(vim.g.COUNTER)
-- vim.keymap.set('n', '<c-`>', function()
--     if not vim.g.COUNTER then
--         vim.g.COUNTER = 0
--     end
--     vim.g.COUNTER = vim.g.COUNTER + 1
--     local line = vim.api.nvim_get_current_line()
--     print(line)
--     -- local cursor_position = vim.window.cursor[2]
--     -- local new_line = line:sub(1, cursor_position) .. "'avim.g.COUNTER<esc>'" .. line:sub(cursor_position + 1)
-- --     vim.api.nvim_set_current_line(new_line)
-- --     local r,c = unpack(vim.api.nvim_win_get_cursor(0))
-- -- print(r, c)
-- end, {})
--

