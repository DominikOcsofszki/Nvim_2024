local M = {}

local _config = {}

function M.setup(config)
  _config = config
end

function M.do_sth()
   -- local option_x = _config.option_x or 'some_default_value'
   -- ...

   -- local parser = vim.treesitter.get_parser()
   -- local trees = parser:parse()
   -- local root = trees[1]:root()
   -- local lnum, col = unpack(vim.api.nvim_win_get_cursor(0))
   -- lnum = lnum - 1
   -- local cursor_node = root:descendant_for_range(lnum, col, lnum, col)
   -- local parent = cursor_node:parent()
   -- while parent ~= nil do
   --     local type = parent:type()
   --     if type == "table" and parent:child_count() > 0 then
   --         local child = parent:child(1)
   --         if child:type() == "bare_key" then
   --             local name = vim.treesitter.query.get_node_text(child, bufnr)
   --             if name == "setup" or name == "teardown" then
   --                 print('Cursor was within a setup or teardown block')
   --                 return
   --             end
   --         end
   --     end
   --     parent = parent:parent()
   -- end
    local query = vim.treesitter.query.parse_query(vim.bo.filetype, [[
  ((table_array_element
    (bare_key) @element_name
    (#eq? @element_name "queries")
    (pair
      (bare_key) @property
      (string) @value
      (#eq? @property "name")
    )
   )
  )
]])
query()
end

return M


