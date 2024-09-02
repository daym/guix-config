;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules (gnu home)
             (gnu packages)
             (gnu services)
             (guix transformations)
             (guix gexp)
             (guix git-download)
             (guix packages)
             (guix build-system emacs)
             (guix build-system gnu)
             (guix channels)
             (gnu home services desktop)
                                        ;(gnu home services dict)
             (gnu home services dotfiles)
             (gnu home services fontutils)
             (gnu home services gnupg)
             (gnu home services guix)
             (gnu home services mail)
             (gnu home services mcron)
             (gnu home services mail)
             (gnu home services media)
             (gnu home services messaging)
             (gnu home services pm)
             (gnu home services shells)
             (gnu home services shepherd)
             (gnu home services sound)
             (gnu home services ssh)
             (gnu home services symlink-manager)
                                        ;(gnu home services syncthing)
             (gnu home services xdg)
             (gnu packages linux) ; e2fsprogs
             (gnu packages gnome) ; libsecret
             (gnu packages java) ; jbr
             (gnu packages qt) ; qtwayland-5
             )

(use-modules ((guix licenses) #:prefix license:))
(define transform1
  (options->transformation `((with-patch . ,(string-append "libcxx@12.0.1="
                                                           "patches/libcxx2.patch")))))

(define patch1
  (options->transformation `((with-patch . ,(string-append "emacs-dap-mode="
                                                           "patches/dap-mode.patch")))))

(define patch2
  (options->transformation `((with-patch . ,(string-append "emacs-lsp-mode="
                                                           "patches/lsp-mode.patch")))))

(define patch5
  (options->transformation `((with-debug-info . "mogan")
                             (with-patch . ,(string-append "mogan="
                                                           "patches/mogan-wayland.patch")))))

(define patch9
  (lambda (p)
    (package
      (inherit p)
      (inputs
       (modify-inputs (package-inputs p)
                      (delete "pipewire"))))))

                                        ;doesn't apply
                                        ;(define patch6
                                        ;  (options->transformation '((with-patch . "sway=/home/dannym/src/guix-config/sway-hidpi-xwayland.patch"))))

(define %source-dir (string-append (getcwd) "/idea"))

(define (dap-trunk base)
  (package
    (inherit base)
    (name "emacs-dap-mode")
    (version "22af181d627577968f03213ba59d02458d3e734a")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/emacs-lsp/dap-mode")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1q360xhnmfnjgrkmzq69p2wc0rphz7fsbjzgn3hjw0a8kv3jsq0y"))))))

                                        ; Note: Community edition contains proprietary plugins: https://www.jetbrains.com/legal/community-bundled-plugins (Space Integration, Code With Me, Shared Indexes, Marketplace Licensing Support, Package Checker)
                                        ; Note: Community products: android-studio, idea, pycharm
                                        ; Note: Proprietary-only products: clion, phpstorm, webstorm, datagrip!, goland, dataspell, RubyMine, datalore, rustrover
                                        ; Note: Other non-ide products: youtrack, teamcity
                                        ; Note: .NET products: rider, dotTrace, dotMemory, dotCover
                                        ; Note: VS extensions: resharper, resharper C++
                                        ; TODO: e2fsprogs libe2p.so
