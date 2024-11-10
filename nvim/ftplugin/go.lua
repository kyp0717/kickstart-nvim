vim.bo.comments = ':---,:--'

local go_ls_cmd = 'gopls'

-- Check if go-language-server is available
if vim.fn.executable(go_ls_cmd) ~= 1 then
  return
end

local root_files = {
  '.luarc.json',
  '.luarc.jsonc',
  'go.mod',
  '.stylua.toml',
  'stylua.toml',
  'selene.toml',
  'selene.yml',
  '.git',
}

vim.lsp.start {
  name = 'gopls',
  cmd = { go_ls_cmd },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  -- capabilities = require('user.lsp').make_client_capabilities(),
}

