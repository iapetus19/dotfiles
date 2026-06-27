return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			"         .                  *.                                                                               ",
			"       .*%0.                &&*.                                                                             ",
			"     .*%%%00*               &&&&*.                                                     .*.                   ",
			"   .*%%%%%000*              &&&&&&*.                          ..*******.              .%@&                   ",
			" .*%%%%%%%00000             &&&&&&&&*.                 .*0&%%@@@@@@@@@@@&0^          *@@@&                   ",
			"*00%%%%%%%000000.           &&&&&&&&&&*            o&@@@@%&00*^^^^^^^*0%&       *@@@&                        ",
			"0000%%%%%%0000000*          &&&&&&&&&&&          %@@%0^ .*.              &%000&&&&@@@@&&&0o                  ",
			"000000%%%%000000000.        &&&&&&&&&&&           0@*   0%@@0            *@@&&000%@@@0^^                     ",
			"0000000%%%0000000000*       &&&&&&&&&&&                00*@@0          *&@%     0@@@0                        ",
			"00000000%%000000000000      &&&&&&&&&&&               0 *@@%        .0%@@0     0@@@0     *%&          &@%    ",
			"000000000%'000000000000.    &&&&&&&&&&&              ^ 0@@%'     .o&@@&^      0@@@0     *@@&  .*.    &@@0   ",
			"0000000000 '000000000000.   &&&&&&&&&&&             .*&@@%'  .*0%@@&*        *@@@0     *@@%  .0@%   0@@*    ",
			"0000000000   '00000000000*  &&&&&&&&&&&            *0%@@@%%%@@@%0^          *@@@0     *@@%  *%@@%  *@@^     ",
			"0000000000    '000000000000.&&&&&&&&&&&           @@@@@@@@@@@%0            @@@&     *@@%  &0%@@* *@%       ",
			"0000000000      000000000000%&&&&&&&&&&           0@@@^    ^00%@&o.       %@@%     *@@@ .&^0@@% *@%        ",
			"0000000000       ^0000000000%%&&&&&&&&&          @@%          0@@&       &@@@    .&@@@ 0&  @@*o@&         ",
			"0000000000        '000000000%%%%&&&&&&&         @@%            0@@@0     *@@@   .00@@@0&0  %@@0@0          ",
			"0000000000          00000000%%%%%%&&&&&        @@&           .0@@@@0     @@@* .*0 &@@@%*  *@@@%@0         ",
			"0000000000           '000000%%%%%%%%&&*        %@0        .*&%@@%&^       0@@&0&^ ^@@@@^   &@@@@*          ",
			" ^00000000            '00000%%%%%%'.*.         *0  .*00&%@@@&0*         ^0@@%&^    0@@&    &@@%^          ",
			"   ^000000              ^000%%%%% &@&0o.o0000&&%%@@@@%&0*^              ^0^        ''     ''               ",
			"     ^0000               '00%%%%% ^&&%%%%&&&&000*^^                                                           ",
			"       ^00                '0%%%%'                                                                             ",
			"         '                  ^''                                                                               ",
		}
		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
			dashboard.button("SPC e", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
			dashboard.button("l", "󰒲  > Lazy", "<cmd>Lazy<CR>"),
			dashboard.button("s", " > Settings", "<cmd>cd ~/.config/nvim/lua/shobhit<CR>"),
			dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
