;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules (gnu home)
             (gnu packages) ;; To extend %load-path with channels
             (gnu services)
             (gnu services shepherd)
             (guix transformations)
             (guix gexp)
             (guix utils)
             (guix describe)
             (guix git-download)
             (guix download)
             (guix packages)
             (guix build-system)
             (guix build-system cmake)
             (guix build-system emacs)
             (guix build-system gnu)
             (guix build-system python)
             (guix build-system pyproject)
             (guix channels)
             (ice-9 match)
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
             (gnu packages emacs-xyz)
             (guix build-system glib-or-gtk)
             (gnu packages gnome) ; libsecret
             (gnu packages java) ; jbr
             (gnu packages qt) ; qtwayland-5
             (gnu packages guile)
             (gnu packages glib)
             (gnu packages gtk)
             (gnu packages autotools)
             (gnu packages xml)
             (gnu packages base)
             (gnu packages gettext)
             (gnu packages perl)
             (gnu packages python)
             (gnu packages image)
             (gnu packages sqlite)
             (gnu packages pkg-config)
             (gnu packages freedesktop)
             (gnu packages check)
             (gnu packages crypto)
             (gnu packages fontutils) ; freetype
             (gnu packages python-build)
             (gnu packages python-check) ; python-mypy-extensions
             )

(use-modules ((guix licenses) #:prefix license:))
(define transform1
  (options->transformation `((with-patch . ,(string-append "libcxx@12.0.1="
                                                           "patches/libcxx2.patch")))))

;; TODO: We don't use it anymore--but maybe it would be a good idea for Guix to have it.
(define patch1
  (options->transformation `((with-patch . ,(string-append "emacs-dap-mode="
                                                           "patches/dap-mode.patch")))))

(define patch2
  (options->transformation `((with-patch . ,(string-append "emacs-lsp-mode="
                                                           "patches/lsp-mode.patch")))))

                                        ;(define patch5
                                        ;  (options->transformation `((with-debug-info . "mogan")
                                        ;                             (with-patch . ,(string-append "mogan="
                                        ;                                                          "patches/mogan-wayland.patch")))))

                                        ;(define texmacs-patch
                                        ;  (options->transformation `( ;(with-debug-info . "qtbase")
                                        ;                             (with-debug-info . "texmacs-guile3")
                                        ;                             (with-patch . ,(string-append "texmacs-guile3="
                                        ;                                                           "patches/texmacs-wayland.patch")))))

;; Avoid etc/images/diropen.xpm and diropen.xbm
(define emacs-patch
  (options->transformation `((with-patch . ,(string-append "emacs-pgtk="
                                                           "patches/emacs-tab-stops.patch")))))

(define offlineimap-patch
  (options->transformation `((with-patch . ,(string-append "python-imaplib2="
                                                           "patches/imaplib2-python3.patch")))))

(define nwg-launchers-patch
  (options->transformation `((with-patch . ,(string-append "nwg-launchers="
                                                           "patches/nwg-launchers-startup-notification.patch")))))

(define sway-patch
  (options->transformation `((with-patch . ,(string-append "sway="
                                                           "patches/sway-busy-cursor.patch")))))

                                        ;(define emacs-gptel-patch
                                        ;  (options->transformation `((with-patch . ,(string-append "emacs-gptel="
                                        ;                             "patches/emacs-gptel.patch")))))

(define ungoogled-chromium-patch
  (options->transformation `( ;(with-debug-info . "ungoogled-chromium")
                             (with-patch . ,(string-append "ungoogled-chromium="
                                                           "patches/7b0d7f4.diff")))))

(define emacs-spacious-padding-patch
  (options->transformation `((with-patch . ,(string-append "emacs-spacious-padding="
                                                           "patches/emacs-spacious-padding2.patch")))))

(define emacs-color-theme-solarized-patch
  (options->transformation `((with-patch . ,(string-append "emacs-color-theme-solarized="
                                                           "patches/emacs-color-theme-solarized2.patch")))))

(define network-manager-applet-patch
  (options->transformation `(  ;  (with-debug-info . "libappindicator")
                                        ;(with-debug-info . "gtk+")
                             (with-patch . ,(string-append "network-manager-applet="
                                                           "patches/network-manager-applet.patch")))))

;; Nope.
(define issue-30-emacs-window-tool-bar-patch
  (lambda (p)
    (package
      (inherit p)
      ;(name "emacs-window-tool-bar-patch")
      
      (source
       (origin
              (method git-fetch)
              (uri (git-reference
                    (url "git@github.com:daym/window-tool-bar.git")
                    (commit "fix-integration-with-tab-line")))
              ;(file-name (git-file-name name version))
              (sha256
               (base32
                "3khywgals4j751sdp70widkvcsfrfl17y92sg0yyg6n4m5plw791"))))))) ; I need that

(define emacs-window-tool-bar-patch
  (options->transformation `(  ;  (with-debug-info . "libappindicator")
                                        ; for header line.
                             (with-patch . ,(string-append "emacs-window-tool-bar="
                                                           ;"patches/window-tool-bar-header.patch" ; ok but useless
                                                           "patches/emacs-window-tool-bar-click2.patch" ; I need that
                                                           ;"patches/32.patch"
                                                           ))
                             )))


(define vorta-patch
  (options->transformation `(  ;  (with-debug-info . "vorta")
                             (with-patch . ,(string-append "vorta="
                                                           "patches/vorta-2205.patch"
                                                           ))
                             )))


(define llama-tune
  (options->transformation `( ; "invalid Git URL replacement specification" (with-git-url . "https://github.com/unslothai/llama.cpp.git") ; dynamic quantization
                             (tune . "znver3")))) ; Zen 3

(define waybar-patch
  (lambda (p)
    (package
      (inherit p)
      (inputs
       (modify-inputs (package-inputs p)
                      (delete "pipewire")
                      (delete "pulseaudio"))))))

                                        ;doesn't apply
                                        ;(define patch6
                                        ;  (options->transformation '((with-patch . "sway=/home/dannym/src/guix-config/sway-hidpi-xwayland.patch"))))

(define emacs-pgtk (emacs-patch (specification->package "emacs-pgtk")))

(define (package-with-emacs-pgtk p)
  (package
    (inherit p)
    (propagated-inputs
     (map (match-lambda ((name (? package? q) sub-drvs ...)
                         `(,name ,(package-with-emacs-pgtk q) ,@sub-drvs)))
          (package-propagated-inputs p)))
    (arguments
     (if (and (eq? 'emacs (build-system-name (package-build-system p)))
              (not (string=? (package-name p) "emacs-jedi")) ; test failure on native compilation
              (not (string=? (package-name p) "emacs-dap-mode")) ; native-compiler-error-empty-byte
              (not (string=? (package-name p) "emacs-yaml"))) ; would hang otherwise
                                        ; emacs-guix emacs-haskell-mode emacs-pdf-tools
         `(#:emacs ,emacs-pgtk
           ,@(package-arguments p))
         (package-arguments p)))))

(define %source-dir (string-append (getcwd) "/idea"))

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
                               ;; Otherwise GradleProjectSettings Jvm never get actually resolved when you select "#JAVA_HOME" in the Ctrl-S gradle "Gradle JVM" GUI. The next Gradle sync then will fail with mysterious error message "Invalid Gradle JDK configuration found.". Very unfun.
                               `("JAVA_HOME" = (,(assoc-ref inputs "openjdk")))
                               `("JBR21" = (,(assoc-ref inputs "jbr21")))
                               `("JBR17" = (,(assoc-ref inputs "jbr17")))
                               `("RIDER_JDK" = (,(assoc-ref inputs "jbr21")))
                               `("MPS_JDK" = (,(assoc-ref inputs "jbr21")))
                               `("CLION_JDK" = (,(assoc-ref inputs "jbr21")))
                               `("IDEA_JDK" = (,(assoc-ref inputs "jbr21")))
                               `("STUDIO_JDK" = (,(assoc-ref inputs "jbr21")))
                               `("PYCHARM_JDK" = (,(assoc-ref inputs "jbr21"))))))
                         '("android-studio" "idea" "pycharm" "rider" "mps"))
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
       ("openjdk" ,openjdk "jdk")
       ("jbr17" ,jbr17 "jdk")
       ("jbr21" ,jbr21 "jdk")
       ("libsecret" ,libsecret)))
    (synopsis "IDE")
    (description "This package provides an IDE.")
    (home-page "https://www.jetbrains.com/idea/")
    (license license:asl2.0)))

