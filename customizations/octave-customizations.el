(setq inferior-octave-program
      (if (eq system-type 'windows-nt)
          "C:/Octave/3.2.4_gcc-4.4.0/bin/octave.exe"
        "octave"))
