local dev = true
local path = vim.fn.expand("~/dev/pg_query.nvim")

if not vim.loop.fs_stat(path) then
    return {}
end

return {
    {
        "jesses-code-adventures/pg_query.nvim",
        dir = dev and path or nil,
        dev = dev,
        enabled = true,
        keys = {
            { "<leader>pw", function() require("pg_query").write(); end, mode = "n", desc = "Edit default param values for the query under the cursor." },
            { "<leader>pr", function() require("pg_query").render(); end, mode = "n", desc = "Render postgres query with values, and pipe into output_cmd." },
        },
        -- these are the default values. if you're happy with them, you can just pass an empty table to opts.
        opts = {
            field_separator=' ✦ ', -- in the edit buffer, the string that separates the field label from the input text.
            fields_align_right=false, -- in the edit buffer, choose to align the field names to the right of the buffer.
            output_cmd='pbcopy', -- when rendering your query with values (ie calling render()), the rendered sql command will be piped into this command line program.
        }
    }
}

