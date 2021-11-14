local split = vim.fn.split
local system = vim.fn.system


-- Randomize header
math.randomseed(os.time())
local words_list = {
  "Foo!",
  "Ahihihihi",
  "Neovim",
  "Ehe..",
  "Sus..",
  "Bruh..",
}

local choice = math.random(1, table.getn(words_list))
local word_choice = words_list[choice]


-- Cowsay as header
local what_does_the_cow_say = 'cowsay ' .. word_choice


-- Apply header randomly (either cowsay / font)
if math.random(1,2) == 1 then
  vim.g["startify_custom_header"] = vim.fn["startify#pad"](
    split(system('figlet -w 60 ' .. word_choice), '\n')
  )

else
  vim.g["startify_custom_header"] = vim.fn["startify#pad"](
    split(system(what_does_the_cow_say), '\n')
  )
end
