local M={source={},enabled=false}
function M.disable()
    vim.wo.spell=vim.go.spell
    vim.bo.spelllang=vim.go.spelllang
    M.enabled=false
end
---@param args? string|string[]
function M.toggle(args)
    if M.enabled then
        M.disable()
    else
        M.enable(args)
    end
end
---@param args? string|string[]
function M.enable(args)
    args=(type(args)=='string' and {args} or
    type(args)=='nil' and M.source or args)
    if #args==0 then error('No source given') end
    ---@cast args string[]
    for _,s in ipairs(args) do
        if not vim.api.nvim_get_runtime_file('spell/'..s..'.utf-8.spl',false)[1] then
            local file=vim.api.nvim_get_runtime_file('data/en/'..s..'.dic',false)[1]
            if not file then error('No file found for source: '..s) end
            local path=vim.fn.fnamemodify(file,':h:h:h')
            vim.fn.mkdir(path..'/spell','p')
            vim.cmd.mkspell(path..'/spell/'..s..'.utf-8.spl',file)
        end
    end
    vim.bo.spelllang=vim.go.spelllang..','..vim.fn.join(args,',')
    vim.wo.spell=true
    M.enabled=true
    M.source=args
end
return M
