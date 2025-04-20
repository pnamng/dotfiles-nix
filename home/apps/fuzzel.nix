{
  main = {
    font = "JetBrainsMono Nerd Font:size=12";
    prompt = "> ";
    lines = 10;
    width = 40;
    terminal = "alacritty";
    vertical-pad = 24;
  };
  colors = {
    background = "0f111bff"; # #0f111b with alpha
    text = "ecf0c1ff"; # #ecf0c1 with alpha
    match = "5ccc96ff"; # Green for matched text
    selection = "7a5cccff"; # Purple for selected item background
    selection-text = "ecf0c1ff"; # Text on selected item
    selection-match = "5ccc96ff"; # Green for matched text in selection
    border = "7a5cccff"; # Purple border
  };
  border = {
    width = 2;
    radius = 5;
  };
  dmenu = {
    exit-immediately-if-empty = true;
  };
}
