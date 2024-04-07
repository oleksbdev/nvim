return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
          -- "neo-tree",
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        -- lualine_d = {{'datetime', style={'default'}}},
        -- lualine_v = {'selectioncount'},
        lualine_w = {'encoding', 'fileformat', 'filetype'},
        lualine_x = {'progress'},
        lualine_y = {'location'},
        lualine_z = { {'datetime', style="%H:%M:%S" } }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_w = {'location'},
        lualine_x = {},
        lualine_y = {},
        -- lualine_z = { {'datetime', style="%H:%M:%S" } }
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
  }
  end,
}
