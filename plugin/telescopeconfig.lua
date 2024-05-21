
local has_module, telescope = pcall(require, "telescope")
if not has_module then
  -- vim.print("telescope not not installed")
  return
end

telescope.setup()

telescope.load_extension("fzy_native")

