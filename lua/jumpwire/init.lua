local FileAnalyser = require('jumpwire.FileAnalyser')
local Jump = require('jumpwire.Jump')
local M = {}

JumpWireConfig = {}

M.help = function ()
    print('No language defined for current file https://github.com/emilycares/jumpwire.nvim/blob/master/config.md')
end

M.jump = function (destination)
    if not JumpWireConfig == {} then
        M.help()
    else
        Jump.jump(FileAnalyser.get_file_path(), JumpWireConfig.language, destination)
    end
end

M.setup = function (config)
    JumpWireConfig = config
end

return M
