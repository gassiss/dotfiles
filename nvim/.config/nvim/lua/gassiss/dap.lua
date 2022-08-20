local dap = require("dap")
local dapui = require("dapui")
local nnoremap = require("gassiss/keymap").nnoremap
local vnoremap = require("gassiss/keymap").vnoremap
require("nvim-dap-virtual-text").setup()

dapui.setup({
  layouts = {
    {
      elements = {
        "repl",
        "console",
      },
      size = 7,
      position = "bottom",
    },
    {
      elements = {
        { id = "scopes", size = 0.25 },
        "watches",
        "breakpoints",
      },
      size = 40,
      position = "left",
    }
  },
})

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = {os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js"},
}

dap.configurations.javascript = {
  {
    name = "Launch",
    type = "node2",
    request = "launch",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal",
  },
  {
    name = "Attach to process",
    type = "node2",
    request = "attach",
  },
  {
    name = "Jest (Node2 with ts-node)",
    type = "node2",
    request = "launch",
    cwd = vim.loop.cwd(),
    runtimeArgs = {"--inspect-brk", "${workspaceFolder}/node_modules/.bin/jest"},
    runtimeExecutable = "node",
    args = {"${file}", "--runInBand", "--coverage", "false"},
    sourceMaps = true,
    port = 9229,
    skipFiles = { "<node_internals>/**", "node_modules/**" },
  },
}

dap.configurations.typescript = {
  {
    name = "Launch",
    type = "node2",
    request = "launch",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal",
  },
  {
    name = "Attach to process",
    type = "node2",
    request = "attach",
  },
  -- {
  --   name = "Jest (Node2 with ts-node)",
  --   type = "node2",
  --   request = "launch",
  --   cwd = vim.loop.cwd(),
  --   runtimeArgs = {"--inspect-brk", "${workspaceFolder}/node_modules/.bin/jest", "-r", "ts-node/register"},
  --   runtimeExecutable = "node",
  --   args = {"${file}", "--runInBand", "--coverage", "false"},
  --   sourceMaps = true,
  --   port = 9229,
  --   skipFiles = { "<node_internals>/**", "node_modules/**" },
  -- },
}

-- opens dapui bottom drawer when debugging, and closes when it finishes
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open(1)
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

nnoremap("<F5>", function() dap.continue() end)
nnoremap("<F10>", function() dap.step_over() end)
nnoremap("<F11>", function() dap.step_into() end)
nnoremap("<F12>", function() dap.step_out() end)
nnoremap("<leader>db", function() dap.toggle_breakpoint() end)
nnoremap("<leader>dB", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end)
nnoremap("<F1>", function() dap.run_last() end)
nnoremap("<leader>dc", function() dap.run_to_cursor() end)
nnoremap("<leader>de", function() dapui.eval() end)
vnoremap("<leader>de", function() dapui.eval() end)
nnoremap("<F7>", function() dapui.toggle(1) end)
nnoremap("<F8>", function() dapui.toggle(2) end)
nnoremap("<F4>", function() dap.terminate() end)

--[[
also setup exrc per project configuration so you can launch file specific test etc

also setup golang debugger
--]]