(define emacs-xenops
  (package
    (name "emacs-xenops")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                     (url "https://github.com/dandavison/xenops.git")
                     (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1vsrc1s62kv1i84skm6k5zy868gayjck268qwj38rpspc8c5qgih"))))
    (build-system emacs-build-system)
    (synopsis "xenops")
    (description "FIXME")
    (home-page "FIXME")
    (license license:expat)))

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
                              "wlogout"
                              "kanshi" ; screen config profiles
                              "wf-recorder" ; screen recorder (for wlroots only)
                              "wlr-randr"
                              "wob" ; user-custom pipeable bar
                                        ;"sway"
                              "swayidle"
                              "wl-clipboard"
                              "cliphist" ; or maybe wl-clip-persist ; in any case requires wl-clipboard
                                        ;"nwg-launchers"
                              "rofi-wayland"
                              "waypipe"
                              "slurp" ; screenshot
                                        ;"scrot" ; screenshot ; supposedly only xorg
                              "maim" ; screenshot; need no hold-drag
                              "grimshot"
                              )))

(define backup-packages
  (specifications->packages '("vorta" "cryfs" "onedrive")))

;; Rewrites in Rust
                                        ;(specification->package "fish")
;; In Rust to begin with
                                        ;(specification->package "nushell")

(define-public xdg-desktop-portal-gtk
  (package
    (name "xdg-desktop-portal-gtk")
    (version "1.14.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/flatpak/xdg-desktop-portal-gtk/releases/download/"
                    version "/xdg-desktop-portal-gtk-" version ".tar.xz"))
              (sha256
               (base32
                "002p19j1q3fc8x338ndzxnicwframpgafw31lwvv5avy329akqiy"))))
    (build-system glib-or-gtk-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'po-chmod
           (lambda _
             ;; Make sure 'msgmerge' can modify the PO files.
             (for-each (lambda (po)
                         (chmod po #o666))
                       (find-files "po" "\\.po$"))
             #t)))
       ;; Enable Gnome portal backends
       #:configure-flags
       (list
        "--enable-appchooser"
        "--enable-wallpaper"
        "--enable-screenshot"
        "--enable-screencast"
        "--enable-background"
        "--enable-settings")))
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("autoconf" ,autoconf)
       ("automake" ,automake)
       ("libtool" ,libtool)
       ("libxml2" ,libxml2)
       ("glib:bin" ,glib "bin")
       ("which" ,which)
       ("gettext" ,gettext-minimal)))
    (inputs
     `(("glib" ,glib)
       ("gtk" ,gtk+)
       ("fontconfig" ,fontconfig)
       ("gnome-desktop" ,gnome-desktop)
       ("gsettings-desktop-schemas" ,gsettings-desktop-schemas)))
    (propagated-inputs
     (list xdg-desktop-portal))
    (home-page "https://github.com/flatpak/xdg-desktop-portal-gtk")
    (synopsis "GTK implementation of xdg-desktop-portal")
    (description
     "This package provides a backend implementation for xdg-desktop-portal
which uses GTK+ and various pieces of GNOME infrastructure, such as the
@code{org.gnome.Shell.Screenshot} or @code{org.gnome.SessionManager} D-Bus
interfaces.")
    (license license:lgpl2.1+)))

(define-public gtkmm-3
  (package
    (inherit gtkmm)
    (name "gtkmm")
    (version "3.24.9-fixed")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://gnome/sources/" name "/"
                       (version-major+minor version)  "/"
                       name "-" version ".tar.xz"))
       (sha256
        (base32 "1kj4mla3z9kxhdby5w88nl744xkmq6xchf79m1kfa72p0kjbzm9h"))))
    (propagated-inputs
     (list atkmm-2.28
           cairomm-1.14
           glibmm-2.66
           gtk+
           pangomm-2.46))))

(define-public cadabra2x
  (package
    (inherit (specification->package "cadabra2"))
    (inputs
     (list glibmm-2.66 gmp python boost gtkmm-3 sqlite python-gmpy2 python-sympy
           python-mpmath python-matplotlib texlive-dvipng
           `(,util-linux "lib")))))

(define cadabra2 (specification->package "cadabra2"))

(define-public emacs-xah-wolfram-mode
  (package
    (name "emacs-xah-wolfram-mode")
    (version "2.19.20241225115617")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xahlee/xah-wolfram-mode.git")
                    (commit "8baa0bf340ebea965e7eca43a0cd24f2303b96e7")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "01xwyzzrivyi40h40zwlja9p2pnp3xklvkax7kb1kj3dbwlwqf87"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'patch
            (lambda _
              (substitute* "xah-wolfram-mode.el"
                ;; Or: "mathics" on the right side.
                (("wolframscript") "wolframscript")))))))
    (synopsis "Mode for the Wolfram language")
    (description "This package provides a mode for the WL language--for
example the one implemented by python-mathics-core.")
    (home-page "http://xahlee.info/emacs/misc/xah-wolfram-mode.html")
    (license license:expat)))

