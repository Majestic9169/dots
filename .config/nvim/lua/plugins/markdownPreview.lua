return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end
}
--
-- return {
--   "iamcco/markdown-preview.nvim",
--   keys = {
--     {
--       "<leader>mp",
--       ft = "markdown",
--       "<cmd>MarkdownPreviewToggle<cr>",
--       desc = "Markdown Preview",
--     },
--   },
-- }
