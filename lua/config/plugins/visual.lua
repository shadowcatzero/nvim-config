return function(use)
    use {
        'navarasu/onedark.nvim',
        config = function()
            require 'onedark'.setup { style = 'darker' }
            require 'onedark'.load()
        end
    }
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            if vim.o.termguicolors then
                require 'colorizer'.setup()
            end
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require 'lualine'.setup() end
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require 'gitsigns'.setup() end
    }
end