(define emacs-guix
  (specification->package "emacs-guix"))

(define-public emacs-guix-minimal
  (package
    (inherit emacs-guix)
    (build-system emacs-build-system)
    (native-inputs '())
    (inputs '())
    (propagated-inputs '())
    (arguments
     (list
      #:include ''("\
^guix-(auto-mode|build-log|derivation|env-var|prettify|scheme|utils)\\.el")
      #:modules '((guix build emacs-build-system)
                  (guix build utils)
                  (srfi srfi-26)
                  (srfi srfi-71)
                  (ice-9 regex)
                  (ice-9 textual-ports))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'patch-source
            (lambda _
              (chdir "elisp")
              (let* ((all (call-with-input-file "guix-utils.el"
                            get-string-all))
                     (match-str
                      (lambda (from to base)
                        (let ((res (string-match
                                    (string-append "(" from ".*)" to)
                                    base)))
                          (values (and res (match:substring res 1))
                                  (match:suffix res)))))
                     (pprint rest (match-str
                                   "\\(cl-defun guix-pretty-print-buffer"
                                   "\\(defun guix-pretty-print-file"
                                   all))
                     (search rest (match-str
                                  "\\(defmacro guix-while-search"
                                   "\\(defmacro guix-while-null"
                                   rest)))
                (substitute* "guix-build-log.el"
                 (("guix-find-file-or-url") "find-file-existing"))
                (substitute* "guix-derivation.el"
                  (("guix-find-file") "find-file-existing"))
                (call-with-output-file "guix-utils.el"
                  (lambda (port)
                    (display "(require 'cl-lib)\n\n" port)
                    (for-each
                     (cut display <> port)
                     (list pprint search
                           (match-str ";;; Fontification" ";;; Diff" rest)))
                    (display "(provide 'guix-utils)" port)))))))))
    (description
     (string-append (package-description emacs-guix) "

Note: This is a minimalist variant of emacs-guix, with simply
file prettification."))))
(home-environment
 (packages (append ;;; System

            (list (specification->package "xdg-dbus-proxy"))

                                        ;(list (@ (gnu packages freedesktop) xdg-desktop-portal)) ; otherwise it would pick up xdg-desktop-portal-next
            (specifications->packages '("xdg-desktop-portal"
                                        ;"xdg-desktop-portal-gtk" ; required for Access--which is required for ScreenCast
                                        "xdg-desktop-portal-wlr"))
            (list xdg-desktop-portal-gtk)
            wayland-packages

            ;; <https://github.com/swaywm/swaylock/issues/395>
            (list (specification->package "swaylock"))

            (list (nwg-launchers-patch (specification->package "nwg-launchers")))
            (list (sway-patch (specification->package "sway")))

            (list (specification->package "clamav"))

            backup-packages

            (list
             (waybar-patch (specification->package "waybar"))
                                        ;(specification->package "yambar-wayland")
             (specification->package "i3status") ; sway can use it

             (specification->package "pulseaudio")   ; TODO: really?
             (specification->package "polkit-gnome") ; ???
             (specification->package "hicolor-icon-theme")
             (specification->package "adwaita-icon-theme")
             (specification->package "dunst")
             (specification->package "bluez")

;;; System/Laptop
             
             ;(specification->package "tlp") ; service
             (specification->package "tlpui") ; power management
             (specification->package "openrgb")

                                        ;(specification->package "ccid") ; fingerprint reader?
                                        ;(specification->package "pcsc-lite")

;;; System Tools

             (package-with-emacs-pgtk (specification->package "emacs-enwc")) ; network manager
             (package-with-emacs-pgtk (specification->package "emacs-age")) ; encryption
             (specification->package "pass-age")
             (package-with-emacs-pgtk (specification->package "emacs-password-store")) ; "pass" integration
             (package-with-emacs-pgtk (specification->package "emacs-passage")) ; password mgr
             (specification->package "xrdb")      ; compat for nheko
             (specification->package "gammastep") ; redshift
             ;(specification->package "btop")
             (specification->package "px") ; ps, pstree and top for humans.
             (specification->package "dex") ; generate and execute desktop files
             ;; Used by qemu, apparently:
             ;(specification->package "samba")
             
             ;(specification->package "putty")
             (specification->package "gnome-boxes") ; qemu frontend
             (specification->package "udiskie")
             (specification->package "efibootmgr")
             ;;(specification->package "roxterm")
             (specification->package "foot")
             (specification->package "p7zip")
             (specification->package "zip")
             (specification->package "unzip")
             (specification->package "zstd")
                                        ;(specification->package "unrar")
             (specification->package "gkrellm")
             (specification->package "dos2unix")
             (specification->package "lshw")
             (specification->package "pdfgrep")
             (specification->package "lm-sensors")
             (specification->package "xdg-utils")
             (specification->package "ripgrep")
                                        ;(specification->package "seahorse") ; keyring admin ; broken
             (specification->package "dmidecode")
             (specification->package "hdparm")
                                        ;(specification->package "openssl")
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
             (specification->package "rocminfo") ; rocm-clang-runtime build error
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
             
                                        ;(specification->package "qmk") ; req python-halo, python-twine, python-httpcore, python-uvicorn 
             (specification->package "dfu-util") ; to flash keyboard firmware

             (specification->package "d-feet") ; to look at dbus

             ;; For secret-tool, a frontend for gnome-keyring-daemon.
             (specification->package "libsecret")
             
;;; Experimental System Tools

             (specification->package "bat")

;;; Fonts

             ;; FIXME use weird "ttf" targets etc
             (specification->package "font-google-noto")
             (specification->package "font-dejavu")
             (specification->package "font-google-noto-sans-cjk")
             (specification->package "font-ipa-ex")
             (specification->package "font-wqy-zenhei")
             (specification->package "font-jetbrains-mono")

;;; Multimedia

             (specification->package "showmethekey")
             (specification->package "yt-dlp")
             (specification->package "pavucontrol")
             ;; Note: There's another "anything bar" wayland thing: wob.
             (specification->package "pa-notify") ; OSD if volume changes!
                                        ;(specification->package "ffmpeg") ; conflict with mpv
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

;;; Hardware programming

             (package-with-emacs-pgtk (specification->package "emacs-vhdl-ts-mode"))
             ;(package-with-emacs-pgtk (specification->package "emacs-vhdl-ext"))
             (package-with-emacs-pgtk (specification->package "emacs-fpga"))

;;; Programming

             idea

             (specification->package "gnu-standards") ; info manuals

             ;; Typescript compiler.
             (specification->package "rust-swc")
             (specification->package "vscodium")
             (specification->package "wireshark")
             (specification->package "kicad")
             (specification->package "meld")
             (specification->package "gnuradio") ;builds from source
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
             (package-with-emacs-pgtk (emacs-window-tool-bar-patch (specification->package "emacs-window-tool-bar")))
             (package-with-emacs-pgtk (specification->package "emacs-ws-butler")) ; auto trim whitespace from end of MODIFIED lines
             (package-with-emacs-pgtk (specification->package "emacs-vlf")) ; very large files
             (package-with-emacs-pgtk (specification->package "emacs-tuareg")) ; ocaml
             (package-with-emacs-pgtk (specification->package "emacs-yaml-mode"))
             (package-with-emacs-pgtk (specification->package "emacs-julia-mode")) ; uses yaml which hangs
             (package-with-emacs-pgtk (specification->package "emacs-julia-repl"))
             (package-with-emacs-pgtk (specification->package "emacs-julia-snail"))
             (package-with-emacs-pgtk (specification->package "emacs-inf-ruby"))
             (package-with-emacs-pgtk (specification->package "emacs-alchemist")) ; Elixir
             (package-with-emacs-pgtk (specification->package "emacs-xpm"))
             (package-with-emacs-pgtk (specification->package "emacs-tco-el")) ; macro "defun-tco" for tail class optimized procedures
             (package-with-emacs-pgtk (specification->package "emacs-stream"))
             ;; We in org mode
             (specification->package "plantuml")
             (package-with-emacs-pgtk (specification->package "emacs-plantuml-mode"))

             (list (specification->package "git") "send-email")
                                        ;(specification->package "nasm")
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
             (package-with-emacs-pgtk (specification->package "emacs-ctrlf")) ; you've got to be kidding me. Why is this not builtin? ; alternatives: occur[!], swiper, consult-line[terrible]
             (package-with-emacs-pgtk (specification->package "emacs-swiper")) ; regexp search and group
             (specification->package "python-jupytext") ;; required by code-cells
             ;; Result cells of ipynb files are not retained in the conversion to script format. This means that opening and then saving an ipynb file clears all cell outputs.
             ;; code-cells-write-ipynb to export to ipynb.
             (package-with-emacs-pgtk (specification->package "emacs-code-cells"))
             (package-with-emacs-pgtk (specification->package "emacs-password-generator"))
             (specification->package "guile-ares-rs")
                                        ;(specification->package "diffoscope") ; requires u-boot-tools--and that doesn't build.
             (specification->package "diffstat")
                                        ;(specification->package "hugs") ; build failure with gcc 4.9.4
                                        ;(specification->package "gprolog")
                                        ;(specification->package "trealla")
                                        ;(specification->package "fpc")
                                        ;(specification->package "esbuild")
                                        ;(specification->package "ocaml")
             (specification->package "ocaml-merlin") ; LSP for ocaml
             (package-with-emacs-pgtk (specification->package "emacs-kotlin-mode"))
                                        ;(specification->package "gforth") ; also has emacs support
                                        ;(specification->package "clojure")
                                        ;(specification->package "clojure-tools")
             
                                        ; (specification->package "leiningen")
                                        ;(specification->package "pure")
             (specification->package "stellarium")
             (specification->package "kicad-symbols")
             (specification->package "kicad-footprints")
             (specification->package "godot")
                                        ;(specification->package "glade")
                                        ; hell no (specification->package "node")
             (specification->package "git-issue") ; decentralized issue tracker
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
             (package-with-emacs-pgtk (specification->package "emacs-casual-calc"))
             (package-with-emacs-pgtk (specification->package "emacs-casual-info"))
             (package-with-emacs-pgtk (specification->package "emacs-casual-dired"))
                                        ;(package-with-emacs-pgtk (specification->package "emacs-casual-avy"))
             (specification->package "texlive-digestif")
             ;; For xenops
             (package-with-emacs-pgtk (specification->package "emacs-aio"))
             ;; For xenops
             (specification->package "texlive-scheme-basic")
             ;; For me (and org)
             (specification->package "texlive-esint") ; \oiint
             ;; For me (and org)
             (specification->package "texlive-units")
             ;; For me (and org)
             (specification->package "texlive-siunitx") ; \si
             ;; For me (and org)
             (specification->package "texlive-braket") ; \ket
             ;; For me (and org)
             (specification->package "texlive-mathtools") ; \ket, :=
             ;; For xenops
             (specification->package "texlive-dvipng")
             ;; Content-oriented latex.  Examples: \D{f}{x}, \D[n]{f}{x}, \D{f}{x,y,z}, \D[2,n,3]{f}{x,y,z}, \pderiv{f}{x}, ..., \Integrate{f}{x}, \Int{f(x)}{x}, \Int{f}{S,C}, \Int{f(x)}{x,a,b}, \Sum{a(k)}{k}, \Sum{a(k)}{k,1,n}, \Prod{a(k)}{k}, \IdentityMatrix\Style{IdentityMatrixParen=p}, \IdentityMatrix[2], ...
             (specification->package "texlive-cool")
             (package-with-emacs-pgtk (specification->package "emacs-lsp-booster"))
             (package-with-emacs-pgtk (specification->package "emacs-undo-tree"))
                                        ;(package-with-emacs-pgtk (specification->package "emacs-page-break-lines"))
             (package-with-emacs-pgtk (specification->package "emacs-form-feed"))
             (package-with-emacs-pgtk emacs-pgtk) ; overly paranoid
             (package-with-emacs-pgtk (specification->package "emacs-smartparens"))
                                        ;(package-with-emacs-pgtk (specification->package "emacs-indent-bars")) ; maybe overdoing it
             (package-with-emacs-pgtk (emacs-spacious-padding-patch (specification->package "emacs-spacious-padding"))) ; spacing between windows
             (package-with-emacs-pgtk (specification->package "emacs-crdt"))
             (package-with-emacs-pgtk (specification->package "emacs-magit"))
             (package-with-emacs-pgtk (specification->package "emacs-magit-org-todos-el"))
             (package-with-emacs-pgtk (specification->package "emacs-git-email"))
             (package-with-emacs-pgtk (specification->package "emacs-diff-hl")) ; VC diff in the fringe
             (package-with-emacs-pgtk (emacs-color-theme-solarized-patch (specification->package "emacs-color-theme-solarized")))
             (package-with-emacs-pgtk (specification->package "emacs-dtrt-indent"))
             (package-with-emacs-pgtk (specification->package "emacs-slime-company"))
             (package-with-emacs-pgtk (specification->package "emacs-eval-in-repl-slime"))
             (package-with-emacs-pgtk (specification->package "emacs-pyvenv")) ; we're not really using that
             ;; For Lisp and Javascript; Note: emacs-sly is a fork
             (package-with-emacs-pgtk (specification->package "emacs-slime"))
             (package-with-emacs-pgtk (specification->package "emacs-eldoc"))
             (package-with-emacs-pgtk (specification->package "emacs-xref")) ; TODO: emacs-xref-union
             (package-with-emacs-pgtk (specification->package "emacs-sesman"))
             (package-with-emacs-pgtk (specification->package "emacs-outshine")) ; org-like stuff outside org
             (package-with-emacs-pgtk (specification->package "emacs-org")) ; org 9.7.11 is included in emacs
             (package-with-emacs-pgtk (specification->package "emacs-org-notify"))
                                        ;(package-with-emacs-pgtk (specification->package "emacs-org-element")) ; tree

                                        ;(package-with-emacs-pgtk (specification->package "emacs-org-texlive-collection"))
             (package-with-emacs-pgtk (specification->package "emacs-org-edna"))
             (package-with-emacs-pgtk (specification->package "emacs-org-node"))
             
             (package-with-emacs-pgtk (specification->package "emacs-org-noter")) ; PDF notes
             (package-with-emacs-pgtk (specification->package "emacs-org-pdftools")) ; PDF notes and links ; for org-noter-pdftools; "lightly maintained" (terrible quality)
             (package-with-emacs-pgtk (specification->package "emacs-org-super-links"))
             (package-with-emacs-pgtk (specification->package "emacs-orgit")) ; make org links to magit buffers
             (package-with-emacs-pgtk (specification->package "emacs-orgit-forge")) ; make org links to forge topic buffers
                                        ;(package-with-emacs-pgtk (specification->package "emacs-org-roam"))
             (package-with-emacs-pgtk (specification->package "emacs-org-ref"))
             (package-with-emacs-pgtk (specification->package "emacs-org-super-agenda"))
             (package-with-emacs-pgtk (specification->package "emacs-org-timeblock"))
             (package-with-emacs-pgtk (specification->package "emacs-org-remark")) ; add notes to epub and websites
             (package-with-emacs-pgtk (specification->package "emacs-org-pomodoro"))
             (package-with-emacs-pgtk (specification->package "emacs-org-emms"))
             (package-with-emacs-pgtk (specification->package "emacs-mu4e-dashboard")) ; live query mu4e from org
             (package-with-emacs-pgtk (specification->package "emacs-mu4e-alert"))
             ;(package-with-emacs-pgtk (specification->package "emacs-consult-mu")) ; search mails from consult
             (package-with-emacs-pgtk (specification->package "emacs-org-msg"))
             (package-with-emacs-pgtk (specification->package "emacs-org-contrib")) ; not that well-maintained
             (package-with-emacs-pgtk (specification->package "emacs-emms"))
             (package-with-emacs-pgtk (specification->package "emacs-comment-tags"))
             (package-with-emacs-pgtk (specification->package "emacs-csv-mode"))

             (package-with-emacs-pgtk (specification->package "emacs-embark"))
             (package-with-emacs-pgtk (specification->package "emacs-outline-indent")) ; code folding and outlining
             (package-with-emacs-pgtk (specification->package "emacs-rmsbolt")) ; godbolt
             ;; Used by emacs-dap-mode
             (patch2 (package-with-emacs-pgtk (specification->package "emacs-lsp-treemacs")))
             ;; Used by emacs-dap-mode
             (package-with-emacs-pgtk (specification->package "emacs-bui"))
             ;; Used by emacs-dap-mode (popup)
             (package-with-emacs-pgtk (specification->package "emacs-posframe"))

             (package-with-emacs-pgtk (specification->package "emacs-beacon"))
             (package-with-emacs-pgtk (specification->package "emacs-bar-cursor"))
             (package-with-emacs-pgtk (specification->package "emacs-wakib-keys"))
             (package-with-emacs-pgtk (specification->package "emacs-treemacs-nerd-icons"))
             ;; Alternative: emacs-dape
             (patch2 (package-with-emacs-pgtk (specification->package "emacs-dap-mode")))
             (patch2 (package-with-emacs-pgtk (specification->package "emacs-lsp-mode")))
             (patch2 (package-with-emacs-pgtk (specification->package "emacs-lsp-ui")))
                                        ; doesn't work (package-with-emacs-pgtk (specification->package "emacs-lsp-docker"))
                                        ; part of emacs since emacs 29 (package-with-emacs-pgtk (specification->package "emacs-csharp-mode"))
             (patch2 (package-with-emacs-pgtk (specification->package "emacs-ccls"))) ; C LSP; conflicts with our patched dap-mode
             (patch2 (package-with-emacs-pgtk (specification->package "emacs-lsp-java"))) ; conflicts with our patched dap-mode
                                        ;(package-with-emacs-pgtk (specification->package "emacs-elpy")) ; just use dap-python ; elpy is unmaintained
                                        ;(package-with-emacs-pgtk (specification->package "emacs-tramp")) ; I think that's part of emacs now
             (package-with-emacs-pgtk (specification->package "emacs-agda2-mode"))
             (package-with-emacs-pgtk (specification->package "emacs-treemacs"))
             (package-with-emacs-pgtk (specification->package "emacs-treemacs-extra")) ; magit, projectile, tab-bar; but also all-the-icons, memoize, evil, persp-mode, perspective
             (package-with-emacs-pgtk (specification->package "emacs-magit-gerrit"))
             (package-with-emacs-pgtk (specification->package "emacs-magit-svn"))
             (patch2 (package-with-emacs-pgtk (specification->package "emacs-rustic")))
             (package-with-emacs-pgtk (specification->package "emacs-projectile"))
             (package-with-emacs-pgtk (specification->package "emacs-company"))
             (patch2 (package-with-emacs-pgtk (specification->package "emacs-company-lsp")))
             (package-with-emacs-pgtk (specification->package "emacs-company-org-block")) ; snippets with "<"
             (package-with-emacs-pgtk (specification->package "emacs-capf-autosuggest"))
             (package-with-emacs-pgtk (specification->package "ispell")) ; used by built-in emacs flyspell-mode
             (package-with-emacs-pgtk (specification->package "emacs-flycheck"))
                                        ;(package-with-emacs-pgtk (specification->package "emacs-helm"))
             (package-with-emacs-pgtk (specification->package "emacs-shackle"))
                                        ;(package-with-emacs-pgtk (specification->package "emacs-envrc"))
             ;; Understands guix.scm and manifest.scm natively
             (package-with-emacs-pgtk (specification->package "emacs-buffer-env"))
             (package-with-emacs-pgtk (specification->package "emacs-clojure-mode"))
             (package-with-emacs-pgtk (specification->package "emacs-haskell-mode"))
             ;(package-with-emacs-pgtk (specification->package "emacs-flycheck-guile")) ; would use geiser
             ;(package-with-emacs-pgtk (specification->package "emacs-geiser-guile")) ; geiser is worse than arei
             (package-with-emacs-pgtk (specification->package "emacs-parinfer-rust-mode"))
                                        ;(package-with-emacs-pgtk (specification->package "emacs-parinfer-mode"))
             (package-with-emacs-pgtk (specification->package "emacs-web-mode"))
             (package-with-emacs-pgtk (specification->package "emacs-git-timemachine"))
             (package-with-emacs-pgtk (specification->package "emacs-markdown-mode"))
             ;(package-with-emacs-pgtk (specification->package "emacs-geiser")) ; geiser is worse than arei
             (package-with-emacs-pgtk (specification->package "emacs-go-mode"))
             (package-with-emacs-pgtk (specification->package "emacs-typescript-mode"))
             (package-with-emacs-pgtk (specification->package "emacs-pkg-info"))
             (package-with-emacs-pgtk (specification->package "emacs-flycheck-rust"))
             (package-with-emacs-pgtk (specification->package "emacs-rust-mode"))
             (package-with-emacs-pgtk (specification->package "emacs-docker"))
             (package-with-emacs-pgtk (specification->package "emacs-dired-launch"))
                                        ;(specification->package "dvisvgm") ; TODO: Move that to manifest.scm of your project
                                        ; obsolete in favor of integrated tramp-container
                                        ;(package-with-emacs-pgtk (specification->package "emacs-docker-tramp"))
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
             (package-with-emacs-pgtk (specification->package "emacs-eat"))
                                        ; statistics: R, Julia, and JAGS.
                                        ; FIXME (package-with-emacs-pgtk (specification->package "emacs-ess"))

             (specification->package "python-jupyter-client") ; required by emacs-jupyter (for no reason; why not just invoke "jupyter kernel"?)
             (package-with-emacs-pgtk (specification->package "emacs-jupyter"))
             (specification->package "python-black")
                                        ; TODO emacs-python-black ?? ; why not format-all-the-code ? The latter already works, I think.
             (package-with-emacs-pgtk (specification->package "emacs-elixir-mode"))
             (package-with-emacs-pgtk emacs-guix-minimal)
             (package-with-emacs-pgtk (specification->package "emacs-bluetooth"))
             (package-with-emacs-pgtk (specification->package "emacs-osm"))
             (package-with-emacs-pgtk (specification->package "emacs-erc-hl-nicks")) ; IRC nick coloring
             (package-with-emacs-pgtk (specification->package "emacs-counsel"))
             (package-with-emacs-pgtk (specification->package "emacs-counsel-tramp"))
             (package-with-emacs-pgtk (specification->package "emacs-counsel-projectile"))
                                        ;(package-with-emacs-pgtk (specification->package "emacs-counsel-jq"))
                                        ;(package-with-emacs-pgtk (specification->package "emacs-helm-projectile"))
             (package-with-emacs-pgtk (specification->package "emacs-company-jedi")) ; Python completion
             (package-with-emacs-pgtk (specification->package "emacs-back-button"))
                                        ;(package-with-emacs-pgtk (specification->package "emacs-wanderlust")) ; email (POP3, IMAP and Maildir)
                                        ;I moved from wanderlust to mew because I find mew has better support for encryption, particularly S/MIME.
                                        ;(package-with-emacs-pgtk (specification->package "emacs-mew"))
             (specification->package "mu") ; maildir indexer, mu4e
             (package-with-emacs-pgtk (specification->package "emacs-vertico"))
             ;(package-with-emacs-pgtk (specification->package "emacs-consult"))
             ;(patch2 (package-with-emacs-pgtk (specification->package "emacs-consult-lsp"))) ; gcc 4.9 build failure
             ;(package-with-emacs-pgtk (specification->package "emacs-consult-xdg-recent-files"))
                                        ;(package-with-emacs-pgtk (specification->package "emacs-consult-org-roam"))
             ;(package-with-emacs-pgtk (specification->package "emacs-consult-flycheck"))
             (package-with-emacs-pgtk (specification->package "emacs-marginalia"))
             (package-with-emacs-pgtk (specification->package "emacs-orderless"))
             (package-with-emacs-pgtk (specification->package "emacs-trashed"))
             (package-with-emacs-pgtk (specification->package "emacs-qrencode"))
             (package-with-emacs-pgtk (specification->package "emacs-forge"))
             (package-with-emacs-pgtk (specification->package "emacs-fj")) ; Forgejo
                                        ; Columns
             (package-with-emacs-pgtk (specification->package "emacs-taxy-magit-section"))
             (package-with-emacs-pgtk (specification->package "emacs-ghub"))
             (package-with-emacs-pgtk (specification->package "emacs-github-review"))
             (package-with-emacs-pgtk (specification->package "emacs-pr-review"))
                                        ;(package-with-emacs-pgtk (specification->package "emacs-svg-tag-mode"))
             ;; This one uses text styling and so makes the user's stuff more editable than svg-tag-mode
             ;; Replaces org-bullets and org-superstar
             (package-with-emacs-pgtk (specification->package "emacs-org-modern"))
             (package-with-emacs-pgtk (specification->package "emacs-ob-async"))
             (package-with-emacs-pgtk (specification->package "emacs-mixed-pitch"))
             ;; Used by emacs-doom-modeline. Requires nerd font. Can install it via M-x nerd-icons-install-fonts to ~/.local/share/fonts
             ;; Don't forget to M-x customize-variable lsp-treemacs-theme to "Iconless" without quotes. It will show icons from the font anyway.
             (package-with-emacs-pgtk (specification->package "emacs-nerd-icons"))
                                        ;(package-with-emacs-pgtk (specification->package "emacs-doom-modeline"))
             (package-with-emacs-pgtk (specification->package "emacs-pulsar"))
             (package-with-emacs-pgtk (specification->package "emacs-rainbow-delimiters"))
             ;; What's the difference to which-key ??
             (package-with-emacs-pgtk (specification->package "emacs-discover-my-major"))
             (package-with-emacs-pgtk (specification->package "emacs-which-key"))
             (package-with-emacs-pgtk (specification->package "emacs-auctex"))
             ;; See also M-x cdlatex-command-help
             (package-with-emacs-pgtk (specification->package "emacs-cdlatex"))
             (package-with-emacs-pgtk (specification->package "emacs-company-auctex"))
             (package-with-emacs-pgtk (specification->package "emacs-latex-extra"))
             (package-with-emacs-pgtk (specification->package "emacs-adoc-mode"))
             (package-with-emacs-pgtk (specification->package "emacs-tempel"))
             (package-with-emacs-pgtk (specification->package "emacs-debbugs"))
             (package-with-emacs-pgtk (specification->package "emacs-inheritenv"))
             ;; Alternative: emacs-reformatter
                                        ;(specification->package "emacs-format-all-the-code") ; can't because inheritenv.
             (package-with-emacs-pgtk (specification->package "emacs-format-all-the-code"))

             ;; For swank-js to use.  But it doesn't work with multiple major modes yet. TODO: css-mode;
             (package-with-emacs-pgtk (specification->package "emacs-js2-mode"))
                                        ; typescript mode done by combobulate
             ;; Allows the user to see/edit a range of a buffer in another buffer.
             (package-with-emacs-pgtk (specification->package "emacs-edit-indirect"))
             ;; This one works with multiple major modes (and thus with Vue JS, mmm)
                                        ; shipped by default (package-with-emacs-pgtk (specification->package "emacs-js-mode"))
             ;; Allows multiple major modes to coexist in one buffer
             (package-with-emacs-pgtk (specification->package "emacs-mmm-mode"))
             ;; For Clojure. Supports light table via M-x cider-enlighten-mode
             (package-with-emacs-pgtk (specification->package "emacs-cider"))
             (package-with-emacs-pgtk (specification->package "emacs-vala-mode"))
             ;; Shows number of search results in status bar
             (package-with-emacs-pgtk (specification->package "emacs-anzu"))
             (package-with-emacs-pgtk (specification->package "emacs-dired-rsync"))
             (package-with-emacs-pgtk (specification->package "emacs-dockerfile-mode"))
             (package-with-emacs-pgtk (specification->package "emacs-emacsql"))
                                        ;(package-with-emacs-pgtk (specification->package "emacs-helm-cider"))
                                        ; TODO (package-with-emacs-pgtk (specification->package "emacs-graphviz-dot-mode"))
             (package-with-emacs-pgtk (specification->package "emacs-jinja2-mode"))
             ;; Spaced repetition in org mode.
             (package-with-emacs-pgtk (specification->package "emacs-org-fc"))
             ;; vcard vcf
             (package-with-emacs-pgtk (specification->package "emacs-org-vcard"))
             ;; Visual undo tree.
             (package-with-emacs-pgtk (specification->package "emacs-vundo"))
             ;; Weather info
             (package-with-emacs-pgtk (specification->package "emacs-wttrin"))
             ;; org->HTML export
             (package-with-emacs-pgtk (specification->package "emacs-org-re-reveal"))
                                        ; unused
             (package-with-emacs-pgtk (specification->package "emacs-frames-only-mode"))
                                        ; https://github.com/karthink/popper special-case popup windows in general.
             (package-with-emacs-pgtk (specification->package "emacs-popper"))
                                        ; TODO avy
                                        ; doesn't native compile: (package-with-emacs-pgtk (specification->package "emacs-mastodon"))

             (package-with-emacs-pgtk (specification->package "emacs-elfeed")) ; RSS/Atom
             (package-with-emacs-pgtk (specification->package "emacs-elfeed-tube")) ; RSS/Atom Youtube
             (package-with-emacs-pgtk (specification->package "emacs-elfeed-score"))
             (package-with-emacs-pgtk (specification->package "emacs-elfeed-org")) ; manage elfeed subscriptions in org mode
             (package-with-emacs-pgtk (specification->package "emacs-fortran-tags"))
                                        ; or celluloid for gtk
             (package-with-emacs-pgtk (specification->package "emacs-mpv"))
             (package-with-emacs-pgtk (specification->package "emacs-empv")) ; ?
             (package-with-emacs-pgtk (specification->package "fd")) ; used by empv
                                        ; emacs-ytel
             (package-with-emacs-pgtk (specification->package "emacs-nov-el")) ; for epub
             (package-with-emacs-pgtk (specification->package "dvisvgm")) ; for epub
             (package-with-emacs-pgtk (specification->package "emacs-ztree")) ; directory diff

             (specification->package "pantalaimon")
             (package-with-emacs-pgtk (specification->package "emacs-ement"))
             (package-with-emacs-pgtk (specification->package "emacs-slack"))
             
             ;; Guile IDE
             (package-with-emacs-pgtk (specification->package "emacs-arei"))
             (specification->package "guile-ares-rs")
                                        ; I adapt it (package-with-emacs-pgtk (specification->package "emacs-combobulate"))
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
                                        ;(let ((base (specification->package "mogan")))
                                        ;          (package (inherit base)
                                        ;            (inputs
                                        ;             (modify-inputs (package-inputs base)
                                        ;                            ;(prepend qtwayland-5)
                                        ;                            ))))

             ;; Scientist.
             (specification->package "texmacs-guile3")
             (package-with-emacs-pgtk (specification->package "emacs-zotxt"))
             (specification->package "zotero")

;;; Theorem Proving

                                        ;(specification->package "agda")
                                        ;(specification->package "lean") ; used by Terence Tao
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
             (package-with-emacs-pgtk (specification->package "emacs-anki-editor"))
             (package-with-emacs-pgtk (specification->package "emacs-gnosis"))
             ;; https://github.com/louietan/anki-editor
             (package-with-emacs-pgtk (specification->package "emacs-org-drill"))
             (package-with-emacs-pgtk (specification->package "emacs-org-sticky-header"))
                                        ; similar: (package-with-emacs-pgtk (specification->package "emacs-gnosis"))

             (specification->package "pandoc")
             (package-with-emacs-pgtk (specification->package "emacs-pandoc-mode"))
             (package-with-emacs-pgtk (specification->package "emacs-ox-pandoc"))
             (package-with-emacs-pgtk (specification->package "emacs-org-pandoc-import"))
             (package-with-emacs-pgtk (specification->package "emacs-org-auto-tangle"))
             (package-with-emacs-pgtk (specification->package "emacs-howm")) ; minor mode for wiki

             (package-with-emacs-pgtk (specification->package "emacs-pdf-tools"))
             (package-with-emacs-pgtk (specification->package "emacs-saveplace-pdf-view"))
             (package-with-emacs-pgtk emacs-xah-wolfram-mode)
             
;;; Network

             (specification->package "mailutils")
             (specification->package "iptables")
             (specification->package "nftables")
                                        ;(specification->package "mpop") ; TODO: guix home service
             (offlineimap-patch (specification->package "offlineimap3"))
                                        ; FIXME (specification->package "freerdp") ; TODO: split off include/crypto.h since it uses openssl and that's why we need to propagate openssl
             ;; Namespace "Gst" is not available
             ;; xpra needs to be installed on the remote host as well!
             (specification->package "openvpn")
             (specification->package "mosh")
             (specification->package "ublock-origin-chromium")
             (specification->package "gnupg")
             (specification->package "transmission")
             (specification->package "openconnect")
             (specification->package "blueman")
             (network-manager-applet-patch (specification->package "network-manager-applet")) ; our system profile also has it... silly enough.
             (specification->package "network-manager-openconnect")
             (specification->package "network-manager-openvpn")
                                        ;(ungoogled-chromium-patch )
             (specification->package "ungoogled-chromium")
                                        ;(specification->package "icecat")
                                        ;(specification->package "gfeeds")
             (specification->package "gource") ; commit visualization
                                        ;(specification->package "nheko")
                                        ;(specification->package "rtorrent")
             (specification->package "sshfs")
             (specification->package "rsync")
                                        ;(specification->package "davfs2")
             (specification->package "rclone")
             (specification->package "netcat")
             (specification->package "htmlq")
             (specification->package "nmap")
             (specification->package "ntp")
                                        ;(specification->package "irssi")
             (specification->package "samba")
             (specification->package "curl")
             (specification->package "qrencode")
             (specification->package "remmina")
             (specification->package "rtorrent")
                                        ;(specification->package "telegram-desktop")
             
;;; Python

             (specification->package "pypy")
             (specification->package "python-lxml")
             (specification->package "python")
             (specification->package "python-lsp-server")
             (specification->package "python-sympy")
             (specification->package "python-sentencepiece")
             (specification->package "python-debugpy") ; DAP ; requires pydevd

;;; AI

             (llama-tune (specification->package "llama-cpp")) ; can be tuned
             (package-with-emacs-pgtk (specification->package "emacs-gptel"))

;;; Android
             
             (specification->package "aapt")
             (transform1 (specification->package "aapt2")) ; /tmp/guix-build-clang-runtime-12.0.1.drv-0/compiler-rt-12.0.1.src/lib/sanitizer_common/sanitizer_platform_limits_posix.cpp:154: crypt.h: No such file or directory
             (transform1 (specification->package "adb"))
             (transform1 (specification->package "fastboot"))
             (transform1 (specification->package "apksigner"))
             (transform1 (specification->package "zipalign"))
             (specification->package "python-androguard") ; XML binary
             (transform1 (specification->package "etc1tool")) ; transform copied
             (specification->package "e2fsprogs")

;;; Emulation/Container

             (specification->package "bubblewrap")
             (specification->package "libvirt")
             (specification->package "flatpak")
             (specification->package "dosbox")
                                        ; (specification->package "docker-compose") ; buggy with podman
             (specification->package "podman")
             (specification->package "kubectl")
             ;; Otherwise podman is very slow and takes enormous amount of storage.
             (specification->package "fuse-overlayfs")
             (specification->package "podman-compose")

;;; Games

             (specification->package "daikichi") ; fortune
                                        ;(specification->package "fortunes-jkirchartz")
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
             ;(specification->package "sioyek")
             (specification->package "xournalpp")
             (specification->package "blender")

;;; Database

                                        ;(specification->package "sqlite") ; conflict because of libsoup.
             (specification->package "postgresql")

;;; Science

             (package-with-emacs-pgtk (specification->package "emacs-biblio"))
             (package-with-emacs-pgtk (specification->package "emacs-persid")) ; isbn, doi, ...; (persid-insert-bibtex "arxiv:2008.06030")
                                        ;(specification->package "texlive-pgfopts") ; used by cadabra2 < 2.5.2
                                        ;(specification->package "texlive-ytableau") ; used by cadabra2 < 2.5.2
                                        ;(specification->package "texlive-setspace") ; used by cadabra2 < 2.5.2
             (specification->package "sage")
             ;; Supported by texmacs
             cadabra2
             ;; Supported by texmacs
             (specification->package "giac")
             ;; Supported by texmacs
             (specification->package "graphviz")
             ;; Supported by texmacs
             (specification->package "gnuplot")
             ;; Symbolic math, supported by texmacs and emacs
             (specification->package "maxima")
                                        ;(specification->package "texlive-breqn")
                                        ;(specification->package "texlive-tensor")
             ;; Supported by texmacs
             (specification->package "scilab")

;;; Multimedia Toys

             (specification->package "espeak-ng")
             (specification->package "mumble")
             ;; wpctl
             (specification->package "wireplumber")
             ;; pipewire effect control; TODO: jdsp2linux instead
                                        ;(specification->package "easyeffects") ; PHP (from lsp-plugins)

;;; Crypto

             (specification->package "yubikey-personalization")
             (specification->package "python-yubikey-manager")

             ;;; Guix development
             (specification->package "mumi")
             (specification->package "codeberg-cli")
             (specification->package "forgejo-cli")

;;; Network Admin

                                        ; FIXME (specification->package "k9s")
                                        ; FIXME (specification->package "kubectl")
             )))
 (services
  (cons*
;;;(service home-pulseaudio-rtp-sink-service-type)
   (service home-fish-service-type)
   (service home-pipewire-service-type)
   (service home-shepherd-service-type)
                                        ; (home-shepherd-configuration
                                        ;   (services (list (@ (shepherd service repl) repl-service))))
                                        ;(simple-service 'battery-threshold shepherd-root-service-type
                                        ;                  (list (@ (shepherd service repl) repl-service)))
   (service home-dbus-service-type)
;;;(service home-dicod-service-type)
;;;(service home-dotfiles-service-type)
;;;(service home-fontutils-service-type)
   (service home-gpg-agent-service-type
            (home-gpg-agent-configuration
             (pinentry-program
              (file-append (specification->package "pinentry-gnome3")
                           "/bin/pinentry-gnome3"))))
   (service home-ssh-agent-service-type)
   (service home-channels-service-type)
   (service home-msmtp-service-type
            (home-msmtp-configuration
             (accounts
              (list
               (msmtp-account
                (name "dannym@friendly-machines.com")
                (configuration
                 (msmtp-configuration
                  (auth? #t)
                  (tls? #t)
                  (tls-starttls? #f)
                  (log-file "/home/dannym/log/mail/dannym@friendly-machines.com.log")
                  (from "dannym@friendly-machines.com")
                  (host "smtp.dreamhost.com") ; later pop.dreamhost.com (imaps, pop3s)
                  (port 465)
                  (user "dannym@friendly-machines.com")
                  (password-eval "pass Mail/dannym@friendly-machines.com"))))
               (msmtp-account
                (name "dannym@tx0.org")
                (configuration
                 (msmtp-configuration
                  (auth? #t)
                  (tls? #t)
                  (tls-starttls? #t)
                  (log-file "/home/dannym/log/mail/dannym@tx0.org.log")
                  (from "dannym@tx0.org")
                  (host "mx.sdf.org")   ; later mx.sdf.org (imaps)
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
   (simple-service 'custom-dbus-services home-dbus-service-type (map specification->package (list "xdg-desktop-portal-wlr" "xdg-desktop-portal" "blueman")))

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
                                  "bash_profile")))))
   %base-home-services)))
