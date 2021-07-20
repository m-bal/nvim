local snap = require'snap'

local fzy = snap.get'consumer.fzy'
local limit = snap.get'consumer.limit'
local producer_file = snap.get'producer.ripgrep.file'
local producer_vimgrep = snap.get'producer.ripgrep.vimgrep'.line{}
local producer_buffer = snap.get'producer.vim.buffer'
local producer_oldfile = snap.get'producer.vim.oldfile'
local producer_git = snap.get'producer.git.file'
local select_file = snap.get'select.file'
local select_vimgrep = snap.get'select.vimgrep'
local preview_file = snap.get'preview.file'
local preview_vimgrep = snap.get'preview.vimgrep'

-- snap.register.map({'n'}, {'<Leader><Leader>'}, function ()
--   snap.run({
--     prompt = 'Files',
--     producer = fzy(producer_file),
--     select = select_file.select,
--     multiselect = select_file.multiselect,
--     views = {preview_file}
--   })
-- end)

-- snap.register.map({'n'}, {'<Leader>fg'}, function ()
--   snap.run({
--     prompt = 'Git Files',
--     producer = fzy(producer_git),
--     select = select_file.select,
--     multiselect = select_file.multiselect,
--     views = {preview_file}
--   })
-- end)

snap.register.map({'n'}, {'<Leader>ff'}, function ()
  snap.run({
    prompt = 'Grep',
    producer = limit(10000, producer_vimgrep),
    steps = {{
        consumer = fzy,
        config = {prompt = "Fzy>"}
    }},
    select = select_vimgrep.select,
    multiselect = select_vimgrep.multiselect,
    views = {preview_vimgrep}
  })
end)

-- snap.register.map({'n'}, {'<Leader>fb'}, function ()
--   snap.run({
--     prompt = 'Buffers',
--     producer = fzy(producer_buffer),
--     select = select_file.select,
--     multiselect = select_file.multiselect,
--     views = {preview_file}
--   })
-- end)

snap.register.map({'n'}, {'<Leader>fo'}, function ()
  snap.run({
    prompt = 'Oldfiles',
    producer = fzy(producer_oldfile),
    select = select_file.select,
    multiselect = select_file.multiselect,
    views = {preview_file}
  })
end)

snap.register.map({'n'}, {'<Leader>m'}, function ()
  snap.run({
    prompt = 'Grep',
    producer = limit(10000, producer_vimgrep),
    select = select_vimgrep.select,
    steps = {{
        consumer = fzy,
        config = {prompt = "Fzy>"}
    }},
    multiselect = select_vimgrep.multiselect,
    initial_filter = vim.fn.expand('<cword>')
  })
end)
