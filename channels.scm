(cons* (channel
        (name 'nonguix)
        (url "https://gitlab.com/nonguix/nonguix")
        ;; Enable signature verification:
        (introduction
         (make-channel-introduction
          "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
          (openpgp-fingerprint
           "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))

       (channel
          (name 'guix-hpc)
          (url "https://gitlab.inria.fr/guix-hpc/guix-hpc.git")
          (branch "master"))
 (channel
  (name 'guix-android)
  (url "https://framagit.org/tyreunom/guix-android.git")
  (introduction
   (make-channel-introduction
    "d031d039b1e5473b030fa0f272f693b469d0ac0e"
    (openpgp-fingerprint
     "1EFB 0909 1F17 D28C CBF9  B13A 53D4 57B2 D636 EE82"))))

; (channel
;  (name 'antioxidated-packages)
;  (url "https://notabug.org/dannym/cargoless-rust-experiments")
;  (introduction
;   (make-channel-introduction
;    "020851ad649480ee4769b77a947642e993ea5956"
;    ; "76CE C6B1 7274 B465 C02D  B3D9 E71A 3554 2C30 BAA5"
;    (openpgp-fingerprint
;     "C1F3 3EE2 0C52 8FDB 7DD7  011F 49E3 EE22 1917 25EE")
;     )))

; (list (channel-with-substitutes-available
;            %default-guix-channel
                                        ;            "https://ci.guix.gnu.org")))

 (channel
  (name 'guix-rocm)
  (url "https://codeberg.org/dtelsing/Guix-ROCm.git")
  (branch "master"))

(channel
  (name 'guix-rocm-ml)
  (url "https://codeberg.org/dtelsing/Guix-ROCm-ML.git")
  (branch "master"))

       %default-channels)