(define idea
  (package
    (name "idea")
    (version "FIXME")
    (source (local-file %source-dir #:recursive? #t)) ;  #:select? (git-predicate %source-dir)
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (delete 'build)
         (replace 'install
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (out-bin (string-append out "/bin"))
                    (out-share (string-append out "/share"))
                    (out-share-applications (string-append out-share "/applications"))
                    (out-share-icons (string-append out-share "/icons")))
               (for-each (lambda (file-name)
                           (let ((full-file-name (string-append "bin/" file-name)))
                             (install-file full-file-name out-bin)
                             (chmod (string-append out-bin "/" file-name) #o755)
                             (wrap-program (string-append out-bin "/" file-name)
                               `("LD_LIBRARY_PATH" prefix
                                 (,(string-append
                                    (assoc-ref inputs "libsecret")
                                    "/lib:"
                                    (assoc-ref inputs "e2fsprogs")
                                    "/lib")))
                               `("JBR21" = (,(assoc-ref inputs "jbr21")))
                               `("JBR17" = (,(assoc-ref inputs "jbr17")))
                               `("RIDER_JDK" = (,(assoc-ref inputs "jbr21")))
                               `("CLION_JDK" = (,(assoc-ref inputs "jbr21")))
                               `("IDEA_JDK" = (,(assoc-ref inputs "jbr21")))
                               `("STUDIO_JDK" = (,(assoc-ref inputs "jbr21")))
                               `("PYCHARM_JDK" = (,(assoc-ref inputs "jbr21"))))))
                         '("android-studio" "idea" "pycharm" "rider"))
               (for-each (lambda (file-name)
                           (let ((dir-name
                                  (string-append out "/"
                                                 (dirname file-name))))
                             (install-file file-name dir-name)))
                         '("share/icons/hicolor/scalable/apps/android-studio.svg"
                           "share/icons/hicolor/scalable/apps/pycharm.svg"
                           "share/icons/hicolor/128x128/apps/idea.png"
                           "share/icons/hicolor/128x128/apps/pycharm.png"
                           "share/icons/hicolor/64x64/apps/idea.png"))
               (mkdir-p out-share-applications)
               (for-each (lambda (file-name)
                                        ;(substitute* file-name
                                        ; (("^Exec=.*") (string-append "Exec="  "\n")))
                                        ; TODO make-desktop-entry-file
                           (install-file file-name out-share-applications))
                         '("share/applications/android-studio.desktop"
                           "share/applications/idea.desktop"
                           "share/applications/pycharm.desktop"))))))))
    (native-inputs
     (list))
    (inputs
     `(("e2fsprogs" ,e2fsprogs)
                                        ;("jbr11" ,jbr11 "jdk")
       ("jbr17" ,jbr17 "jdk")
       ("jbr21" ,jbr21 "jdk")
       ("libsecret" ,libsecret)))
    (synopsis "IDE")
    (description "This package provides an IDE.")
    (home-page "https://www.jetbrains.com/idea/")
    (license license:asl2.0)))


(define xorg-packages
  (specifications->packages '("i3-wm" "openbox" "tint2" "xbindkeys" "xterm")
                                        ;"shod"
                                        ;"obconf" 
                                        ; "windowmaker"
                                        ; "fbautostart"
                                        ; "fluxbox"
                                        ; "cbatticon"
                                        ; "rofi"
                                        ; "numlockx"
                                        ; "pinentry-rofi"
                                        ; "redshift"
                                        ; "xwininfo"
                                        ; "xkbcomp"
                                        ; "xpra"
                                        ; "xdpyinfo"

                  ;;; X

                                        ;(specification->package "xclip")
                                        ; "xev"
                                        ; "xkill"
                                        ;(specification->package "xprop")
                                        ; "xrandr" ; pure X11
                                        ;(specification->package "xdpyinfo")
                                        ;(specification->package "xsetroot")
                                        ;(specification->package "xset")
                                        ;(specification->package "x11-ssh-askpass")
                                        ;(specification->package "xfontsel")

                            ))

(define wayland-packages
  (specifications->packages '("wdisplays"
                              "kanshi" ; auto screen config
                              "sway"
                              "swayidle"
                              "swaylock"
                              "nwg-launchers"
                              "rofi-wayland"
                              "waypipe"
                              "slurp" ; screenshot
                              "scrot" ; screenshot
                              "maim" ; screenshot; need no hold-drag
                                        ; "grimshot" ; screenshot meta
                              )))

(define backup-packages
  (specifications->packages '("vorta" "cryfs" "onedrive")))

;; Rewrites in Rust
                                        ;(specification->package "fish")
;; In Rust to begin with
                                        ;(specification->package "nushell")

(home-environment
 (packages (append ;;; System

            (specifications->packages '("xdg-desktop-portal" "xdg-desktop-portal-gtk" "xdg-desktop-portal-wlr"))
            wayland-packages
            backup-packages

            (list
            (patch9 (specification->package "waybar"))
                                        ;(specification->package "yambar-wayland")
            (specification->package "i3status") ; sway can use it

            (specification->package "pulseaudio") ; TODO: really?
            (specification->package "polkit-gnome") ; ???
            (specification->package "hicolor-icon-theme")
            (specification->package "adwaita-icon-theme")
            (specification->package "dunst")
            (specification->package "bluez")

                  ;;; System/Laptop
            
            (specification->package "tlp") ; power management
            (specification->package "openrgb")

                                        ;(specification->package "ccid") ; fingerprint reader?
                                        ;(specification->package "pcsc-lite")

                  ;;; System Tools

            (specification->package "xrdb") ; compat for nheko
            (specification->package "dex") ; generate and execute desktop files
                                        ; Used by qemu, apparently
            (specification->package "samba")
            (specification->package "udiskie")
            (specification->package "efibootmgr")
            (specification->package "roxterm")
            (specification->package "p7zip")
            (specification->package "zip")
            (specification->package "unzip")
                                        ;(specification->package "unrar")
            (specification->package "gkrellm")
            (specification->package "dos2unix")
            (specification->package "lshw")
            (specification->package "pdfgrep")
            (specification->package "lm-sensors")
            (specification->package "xdg-utils")
            (specification->package "ripgrep")
            (specification->package "seahorse") ; keyring admin
            (specification->package "dmidecode")
            (specification->package "hdparm")
            (specification->package "openssl")
            (specification->package "fdupes")
            (specification->package "nautilus")
            (specification->package "net-tools")
            (specification->package "lsof")
            (specification->package "alsa-utils")
            (specification->package "cryptsetup")
            (specification->package "hwinfo")
            (specification->package "strace")
            (specification->package "screen")
            (specification->package "fzf")
            (specification->package "tmon") ; temp monitoring
            (specification->package "file")
            (specification->package "rocminfo")
            (specification->package "playerctl")
            (specification->package "pinentry-gnome3")
            (specification->package "gnome-keyring")
            (specification->package "dconf-editor")
            (specification->package "zenity")
            (specification->package "trash-cli")
                                        ;(specification->package "gnome-screenshot")
            (specification->package "password-store")
                                        ;(specification->package "vinagre")
            (specification->package "gnome-font-viewer")
                                        ;(specification->package "turbovnc")
                                        ;(specification->package "freetds")
            (specification->package "brightnessctl") ; works!
                                        ;(specification->package "acpilight")
                                        ;(specification->package "light")
            (list (specification->package "bind") "utils")
            (specification->package "du-dust")
                                        ; (specification->package "exhale") ???
            (specification->package "sed") ; used by guix home and not there
            (specification->package "testdisk")
            (specification->package "ntfs-3g")
            (specification->package "ddcutil")
            
            (specification->package "qmk")
            (specification->package "dfu-util") ; to flash keyboard firmware

            (specification->package "d-feet") ; to look at dbus

            ;; For secret-tool, a frontend for gnome-keyring-daemon.
            (specification->package "libsecret")
            
                  ;;; Experimental System Tools

            (specification->package "bat")

                  ;;; Fonts

            (specification->package "font-google-noto")
            (specification->package "font-dejavu")
            (specification->package "font-google-noto-sans-cjk")
            (specification->package "font-ipa-ex")
            (specification->package "font-wqy-zenhei")
            (specification->package "font-jetbrains-mono")

                  ;;; Multimedia

            (specification->package "yt-dlp")
            (specification->package "pavucontrol")
            (specification->package "ffmpeg")
            (specification->package "obs")
            (specification->package "mplayer")
            (specification->package "mpv")
            (specification->package "handbrake")
                                        ;(specification->package "abcde")
            (specification->package "espeak")
            (specification->package "imagemagick")
            (specification->package "inkscape")
            (specification->package "bluefish")
                                        ;(specification->package "graphicsmagick")
            (specification->package "audacity")
            (specification->package "gimp")
                                        ;(specification->package "dvdbackup")
                                        ;(specification->package "wavpack")
                                        ;(specification->package "lame")
                                        ;(specification->package "cdparanoia")
            (specification->package "geeqie")

                  ;;; Programming

            idea

            ;; Typescript compiler.
            (specification->package "rust-swc")
                                        ;(specification->package "vscodium")
            (specification->package "wireshark")
            (specification->package "kicad")
            (specification->package "meld")
            (specification->package "gnuradio")
                                        ;(specification->package "swi-prolog") ; has emacs lsp-mode integration
            (specification->package "asciidoc")
                                        ;(specification->package "racket")
            (specification->package "gdb")
            (specification->package "rr")
                                        ;(specification->package "mercurial")
            (specification->package "git")
            ;; For texmacs. Seriously?
            (specification->package "subversion")
                                        ; Reverse Engineering
            (specification->package "radare2")
            (specification->package "emacs-julia-mode")
            (specification->package "emacs-julia-repl")
            (specification->package "emacs-julia-snail")
            (specification->package "emacs-inf-ruby")
            
            (list (specification->package "git") "send-email")
            (specification->package "nasm")
            ;; (specification->package "julia")
            ;; (specification->package "julia-intervalsets")
            ;; (specification->package "julia-logexpfunctions")
            ;; (specification->package "julia-latexstrings")
            ;; (specification->package "julia-unitful")
            ;; (specification->package "julia-tensorcore")
            ;; ;(specification->package "julia-softglobalscope")
            ;; (specification->package "julia-reexport")
            ;; (specification->package "julia-pycall") ; !!!
            ;; (specification->package "julia-parameters")
            ;; (specification->package "julia-offsetarrays") ; !!!!
            ;; (specification->package "julia-calculus")
            ;; (specification->package "julia-missings")
            ;; ; (specification->package "julia-infinity") ; broken
            ;; (specification->package "julia-nanmath")
            ;; (specification->package "julia-muladdmacro") ; FMA
            ;; (specification->package "julia-mlstyle")
            ;; (specification->package "julia-mappedarrays")
            ;; (specification->package "julia-itertools")
            ;; (specification->package "julia-irrationalconstants")
            ;; (specification->package "julia-interpolations")
            ;; (specification->package "julia-astrolib")
            ;; (specification->package "julia-automa")
            ;; (specification->package "julia-combinatorics")
            ;; (specification->package "julia-documenter")
            ;; (specification->package "julia-ellipsisnotation")
            ;; (specification->package "julia-inversefunctions")
            ;; (specification->package "julia-measurements")
                                        ; julia-xkbcommon-jll
                                        ; julia-wayland-protocols-jll
                                        ; julia-wayland-jll
            (specification->package "jupyter")
            (specification->package "jupyter-guile-kernel")
            (specification->package "guile-ares-rs")
            (specification->package "diffoscope")
            (specification->package "diffstat")
            (specification->package "hugs")
                                        ;(specification->package "gprolog")
                                        ;(specification->package "fpc")
                                        ;(specification->package "esbuild")
                                        ;(specification->package "ocaml")
                                        ;(specification->package "gforth") ; also has emacs support
                                        ;(specification->package "clojure")
                                        ;(specification->package "clojure-tools")
            
                                        ; (specification->package "leiningen")
                                        ;(specification->package "pure")
            (specification->package "kicad-symbols")
            (specification->package "kicad-footprints")
            (specification->package "godot")
                                        ;(specification->package "glade")
                                        ; hell no (specification->package "node")
            (specification->package "git-lfs")
                                        ;(specification->package "sbcl")
                                        ;(specification->package "sbcl-binpack") ; for textures
            (specification->package "jq")
                                        ;(specification->package "make")
            (specification->package "expect")
                                        ;(specification->package "lazygit")
            (specification->package "direnv")
                                        ; In container (specification->package "vala") ; gtk
            (specification->package "badass") ; generate fake commits on github

                  ;;; Game development
                                        ; libresprite
                                        ; aseprite
            

                  ;;; Emacs

                                        ; TODO maybe browse-at-remote (but it REALLY uses a browser)
                                        ; TODO maybe emacs-git-link
            (specification->package "emacs-casual-calc")
            (specification->package "emacs-casual-info")
            (specification->package "emacs-casual-dired")
                                        ;(specification->package "emacs-casual-avy")
            (specification->package "texlive-digestif")
            ;; For xenops
            (specification->package "emacs-aio")
            (specification->package "emacs-lsp-booster")
            (specification->package "emacs-pgtk")
            (specification->package "emacs-paredit")
            (specification->package "emacs-crdt")
            (specification->package "emacs-magit")
            (specification->package "emacs-diff-hl") ; VC diff in the fringe
            (specification->package "emacs-inheritenv")
            (specification->package "emacs-color-theme-solarized")
            (specification->package "emacs-dtrt-indent")
            (specification->package "emacs-slime-company")
            (specification->package "emacs-eval-in-repl-slime")
            (specification->package "emacs-pyvenv") ; we're not really using that
            ;; For Lisp and Javascript; Note: emacs-sly is a fork
            (specification->package "emacs-slime")
            (specification->package "emacs-org-roam")
            (specification->package "emacs-org-ref")
            (specification->package "emacs-org-super-agenda")
            (specification->package "emacs-org-timeblock")
            (specification->package "emacs-org-remark") ; add notes to epub and websites
            (specification->package "emacs-org-pomodoro")
            (specification->package "emacs-org-emms")
            (specification->package "emacs-mu4e-dashboard") ; live query mu4e from org
            (specification->package "emacs-emms")
            (specification->package "emacs-comment-tags")              
            (specification->package "emacs-embark")
            ;; Used by emacs-dap-mode
            (patch2 (specification->package "emacs-lsp-treemacs"))
            ;; Used by emacs-dap-mode
            (specification->package "emacs-bui")
            ;; Used by emacs-dap-mode (popup)
            (specification->package "emacs-posframe")
            (patch2 (specification->package "emacs-dap-mode"))
            (patch2 (specification->package "emacs-lsp-mode"))
            (patch2 (specification->package "emacs-lsp-ui"))
                                        ; doesn't work (specification->package "emacs-lsp-docker")
                                        ; part of emacs since emacs 29 (specification->package "emacs-csharp-mode")
                                        ;(specification->package "emacs-lsp-java") ; conflicts with our patched dap-mode
                                        ;(specification->package "emacs-elpy") ; just use dap-python ; elpy is unmaintained
            (specification->package "emacs-tramp")
            (specification->package "emacs-agda2-mode")
            (specification->package "emacs-treemacs")
            (specification->package "emacs-magit-gerrit")
            (specification->package "emacs-magit-svn")
            (patch2 (specification->package "emacs-rustic"))
            (specification->package "emacs-projectile")
            (specification->package "emacs-company")
            (specification->package "emacs-capf-autosuggest")
            (specification->package "emacs-flycheck")
                                        ;(specification->package "emacs-helm")
            (specification->package "emacs-shackle")
            (specification->package "emacs-envrc")
            (specification->package "emacs-clojure-mode")
            (specification->package "emacs-haskell-mode")
            (specification->package "emacs-flycheck-guile")
            (specification->package "emacs-geiser-guile")
            (specification->package "emacs-parinfer-mode")
            (specification->package "emacs-web-mode")
            (specification->package "emacs-git-timemachine")
            (specification->package "emacs-markdown-mode")
            (specification->package "emacs-geiser")
            (specification->package "emacs-go-mode")
            (specification->package "emacs-typescript-mode")
            (specification->package "emacs-pkg-info")
            (specification->package "emacs-flycheck-rust")
            (specification->package "emacs-rust-mode")
                                        ; obsolete in favor of integrated tramp-container
                                        ;(specification->package "emacs-docker-tramp")
            (specification->package "tree-sitter-cli")
            (specification->package "tree-sitter-clojure")
            (specification->package "tree-sitter-gomod")
            (specification->package "tree-sitter-html")
            (specification->package "tree-sitter-python")
            (specification->package "tree-sitter-css")
            (specification->package "tree-sitter-rust")
            (specification->package "tree-sitter-c-sharp")
            (specification->package "tree-sitter-racket")
            (specification->package "tree-sitter-scheme")
            (specification->package "tree-sitter-org")
            (specification->package "tree-sitter-markdown")
            (specification->package "tree-sitter-julia")
            (specification->package "tree-sitter-json")
            (specification->package "tree-sitter-go")
            (specification->package "tree-sitter-bash")
            (specification->package "tree-sitter-elixir")
            (specification->package "tree-sitter-c")
            (specification->package "tree-sitter-haskell")
            (specification->package "tree-sitter-java")
            (specification->package "tree-sitter-javascript")
            (specification->package "tree-sitter-typescript")
            (specification->package "tree-sitter-cpp")
            (specification->package "tree-sitter-verilog")
            (specification->package "tree-sitter-vhdl")
            (specification->package "emacs-eat")
                                        ; statistics: R, Julia, and JAGS.
            (specification->package "emacs-ess")

            (specification->package "python-jupyter-client") ; required by emacs-jupyter (for no reason; why not just invoke "jupyter kernel"?)
            (specification->package "emacs-jupyter")
            (specification->package "emacs-guix")
            (specification->package "emacs-counsel")
            (specification->package "emacs-counsel-tramp")
            (specification->package "emacs-counsel-projectile")
                                        ;(specification->package "emacs-counsel-jq")
                                        ;(specification->package "emacs-helm-projectile")
            (specification->package "emacs-company-jedi") ; Python completion
            (specification->package "emacs-back-button")
                                        ;(specification->package "emacs-wanderlust") ; email (POP3, IMAP and Maildir)
                                        ;I moved from wanderlust to mew because I find mew has better support for encryption, particularly S/MIME.
                                        ;(specification->package "emacs-mew")
            (specification->package "mu") ; maildir indexer, mu4e
            (specification->package "emacs-vertico")
            (specification->package "emacs-consult")
            (patch2 (specification->package "emacs-consult-lsp"))
            (specification->package "emacs-consult-xdg-recent-files")
            (specification->package "emacs-consult-org-roam")
            (specification->package "emacs-consult-flycheck")
            (specification->package "emacs-marginalia")
            (specification->package "emacs-orderless")
            (specification->package "emacs-qrencode")
            (specification->package "emacs-forge")
                                        ; Columns
            (specification->package "emacs-taxy-magit-section")
            (specification->package "emacs-ghub")
            (specification->package "emacs-github-review")
                                        ;(specification->package "emacs-svg-tag-mode")
            ;; This one uses text styling and so makes the user's stuff more editable than svg-tag-mode
            ;; Replaces org-bullets and org-superstar
            (specification->package "emacs-org-modern")
            ;; Used by emacs-doom-modeline. Requires nerd font. Can install it via M-x nerd-icons-install-fonts to ~/.local/share/fonts
            ;; Don't forget to M-x customize-variable lsp-treemacs-theme to "Iconless" without quotes. It will show icons from the font anyway.
            (specification->package "emacs-nerd-icons")
                                        ;(specification->package "emacs-doom-modeline")
            (specification->package "emacs-pulsar")
            (specification->package "emacs-rainbow-delimiters")
            ;; What's the difference to which-key ??
            (specification->package "emacs-discover-my-major")
            (specification->package "emacs-which-key")
            (specification->package "emacs-auctex")
            (specification->package "emacs-company-auctex")
            (specification->package "emacs-latex-extra")
            (specification->package "emacs-adoc-mode")
            (specification->package "emacs-tempel")
            (specification->package "emacs-debbugs")
            ;; Alternative: emacs-reformatter
            (specification->package "emacs-format-all-the-code")
            ;; For swank-js to use.  But it doesn't work with multiple major modes yet. TODO: css-mode;
            (specification->package "emacs-js2-mode")
                                        ; typescript mode done by combobulate
            ;; This one works with multiple major modes (and thus with Vue JS, mmm)
                                        ; shipped by default (specification->package "emacs-js-mode")
            ;; Allows multiple major modes to coexist in one buffer
            (specification->package "emacs-mmm-mode")
            ;; For Clojure. Supports light table.
            (specification->package "emacs-cider")
            (specification->package "emacs-vala-mode")
            ;; Shows number of search results in status bar
            (specification->package "emacs-anzu")
            (specification->package "emacs-dired-rsync")
            (specification->package "emacs-dockerfile-mode")
            (specification->package "emacs-emacsql")
                                        ;(specification->package "emacs-helm-cider")
                                        ; TODO (specification->package "emacs-graphviz-dot-mode")
            (specification->package "emacs-jinja2-mode")
            ;; Spaced repetition in org mode.
            (specification->package "emacs-org-fc")
            ;; Visual undo.
            (specification->package "emacs-vundo")
            ;; Weather info
            (specification->package "emacs-wttrin")
            ;; org->HTML export
            (specification->package "emacs-org-re-reveal")
                                        ; unused
            (specification->package "emacs-frames-only-mode")
                                        ; https://github.com/karthink/popper special-case popup windows in general.
            (specification->package "emacs-popper")
                                        ; TODO avy
            (specification->package "emacs-elfeed") ; RSS/Atom
            (specification->package "emacs-elfeed-score")
            (specification->package "emacs-elfeed-org") ; subscriptions in org mode
            (specification->package "emacs-fortran-tags")
                                        ; or celluloid for gtk
            (specification->package "emacs-mpv")
                                        ;(specification->package "emacs-empv") ; ?
                                        ; emacs-ytel
            (specification->package "emacs-nov-el") ; for epub
            
            ;; Guile IDE
            (specification->package "emacs-arei")
            (specification->package "guile-ares-rs")
                                        ; I adapt it (specification->package "emacs-combobulate")
                                        ; FIXME https://github.com/mclear-tools/consult-notes
                                        ; and then (consult-notes-org-roam-mode)
                                        ; HELM!?
                                        ;emacs-consult-notmuch
                                        ;emacs-consult-yasnippet
                                        ;emacs-consult-bibtex
                                        ;emacs-consult-dir
                                        ; Ivy[built-in]
                                        ; company-mode
                                        ; consult: Either use the default completion UI or ensure that exactly one of vertico-mode, mct-mode, or icomplete-mode is enabled. The unsupported modes selectrum-mode, ivy-mode, helm-mode, ido-mode and ido-ubiquitous-mode must be disabled.
                                        ; emacs vertico uses built-in completion; better than helm
                                        ;(specification->package "texmacs")
            (patch5 (let ((base (specification->package "mogan")))
                      (package (inherit base)
                        (inputs
                         (modify-inputs (package-inputs base)
                                        (prepend qtwayland-5)))

                        )))

                  ;;; Theorem Proving

                                        ;(specification->package "agda")
                                        ;(specification->package "lean")
                                        ;(specification->package "tla2tools")
            (specification->package "tree-sitter-tlaplus")

                  ;;; Learning
            
            (specification->package "anki")
            ;; One of the problems with one-way sync/extract from org-mode files to Anki database is losing out the context (imagine notes from a technical books).
            ;; I use org-drill in combination with org-sticky-header, which show the path of headings to that particular node.
            ;; Normally in Anki, this requires to add some extra descriptions or tags for this purpose. In org-mode, we get this for free.
            ;; But on the other hand, org-drill will fill your org file with scheduling and metadata drawers.
            ;; Another drawback with org-drill is it manages schedules for one "card" per heading, hence cloze items are not scheduled individually.
            ;; So, either you remember entirely "Alfred North Whitehead wrote [Principia Mathematica] in [1910]" or not at all.
            ;; In Anki, not only the book title "[Principia Mathematica]" and the written year "[1910]" are tested separately (same as org-drill),
            ;; but also scheduled/scored separately too (where org-drill falls short).
            ;; Use both, org-drill mostly for books, Anki for "standalone" facts.
            (specification->package "emacs-anki-editor")
            ;; https://github.com/louietan/anki-editor
            (specification->package "emacs-org-drill")
                                        ; similar: (specification->package "emacs-gnosis")

            (specification->package "pandoc")
            (specification->package "emacs-pandoc-mode")
            (specification->package "emacs-ox-pandoc")
            (specification->package "emacs-org-pandoc-import")
            (specification->package "emacs-org-auto-tangle")

            (specification->package "emacs-pdf-tools")
            
                  ;;; Network

            (specification->package "mailutils")
            (specification->package "iptables")
            (specification->package "nftables")
                                        ;(specification->package "mpop") ; TODO: guix home service
            (specification->package "offlineimap3")
            (specification->package "freerdp")
            ;; Namespace "Gst" is not available
            ;; xpra needs to be installed on the remote host as well!
            (specification->package "openvpn")
            (specification->package "mosh")
            (specification->package "ublock-origin-chromium")
            (specification->package "gnupg")
            (specification->package "transmission")
            (specification->package "openconnect")
            (specification->package "network-manager-openconnect")
            (specification->package "network-manager-openvpn")
            (specification->package "ungoogled-chromium")
            (specification->package "icecat")
                                        ;(specification->package "gfeeds")
            (specification->package "gource") ; commit visualization
            (specification->package "nheko")
                                        ;(specification->package "rtorrent")
            (specification->package "sshfs")
            (specification->package "rsync")
                                        ;(specification->package "davfs2")
            (specification->package "rclone")
            (specification->package "netcat")
            (specification->package "nmap")
            (specification->package "ntp")
                                        ;(specification->package "irssi")
            (specification->package "samba")
            (specification->package "curl")
            (specification->package "qrencode")
            (specification->package "remmina")
            (specification->package "rtorrent")
           
                  ;;; Python

            (specification->package "pypy")
            (specification->package "python-lxml")
            (specification->package "python")
            (specification->package "python-sympy")
            (specification->package "python-sentencepiece")
            (specification->package "python-debugpy") ; DAP

            ;;; AI

            (specification->package "llama-cpp")
            (specification->package "emacs-gptel")

                  ;;; Android
            
            (transform1 (specification->package "aapt2"))
            (transform1 (specification->package "adb"))
            (transform1 (specification->package "fastboot"))

                  ;;; Emulation/Container

            (specification->package "bubblewrap")
            (specification->package "libvirt")
            (specification->package "flatpak")
            (specification->package "dosbox")
            (specification->package "docker-compose")
            (specification->package "podman")
            ;; Otherwise podman is very slow and takes enormous amount of storage.
            (specification->package "fuse-overlayfs")
                                        ;(specification->package "podman-compose") ; unnecessary

                  ;;; Games

            (specification->package "daikichi") ; fortune
            (specification->package "fortunes-jkirchartz")
            (specification->package "steam")
            (specification->package "freeciv")

                  ;;; Office

            (specification->package "gv")
                                        ;(specification->package "vim")
            (specification->package "nano")
            (specification->package "libreoffice")
            (specification->package "evince")
            (specification->package "gedit")
            (specification->package "fbreader")
            (specification->package "sioyek")

                  ;;; Database

            (specification->package "sqlite")
            (specification->package "postgresql")

                  ;;; Science

            (specification->package "texlive-pgfopts") ; used by cadabra2 < 2.5.2
            (specification->package "texlive-ytableau") ; used by cadabra2 < 2.5.2
            (specification->package "texlive-setspace") ; used by cadabra2 < 2.5.2
            ;; Supported by texmacs
            (specification->package "cadabra2")
            ;; Supported by texmacs
            (specification->package "giac")
            ;; Supported by texmacs
            (specification->package "graphviz")
            ;; Supported by texmacs
            (specification->package "gnuplot")
            ;; Symbolic math, supported by texmacs and emacs
            (specification->package "maxima")
                                        ;(specification->package "texlive-breqn")
            (specification->package "texlive-tensor")
            ;; Supported by texmacs
            (specification->package "scilab")

                  ;;; Multimedia Toys

            (specification->package "espeak-ng")
            (specification->package "mumble")
            ;; wpctl
            (specification->package "wireplumber")
            ;; pipewire effect control; TODO: jdsp2linux instead
            (specification->package "easyeffects")

                  ;;; Crypto

            (specification->package "yubikey-personalization")
            (specification->package "python-yubikey-manager")

            ;;; Network Admin

            (specification->package "k9s")
            (specification->package "kubectl"))))
 (services
  (list
    ;;;(service home-pulseaudio-rtp-sink-service-type)
   (service home-fish-service-type)
   (service home-pipewire-service-type)
   (service home-shepherd-service-type)
   (service home-dbus-service-type)
    ;;;(service home-dicod-service-type)
    ;;;(service home-dotfiles-service-type)
    ;;;(service home-fontutils-service-type)
   (service home-gpg-agent-service-type
            (home-gpg-agent-configuration
             (pinentry-program
              (file-append (specification->package "pinentry-gnome3") "/bin/pinentry-gnome3"))))
   (service home-ssh-agent-service-type)
   (service home-channels-service-type)
   (service home-msmtp-service-type
            (home-msmtp-configuration
             (accounts
              (list
               (msmtp-account
                (name "dannym@tx0.org")
                (configuration
                 (msmtp-configuration
                  (tls? #t)
                  (tls-starttls? #t)
                  (log-file "log/mail/dannym@tx0.org.log")
                  (from "dannym@tx0.org")
                  (host "mx.sdf.org") ; later mx.sdf.org (imaps)
                  (port 25)
                  (user "dannym")
                  (password-eval "pass Mail/dannym@tx0.org"))))))))
   (service home-mcron-service-type)
    ;;;(service home-kodi-service-type)
    ;;;(service home-znc-service-type) ; IRC
    ;;;(service home-parcimonie-service-type)
    ;;;(service home-batsignal-service-type)
    ;;;(service home-inputrc-service-type)
    ;;; home-symlink-manager-service-type
    ;;; home-syncthing-service-type
   (service home-xdg-base-directories-service-type)
   (service home-xdg-mime-applications-service-type)
                                        ; automatic (service home-fontconfig-service-type)
                                        ;    (service home-channels-service-type)
   (simple-service 'nonguix-packages-service
                   home-channels-service-type
                   (list
                    (channel
                     (name 'nonguix)
                     (url "https://gitlab.com/nonguix/nonguix")
                     ;; Enable signature verification:
                     (introduction
                      (make-channel-introduction
                       "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
                       (openpgp-fingerprint
                        "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))))
   
   (simple-service 'guix-android-packages-service
                   home-channels-service-type
                   (list
                    (channel
                     (name 'guix-android)
                     (url "https://framagit.org/tyreunom/guix-android.git")
                     (introduction
                      (make-channel-introduction
                       "d031d039b1e5473b030fa0f272f693b469d0ac0e"
                       (openpgp-fingerprint
                        "1EFB 0909 1F17 D28C CBF9  B13A 53D4 57B2 D636 EE82"))))))

   (simple-service 'guix-hpc-packages-service
                   home-channels-service-type
                   (list
                    (channel
                     (name 'guix-hpc)
                     (url "https://gitlab.inria.fr/guix-hpc/guix-hpc.git")
                     (branch "master")
                                        ;(introduction
                                        ;  (make-channel-introduction
                                        ;   "d031d039b1e5473b030fa0f272f693b469d0ac0e"
                                        ;(openpgp-fingerprint
                                        ; "1EFB 0909 1F17 D28C CBF9  B13A 53D4 57B2 D636 EE82")))
                     )))

   ;; Screencasting
   (simple-service 'custom-dbus-services home-dbus-service-type (list (specification->package "xdg-desktop-portal-wlr")))

   (service home-bash-service-type
            (home-bash-configuration
             (aliases '(("grep" . "grep --color=auto")
                        ("ll" . "ls -l")
                        ("ls" . "ls -p --color=auto")))
             (bashrc (list (local-file
                            ".bashrc"
                            "bashrc")))
             (bash-profile (list (local-file
                                  ".bash_profile"
                                  "bash_profile"))))))))
