;; SPDX: GPL3+

(use-modules (guix gexp))
(use-modules ((guix licenses) #:prefix license:))
(use-modules (guix packages))
(use-modules (guix build-system gnu))
(use-modules (gnu packages gnome))
(use-modules (gnu packages java))
(use-modules (gnu packages linux))

(define %source-dir (getcwd))

; Note: Community edition contains proprietary plugins: https://www.jetbrains.com/legal/community-bundled-plugins (Space Integration, Code With Me, Shared Indexes, Marketplace Licensing Support, Package Checker)
; Note: Community products: android-studio, idea, pycharm
; Note: Proprietary-only products: clion, phpstorm, webstorm, datagrip!, goland, dataspell, RubyMine, datalore
; Note: Other non-ide products: youtrack, teamcity
; Note: .NET products: rider, dotTrace, dotMemory, dotCover
; Note: VS extensions: resharper, resharper C++
; TODO: e2fsprogs libe2p.so
(define-public idea
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
                              ;; Otherwise GradleProjectSettings Jvm never get actually resolved when you select "#JAVA_HOME" in the Ctrl-S gradle "Gradle JVM" GUI. Very unfun.
                              `("JAVA_HOME" = (,(assoc-ref inputs "jbr21")))xxx2@
                              `("JBR21" = (,(assoc-ref inputs "jbr21")))
                              `("JBR17" = (,(assoc-ref inputs "jbr17")))
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
                           (install-file file-name out-share-applications))
                         '("share/applications/android-studio.desktop"
                           "share/applications/idea.desktop"
                           "share/applications/pycharm.desktop"
                           "share/applications/rider.desktop"))))))))
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
idea
