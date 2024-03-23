{
  programs.git = {
    enable = true;
    userName = "Chen";
    userEmail = "i@cuichen.cc";
    extraConfig = {
      core = {
        filemode = false;
        autocrlf = true;
      };
    };
  };
}
