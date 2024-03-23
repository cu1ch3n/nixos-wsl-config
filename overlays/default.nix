# This file defines overlays
{ ... }: {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  modifications = final: prev: {
    ott = prev.ott.overrideAttrs (oldAttrs: {
      version = "0.32";
      src = prev.fetchFromGitHub {
        owner = "ott-lang";
        repo = "ott";
        rev = "c6b0c2c0843a36a3e19acd6c20138257cb412cf9";
        hash = "sha256-0mRAUp0FnWabR5J8/771oleg6w+lQWTZw4vmQVl0P4g=";
      };
    });
  };
}
