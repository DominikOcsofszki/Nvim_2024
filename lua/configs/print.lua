vim.keymap.set('n', '<c-`>', function()
    vim.g.COUNTER = (vim.g.COUNTER or 0) + 1
    print(vim.g.COUNTER)
    require('helper').insertKeys('oic("=============h' .. vim.g.COUNTER .. '==================")<esc>')
end, {})
