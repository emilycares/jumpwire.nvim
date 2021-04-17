local M = {}

M.get_file_path = function ()
    return vim.fn.expand('%:p')
end

M.get_file_name = function (path)
    return path:match('^.+/(.+)$')
end

M.get_file_extension =  function (path)
    return path:match('^.+/(.+)$'):match('[^.]*.(.*)')
end

M.get_language = function (path)
    return path:match("[^.]+$")
end

return M
