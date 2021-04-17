local FileAnalyser = require('jumpwire.FileAnalyser')
local M = {}

M.jump = function (path, config, wanted_destination)
    --print(vim.inspect(config))
    local data = M.get_destination_configuration(path, config, wanted_destination);

    if not data or not data.destination_information or not data.key then
        print(vim.inspect('Could not find ' .. wanted_destination .. ' for file ' .. FileAnalyser.get_file_name(path)))
        return
    end

    local destination_information = data.destination_information;
    local key = data.key;

    if destination_information.type == 'fileExtension' then
        M.file_jump(path, key, destination_information.data)
    elseif destination_information.type == 'jvm' then
        M.file_jump_jwm(path, destination_information.data)
    elseif destination_information.type == 'lineContains' then
        M.scroll_jump(destination_information.data)
    else
        vim.api.nvim_echo('Could not find destination type: ' .. destination_information.type)
    end
end

M.scroll_jump = function (destination)
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)

    for key,value in pairs(lines) do
        if value:match(destination) then
            vim.api.nvim_command(tostring(key))
            return
        end
    end
end

M.file_jump = function (path, key, extension)
    local keyLength = key:len()
    local pathLength = path:len()

    local path_without_current = path:sub(0, pathLength - keyLength)
    local next_destination = path_without_current .. extension

    vim.api.nvim_command('edit ' .. next_destination)
end

M.file_jump_jwm = function (path, destination)
    local extension = FileAnalyser.get_language(path)
    local next_destination

    if destination == 'test' then
        local to_test_folder = path:gsub('src/main/', 'src/test/')
        next_destination = to_test_folder:gsub('%.' .. extension, 'Test%.' .. extension)
    elseif destination == 'implementation' then
        local to_main_folder = path:gsub('src/test/', 'src/main/')
        next_destination = to_main_folder:gsub('Test%.' .. extension, '%.' .. extension)
    else
    end

    vim.api.nvim_command('edit ' .. next_destination)
end

M.get_destination_configuration = function (path, config, destination)
    for key in pairs(config) do
        if path:sub(-#key) == key then
            local value = config[key]
            if value[destination] ~= nil then
                return {destination_information = value[destination], key = key}
            end
        end

    end
end

return M
