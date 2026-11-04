-- Run: nvim -l module/plugins/agentic/fence_test.lua
package.path = vim.fs.dirname(debug.getinfo(1, "S").source:sub(2)) .. "/?.lua;" .. package.path
local Fence = require("fence")

local function check(name, input, expected)
  local actual = Fence.balance(input)
  assert(vim.deep_equal(actual, expected), name .. ":\n" .. vim.inspect(actual))
end

check("leaves plain text untouched", { "a", "b" }, { "a", "b" })

check("leaves a fenced block without nested fences untouched",
  { "```console", "output", "```" },
  { "```console", "output", "```" })

check("lengthens the outer fence around a nested fence",
  { "```console", "```sh", "ls", "```", "```" },
  { "````console", "```sh", "ls", "```", "````" })

check("outgrows the longest nested fence",
  { "```", "````md", "x", "````", "```" },
  { "`````", "````md", "x", "````", "`````" })

check("leaves an already longer outer fence untouched",
  { "````console", "```sh", "```", "````" },
  { "````console", "```sh", "```", "````" })

check("leaves an unclosed outer fence untouched",
  { "```console", "```sh", "ls" },
  { "```console", "```sh", "ls" })

print("fence_test: ok")
