-- security add-generic-password -s "anthropic_api_key" -a "your_username" -w "your-api-key" -U
local function anthropic_api_key_from_keychain()
  local handle = io.popen('security find-generic-password -s "anthropic_api_key" -a "' .. vim.fn.expand("$USER") .. '" -w 2>/dev/null')
  if handle then
    local result = handle:read("*a")
    handle:close()
    -- Remove trailing newline if present
    return result:gsub("%s+$", "")
  else
    return nil
  end
end

-- Set the environment variable
local api_key = anthropic_api_key_from_keychain()
if api_key then
  vim.fn.setenv("ANTHROPIC_API_KEY", api_key)
end

