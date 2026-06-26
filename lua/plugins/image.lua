-- BUG: Transparent PNGs show an inconsistent background in unicode-placeholders mode.
--
-- ROOT CAUSE:
--   lua/image/backends/kitty/helpers.lua :: write_placeholder() (~line 163)
--
--   The function sets the foreground color (to encode the image ID) but never resets
--   the background color before writing placeholder characters:
--
--     local foreground = "\x1b[38;5;" .. image_id .. "m"   -- sets fg only
--     local restore = "\x1b[39m"                            -- restores fg only
--
--   Placeholder cells inherit whatever background color Neovim last rendered for
--   those terminal cells (e.g. catppuccin's #1e1e2e). Kitty renders transparent
--   pixels using the cell background color -- so transparent areas show Neovim's
--   theme background inconsistently depending on buffer/render state.
--
-- FIX (for the PR):
--   Reset the background to terminal default (\x1b[49m) alongside the foreground:
--
--     local foreground = "\x1b[38;5;" .. image_id .. "m\x1b[49m"
--     local restore = "\x1b[39m\x1b[49m"
--
--   This makes transparent PNG areas always show the terminal background colour
--   rather than whatever Neovim happened to paint on those cells.
--
-- ATTEMPTED WORKAROUNDS (all failed):
--   1. Monkey-patching helpers.write_placeholder at runtime -- Neovim's render cycle
--      runs after write_placeholder and re-sets cell backgrounds, overwriting the fix.
--   2. Wrapping image.from_file to force with_virtual_padding = true -- virtual
--      padding lines use Normal highlight which sets bg, but doesn't address the
--      missing reset inside write_placeholder itself.
--   3. winhighlight Normal:NoBg on the image window -- Neovim highlight groups don't
--      affect write_placeholder's direct terminal writes which happen in a separate pass.

return {
  "3rd/image.nvim",
  opts = {
    backend = "kitty",
    kitty_method = "unicode-placeholders",
    processor = "magick_cli",
    integrations = {
      markdown = { enabled = false },
    },
  },
}
