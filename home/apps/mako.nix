{
  enable = true;
  font = "JetBrainsMono Nerd Font 12";
  backgroundColor = "#0f111b";
  textColor = "#ecf0c1";
  borderColor = "#7a5ccc";
  borderSize = 2;
  padding = "10";
  defaultTimeout = 10000; # 10 seconds
  maxVisible = 3;
  width = 450;
  height = 100;
  extraConfig = ''
    [urgency=low]
    border-color=#5b5b77
    background-color=#0f111b
    text-color=#ecf0c1

    [urgency=normal]
    border-color=#7a5ccc
    background-color=#0f111b
    text-color=#ecf0c1

    [urgency=critical]
    border-color=#ebeb94
    background-color=#0f111b
    text-color=#ebeb94
  '';
}
