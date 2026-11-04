-- Tool output arrives wrapped in a ``` fence, even when the output itself
-- contains ``` fences. The first nested fence then closes the wrapper early
-- and the rest of the chat renders as code. Markdown only closes a fence
-- with one at least as long, so lengthening the wrapper fixes it.
local M = {}

local function backtick_fence_length(line)
  local ticks = line:match("^%s*(```+)")
  return ticks and #ticks or 0
end

local function longest_fence(lines, from, to)
  local longest = 0
  for i = from, to do
    longest = math.max(longest, backtick_fence_length(lines[i]))
  end
  return longest
end

---@param lines string[]
---@return string[]
function M.balance(lines)
  local last = #lines
  local outer = backtick_fence_length(lines[1] or "")
  local is_wrapped = outer > 0 and last > 1 and lines[last]:match("^%s*```+%s*$")
  if not is_wrapped then
    return lines
  end

  local nested = longest_fence(lines, 2, last - 1)
  if nested < outer then
    return lines
  end

  local fence = string.rep("`", nested + 1)
  local balanced = vim.list_slice(lines)
  balanced[1] = fence .. lines[1]:gsub("^%s*```+", "")
  balanced[last] = fence
  return balanced
end

return M
