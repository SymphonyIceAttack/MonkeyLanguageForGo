{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{

  env.GIT_DIR = ''${config.env.DEVENV_ROOT}/.jj/repo/store/git'';
  packages = [
    pkgs.git
    pkgs.jujutsu
  ];
  languages.go = {
    enable = true;
  };
  scripts.goinstall.exec = ''
    go mod tidy
  '';

  enterShell = ''
    goinstall
  '';
}
