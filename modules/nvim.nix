{pkgs, ...}:
{
	programs.neovim = {
  		enable = true;
  		defaultEditor = true;
  
  		plugins = with pkgs.vimPlugins; [
    			jellybeans-nvim
			plenary-nvim
    			lualine-nvim
    			telescope-nvim
			nvim-tree-lua
    			nvim-treesitter.withAllGrammars
  		];

		initLua = ''
      			vim.opt.number = true
      			vim.opt.relativenumber = true
      			vim.g.mapleader = " "

      			require('lualine').setup()
      			require('telescope').setup()
      
      			require('nvim-tree').setup({
        			sort_by = "case_sensitive",
        			view = {
          				width = 30,
        			},
        			renderer = {
          				group_empty = true,
        			},
        			filters = {
          				dotfiles = false,
        			},
      			})

      			vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })

      			vim.cmd("colorscheme jellybeans-nvim")

      			local function open_nvim_tree(data)
       	 			local directory = vim.fn.isdirectory(data.file) == 1
        			if not directory then return end
        			require("nvim-tree.api").tree.open()
      			end
      			vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
    		'';

	};


}
