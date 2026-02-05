{
  plugins.snacks = {
    enable = true;
    settings = {
      notifier = {
        enabled = true;
      };
      dashboard = {
        sections = [
          {
            header = ''
              ██████╗ ██████╗  ██████╗ ████████╗ ██████╗
              ██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝██╔═══██╗
              ██████╔╝██████╔╝██║   ██║   ██║   ██║   ██║
              ██╔═══╝ ██╔══██╗██║   ██║   ██║   ██║   ██║
              ██║     ██║  ██║╚██████╔╝   ██║   ╚██████╔╝
              ╚═╝     ╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝
            '';
          }
          {
            icon = " ";
            title = "Keymaps";
            section = "keys";
            gap = 1;
            padding = 1;
          }
          {
            icon = " ";
            title = "Recent Files";
            section = "recent_files";
            gap = 1;
            padding = 1;
          }
          {
            icon = " ";
            title = "Projects";
            section = "projects";
            gap = 1;
            padding = 1;
          }
        ];
      };
    };
  };
}
