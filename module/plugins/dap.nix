{ pkgs, ... }: {
  programs.nixvim = {
    plugins = {
      dap = {
        enable = true;
        adapters = { };
        signs = {
          dapBreakpoint = {
            text = "●";
            texthl = "DapBreakpoint";
          };
          dapBreakpointCondition = {
            text = "●";
            texthl = "DapBreakpointCondition";
          };
          dapLogPoint = {
            text = "◆";
            texthl = "DapLogPoint";
          };
        };
        extensions = {

        };
      };
      dap-go = {
        enable = true;
        settings.delve.path = "${pkgs.delve}/bin/dlv";
      };
      dap-ui = { enable = true; };
      dap-virtual-text = { enable = true; };
    };
    # Allow DAP UI to automatically open and close when possible
    # extraConfigLua = ''
    #   require('dap').listeners.after.event_initialized['dapui_config'] = require('dapui').open
    #   require('dap').listeners.before.event_terminated['dapui_config'] = require('dapui').close
    #   require('dap').listeners.before.event_exited['dapui_config'] = require('dapui').close
    # '';

    # extraPlugins = [ (pkgs.vimPlugins.telescope-dap-nvim) ];
  };
}
