local wordy=require'wordy'
local function complete()
  return {
    'weak',
    'being', 'passive-voice',
    'business-jargon',
    'weasel',
    'puffery',
    'problematic', 'redundant',
    'colloquial', 'idiomatic', 'similies',
    'art-jargon',
    'contractions', 'opinion', 'vague-time', 'said-synonyms',
    'adjectives',
    'adverbs',
  }
end
vim.api.nvim_create_user_command('NoWordy',wordy.disable,{nargs=0})
vim.api.nvim_create_user_command('Wordy',function (args) wordy.enable(args.fargs) end,{nargs='*',complete=complete})
vim.api.nvim_create_user_command('WordyToggle',function (args) wordy.toggle(args.fargs) end,{nargs='*',complete=complete})
