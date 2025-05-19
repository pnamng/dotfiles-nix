{ config, ... }:
{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      # split panes using | and -
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %

      # Start windows and panes at 1, not 0
      set -g base-index 1
      setw -g pane-base-index 1

      # set true colors
      set -g default-terminal "tmux-256color"
      set -ga terminal-overrides ",xterm-256color:Tc"

      # remap prefix from 'C-b' to 'C-a'
      unbind C-b
      set-option -g prefix C-a
      bind-key C-a send-prefix
      set-option -g status-position bottom

      set -g @bg_dim '#232a2e'
      set -g @bg0 '#${config.colorScheme.palette.base00}'
      set -g @bg1 '#${config.colorScheme.palette.base01}'
      set -g @bg2 '#${config.colorScheme.palette.base02}'
      set -g @bg3 '#${config.colorScheme.palette.base03}'
      set -g @bg4 '#4f585e'
      set -g @bg5 '#56635f'
      set -g @bg_visual '#543a48'
      set -g @bg_red '#514045'
      set -g @bg_green '#425047'
      set -g @bg_blue '#3a515d'
      set -g @bg_yellow '#4d4c43'

      set -g @fg '#${config.colorScheme.palette.base05}'
      set -g @red '#${config.colorScheme.palette.base08}'
      set -g @orange '#${config.colorScheme.palette.base09}'
      set -g @yellow '#${config.colorScheme.palette.base0A}'
      set -g @green '#${config.colorScheme.palette.base0B}'
      set -g @aqua '#${config.colorScheme.palette.base0C}'
      set -g @blue '#${config.colorScheme.palette.base0D}'
      set -g @purple '#${config.colorScheme.palette.base0E}'
      set -g @grey0 '#7a8478'
      set -g @grey1 '#859289'
      set -g @grey2 '#9da9a0'
      set -g @statusline1 '#a7c080'
      set -g @statusline2 '#d3c6aa'
      set -g @statusline3 '#e67e80'

      set-option -g status "on"
      set -g status-interval 2

      set-option -g status-fg '#${config.colorScheme.palette.base05}'
      set-option -g status-bg '#${config.colorScheme.palette.base00}'

      set-option -g mode-style fg='#{@fg}',bg='#{@purple}'

      # default statusbar colors
      set-option -g status-style fg='#{@fg}',bg='#{@bg_dim}',default # fg=fg bg=bg_dim

      # ---- Windows ----
      # default window title colors
      set-window-option -g window-status-style fg='#{@bg5}',bg='#{@bg0}' # fg=yellow bg=bg0

      # default window with an activity alert
      set-window-option -g window-status-activity-style 'bg=#{@bg1},fg=#{@bg3}' # bg=bg1, fg=fg3

      # active window title colors
      set-window-option -g window-status-current-style fg='#{@fg}',bg='#{@bg_green}' # fg=fg bg=bg_green

      # ---- Pane ----
      # pane borders
      set-option -g pane-border-style fg='#{@bg1}' # fg=bg1
      set-option -g pane-active-border-style 'fg=#{@blue}' # fg=blue

      # pane number display
      set-option -g display-panes-active-colour '#7fbbb3' # blue
      set-option -g display-panes-colour '#e69875' # orange

      # ---- Command ----
      # message info
      set-option -g message-style fg='#{@statusline3}',bg='#{@bg_dim}' # fg=statusline3 bg=bg_dim

      # writing commands inactive
      set-option -g message-command-style 'fg=#{@bg3},bg=#{@bg1}' # bg=fg3, fg=bg1

      # ---- Miscellaneous ----
      # clock
      set-window-option -g clock-mode-colour '#7fbbb3' #blue

      # bell
      set-window-option -g window-status-bell-style fg='#{@bg0}',bg='#{@statusline3}' # fg=bg, bg=statusline3

      # ---- Formatting ----
      set-option -g status-left-style none
      set -g status-left-length 60
      set -g status-left '#[fg=#{@bg_dim},bg=#{@green},bold] #S #[fg=#{@green},bg=#{@bg2},nobold]#[fg=#{@green},bg=#{@bg2},bold] #(whoami) #[fg=#{@bg2},bg=#{@bg0},nobold]'

      set-option -g status-right-style none
      set -g status-right-length 150
      set -g status-right '#[fg=#{@bg2}]#[fg=#{@fg},bg=#{@bg2}] #[fg=#{@fg},bg=#{@bg2}]%Y-%m-%d  %H:%M #[fg=#{@aqua},bg=#{@bg2},bold]#[fg=#{@bg_dim},bg=#{@aqua},bold] #h '

      set -g window-status-separator '#[fg=#{@grey2},bg=#{@bg0}] '
      set -g window-status-format "#[fg=#{@grey0},bg=#{@bg0}] #I  #[fg=#{@grey0},bg=#{@bg0}]#W "
      set -g window-status-current-format "#[fg=#{@bg0},bg=#{@bg_green}]#[fg=#{@fg},bg=#{@bg_green}] #I  #[fg=#{@fg},bg=#{@bg_green},bold]#W #[fg=#{@bg_green},bg=#{@bg0},nobold]"
    '';
  };
}
