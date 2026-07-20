{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      wl-clipboard
      fd fzf
      harper
      rust-analyzer
      markdownlint-cli2
      nerd-fonts.jetbrains-mono
      nerd-fonts.sauce-code-pro
      # lsp servers, formatters, linters
    ];

    # initLua = builtins.readFile ../../config/nvim/init.lua;
  };
}
