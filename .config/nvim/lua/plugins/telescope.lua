vim.api.nvim_create_user_command(
    'ObsidianVault',
    function ()
        require('telescope.builtin').find_files({cwd="~/.personal/"})
    end,
    {}
)

-- vim.keymap.set('n', '<leader>fd', ':ObsidianVault<CR>', {noremap = true, silent = true})

return {
    {
        "AstroNvim/astrocore",
        ---@type AstroCodeOpts
        opts = {
            mappings = {
                n = {
                    ["<leader>fd"] = { "<cmd>ObsidianVault<cr>", desc = "Find Obsidian Files"}
                }
            }
        }
    }
}
