(use-modules (guix packages))
(use-modules (guix download))
(use-modules (guix build-system python))
(use-modules (guix build-system pyproject))
(use-modules ((guix licenses) #:prefix license:))
(use-modules (gnu packages python-web))
(use-modules (gnu packages python-xyz))
(use-modules (gnu packages python-crypto))
(use-modules (gnu packages libffi))
(use-modules (gnu packages version-control))
(use-modules (gnu packages python-build))
(use-modules (gnu packages xdisorg))
(use-modules (gnu packages python-science))
(use-modules (gnu packages audio))
(use-modules (gnu packages tree-sitter))
(use-modules (gnu packages python-compression))
(use-modules (gnu packages maths))
(use-modules (gnu packages check))
(use-modules (gnu packages time))
(use-modules (gnu packages sphinx))
(use-modules (gnu packages python-check))
(use-modules (gnu packages xml))
(use-modules (gnu packages machine-learning))
(use-modules (gnu packages serialization))
(use-modules (gnu packages rpc))
(use-modules (gnu packages protobuf))
(use-modules (gnu packages graphviz))
(use-modules (gnu packages databases))
(use-modules (gnu packages digest))
(use-modules (gnu packages docker))
(use-modules (gnu packages monitoring))
(use-modules (gnu packages jupyter))
(use-modules (gnu packages geo))
(use-modules (gnu packages web))
(use-modules (gnu packages statistics))
(use-modules (gnu packages graph))
(use-modules (gnu packages terminals))

;/home/dannym/src/guix-config/aider.scm:8907:2: error: python-build@1.2.1: dependency cycle detected:
;  python-build@1.2.1 -> python-build@1.2.1 -> python-aider-chat@0.50.1

;/home/dannym/src/guix-config/aider.scm:10892:2: error: python-textx@4.0.1: dependency cycle detected:
;  python-textx@4.0.1 -> python-textx-dev@0.1.5 -> python-textx@4.0.1 -> python-llnl-hatchet@2024.1.2 -> python-triton@3.0.0 -> python-torch@2.4.0 -> python-imgcat@0.5.0 -> python-aider-chat@0.50.1

;/home/dannym/src/guix-config/aider.scm:11299:2: error: python-datasets@2.21.0: dependency cycle detected:
;  python-datasets@2.21.0 -> python-accelerate@0.33.0 -> python-datasets@2.21.0 -> python-tokenizers@0.20.0 -> python-litellm@1.43.17 -> python-aider-chat@0.50.1

(define-public python-lox
  (package
    (name "python-lox")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "lox" version))
       (sha256
        (base32 "0xwr46vh14r2cgzkagw6jbs6sp36yj86xgg7pk1cfkgvga35yzfc"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pathos python-sphinx-rtd-theme))
    (home-page "https://github.com/BrianPugh/lox")
    (synopsis "Threading and Multiprocessing for every project.")
    (description "Threading and Multiprocessing for every project.")
    (license license:expat)))

(define-public python-imgcat
  (package
    (name "python-imgcat")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "imgcat" version))
       (sha256
        (base32 "1q6gjc97csmra30d0mqhnf8hcqjlzc4p4vkd2hd7dcb6qz9in9m6"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-matplotlib
                         python-numpy
                         python-pillow
                         python-pytest
                         python-tensorflow
                         python-torch
                         python-torchvision))
    (home-page "https://github.com/wookayin/python-imgcat")
    (synopsis "imgcat as Python API and CLI")
    (description "imgcat as Python API and CLI.")
    (license license:expat)))

(define-public python-sounddevice
  (package
    (name "python-sounddevice")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sounddevice" version))
       (sha256
        (base32 "1bsmr7892a2sk6yyg76c4ydpwc6zrv3d7phmkhyl0gabcmvm5s8d"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-cffi))
    (home-page "http://python-sounddevice.readthedocs.io/")
    (synopsis "Play and Record Sound with Python")
    (description "Play and Record Sound with Python.")
    (license license:expat)))

(define-public python-pypager
  (package
    (name "python-pypager")
    (version "3.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pypager" version))
       (sha256
        (base32 "0i5bhqnyhzqyvzha3lcq92i69a4cwky9pcp5b3flk5rc9y6grhbr"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-prompt-toolkit python-pygments))
    (home-page "https://github.com/jonathanslenders/pypager")
    (synopsis "Pure Python pager (like \"more\" and \"less\").")
    (description "Pure Python pager (like \"more\" and \"less\").")
    (license #f)))

(define-public python-soxr
  (package
    (name "python-soxr")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "soxr" version))
       (sha256
        (base32 "0lkarx35y3cmv8mcwy77jmc5g2fqfmh22hdb36ydsa3yw0ymwf02"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy))
    (native-inputs (list python-pytest))
    (home-page "https://github.com/dofuuz/python-soxr")
    (synopsis "High quality, one-dimensional sample-rate conversion library")
    (description
     "High quality, one-dimensional sample-rate conversion library.")
    (license #f)))

(define-public python-joblibspark
  (package
    (name "python-joblibspark")
    (version "0.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "joblibspark" version))
       (sha256
        (base32 "0a42izqzqn83kcl57d71scx55j3pknj0gw4xx24xwhzx5y624fg1"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-joblib))
    (home-page "https://github.com/joblib/joblib-spark")
    (synopsis "Joblib Apache Spark Backend")
    (description "Joblib Apache Spark Backend.")
    (license #f)))

(define-public python-torchpippy
  (package
    (name "python-torchpippy")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "torchpippy" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-torch))
    (home-page "https://github.com/pytorch/PiPPy")
    (synopsis "Pipeline Parallelism for PyTorch")
    (description "Pipeline Parallelism for @code{PyTorch}.")
    (license license:bsd-3)))

(define-public python-types-pyyaml
  (package
    (name "python-types-pyyaml")
    (version "6.0.12.20240808")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "types-PyYAML" version))
       (sha256
        (base32 "1bxryjkgji2n8261m3igvhia7iz40yb6llm5pnl40m7nszdnvxxq"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/python/typeshed")
    (synopsis "Typing stubs for PyYAML")
    (description "Typing stubs for @code{PyYAML}.")
    (license #f)))

(define-public python-pytest-voluptuous
  (package
    (name "python-pytest-voluptuous")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytest-voluptuous" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pytest python-voluptuous))
    (home-page "https://github.com/f-secure/pytest-voluptuous")
    (synopsis "Pytest plugin for asserting data against voluptuous schema.")
    (description "Pytest plugin for asserting data against voluptuous schema.")
    (license #f)))

(define-public python-types-tabulate
  (package
    (name "python-types-tabulate")
    (version "0.9.0.20240106")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "types-tabulate" version))
       (sha256
        (base32 "0zllrsb7131kyhdbnqpx10mfgp3dz0vkbp8j2yymbkvzvl8dpdn9"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/python/typeshed")
    (synopsis "Typing stubs for tabulate")
    (description "Typing stubs for tabulate.")
    (license #f)))

(define-public python-wsgiref
  (package
    (name "python-wsgiref")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "wsgiref" version ".zip"))
       (sha256
        (base32 "0y8fyjmpq7vwwm4x732w97qbkw78rjwal5409k04cw4m03411rn7"))))
    (build-system pyproject-build-system)
    (native-inputs (list zip))
    (home-page "http://cheeseshop.python.org/pypi/wsgiref")
    (synopsis "WSGI (PEP 333) Reference Library")
    (description "WSGI (PEP 333) Reference Library.")
    (license #f)))

(define-public python-frozen-flask
  (package
    (name "python-frozen-flask")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "Frozen-Flask" version))
       (sha256
        (base32 "1brsw2hx3bbnw5jvcsvblasdi5z03373zkvgipmmjzcb31dqk9sk"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-flask))
    (native-inputs (list python-pytest))
    (home-page #f)
    (synopsis "Freezes a Flask application into a set of static files.")
    (description "Freezes a Flask application into a set of static files.")
    (license #f)))

(define-public python-flask-uploads
  (package
    (name "python-flask-uploads")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "Flask-Uploads" version))
       (sha256
        (base32 "00nb3s29vkqhb0196llyq1bgrirkmaxxwfmn0ap50zb66dhbvv2k"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-flask))
    (home-page "https://github.com/maxcountryman/flask-uploads")
    (synopsis "Flexible and efficient upload handling for Flask")
    (description "Flexible and efficient upload handling for Flask.")
    (license license:expat)))

(define-public python-flask-themes
  (package
    (name "python-flask-themes")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "Flask-Themes" version))
       (sha256
        (base32 "1z6r12z4gdxlnxd3sj99v4vnl3757wm6b4pwxwvsmksckb9gv1h5"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-flask))
    (home-page "http://bitbucket.org/leafstorm/flask-themes/")
    (synopsis "Provides infrastructure for theming Flask applications")
    (description
     "This package provides infrastructure for theming Flask applications.")
    (license license:expat)))

(define-public python-mimeparse
  (package
    (name "python-mimeparse")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "python-mimeparse" version))
       (sha256
        (base32 "0y2g6cl660bpz11srgqyvvm8gmywpgyx8g0xfvbiyr0af0yv1r3n"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/dbtsai/python-mimeparse")
    (synopsis
     "A module provides basic functions for parsing mime-type names and matching them against a list of media-ranges.")
    (description
     "This package provides a module provides basic functions for parsing mime-type
names and matching them against a list of media-ranges.")
    (license #f)))

(define-public python-mimerender
  (package
    (name "python-mimerender")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "mimerender" version))
       (sha256
        (base32 "1imim78dypbl9fvrz21j8f13q8i96dx90m7f5ib3z371zrz3gwg7"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-python-mimeparse))
    (home-page "https://github.com/martinblech/mimerender")
    (synopsis
     "RESTful HTTP Content Negotiation for Flask, Bottle, web.py and webapp2 (Google App Engine)")
    (description
     "RESTful HTTP Content Negotiation for Flask, Bottle, web.py and webapp2 (Google
App Engine).")
    (license license:expat)))

(define-public python-flask-restless
  (package
    (name "python-flask-restless")
    (version "0.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "Flask-Restless" version))
       (sha256
        (base32 "1dn2g3qkgvbbs4165hng82gkplm1bnxf010qkaf26ixx1bl7zr0x"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-flask python-mimerender python-dateutil
                             python-sqlalchemy))
    (home-page "http://github.com/jfinkels/flask-restless")
    (synopsis "A Flask extension for easy ReSTful API generation")
    (description
     "This package provides a Flask extension for easy @code{ReSTful} API generation.")
    (license #f)))

(define-public python-flask-pymongo
  (package
    (name "python-flask-pymongo")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "Flask-PyMongo" version))
       (sha256
        (base32 "051kwdk07y4xm4yawcjhn6bz8swxp9nanv7jj35mz2l0r0nv03k2"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-flask python-pymongo))
    (home-page "http://flask-pymongo.readthedocs.org/")
    (synopsis "PyMongo support for Flask applications")
    (description "@code{PyMongo} support for Flask applications.")
    (license license:bsd-3)))

(define-public python-flask-mail
  (package
    (name "python-flask-mail")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "Flask-Mail" version))
       (sha256
        (base32 "07c8jyyj411kwyppdaksb8r5mpb9hlpja1lw429fgk5v09xkw224"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-blinker python-flask))
    (home-page #f)
    (synopsis "Flask extension for sending email")
    (description "Flask extension for sending email.")
    (license #f)))

(define-public python-flask-gravatar
  (package
    (name "python-flask-gravatar")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "Flask-Gravatar" version))
       (sha256
        (base32 "1qb2ylirjajdqsmldhwfdhf8i86k7vlh3y4gnqfqj4n6q8qmyrk0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-flask))
    (native-inputs (list python-check-manifest
                         python-coverage
                         python-isort
                         python-pydocstyle
                         python-pytest
                         python-pytest-cache
                         python-pytest-cov
                         python-pytest-pep8))
    (home-page "https://github.com/zzzsochi/Flask-Gravatar/")
    (synopsis
     "Small extension for Flask to make usage of Gravatar service easy.")
    (description
     "Small extension for Flask to make usage of Gravatar service easy.")
    (license license:bsd-3)))

(define-public python-flask-flatpages
  (package
    (name "python-flask-flatpages")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "Flask-FlatPages" version))
       (sha256
        (base32 "0sdws2y801a00c3gic86ybqwbvqqysmw6anhkd44b39h99bhqgs0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-flask
                             python-jinja2
                             python-markdown
                             python-pytz
                             python-pyyaml
                             python-six))
    (home-page "")
    (synopsis "Provides flat static pages to a Flask application")
    (description
     "This package provides flat static pages to a Flask application.")
    (license #f)))

(define-public python-flask-cache
  (package
    (name "python-flask-cache")
    (version "0.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "Flask-Cache" version))
       (sha256
        (base32 "1x3ygki1x5rp3msxaxzx8n7frd5j71fyjxp2ivpm8f06pjlnq4lh"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-flask))
    (home-page "http://github.com/thadeusb/flask-cache")
    (synopsis "Adds cache support to your Flask application")
    (description "Adds cache support to your Flask application.")
    (license license:bsd-3)))

(define-public python-visitor
  (package
    (name "python-visitor")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "visitor" version))
       (sha256
        (base32 "02j87v93c50gz68gbgclmbqjcwcr7g7zgvk7c6y4x1mnn81pjwrc"))))
    (build-system pyproject-build-system)
    (home-page "http://github.com/mbr/visitor")
    (synopsis "A tiny pythonic visitor implementation.")
    (description
     "This package provides a tiny pythonic visitor implementation.")
    (license license:expat)))

(define-public python-dominate
  (package
    (name "python-dominate")
    (version "2.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "dominate" version))
       (sha256
        (base32 "1i4xs4qjmr77lizb6lgm1j64mp9js4d0bmp30hcsx2lvgml890jm"))))
    (build-system pyproject-build-system)
    (home-page "")
    (synopsis
     "Dominate is a Python library for creating and manipulating HTML documents using an elegant DOM API.")
    (description
     "Dominate is a Python library for creating and manipulating HTML documents using
an elegant DOM API.")
    (license #f)))

(define-public python-flask-bootstrap
  (package
    (name "python-flask-bootstrap")
    (version "3.3.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "Flask-Bootstrap" version))
       (sha256
        (base32 "1j1s2bplaifsnmr8vfxa3czca4rz78xyhrg4chx39xl306afs26b"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-dominate python-flask python-visitor))
    (home-page "http://github.com/mbr/flask-bootstrap")
    (synopsis
     "An extension that includes Bootstrap in your project, without any boilerplate code.")
    (description
     "An extension that includes Bootstrap in your project, without any boilerplate
code.")
    (license license:bsd-3)))

(define-public python-flask-admin
  (package
    (name "python-flask-admin")
    (version "1.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "Flask-Admin" version))
       (sha256
        (base32 "0s9k4dw1n96bv1lvh9m4fmn1sv165ps3bp6p04d62sibhfpy5ji4"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-flask python-wtforms))
    (home-page "https://github.com/flask-admin/flask-admin/")
    (synopsis "Simple and extensible admin interface framework for Flask")
    (description "Simple and extensible admin interface framework for Flask.")
    (license license:bsd-3)))

(define-public python-zip
  (package
    (name "python-zip")
    (version "0.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "zip" version))
       (sha256
        (base32 "18agz94zz086z023y5kmchizg2wmwmmjdj14g8hyjqb777i7j2qd"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-blinker
                             python-bumpversion
                             python-click
                             python-colorama
                             python-coverage
                             python-cryptography
                             python-flake8
                             python-flask
                             python-flask-admin
                             python-flask-bootstrap
                             python-flask-cache
                             python-flask-flatpages
                             python-flask-gravatar
                             python-flask-login
                             python-flask-mail
                             python-flask-pymongo
                             python-flask-restless
                             python-flask-sqlalchemy
                             python-flask-themes
                             python-flask-uploads
                             python-flask-wtf
                             python-frozen-flask
                             python-jinja2
                             python-markdown
                             python-networkx
                             python-pymongo
                             python-pytest
                             python-dateutil
                             python-pyyaml
                             python-six
                             python-sphinx
                             python-sqlalchemy
                             python-tox
                             python-watchdog
                             python-werkzeug
                             python-wheel
                             python-wsgiref
                             python-wtforms))
    (home-page "https://github.com/kdheepak/zip")
    (synopsis "")
    (description #f)
    (license #f)))

(define-public python-collective.checkdocs
  (package
    (name "python-collective.checkdocs")
    (version "0.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "collective.checkdocs" version ".zip"))
       (sha256
        (base32 "0vp4amk5cj1x244mxfhxphvb6zqdj61c281qfmrbq92jghjjhlrs"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-docutils))
    (native-inputs (list zip))
    (home-page "https://github.com/collective/collective.checkdocs")
    (synopsis
     "Distutils command to view and validate restructured text in package's long_description")
    (description
     "Distutils command to view and validate restructured text in package's
long_description.")
    (license license:gpl3)))

(define-public python-sshfs
  (package
    (name "python-sshfs")
    (version "2024.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sshfs" version))
       (sha256
        (base32 "10250yvfm3q76r5nq4n8zxiignj859yh4psf3dwdr2bfk0sqiiar"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-asyncssh python-fsspec))
    (home-page #f)
    (synopsis "SSH Filesystem -- Async SSH/SFTP backend for fsspec")
    (description "SSH Filesystem -- Async SSH/SFTP backend for fsspec.")
    (license #f)))

(define-public python-dvc-ssh
  (package
    (name "python-dvc-ssh")
    (version "4.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "dvc-ssh" version))
       (sha256
        (base32 "1lns6vnbivb5k9075axbvirlyk20c2iryxgdnfxqniyh0nhbmw4n"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-dvc python-sshfs))
    (native-inputs (list python-collective.checkdocs
                         python-dvc
                         python-filelock
                         python-flaky
                         python-mock
                         python-mypy
                         python-pydocstyle
                         python-pygments
                         python-pytest
                         python-pytest-cov
                         python-pytest-docker
                         python-pytest-lazy-fixture
                         python-pytest-mock
                         python-pytest-xdist
                         python-pywin32
                         python-types-requests
                         python-types-tabulate
                         python-types-toml
                         python-wget
                         python-wheel
                         python-xmltodict))
    (home-page "")
    (synopsis "ssh plugin for dvc")
    (description "ssh plugin for dvc.")
    (license #f)))

(define-public python-zope.event
  (package
    (name "python-zope.event")
    (version "5.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "zope.event" version))
       (sha256
        (base32 "1kb73swvjszramlxljwlcbvrsnknr7icb8mmw9l406w9v7c41i5s"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list )) ; FIXME it had some other dep
    (native-inputs (list python-zope.testrunner))
    (home-page "https://github.com/zopefoundation/zope.event")
    (synopsis "Very basic event publishing system")
    (description "Very basic event publishing system.")
    (license #f)))

(define-public python-repoze.sphinx.autointerface
  (package
    (name "python-repoze.sphinx.autointerface")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "repoze.sphinx.autointerface" version))
       (sha256
        (base32 "18981v34cyw8r6q19syx2vy6yjbc6afyz3287qavk5j6791g2ss8"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-sphinx  ; FIXME it had some other dep
                             python-zope.interface))
    (native-inputs (list python-zope.testrunner))
    (home-page "https://github.com/repoze/repoze.sphinx.autointerface/")
    (synopsis "Sphinx extension: auto-generates API docs from Zope interfaces")
    (description
     "Sphinx extension: auto-generates API docs from Zope interfaces.")
    (license #f)))

(define-public python-zope.interface
  (package
    (name "python-zope.interface")
    (version "7.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "zope.interface" version))
       (sha256
        (base32 "1zwfqdiwh8w1h2ayb551dsdciwm45m8hc7dbb4d3g47qrfkzvxgh"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-coverage ; ; FIXME it had some other dep
                             python-repoze.sphinx.autointerface
                             python-sphinx
                             python-sphinx-rtd-theme
                             python-zope.event
                             python-zope.testing))
    (home-page "https://github.com/zopefoundation/zope.interface")
    (synopsis "Interfaces for Python")
    (description "Interfaces for Python.")
    (license #f)))

(define-public python-zope.exceptions
  (package
    (name "python-zope.exceptions")
    (version "5.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "zope.exceptions" version))
       (sha256
        (base32 "0y79n33kpdzr19jiklv7y556hcivc4w4zgbv9gdn00f38r4lq6v1"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-zope.interface)) ; FIXME it had some other dep
    (native-inputs (list python-zope.testrunner))
    (home-page "https://github.com/zopefoundation/zope.exceptions")
    (synopsis "Zope Exceptions")
    (description "Zope Exceptions.")
    (license #f)))

(define-public python-zope.testrunner
  (package
    (name "python-zope.testrunner")
    (version "6.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "zope.testrunner" version))
       (sha256
        (base32 "1p6vmgyy2hp7d99fdv429dx9gs3myqcjfligvvqa4hmbinm8izyi"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-zope.exceptions
                             python-zope.interface)) ; FIXME it had some other dep
    (native-inputs (list python-zope.testing))
    (home-page "https://github.com/zopefoundation/zope.testrunner")
    (synopsis "Zope testrunner script.")
    (description "Zope testrunner script.")
    (license #f)))

(define-public python-zope.testing
  (package
    (name "python-zope.testing")
    (version "5.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "zope.testing" version))
       (sha256
        (base32 "0jfnycp9kzmmkk0rard8chd81v5yp6vnm09ky7d3qmv6svcd0z78"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list )) ; FIXME it had some other dep
    (native-inputs (list python-zope.testrunner))
    (home-page "https://github.com/zopefoundation/zope.testing")
    (synopsis "Zope testing helpers")
    (description "Zope testing helpers.")
    (license #f)))

(define-public python-zc.lockfile
  (package
    (name "python-zc.lockfile")
    (version "3.0.post1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "zc.lockfile" version))
       (sha256
        (base32 "1v41irj7azaag3f14xyviv3l8mvap74v5p3q274k68vakrnyxcmd"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list )) ; FIXME it had some other dep
    (native-inputs (list python-zope.testing))
    (home-page "https://github.com/zopefoundation/zc.lockfile")
    (synopsis "Basic inter-process locks")
    (description "Basic inter-process locks.")
    (license #f)))

(define-public python-iterative-telemetry
  (package
    (name "python-iterative-telemetry")
    (version "0.0.8")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "iterative-telemetry" version))
       (sha256
        (base32 "0bb5xi797xp2n4l0l9mblxwp0wmd33xs44j75bzjr2cw20crvvav"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-appdirs python-distro python-filelock
                             python-requests))
    (native-inputs (list python-mypy
                         python-pylint
                         python-pytest
                         python-pytest-cov
                         python-pytest-mock
                         python-pytest-sugar
                         python-types-requests))
    (home-page "https://github.com/iterative/telemetry-python")
    (synopsis "Common library for sending telemetry")
    (description "Common library for sending telemetry.")
    (license #f)))

(define-public python-antlr4-python3-runtime
  (package
    (name "python-antlr4-python3-runtime")
    (version "4.13.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "antlr4_python3_runtime" version))
       (sha256
        (base32 "05irxwjkzkcnd9jwr37rhnf92f1yjgrnsn5ch00vghig3mz696wh"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-typing))
    (home-page #f)
    (synopsis "ANTLR 4.13.2 runtime for Python 3")
    (description "ANTLR 4.13.2 runtime for Python 3.")
    (license license:bsd-3)))

(define-public python-hydra-core
  (package
    (name "python-hydra-core")
    (version "1.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "hydra-core" version))
       (sha256
        (base32 "0958j11rl9jb6filxyvsycdfhrs7gcpfga48klz7r68nfbb8x1wa"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-antlr4-python3-runtime
                             python-importlib-resources python-omegaconf
                             python-packaging))
    (home-page "https://github.com/facebookresearch/hydra")
    (synopsis "A framework for elegantly configuring complex applications")
    (description
     "This package provides a framework for elegantly configuring complex
applications.")
    (license license:expat)))

(define-public python-pylint-plugin-utils
  (package
    (name "python-pylint-plugin-utils")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pylint_plugin_utils" version))
       (sha256
        (base32 "1r4kxqz6rhjc9idkxc61sj316mv2alahjf477aigp8wbldlbzknk"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pylint))
    (home-page "https://github.com/PyCQA/pylint-plugin-utils")
    (synopsis "Utilities and helpers for writing Pylint plugins")
    (description "Utilities and helpers for writing Pylint plugins.")
    (license #f)))

(define-public python-types-paramiko
  (package
    (name "python-types-paramiko")
    (version "3.4.0.20240423")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "types-paramiko" version))
       (sha256
        (base32 "1hd8w8dzj5rzvlxvr5n5j0kl6v5nm39l6ryncdjqhirc4gd8vada"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-cryptography))
    (home-page "https://github.com/python/typeshed")
    (synopsis "Typing stubs for paramiko")
    (description "Typing stubs for paramiko.")
    (license #f)))

(define-public python-types-mock
  (package
    (name "python-types-mock")
    (version "5.1.0.20240425")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "types-mock" version))
       (sha256
        (base32 "19552bl91ah3qafphkq8vc1w1c9kzr2c2g1y0iq7v0ifsx2sd0aj"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/python/typeshed")
    (synopsis "Typing stubs for mock")
    (description "Typing stubs for mock.")
    (license #f)))

(define-public python-types-certifi
  (package
    (name "python-types-certifi")
    (version "2021.10.8.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "types-certifi" version))
       (sha256
        (base32 "0ksaan5yha5r4d2nc7f288y0diwp63md23f1w5v0pg35s6c7gkvj"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/python/typeshed")
    (synopsis "Typing stubs for certifi")
    (description "Typing stubs for certifi.")
    (license #f)))

(define-public python-pytest-pylint
  (package
    (name "python-pytest-pylint")
    (version "0.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytest-pylint" version))
       (sha256
        (base32 "0gjm9qy1rsngvli042szqc45y0q5zk1crq28ja01iyjw3n74nxl8"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pylint python-pytest python-tomli))
    (home-page "https://github.com/carsongee/pytest-pylint")
    (synopsis "pytest plugin to check source code with pylint")
    (description "pytest plugin to check source code with pylint.")
    (license license:expat)))

(define-public python-pytest-docker
  (package
    (name "python-pytest-docker")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytest-docker" version))
       (sha256
        (base32 "0pzvdxfprnkknprrf9dqvnpk8ib3ivp9x6y7csksllm70i454w93"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-attrs python-pytest))
    (native-inputs (list python-mypy ; ; FIXME it had some other dep
                         python-pytest-mypy
                         python-pytest-pycodestyle
                         python-pytest-pylint
                         python-requests
                         python-types-requests
                         ))
    (home-page "https://github.com/avast/pytest-docker")
    (synopsis
     "Simple pytest fixtures for Docker and Docker Compose based tests")
    (description
     "Simple pytest fixtures for Docker and Docker Compose based tests.")
    (license license:expat)))

(define-public python-scmrepo
  (package
    (name "python-scmrepo")
    (version "3.3.7")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "scmrepo" version))
       (sha256
        (base32 "01qwi6630plyl89yvwpjm4ddcxfrqxbyf7xmgyqgiw3wq9iib84c"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-aiohttp-retry
                             python-asyncssh
                             python-dulwich
                             python-fsspec
                             python-funcy
                             python-gitpython
                             python-pathspec
                             python-pygit2
                             python-pygtrie
                             python-tqdm))
    (native-inputs (list python-aioresponses
                         python-mypy
                         python-paramiko
                         python-pytest
                         python-pytest-asyncio
                         python-pytest-cov
                         python-pytest-docker
                         python-pytest-mock
                         python-pytest-sugar
                         python-pytest-test-utils
                         python-scmrepo
                         python-types-certifi
                         python-types-mock
                         python-types-paramiko
                         python-types-tqdm))
    (home-page #f)
    (synopsis "scmrepo")
    (description "scmrepo.")
    (license #f)))

(define-public python-gto
  (package
    (name "python-gto")
    (version "1.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "gto" version))
       (sha256
        (base32 "0xbxib9ky5czyhrl5p3c4yc2j1699y0447s0752xbh4ma5rhw414"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-entrypoints
                             python-funcy
                             python-pydantic
                             python-rich
                             python-ruamel.yaml
                             python-scmrepo
                             python-semver
                             python-tabulate
                             python-typer))
    (native-inputs (list python-freezegun
                         python-pylint
                         python-pylint-plugin-utils
                         python-pytest
                         python-pytest-cov
                         python-pytest-mock
                         python-pytest-test-utils
                         python-types-freezegun))
    (home-page #f)
    (synopsis "Version and deploy your models following GitOps principles")
    (description
     "Version and deploy your models following @code{GitOps} principles.")
    (license #f)))

(define-public python-flufl.lock
  (package
    (name "python-flufl.lock")
    (version "8.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "flufl.lock" version))
       (sha256
        (base32 "1jz7vipjga4x803gfsb9mvnfb6q8my7ib000nsc3v9ljaq0050yq"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-atpublic python-psutil))
    (home-page #f)
    (synopsis "NFS-safe file locking with timeouts for POSIX and Windows")
    (description "NFS-safe file locking with timeouts for POSIX and Windows.")
    (license #f)))

(define-public python-flatten-dict
  (package
    (name "python-flatten-dict")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "flatten-dict" version))
       (sha256
        (base32 "0xihnim27ympw7dq17gdknkmzsqb54qry3vawhdbh1gqwsv9csjh"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-importlib-metadata python-pathlib2
                             python-six))
    (home-page "https://github.com/ianlini/flatten-dict")
    (synopsis
     "A flexible utility for flattening and unflattening dict-like objects in Python.")
    (description
     "This package provides a flexible utility for flattening and unflattening
dict-like objects in Python.")
    (license license:expat)))

(define-public python-pytest-test-utils
  (package
    (name "python-pytest-test-utils")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytest-test-utils" version))
       (sha256
        (base32 "0wam6hf3fg3idva7am5s0pz62c4sxsaszjbp5zd83mhj6jjvldx5"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pytest))
    (native-inputs (list python-coverage python-mypy python-pytest-test-utils))
    (home-page "")
    (synopsis "")
    (description #f)
    (license #f)))

(define-public python-celery-types
  (package
    (name "python-celery-types")
    (version "0.22.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "celery_types" version))
       (sha256
        (base32 "0c2vdn3vcqa67fsivcp4bxiz0bych7iy3r8rz6hx1pkfbbxd5jhf"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-typing-extensions))
    (home-page "https://github.com/sbdchd/celery-types")
    (synopsis "Type stubs for Celery and its related packages")
    (description "Type stubs for Celery and its related packages.")
    (license #f)))

(define-public python-pywin32
  (package
    (name "python-pywin32")
    (version "306")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pywin32" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/mhammond/pywin32")
    (synopsis "Python for Window Extensions")
    (description "Python for Window Extensions.")
    (license #f)))

(define-public python-dvc-task
  (package
    (name "python-dvc-task")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "dvc-task" version))
       (sha256
        (base32 "0g6d2nbfy57f1m2vs3yc1y3253zkgp2zp541l4mr63lwmwk6c5n0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-celery python-funcy python-kombu
                             python-pywin32 python-shortuuid))
    (native-inputs (list python-celery-types
                         python-dvc-task
                         python-mypy
                         python-pytest
                         python-pytest-celery
                         python-pytest-cov
                         python-pytest-mock
                         python-pytest-rerunfailures
                         python-pytest-sugar
                         python-pytest-test-utils))
    (home-page #f)
    (synopsis "Extensible task queue used in DVC.")
    (description "Extensible task queue used in DVC.")
    (license #f)))

(define-public python-dvc-studio-client
  (package
    (name "python-dvc-studio-client")
    (version "0.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "dvc_studio_client" version))
       (sha256
        (base32 "1lfxbamqmaawf148bjpkk6sby2xwyhmmsfkis23fip3krzsjy8fv"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-dulwich python-requests python-voluptuous))
    (native-inputs (list python-dvc-studio-client
                         python-mypy
                         python-pytest
                         python-pytest-cov
                         python-pytest-mock
                         python-pytest-sugar
                         python-types-requests))
    (home-page #f)
    (synopsis
     "Small library to post data from DVC/DVCLive to Iterative Studio")
    (description
     "Small library to post data from DVC/DVCLive to Iterative Studio.")
    (license #f)))

(define-public python-dvc-render
  (package
    (name "python-dvc-render")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "dvc-render" version))
       (sha256
        (base32 "1h7zjwad0iv3kcv45kyv7ig43gpw0982ndm8iys39bqdfs0wvla0"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-dvc-render
                         python-mypy
                         python-pytest
                         python-pytest-cov
                         python-pytest-mock
                         python-pytest-sugar))
    (home-page #f)
    (synopsis "Dvc Render")
    (description "Dvc Render.")
    (license #f)))

(define-public python-rangehttpserver
  (package
    (name "python-rangehttpserver")
    (version "1.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "rangehttpserver" version))
       (sha256
        (base32 "00rp0qpg6knnldicy27xr6i3vf77p4f1bbl5khs4z3v81nkbpxld"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/danvk/RangeHTTPServer/")
    (synopsis "SimpleHTTPServer with support for Range requests")
    (description "@code{SimpleHTTPServer} with support for Range requests.")
    (license #f)))

(define-public python-aiohttp-retry
  (package
    (name "python-aiohttp-retry")
    (version "2.8.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "aiohttp_retry" version))
       (sha256
        (base32 "1a8ysyj8v52b3a8bq8hp0kbwgkrgj6xbry7r3xpd6ak865z673ls"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-aiohttp))
    (home-page "https://github.com/inyutin/aiohttp_retry")
    (synopsis "Simple retry client for aiohttp")
    (description "Simple retry client for aiohttp.")
    (license license:expat)))

(define-public python-dvc-http
  (package
    (name "python-dvc-http")
    (version "2.32.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "dvc-http" version))
       (sha256
        (base32 "1z1pjvrkzf0mjyrn3w9zmzfwd20imkfmkxi5qr1vkailar1zh57p"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-aiohttp-retry python-fsspec))
    (native-inputs (list python-dvc
                         python-flaky
                         python-mypy
                         python-pylint
                         python-pytest
                         python-pytest-cov
                         python-pytest-mock
                         python-pytest-xdist
                         python-rangehttpserver
                         python-types-requests))
    (home-page "http://dvc.org")
    (synopsis "http plugin for dvc")
    (description "http plugin for dvc.")
    (license #f)))

(define-public python-types-tqdm
  (package
    (name "python-types-tqdm")
    (version "4.66.0.20240417")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "types-tqdm" version))
       (sha256
        (base32 "0c8s8ahz3w4b2mz7mvnf2gyfwrhiibfq93av9w7d9a1fabpykp0n"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/python/typeshed")
    (synopsis "Typing stubs for tqdm")
    (description "Typing stubs for tqdm.")
    (license #f)))

(define-public python-coverage-enable-subprocess
  (package
    (name "python-coverage-enable-subprocess")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "coverage_enable_subprocess" version))
       (sha256
        (base32 "04f0mhvzkvd74m97bldj9b5hqnsc08b8xww4xy3ws1r0ag4kvggx"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-coverage))
    (home-page "https://github.com/bukzor/python-coverage-enable-subprocess")
    (synopsis "enable python coverage for subprocesses")
    (description "enable python coverage for subprocesses.")
    (license license:expat)))

(define-public python-wsgidav
  (package
    (name "python-wsgidav")
    (version "4.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "wsgidav" version))
       (sha256
        (base32 "17ibwpb0aa2q8i9j49rwhzh62gxqpjijv9bbic0z7pkjx8dxf2jz"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-defusedxml python-jinja2 python-json5
                             python-pyyaml))
    (home-page "https://github.com/mar10/wsgidav")
    (synopsis "Generic and extendable WebDAV server based on WSGI")
    (description "Generic and extendable @code{WebDAV} server based on WSGI.")
    (license license:expat)))

(define-public python-types-pkg-resources
  (package
    (name "python-types-pkg-resources")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "types-pkg-resources" version))
       (sha256
        (base32 "1blxmgxrcc2g5g6vqcrpknzzc9m7b4rmv7fr5xb478xy7n6rnjl3"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/python/typeshed")
    (synopsis "Typing stubs for pkg_resources")
    (description "Typing stubs for pkg_resources.")
    (license #f)))

(define-public python-types-colorama
  (package
    (name "python-types-colorama")
    (version "0.4.15.20240311")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "types-colorama" version))
       (sha256
        (base32 "0ylwp6r6k69icsd96zbsan7i1x0rwj427lv5jpxi8avxs6c7z3m2"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/python/typeshed")
    (synopsis "Typing stubs for colorama")
    (description "Typing stubs for colorama.")
    (license #f)))

(define-public python-webdav4
  (package
    (name "python-webdav4")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "webdav4" version))
       (sha256
        (base32 "0zs04j34bjx756jl1i7nh9c1byja8gyvrnfxkla7fkiqxvqacz9q"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-httpx python-dateutil))
    (native-inputs (list python-cheroot
                         python-colorama
                         python-fsspec
                         python-furo
                         python-httpx
                         python-mypy
                         python-myst-parser
                         python-pre-commit
                         python-pytest
                         python-pytest-cov
                         python-pytest-xdist
                         python-sphinx
                         python-sphinx-copybutton
                         python-types-colorama
                         python-types-pkg-resources
                         python-types-python-dateutil
                         python-typing-extensions
                         python-wsgidav))
    (home-page #f)
    (synopsis
     "WebDAV client library with an fsspec-based filesystem and a CLI")
    (description
     "@code{WebDAV} client library with an fsspec-based filesystem and a CLI.")
    (license #f)))

(define-public python-universal-pathlib
  (package
    (name "python-universal-pathlib")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "universal_pathlib" version))
       (sha256
        (base32 "04rgmr95xj84sig95p372vxf5ndgkg0v221panrmvbcjhxa1bhkb"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-fsspec))
    (native-inputs (list python-adlfs
                         python-aiohttp
                         python-cheroot
                         python-gcsfs
                         python-moto
                         python-mypy
                         python-packaging
                         python-pydantic
                         python-pydantic-settings
                         python-pylint
                         python-pytest
                         python-pytest-cov
                         python-pytest-mock
                         python-pytest-sugar
                         python-requests
                         python-s3fs
                         python-webdav4
                         python-wsgidav))
    (home-page "https://github.com/fsspec/universal_pathlib")
    (synopsis "pathlib api extended to use fsspec backends")
    (description "pathlib api extended to use fsspec backends.")
    (license license:expat)))

(define-public python-pytest-servers
  (package
    (name "python-pytest-servers")
    (version "0.5.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytest_servers" version))
       (sha256
        (base32 "16yki4a904shlyinhpk8fr4hqg94mjmhf376s75vb1l7y4gi91kx"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-filelock python-fsspec python-pytest
                             python-requests python-universal-pathlib))
    (native-inputs (list python-coverage
                         python-coverage-enable-subprocess
                         python-mypy
                         python-pytest-servers
                         python-pytest-sugar
                         python-pytest-xdist
                         python-types-requests))
    (home-page #f)
    (synopsis "pytest servers")
    (description "pytest servers.")
    (license #f)))

(define-public python-pywin32-ctypes
  (package
    (name "python-pywin32-ctypes")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pywin32-ctypes" version))
       (sha256
        (base32 "0mapi2wkhb0l03x7l0ddkr9isp5s7mgxbi7dn81law3djh2dqqni"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/enthought/pywin32-ctypes")
    (synopsis "A (partial) reimplementation of pywin32 using ctypes/cffi")
    (description
     "This package provides a (partial) reimplementation of pywin32 using ctypes/cffi.")
    (license #f)))

(define-public python-pyinstaller-hooks-contrib
  (package
    (name "python-pyinstaller-hooks-contrib")
    (version "2024.8")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyinstaller_hooks_contrib" version))
       (sha256
        (base32 "1qpkrs0czfpjlavvlkq5bffm53mmp4zajmjv0mkyjfdpia3qvdi9"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-importlib-metadata python-packaging
                             )) ; FIXME it had some other dep
    (home-page "https://github.com/pyinstaller/pyinstaller-hooks-contrib")
    (synopsis "Community maintained hooks for PyInstaller")
    (description "Community maintained hooks for @code{PyInstaller}.")
    (license #f)))

(define-public python-macholib
  (package
    (name "python-macholib")
    (version "1.16.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "macholib" version))
       (sha256
        (base32 "0c3ar1p61my4x6x2254vdykrlq5k11cizn0kh1w9mkg4x0arxbh7"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-altgraph))
    (home-page "http://github.com/ronaldoussoren/macholib")
    (synopsis "Mach-O header analysis and editing")
    (description "Mach-O header analysis and editing.")
    (license license:expat)))

(define-public python-pyinstaller
  (package
    (name "python-pyinstaller")
    (version "6.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyinstaller" version))
       (sha256
        (base32 "0w0js91xan6m4l56vdqbd31ac46cjb6zc5lgpw8bkxvg0pw40f0l"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-altgraph
                             python-importlib-metadata
                             python-macholib
                             python-packaging
                             python-pefile
                             python-pyinstaller-hooks-contrib
                             python-pywin32-ctypes
                             )) ; FIXME it had some other dep
    (native-inputs (list python-execnet python-psutil python-pytest))
    (home-page "https://www.pyinstaller.org/")
    (synopsis
     "PyInstaller bundles a Python application and all its dependencies into a single package.")
    (description
     "@code{PyInstaller} bundles a Python application and all its dependencies into a
single package.")
    (license #f)))

(define-public python-sqltrie
  (package
    (name "python-sqltrie")
    (version "0.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sqltrie" version))
       (sha256
        (base32 "08axh6wz6qn4m85fm8fvnmrx43m9araqv5lf0hdqi564vqhkk5jn"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-attrs python-orjson python-pygtrie))
    (native-inputs (list python-mypy
                         python-pyinstaller
                         python-pytest
                         python-pytest-benchmark
                         python-pytest-cov
                         python-pytest-mock
                         python-pytest-sugar
                         python-sqltrie))
    (home-page #f)
    (synopsis "SQL-based prefix tree inspired by pygtrie and python-diskcache")
    (description
     "SQL-based prefix tree inspired by pygtrie and python-diskcache.")
    (license #f)))

(define-public python-dvc-objects
  (package
    (name "python-dvc-objects")
    (version "5.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "dvc-objects" version))
       (sha256
        (base32 "055q4px2158x5gsy3n3d423hw71x0ylgqpi91n545kwy1xi1ks92"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-fsspec python-funcy))
    (native-inputs (list python-dvc-objects
                         python-mypy
                         python-pytest
                         python-pytest-asyncio
                         python-pytest-benchmark
                         python-pytest-cov
                         python-pytest-mock
                         python-pytest-sugar
                         python-reflink))
    (home-page "")
    (synopsis
     "dvc objects - filesystem and object-db level abstractions to use in dvc and dvc-data")
    (description
     "dvc objects - filesystem and object-db level abstractions to use in dvc and
dvc-data.")
    (license #f)))

(define-public python-dvc-data
  (package
    (name "python-dvc-data")
    (version "3.16.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "dvc_data" version))
       (sha256
        (base32 "1f101yy02zcqmhv9sa90mgph5yr6d1y6p95zi990jhqfgg8223xj"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-attrs
                             python-dictdiffer
                             python-diskcache
                             python-dvc-objects
                             python-fsspec
                             python-funcy
                             python-orjson
                             python-pygtrie
                             python-sqltrie
                             python-tqdm))
    (native-inputs (list python-blake3
                         python-dvc-data
                         python-mypy
                         python-pytest
                         python-pytest-benchmark
                         python-pytest-cov
                         python-pytest-mock
                         python-pytest-servers
                         python-pytest-sugar
                         python-types-tqdm))
    (home-page #f)
    (synopsis "DVC's data management subsystem")
    (description "DVC's data management subsystem.")
    (license #f)))

(define-public python-dvc
  (package
    (name "python-dvc")
    (version "3.53.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "dvc" version))
       (sha256
        (base32 "0wliq52xzk08h0898axwxyw8m9mq76hgfgg9lxa88cs8d4vlja87"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-attrs
                             python-celery
                             python-colorama
                             python-configobj
                             python-distro
                             python-dpath
                             python-dulwich
                             python-dvc-data
                             python-dvc-http
                             python-dvc-objects
                             python-dvc-render
                             python-dvc-studio-client
                             python-dvc-task
                             python-flatten-dict
                             python-flufl.lock
                             python-fsspec
                             python-funcy
                             python-grandalf
                             python-gto
                             python-hydra-core
                             python-iterative-telemetry
                             python-kombu
                             python-networkx
                             python-omegaconf
                             python-packaging
                             python-pathspec
                             python-platformdirs
                             python-psutil
                             python-pydot
                             python-pygtrie
                             python-pyparsing
                             python-requests
                             python-rich
                             python-ruamel.yaml
                             python-scmrepo
                             python-shortuuid
                             python-shtab
                             python-tabulate
                             python-tomlkit
                             python-tqdm
                             python-voluptuous
                             python-zc.lockfile))
    (native-inputs (list python-beautifulsoup4
                         python-dvc
                         python-dvc-ssh
                         python-filelock
                         python-pandas
                         python-pytest
                         python-pytest-benchmark
                         python-pytest-cov
                         python-pytest-docker
                         python-pytest-mock
                         python-pytest-rerunfailures
                         python-pytest-test-utils
                         python-pytest-timeout
                         python-pytest-xdist
                         python-pywin32
                         python-sqlalchemy
                         python-tzdata
                         python-virtualenv))
    (home-page #f)
    (synopsis "Git for data scientists - manage your code and data together")
    (description
     "Git for data scientists - manage your code and data together.")
    (license #f)))

(define-public python-dvclive
  (package
    (name "python-dvclive")
    (version "3.48.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "dvclive" version))
       (sha256
        (base32 "02pvnz27dnfi3sw764fiv2qg5aydr48a0pb23s9wi23by5h4chs2"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-dvc
                             python-dvc-render
                             python-dvc-studio-client
                             python-funcy
                             python-gto
                             python-psutil
                             python-pynvml
                             python-ruamel.yaml
                             python-scmrepo))
    (native-inputs (list python-dpath
                         ;python-dvclive
                         python-ipython
                         python-mypy
                         python-pytest
                         python-pytest-cov
                         python-pytest-mock
                         python-pytest-sugar
                         python-pytest-voluptuous
                         python-tf-keras
                         python-transformers
                         python-types-pyyaml))
    (home-page #f)
    (synopsis "Experiments logger for ML projects.")
    (description "Experiments logger for ML projects.")
    (license #f)))

(define-public python-peft
  (package
    (name "python-peft")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "peft" version))
       (sha256
        (base32 "197lnnfm13ab8xpby5y5628lfpy9p6m08j7hqz6mr64f8yyhaci5"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-accelerate
                             python-huggingface-hub
                             python-numpy
                             python-packaging
                             python-psutil
                             python-pyyaml
                             python-safetensors
                             python-torch
                             python-tqdm
                             python-transformers))
    (native-inputs (list python-black
                         python-datasets
                         python-diffusers
                         python-hf-doc-builder
                         python-parameterized
                         python-pytest
                         python-pytest-cov
                         python-pytest-xdist
                         python-ruff
                         python-scipy))
    (home-page "https://github.com/huggingface/peft")
    (synopsis "Parameter-Efficient Fine-Tuning (PEFT)")
    (description "Parameter-Efficient Fine-Tuning (PEFT).")
    (license #f)))

(define-public python-trampoline
  (package
    (name "python-trampoline")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "trampoline" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (home-page "https://gitlab.com/ferreum/trampoline")
    (synopsis "Simple and tiny yield-based trampoline implementation.")
    (description "Simple and tiny yield-based trampoline implementation.")
    (license license:expat)))

(define-public python-torchsde
  (package
    (name "python-torchsde")
    (version "0.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "torchsde" version))
       (sha256
        (base32 "12vpnkjkk9k22bdqma23xq44dgmgjmim5ywl2q7ik7aga39p9l41"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy python-scipy python-torch
                             python-trampoline))
    (home-page "https://github.com/google-research/torchsde")
    (synopsis
     "SDE solvers and stochastic adjoint sensitivity analysis in PyTorch.")
    (description
     "SDE solvers and stochastic adjoint sensitivity analysis in @code{PyTorch}.")
    (license #f)))

(define-public python-torchdiffeq
  (package
    (name "python-torchdiffeq")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "torchdiffeq" version))
       (sha256
        (base32 "0hs0hh4j0310x08fvmkdl1r51bkdrnzms0d64dzxmvczi0y7rrf0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-scipy python-torch))
    (home-page "https://github.com/rtqichen/torchdiffeq")
    (synopsis "ODE solvers and adjoint sensitivity analysis in PyTorch.")
    (description
     "ODE solvers and adjoint sensitivity analysis in @code{PyTorch}.")
    (license #f)))

(define-public python-kornia-rs
  (package
    (name "python-kornia-rs")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "kornia_rs" version))
       (sha256
        (base32 "166jf2pmdz5nl0fbpyzki4j0sx4vrfp2qs1g5xlf378ffj40jlh0"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-jax python-kornia python-numpy python-pytest))
    (home-page #f)
    (synopsis "Low level implementations for computer vision in Rust")
    (description "Low level implementations for computer vision in Rust.")
    (license #f)))

(define-public python-kornia
  (package
    (name "python-kornia")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "kornia" version))
       (sha256
        (base32 "01jk0lyxs8149358h664lzq3ly550dqqp6k9ms8khv3ybpm63f0f"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-kornia-rs python-packaging python-torch))
    (native-inputs (list python-coverage
                         python-mypy
                         python-numpy
                         python-onnx
                         python-pre-commit
                         python-pytest
                         python-pytest-timeout
                         python-requests))
    (home-page #f)
    (synopsis "Open Source Differentiable Computer Vision Library for PyTorch")
    (description
     "Open Source Differentiable Computer Vision Library for @code{PyTorch}.")
    (license #f)))

(define-public python-jsonmerge
  (package
    (name "python-jsonmerge")
    (version "1.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "jsonmerge" version))
       (sha256
        (base32 "18wllcpsz3iyhbs62bwi6465ik075ba0l4scmsvij3hb33h5fdy4"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-jsonschema))
    (home-page "")
    (synopsis "Merge a series of JSON documents.")
    (description "Merge a series of JSON documents.")
    (license license:expat)))

(define-public python-dctorch
  (package
    (name "python-dctorch")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "dctorch" version))
       (sha256
        (base32 "0vhhwpx3ns39109d4zh5z1jdp9yd71b24qc0b46v8zm8901cnrsf"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy python-scipy python-torch))
    (home-page "")
    (synopsis "fast discrete cosine transforms for pytorch")
    (description "fast discrete cosine transforms for pytorch.")
    (license license:expat)))

(define-public python-ftfy
  (package
    (name "python-ftfy")
    (version "6.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ftfy" version))
       (sha256
        (base32 "1p5s29wcdkb00qf0kridwi32m82kapksyschiajpgm99iyc0bdbr"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-wcwidth))
    (home-page "https://ftfy.readthedocs.io/en/latest/")
    (synopsis "Fixes mojibake and other problems with Unicode, after the fact")
    (description
     "Fixes mojibake and other problems with Unicode, after the fact.")
    (license #f)))

(define-public python-clip-anytorch
  (package
    (name "python-clip-anytorch")
    (version "2.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "clip-anytorch" version))
       (sha256
        (base32 "1pxswbknh6h9yzix9zx39gvazi1pinl5pf212sq2vxyv9skf89x8"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-ftfy python-regex python-torch
                             python-torchvision python-tqdm))
    (native-inputs (list python-pytest))
    (home-page "https://github.com/rom1504/CLIP")
    (synopsis "# CLIP")
    (description "# CLIP.")
    (license #f)))

(define-public python-clean-fid
  (package
    (name "python-clean-fid")
    (version "0.1.35")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "clean-fid" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy
                             python-pillow
                             python-requests
                             python-scipy
                             python-torch
                             python-torchvision
                             python-tqdm))
    (home-page "https://github.com/GaParmar/clean-fid")
    (synopsis
     "FID calculation in PyTorch with proper image resizing and quantization steps")
    (description
     "FID calculation in @code{PyTorch} with proper image resizing and quantization
steps.")
    (license #f)))

(define-public python-k-diffusion
  (package
    (name "python-k-diffusion")
    (version "0.1.1.post1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "k-diffusion" version))
       (sha256
        (base32 "0rkivrcxafpd4dh1s0cp3hdbha0msgk8593qq7260ai0jl76pdh4"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-accelerate
                             python-clean-fid
                             python-clip-anytorch
                             python-dctorch
                             python-einops
                             python-jsonmerge
                             python-kornia
                             python-pillow
                             python-safetensors
                             python-scikit-image
                             python-scipy
                             python-torch
                             python-torchdiffeq
                             python-torchsde
                             python-torchvision
                             python-tqdm
                             python-wandb))
    (home-page "https://github.com/crowsonkb/k-diffusion")
    (synopsis "Karras et al. (2022) diffusion models for PyTorch")
    (description "Karras et al. (2022) diffusion models for @code{PyTorch}.")
    (license license:expat)))

(define-public python-invisible-watermark
  (package
    (name "python-invisible-watermark")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "invisible-watermark" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy python-opencv-python python-pillow
                             python-pywavelets python-torch))
    (home-page "https://github.com/ShieldMnt/invisible-watermark")
    (synopsis
     "The library for creating and decoding invisible image watermarks")
    (description
     "The library for creating and decoding invisible image watermarks.")
    (license #f)))

(define-public python-hf-doc-builder
  (package
    (name "python-hf-doc-builder")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "hf-doc-builder" version))
       (sha256
        (base32 "16qp51yl7w40w6yym758l0b3za7c89vb3mwnkv3hmnfifq7ncmz5"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-black
                             python-gitpython
                             python-huggingface-hub
                             python-nbformat
                             python-packaging
                             python-pyyaml
                             python-tqdm))
    (native-inputs (list python-black
                         python-flake8
                         python-google-api-python-client
                         python-isort
                         python-pytest
                         python-pytest-xdist
                         python-requests
                         python-timm
                         python-tokenizers
                         python-torch
                         python-transformers))
    (home-page "https://github.com/huggingface/doc-builder")
    (synopsis "Doc building utility")
    (description "Doc building utility.")
    (license #f)))

(define-public python-unidic-lite
  (package
    (name "python-unidic-lite")
    (version "1.0.8")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "unidic-lite" version))
       (sha256
        (base32 "0idj4yp0sl27ylr2wzkybbh0wj7c843lp7cljw5d1m7xv5r4b7fv"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/polm/unidic-lite")
    (synopsis "A small version of UniDic packaged for Python")
    (description
     "This package provides a small version of @code{UniDic} packaged for Python.")
    (license #f)))

(define-public python-unidic
  (package
    (name "python-unidic")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "unidic" version))
       (sha256
        (base32 "1dr1v63vpk0x8fhd8kakszn6347v7byh2j9ilv988b1lvq2irf8a"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-plac python-requests python-tqdm
                             python-wasabi))
    (home-page "https://github.com/polm/unidic-py")
    (synopsis "UniDic packaged for Python")
    (description "@code{UniDic} packaged for Python.")
    (license license:expat)))

(define-public python-torchaudio
  (package
    (name "python-torchaudio")
    (version "2.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "torchaudio" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-torch))
    (home-page "https://github.com/pytorch/audio")
    (synopsis "An audio package for PyTorch")
    (description "An audio package for @code{PyTorch}.")
    (license #f)))

(define-public python-timm
  (package
    (name "python-timm")
    (version "1.0.8")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "timm" version))
       (sha256
        (base32 "15dz615hc69fqalsn20a9xyyikn474z600sbkbcl77633jgmfjpm"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-huggingface-hub python-pyyaml
                             python-safetensors python-torch
                             python-torchvision))
    (home-page "https://github.com/huggingface/pytorch-image-models")
    (synopsis "PyTorch Image Models")
    (description "@code{PyTorch} Image Models.")
    (license #f)))

(define-public python-sudachipy
  (package
    (name "python-sudachipy")
    (version "0.6.8")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "SudachiPy" version))
       (sha256
        (base32 "1228dp1h3fmrg0gvim7hg0fzyz5b588v5z829p1srbq9zy39071x"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-sudachidict-core python-tokenizers))
    (home-page
     "https://github.com/WorksApplications/sudachi.rs/tree/develop/python")
    (synopsis "Python version of Sudachi, the Japanese Morphological Analyzer")
    (description
     "Python version of Sudachi, the Japanese Morphological Analyzer.")
    (license #f)))

(define-public python-sudachipy
  (package
    (name "python-sudachipy")
    (version "0.6.8")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "SudachiPy" version))
       (sha256
        (base32 "1228dp1h3fmrg0gvim7hg0fzyz5b588v5z829p1srbq9zy39071x"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-sudachidict-core python-tokenizers))
    (home-page
     "https://github.com/WorksApplications/sudachi.rs/tree/develop/python")
    (synopsis "Python version of Sudachi, the Japanese Morphological Analyzer")
    (description
     "Python version of Sudachi, the Japanese Morphological Analyzer.")
    (license #f)))

(define-public python-sudachidict-core
  (package
    (name "python-sudachidict-core")
    (version "20240716")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "SudachiDict-core" version))
       (sha256
        (base32 "1agf85f4n6jdrhqjzjglrcgpiqvs9p5ws0c0nd074n9yzmih4f4h"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-sudachipy))
    (home-page "https://github.com/WorksApplications/SudachiDict")
    (synopsis "Sudachi Dictionary for SudachiPy - Core Edition")
    (description "Sudachi Dictionary for @code{SudachiPy} - Core Edition.")
    (license #f)))

(define-public python-qmcpy
  (package
    (name "python-qmcpy")
    (version "1.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "qmcpy" version))
       (sha256
        (base32 "19vnd1l732y7fgykdliy2qbd67rk26phx51f19n42q8nz3lbpyz8"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy python-scipy))
    (home-page "https://qmcsoftware.github.io/QMCSoftware/")
    (synopsis "(Quasi) Monte Carlo Framework in Python 3")
    (description "(Quasi) Monte Carlo Framework in Python 3.")
    (license #f)))

(define-public python-libsigopt
  (package
    (name "python-libsigopt")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "libsigopt" version))
       (sha256
        (base32 "0nlmf7g8hd7hwp3xghalxvsbs6i574gznp89dhbpnvy8fsync58a"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-jsonschema python-numpy python-qmcpy
                             python-scipy))
    (home-page "https://sigopt.org")
    (synopsis "SigOpt computation libraries")
    (description "@code{SigOpt} computation libraries.")
    (license #f)))

(define-public python-sigoptlite
  (package
    (name "python-sigoptlite")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sigoptlite" version))
       (sha256
        (base32 "00f1gssfzm51i2f1hj7ixmp3ys8qalcrblm3rxl7sd8xcgi874l8"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-libsigopt python-numpy))
    (home-page "https://sigopt.org")
    (synopsis "In memory driver for SigOpt")
    (description "In memory driver for @code{SigOpt}.")
    (license #f)))

(define-public python-sigopt
  (package
    (name "python-sigopt")
    (version "8.8.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sigopt" version))
       (sha256
        (base32 "1jj4993c0jg8pxxgrd258axcv7nijpibhciiknyl54azrd0pd049"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-backoff
                             python-click
                             python-gitpython
                             python-packaging
                             python-pypng
                             python-pyyaml
                             python-requests
                             python-urllib3))
    (native-inputs (list python-boto3
                         python-certifi
                         python-docker
                         python-hyperopt
                         python-kubernetes
                         python-matplotlib
                         python-mock
                         python-nose
                         python-notebook
                         python-numpy
                         python-pillow
                         python-pint
                         python-pre-commit
                         python-pylint
                         python-pymongo
                         python-pyopenssl
                         python-pyspark
                         python-pytest
                         python-scikit-learn
                         python-sigoptlite
                         python-twine
                         python-vulture
                         python-xgboost)) ; FIXME it had some other dep
    (home-page "https://sigopt.com/")
    (synopsis "SigOpt Python API Client")
    (description "@code{SigOpt} Python API Client.")
    (license #f)))

(define-public python-rjieba
  (package
    (name "python-rjieba")
    (version "0.1.11")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "rjieba" version))
       (sha256
        (base32 "1g4r0kdj1570n29mmaxb2bjfgybh9847n3wc1rmm7hjd83ybxkd9"))))
    (build-system pyproject-build-system)
    (home-page "")
    (synopsis "jieba-rs Python binding")
    (description "jieba-rs Python binding.")
    (license license:expat)))

(define-public python-rhoknp
  (package
    (name "python-rhoknp")
    (version "1.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "rhoknp" version))
       (sha256
        (base32 "0w8msp3fgzan9pw6nasz7jjvp59qvl2k3059pdhang8p2brswzz2"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-fastapi
                             python-jinja2
                             python-pygments
                             python-pyyaml
                             python-rich
                             python-typer
                             python-typing-extensions
                             python-uvicorn))
    (home-page "https://github.com/ku-nlp/rhoknp")
    (synopsis "Yet another Python binding for Juman++/KNP/KWJA")
    (description "Yet another Python binding for Juman++/KNP/KWJA.")
    (license license:expat)))

(define-public python-pytest-rich
  (package
    (name "python-pytest-rich")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytest-rich" version))
       (sha256
        (base32 "0g57i73lgyvp04cwhwk8bcz10bhp7kslqa1zr2php46njig7fc0n"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pytest python-rich
                             python-typing-extensions))
    (home-page "https://github.com/nicoddemus/pytest-rich")
    (synopsis "Leverage rich for richer test session output")
    (description "Leverage rich for richer test session output.")
    (license license:expat)))

(define-public python-pyctcdecode
  (package
    (name "python-pyctcdecode")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyctcdecode" version))
       (sha256
        (base32 "0b1sa7g5yx6v8f16ccm9pd9qcckmnfq7fglbjda6m89wwh9v7g7k"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-hypothesis python-importlib-metadata
                             python-numpy python-pygtrie))
    (native-inputs (list python-bandit
                         python-black
                         python-codecov
                         python-flake8
                         python-huggingface-hub
                         python-isort
                         python-jupyter
                         python-mypy
                         python-nbconvert
                         python-nbformat
                         python-pydocstyle
                         python-pylint
                         python-pytest
                         python-pytest-cov))
    (home-page "")
    (synopsis "CTC beam search decoder for speech recognition.")
    (description "CTC beam search decoder for speech recognition.")
    (license #f)))

(define-public python-pytest-lazy-fixtures
  (package
    (name "python-pytest-lazy-fixtures")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytest_lazy_fixtures" version))
       (sha256
        (base32 "1v819n9jrgf0rk2fidn6fkdzz68r4jin94lvy9fbb9gf546iymhc"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pytest))
    (home-page "https://github.com/dev-petrov/pytest-lazy-fixtures")
    (synopsis "Allows you to use fixtures in @pytest.mark.parametrize.")
    (description "Allows you to use fixtures in @@pytest.mark.parametrize.")
    (license license:expat)))

(define-public python-neovim
  (package
    (name "python-neovim")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "neovim" version))
       (sha256
        (base32 "03znibklxyyqx2w05l2r8bcff2qp8kzwbifbvpkg8fs3njjyg856"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pynvim))
    (home-page "http://github.com/neovim/python-client")
    (synopsis "Transition packgage for pynvim")
    (description "Transition packgage for pynvim.")
    (license #f)))

(define-public python-pytest-only
  (package
    (name "python-pytest-only")
    (version "2.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytest_only" version))
       (sha256
        (base32 "0a8cmchl4c6ph1r76anwbvd32fxff5fps2v6pkg6dfz3hg0aqhg3"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pytest))
    (home-page "https://github.com/theY4Kman/pytest-only")
    (synopsis "Use @pytest.mark.only to run a single test")
    (description "Use @@pytest.mark.only to run a single test.")
    (license license:expat)))

(define-public python-livemark
  (package
    (name "python-livemark")
    (version "0.110.8")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "livemark" version))
       (sha256
        (base32 "1dznfqb1ycndsi1nd757i7xlr0p3jzrx3a5x20c7pbq7b1k27q46"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-attrs
                             python-cached-property
                             python-deepmerge
                             python-docstring-parser
                             python-frictionless
                             python-gitpython
                             python-giturlparse
                             python-jinja2
                             python-jsonschema
                             python-livereload
                             python-marko
                             python-pyquery
                             python-pyyaml
                             python-typer))
    (native-inputs (list python-black
                         python-ipython
                         python-mypy
                         python-pyflakes
                         python-pylama
                         python-pytest
                         python-pytest-cov
                         python-pytest-only
                         python-pytest-vcr))
    (home-page "https://github.com/frictionlessdata/livemark")
    (synopsis
     "Data presentation framework for Python that generates static sites from extended Markdown with interactive charts, tables, scripts, and other features.")
    (description
     "Data presentation framework for Python that generates static sites from extended
Markdown with interactive charts, tables, scripts, and other features.")
    (license license:expat)))

(define-public python-stringcase
  (package
    (name "python-stringcase")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "stringcase" version))
       (sha256
        (base32 "023hv3gknblhf9lx5kmkcchzmbhkdhmsnknkv7lfy20rcs06k828"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/okunishinishi/python-stringcase")
    (synopsis "String case converter.")
    (description "String case converter.")
    (license license:expat)))

(define-public python-petl
  (package
    (name "python-petl")
    (version "1.7.15")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "petl" version))
       (sha256
        (base32 "0564m3sczhhyhw69h0xx66sy2pb5mfqx6nl674jmalddh21l6ccf"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/petl-developers/petl")
    (synopsis
     "A Python package for extracting, transforming and loading tables of data.")
    (description
     "This package provides a Python package for extracting, transforming and loading
tables of data.")
    (license license:expat)))

(define-public python-objprint
  (package
    (name "python-objprint")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "objprint" version))
       (sha256
        (base32 "0fw6v9a7i2zh2q9vylx3n7iwl30559f2x2f86kkgql9igidavl3k"))))
    (build-system pyproject-build-system)
    (home-page "")
    (synopsis
     "A library that can print Python objects in human readable format")
    (description
     "This package provides a library that can print Python objects in human readable
format.")
    (license #f)))

(define-public python-marko
  (package
    (name "python-marko")
    (version "2.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "marko" version))
       (sha256
        (base32 "04b030vqb27zfl0vg6abjmr2g6g2vkiil6y98ml6wdvrp03005x9"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-objprint python-pygments python-slugify))
    (home-page "https://github.com/frostming/marko")
    (synopsis "A markdown parser with high extensibility.")
    (description
     "This package provides a markdown parser with high extensibility.")
    (license license:expat)))

(define-public python-frictionless
  (package
    (name "python-frictionless")
    (version "5.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "frictionless" version))
       (sha256
        (base32 "0g3dzjpfw1wkggcjgfgcqlzdfl3b94x9vl3j4x35xcgsfvqakr5y"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-attrs
                             python-chardet
                             python-humanize
                             python-isodate
                             python-jinja2
                             python-jsonschema
                             python-marko
                             python-petl
                             python-pydantic
                             python-dateutil
                             python-slugify
                             python-pyyaml
                             python-requests
                             python-rfc3986
                             python-simpleeval
                             python-stringcase
                             python-tabulate
                             python-typer
                             python-typing-extensions
                             python-validators))
    (native-inputs (list python-hatch
                         python-httpx
                         python-ipython
                         python-livemark
                         python-moto
                         python-neovim
                         python-oauth2client
                         python-pyright
                         python-pytest
                         python-pytest-cov
                         python-pytest-dotenv
                         python-pytest-lazy-fixtures
                         python-pytest-mock
                         python-pytest-only
                         python-pytest-timeout
                         python-pytest-vcr
                         python-requests-mock
                         python-ruff
                         python-yattag))
    (home-page #f)
    (synopsis
     "Data management framework for Python that provides functionality to describe, extract, validate, and transform tabular data")
    (description
     "Data management framework for Python that provides functionality to describe,
extract, validate, and transform tabular data.")
    (license #f)))

(define-public python-language-tags
  (package
    (name "python-language-tags")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "language_tags" version))
       (sha256
        (base32 "1rmxz2xzx5nhrzava4cvcyvvg6kshhhs9v03fy35zj1x7sxaqd79"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/OnroerendErfgoed/language-tags")
    (synopsis
     "This project is a Python version of the language-tags Javascript project.")
    (description
     "This project is a Python version of the language-tags Javascript project.")
    (license license:expat)))

(define-public python-csvw
  (package
    (name "python-csvw")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "csvw" version))
       (sha256
        (base32 "1ms0ann9m7bdpn7rav18z3vvmwwlgf76fpnv7a5i60pv4p3w9djr"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-attrs
                             python-babel
                             python-colorama
                             python-isodate
                             python-jsonschema
                             python-language-tags
                             python-dateutil
                             python-rdflib
                             python-requests
                             python-rfc3986
                             python-uritemplate))
    (native-inputs (list python-build
                         python-flake8
                         python-frictionless
                         python-pytest
                         python-pytest-cov
                         python-pytest-mock
                         python-requests-mock
                         python-twine
                         python-wheel))
    (home-page "https://github.com/cldf/csvw")
    (synopsis "Python library to work with CSVW described tabular data")
    (description "Python library to work with CSVW described tabular data.")
    (license license:asl2.0)))

(define-public python-clldutils
  (package
    (name "python-clldutils")
    (version "3.22.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "clldutils" version))
       (sha256
        (base32 "1c87809xvjmc3p3azdzazy4b1fdckv7600cdgxqbymh11r6r3yhf"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-attrs
                             python-bibtexparser
                             python-colorlog
                             python-lxml
                             python-markdown
                             python-markupsafe
                             python-pylatexenc
                             python-dateutil
                             python-tabulate))
    (native-inputs (list python-build
                         python-flake8
                         python-pytest
                         python-pytest-cov
                         python-pytest-mock
                         python-tox
                         python-twine
                         python-wheel))
    (home-page "https://github.com/clld/clldutils")
    (synopsis "Utilities for programmatic data curation")
    (description "Utilities for programmatic data curation.")
    (license license:asl2.0)))

(define-public python-segments
  (package
    (name "python-segments")
    (version "2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "segments" version))
       (sha256
        (base32 "0h97bzcah03mwhidwbxmsrhxjiy7xn4mdm4ashhf890xya4f2nji"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-clldutils python-csvw python-regex))
    (native-inputs (list python-flake8
                         python-pytest
                         python-pytest-cov
                         python-pytest-mock
                         python-twine
                         python-wheel))
    (home-page "https://github.com/cldf/segments")
    (synopsis "")
    (description #f)
    (license license:asl2.0)))

(define-public python-dlinfo
  (package
    (name "python-dlinfo")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "dlinfo" version))
       (sha256
        (base32 "0f5xnip7zv4b8072c2hsqrl61jlgvhvgaz1lpl9gx99sgys46vsz"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/cloudflightio/python-dlinfo")
    (synopsis "Python wrapper for libc's dlinfo and dyld_find on Mac")
    (description "Python wrapper for libc's dlinfo and dyld_find on Mac.")
    (license license:expat)))

(define-public python-phonemizer
  (package
    (name "python-phonemizer")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "phonemizer" version))
       (sha256
        (base32 "031xirpvadq32bqrq2npd7hyqx384pzllrsfl8qv7q7z5q93h32y"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-attrs python-dlinfo python-joblib
                             python-segments python-typing-extensions))
    (native-inputs (list python-coverage python-pytest python-pytest-cov))
    (home-page #f)
    (synopsis "Simple text to phones converter for multiple languages")
    (description "Simple text to phones converter for multiple languages.")
    (license #f)))

(define-public python-kaleido
  (package
    (name "python-kaleido")
    (version "0.2.1.post1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "kaleido" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pathlib))
    (home-page "")
    (synopsis
     "Static image export for web-based visualization libraries with zero dependencies")
    (description
     "Static image export for web-based visualization libraries with zero
dependencies.")
    (license license:expat)))

(define-public python-optuna
  (package
    (name "python-optuna")
    (version "3.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "optuna" version))
       (sha256
        (base32 "1kqy6s7473jz6l9mjh1b55z1yjb5pqpn8gkbabbszfdlaw5m6vhl"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-alembic
                             python-colorlog
                             python-numpy
                             python-packaging
                             python-pyyaml
                             python-sqlalchemy
                             python-tqdm))
    (native-inputs (list python-coverage
                         python-fakeredis
                         python-kaleido
                         python-moto
                         python-pytest
                         python-scipy
                         python-torch))
    (home-page #f)
    (synopsis "A hyperparameter optimization framework")
    (description
     "This package provides a hyperparameter optimization framework.")
    (license #f)))

(define-public python-py3nvml
  (package
    (name "python-py3nvml")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "py3nvml" version))
       (sha256
        (base32 "0wxxky9amy38q7qjsdmmznk1kqdzwd680ps64i76cvlab421vvh9"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-xmltodict))
    (home-page "https://github.com/fbcotter/py3nvml.git")
    (synopsis "Python 3 Bindings for the NVIDIA Management Library")
    (description "Python 3 Bindings for the NVIDIA Management Library.")
    (license license:bsd-3)))

(define-public python-onnxruntime-tools
  (package
    (name "python-onnxruntime-tools")
    (version "1.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "onnxruntime_tools" version))
       (sha256
        (base32 "0vbzjr7m63cpq7qc5qwlcki2lhmwa5yw6mq3s6y6dq14jkjcxgbd"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-coloredlogs
                             python-numpy
                             python-onnx
                             python-packaging
                             python-psutil
                             python-py-cpuinfo
                             python-py3nvml))
    (home-page "https://github.com/microsoft/onnxruntime")
    (synopsis "Transformers Model Optimization Tool of ONNXRuntime")
    (description "Transformers Model Optimization Tool of ONNXRuntime.")
    (license license:expat)))

(define-public python-kagglehub
  (package
    (name "python-kagglehub")
    (version "0.2.9")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "kagglehub" version))
       (sha256
        (base32 "11rnslivhjj3x25hxydkydmi98h5lghglygqkln6244r6k3nc4vn"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-packaging python-requests python-tqdm))
    (home-page #f)
    (synopsis "Access Kaggle resources anywhere")
    (description "Access Kaggle resources anywhere.")
    (license #f)))

(define-public python-keras-nlp
  (package
    (name "python-keras-nlp")
    (version "0.14.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "keras_nlp" version))
       (sha256
        (base32 "0wc7sb8v5g4xdyk4hw3sizx4nql73iwx6hxcf04jzmb0zip8imdb"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py
                             python-kagglehub
                             python-numpy
                             python-packaging
                             python-regex
                             python-rich
                             python-tensorflow-text))
    (home-page "https://github.com/keras-team/keras-nlp")
    (synopsis
     "Industry-strength Natural Language Processing extensions for Keras.")
    (description
     "Industry-strength Natural Language Processing extensions for Keras.")
    (license #f)))

(define-public python-kenlm
  (package
    (name "python-kenlm")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "kenlm" version))
       (sha256
        (base32 "0zxci1g4wa6hf8af84ycq4fqws63rbahzvvp2xm0w59wkp01vp62"))))
    (build-system pyproject-build-system)
    (home-page "")
    (synopsis "")
    (description #f)
    (license #f)))

(define-public python-ipadic
  (package
    (name "python-ipadic")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ipadic" version))
       (sha256
        (base32 "01qwlzlm0ipnfrj3l3b4gcsb2rc6k7c2iv8qmz51l4x6xhqkv4pm"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/polm/ipadic-py")
    (synopsis "IPAdic packaged for Python")
    (description "IPAdic packaged for Python.")
    (license #f)))

(define-public python-fugashi
  (package
    (name "python-fugashi")
    (version "1.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "fugashi" version))
       (sha256
        (base32 "0j07nj5abycgbnx1q9qn8k29h4kbnnm2lm3hfnpl3vi7sasq0jcn"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/polm/fugashi")
    (synopsis
     "A Cython MeCab wrapper for fast, pythonic Japanese tokenization.")
    (description
     "This package provides a Cython @code{MeCab} wrapper for fast, pythonic Japanese
tokenization.")
    (license license:expat)))

(define-public python-tensorflow-text
  (package
    (name "python-tensorflow-text")
    (version "2.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tensorflow-text" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-tensorflow))
    (native-inputs (list python-absl-py python-pytest
                         python-tensorflow-datasets))
    (home-page "http://github.com/tensorflow/text")
    (synopsis
     "TF.Text is a TensorFlow library of text related ops, modules, and subgraphs.")
    (description
     "TF.Text is a @code{TensorFlow} library of text related ops, modules, and
subgraphs.")
    (license license:asl2.0)))

(define-public python-pycnite
  (package
    (name "python-pycnite")
    (version "2024.7.31")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pycnite" version))
       (sha256
        (base32 "0h53vvn55a0gq4wqx9jg693csgc7fsp2zcy3pswj6jpgbb4z29ai"))))
    (build-system pyproject-build-system)
    (home-page #f)
    (synopsis "Python bytecode utilities")
    (description "Python bytecode utilities.")
    (license license:asl2.0)))

(define-public python-importlab
  (package
    (name "python-importlab")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "importlab" version))
       (sha256
        (base32 "0r8ldrapgb9sc6rz2rjbdgb5vsc7cw7b9hq9lmyh5sznn59ki2dk"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-networkx))
    (home-page "https://github.com/google/importlab")
    (synopsis "A library to calculate python dependency graphs.")
    (description
     "This package provides a library to calculate python dependency graphs.")
    (license license:asl2.0)))

(define-public python-pytype
  (package
    (name "python-pytype")
    (version "2024.4.11")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytype" version))
       (sha256
        (base32 "108hi3lg2sb63ryzm6nypylv9ghprmyc8mqq5xzc1n42whfga59k"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-attrs
                             python-immutabledict
                             python-importlab
                             python-jinja2
                             python-libcst
                             python-msgspec
                             python-networkx
                             python-ninja
                             python-pycnite
                             python-pydot
                             python-tabulate
                             python-toml
                             python-typing-extensions))
    (home-page "https://google.github.io/pytype")
    (synopsis "Python type inferencer")
    (description "Python type inferencer.")
    (license license:asl2.0)))

(define-public python-pytest-custom-exit-code
  (package
    (name "python-pytest-custom-exit-code")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytest-custom-exit-code" version))
       (sha256
        (base32 "0da64hqa8fhf6gpjc8rswcbjfj02znjv5pg2889crpf1w87gzzsi"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pytest))
    (home-page "https://github.com/yashtodi94/pytest-custom_exit_code")
    (synopsis
     "Exit pytest test session with custom exit code in different scenarios")
    (description
     "Exit pytest test session with custom exit code in different scenarios.")
    (license license:expat)))

(define-public python-treescope
  (package
    (name "python-treescope")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "treescope" version))
       (sha256
        (base32 "11lcz0h6jwfcbssaaj7al3d43kwgr70x25a3ykfdppw411w3ajrf"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py
                             python-ipython
                             python-jax
                             python-jupyter
                             python-matplotlib
                             python-myst-nb
                             python-myst-parser
                             python-numpy
                             python-palettable
                             python-pandas
                             python-penzai
                             python-plotly
                             python-pyink
                             python-pylint
                             python-pytest
                             python-sphinx
                             python-sphinx-book-theme
                             python-sphinx-hoverxref
                             python-sphinx-contributors
                             python-sphinxcontrib-katex
                             python-torch))
    (home-page #f)
    (synopsis
     "Treescope: An interactive HTML pretty-printer for ML research in IPython notebooks.")
    (description
     "Treescope: An interactive HTML pretty-printer for ML research in IPython
notebooks.")
    (license #f)))

(define-public python-sphinxcontrib-jquery
  (package
    (name "python-sphinxcontrib-jquery")
    (version "4.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinxcontrib-jquery" version))
       (sha256
        (base32 "0ymw7a9nahq7xn69dw8v6l3zvcj9zlnil4qskxvjqsp30jgp680n"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-sphinx))
    (home-page "")
    (synopsis "Extension to include jQuery on newer Sphinx releases")
    (description
     "Extension to include @code{jQuery} on newer Sphinx releases.")
    (license #f)))

(define-public python-sphinx-version-warning
  (package
    (name "python-sphinx-version-warning")
    (version "1.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinx-version-warning" version))
       (sha256
        (base32 "0ifra6b0qi1yzd26j50704h5fxnd5q4xp8ibnhpf6fg7sdpr494r"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-sphinx))
    (home-page "https://github.com/humitos/sphinx-version-warning")
    (synopsis "Sphinx extension to add a warning banner")
    (description "Sphinx extension to add a warning banner.")
    (license #f)))

(define-public python-sphinx-hoverxref
  (package
    (name "python-sphinx-hoverxref")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinx_hoverxref" version))
       (sha256
        (base32 "0mkbp48lln45njhx0rcjaa142a0p4afazh42y0ayv1ra2ydshvhz"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-sphinx
                             python-sphinx-autoapi
                             python-sphinx-autobuild
                             python-sphinx-notfound-page
                             python-sphinx-prompt
                             python-sphinx-rtd-theme
                             python-sphinx-tabs
                             python-sphinx-version-warning
                             python-sphinxcontrib-bibtex
                             python-sphinxcontrib-jquery
                             python-sphinxemoji
                             python-tox))
    (home-page #f)
    (synopsis
     "Sphinx extension to show tooltips with content embedded when hover a reference.")
    (description
     "Sphinx extension to show tooltips with content embedded when hover a reference.")
    (license #f)))

(define-public python-penzai
  (package
    (name "python-penzai")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "penzai" version))
       (sha256
        (base32 "1qgsr4a9qd43qbnnqb643wjq8pcg28xwvs507v956nnzvzs4nam4"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py
                             python-flax
                             python-ipython
                             python-jax
                             python-jupyter
                             python-matplotlib
                             python-myst-nb
                             python-myst-parser
                             python-numpy
                             python-optax
                             python-orbax-checkpoint
                             python-ordered-set
                             python-palettable
                             python-pyink
                             python-pylint
                             python-pytest
                             python-sphinx
                             python-sphinx-book-theme
                             python-sphinx-collections
                             python-sphinx-hoverxref
                             python-sphinx-contributors
                             python-sphinxcontrib-katex
                             python-torch
                             python-transformers
                             python-treescope
                             python-typing-extensions))
    (home-page #f)
    (synopsis
     "Penzai: A JAX research toolkit for building, editing, and visualizing neural networks.")
    (description
     "Penzai: A JAX research toolkit for building, editing, and visualizing neural
networks.")
    (license #f)))

(define-public python-jraph
  (package
    (name "python-jraph")
    (version "0.0.6.dev0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "jraph" version))
       (sha256
        (base32 "1f6q1lnc5n0dp0qyl0axhazl3slm5lqvrs37sfv4wd2b485kmb63"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-jax python-jaxlib python-numpy))
    (home-page "https://github.com/deepmind/jraph")
    (synopsis "Jraph: A library for Graph Neural Networks in Jax")
    (description "Jraph: A library for Graph Neural Networks in Jax.")
    (license license:asl2.0)))

(define-public python-clu
  (package
    (name "python-clu")
    (version "0.0.12")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "clu" version))
       (sha256
        (base32 "1r1wpdw8c4racw33dbnwqg0xb2pb3xzblmwjf3vmf3ykzcdal7pp"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py
                             python-etils
                             ; python-flax ; cycle
                             python-jax
                             python-jaxlib
                             python-ml-collections
                             python-numpy
                             python-packaging
                             python-typing-extensions
                             python-wrapt))
    (native-inputs (list python-pytest python-tensorflow
                         python-tensorflow-datasets python-torch))
    (home-page "http://github.com/google/CommonLoopUtils")
    (synopsis "Set of libraries for ML training loops in JAX.")
    (description "Set of libraries for ML training loops in JAX.")
    (license license:asl2.0)))

(define-public python-tensorstore
  (package
    (name "python-tensorstore")
    (version "0.1.64")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tensorstore" version))
       (sha256
        (base32 "11lqjj04wnm735c5c9hkkvn87yx64rrz7wslziz3gdbghy89xa3z"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-ml-dtypes python-numpy))
    (home-page "https://github.com/google/tensorstore")
    (synopsis "Read and write large, multi-dimensional arrays")
    (description "Read and write large, multi-dimensional arrays.")
    (license #f)))

(define-public python-orbax-checkpoint
  (package
    (name "python-orbax-checkpoint")
    (version "0.5.23")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "orbax_checkpoint" version))
       (sha256
        (base32 "0nb0hif34nf6lld1lhz1ikbr8q4l4yaw4zzr5bdc7r14p4sqsli2"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py
                             python-etils
                             python-flax
                             python-google-cloud-logging
                             python-jax
                             python-jaxlib
                             python-mock
                             python-msgpack
                             python-nest-asyncio
                             python-numpy
                             python-protobuf
                             python-pytest
                             python-pytest-xdist
                             python-pyyaml
                             python-tensorstore
                             python-typing-extensions))
    (home-page #f)
    (synopsis "Orbax Checkpoint")
    (description "Orbax Checkpoint.")
    (license #f)))

(define-public python-tensorflow-io
  (package
    (name "python-tensorflow-io")
    (version "0.37.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tensorflow-io" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-tensorflow-io-gcs-filesystem))
    (home-page "https://github.com/tensorflow/io")
    (synopsis "TensorFlow IO")
    (description "@code{TensorFlow} IO.")
    (license #f)))

(define-public python-pycocotools
  (package
    (name "python-pycocotools")
    (version "2.0.8")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pycocotools" version))
       (sha256
        (base32 "13gv3lg042jy43myld1brgfdjajvxg2gk01ng8v6r8kbg3dwwawg"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-matplotlib python-numpy))
    (home-page "https://github.com/ppwwyyxx/cocoapi")
    (synopsis "Official APIs for the MS-COCO dataset")
    (description "Official APIs for the MS-COCO dataset.")
    (license #f)))

(define-public python-pretty-midi
  (package
    (name "python-pretty-midi")
    (version "0.2.10")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pretty_midi" version))
       (sha256
        (base32 "1g9l8l6zzv89n73jlc10wcldz39i2psa2vik6gl78ih4jhpijvpa"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-mido python-numpy python-six))
    (home-page "https://github.com/craffel/pretty-midi")
    (synopsis "Functions and classes for handling MIDI data conveniently.")
    (description
     "This package provides functions and classes for handling MIDI data conveniently.")
    (license license:expat)))

(define-public python-jsonable
  (package
    (name "python-jsonable")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "jsonable" version))
       (sha256
        (base32 "1r5f5q23ii6b84v9pxk6hizang26yp8w6y46a5cgl6aqirp6fyqk"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/halfak/JSONable-data-types")
    (synopsis
     "An abstract class that supports jsonserialization/deserialization.")
    (description
     "An abstract class that supports jsonserialization/deserialization.")
    (license license:expat)))

(define-public python-mwtypes
  (package
    (name "python-mwtypes")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "mwtypes" version))
       (sha256
        (base32 "0vwmmpwhq8mpw6zdkrwv4qwcfssz2ldbvjrppw4c1vgn9x90c1ry"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-jsonable))
    (home-page "https://github.com/mediawiki-utilities/python-mwtypes")
    (synopsis "A set of types for processing MediaWiki data.")
    (description
     "This package provides a set of types for processing @code{MediaWiki} data.")
    (license license:expat)))

(define-public python-para
  (package
    (name "python-para")
    (version "0.0.8")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "para" version))
       (sha256
        (base32 "05zjzr6bm5sm4nv40pv4v2z048l92b8ws27xdj49vsnqx4m27hs6"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/halfak/para")
    (synopsis
     "a set utilities that ake advantage of python's 'multiprocessing' module to distribute CPU-intensive tasks")
    (description
     "a set utilities that ake advantage of python's multiprocessing module to
distribute CPU-intensive tasks.")
    (license license:expat)))

(define-public python-mwcli
  (package
    (name "python-mwcli")
    (version "0.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "mwcli" version))
       (sha256
        (base32 "180rhw2sqvljwfhchwq7xi2mydgx4lgdjx32khf75d8nzz81ncq0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-docopt python-mwxml python-para))
    (home-page "https://github.com/mediawiki-utilities/python-mwcli")
    (synopsis "Utilities for processing MediaWiki on the command line.")
    (description
     "Utilities for processing @code{MediaWiki} on the command line.")
    (license license:expat)))

(define-public python-mwxml
  (package
    (name "python-mwxml")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "mwxml" version))
       (sha256
        (base32 "1vkm4ysx9hw13wxjn6dw3l3vjx5qj79ykggg35s4lw3hyx2zfdvs"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-jsonschema python-mwcli python-mwtypes
                             python-para))
    (home-page "https://github.com/mediawiki-utilities/python-mwxml")
    (synopsis "A set of utilities for processing MediaWiki XML dump data.")
    (description
     "This package provides a set of utilities for processing @code{MediaWiki} XML
dump data.")
    (license license:expat)))

(define-public python-gcld3
  (package
    (name "python-gcld3")
    (version "3.0.13")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "gcld3" version))
       (sha256
        (base32 "0ng9aawyhnchi065pd8wr2p65hvdambx632baqw2ldz7pxwwgj27"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/google/cld3")
    (synopsis "CLD3 is a neural network model for language identification.")
    (description "CLD3 is a neural network model for language identification.")
    (license #f)))

(define-public python-dm-env
  (package
    (name "python-dm-env")
    (version "1.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "dm-env" version))
       (sha256
        (base32 "1plk7pzzrd3yz5izzkhga45i99xy33icw5m5hv4y0facclffndm4"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py python-dm-tree python-numpy))
    (home-page "")
    (synopsis "A Python interface for Reinforcement Learning environments.")
    (description
     "This package provides a Python interface for Reinforcement Learning
environments.")
    (license license:asl2.0)))

(define-public python-envlogger
  (package
    (name "python-envlogger")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "envlogger" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py python-dm-env python-numpy
                             python-protobuf)) ; FIXME it had some other dep
    (home-page "")
    (synopsis "EnvLogger: A tool for recording trajectories.")
    (description "@code{EnvLogger}: A tool for recording trajectories.")
    (license license:asl2.0)))

(define-public python-conllu
  (package
    (name "python-conllu")
    (version "5.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "conllu" version))
       (sha256
        (base32 "0ssb90l9dwjg2pzs1bxjbljkb0grrhim7c4a0q88kiakb1bigr0w"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-tox))
    (home-page #f)
    (synopsis
     "CoNLL-U Parser parses a CoNLL-U formatted string into a nested python dictionary")
    (description
     "@code{CoNLL-U} Parser parses a @code{CoNLL-U} formatted string into a nested
python dictionary.")
    (license #f)))

(define-public python-timeloop
  (package
    (name "python-timeloop")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "timeloop" version))
       (sha256
        (base32 "04waqkn9pgdvrwqfc9qglwc6hhlj0x9f54fvgppdrjkbzrknqwaf"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/sankalpjonn/timeloop")
    (synopsis "An elegant way to run period tasks.")
    (description "An elegant way to run period tasks.")
    (license license:expat)))

(define-public python-tf2onnx
  (package
    (name "python-tf2onnx")
    (version "1.16.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tf2onnx" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-flatbuffers
                             python-numpy
                             python-onnx
                             python-protobuf
                             python-requests
                             python-six))
    (home-page "https://github.com/onnx/tensorflow-onnx")
    (synopsis "Tensorflow to ONNX converter")
    (description "Tensorflow to ONNX converter.")
    (license #f)))

(define-public python-grpcio-health-checking
  (package
    (name "python-grpcio-health-checking")
    (version "1.65.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "grpcio_health_checking" version))
       (sha256
        (base32 "1cjq3f69pvd5g5vi24ipp36pf8d4k9gz8llzvzsn2jj1pphkzl4y"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-grpcio python-protobuf))
    (home-page "https://grpc.io")
    (synopsis "Standard Health Checking Service for gRPC")
    (description "Standard Health Checking Service for @code{gRPC}.")
    (license #f)))

(define-public python-authlib
  (package
    (name "python-authlib")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "authlib" version))
       (sha256
        (base32 "05w9lpkvgyqmz8cp99s25ak4z9pxz68xpjb3ppgc1i867kq47s3s"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-cryptography))
    (home-page #f)
    (synopsis
     "The ultimate Python library in building OAuth and OpenID Connect servers and clients.")
    (description
     "The ultimate Python library in building OAuth and @code{OpenID} Connect servers
and clients.")
    (license #f)))

(define-public python-weaviate-client
  (package
    (name "python-weaviate-client")
    (version "4.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "weaviate_client" version))
       (sha256
        (base32 "0c5g60x45jwb0s9gb9qhvnhwil04s2ajwdwpnzsjygb1ad7ar6dg"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-authlib
                             python-grpcio
                             python-grpcio-health-checking
                             python-grpcio-tools
                             python-httpx
                             python-pydantic
                             python-requests
                             python-validators))
    (home-page "https://github.com/weaviate/weaviate-python-client")
    (synopsis "A python native Weaviate client")
    (description "This package provides a python native Weaviate client.")
    (license #f)))

(define-public python-onnxruntime-gpu
  (package
    (name "python-onnxruntime-gpu")
    (version "1.19.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "onnxruntime-gpu" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-coloredlogs
                             python-flatbuffers
                             python-numpy
                             python-packaging
                             python-protobuf
                             python-sympy))
    (home-page "https://onnxruntime.ai")
    (synopsis
     "ONNX Runtime is a runtime accelerator for Machine Learning models")
    (description
     "ONNX Runtime is a runtime accelerator for Machine Learning models.")
    (license license:expat)))

(define-public python-fastembed-gpu
  (package
    (name "python-fastembed-gpu")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "fastembed_gpu" version))
       (sha256
        (base32 "10dcljn2i77ladimsfsvb315cq0lyx7g2fpbfndlvga60f3wbw2f"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-huggingface-hub
                             python-loguru
                             python-mmh3
                             python-numpy
                             python-onnxruntime-gpu
                             python-pillow
                             python-pystemmer
                             python-requests
                             python-snowballstemmer
                             python-tokenizers
                             python-tqdm))
    (home-page "https://github.com/qdrant/fastembed")
    (synopsis
     "Fast, light, accurate library built for retrieval embedding generation")
    (description
     "Fast, light, accurate library built for retrieval embedding generation.")
    (license #f)))

(define-public python-pystemmer
  (package
    (name "python-pystemmer")
    (version "2.2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "PyStemmer" version))
       (sha256
        (base32 "0yy6ii23x68g5m2bwc9l1yw3shl4v3phmgv833f4jsyh3rpkcfwz"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/snowballstem/pystemmer/")
    (synopsis "Snowball stemming algorithms, for information retrieval")
    (description "Snowball stemming algorithms, for information retrieval.")
    (license #f)))

(define-public python-mmh3
  (package
    (name "python-mmh3")
    (version "4.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "mmh3" version))
       (sha256
        (base32 "0jnawqn2s5xnldibgz51a0l7vx3hc56hjjj6vafj5kcsics2bkx1"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-mypy python-pytest))
    (home-page "")
    (synopsis
     "Python extension for MurmurHash (MurmurHash3), a set of fast and robust hash functions.")
    (description
     "Python extension for @code{MurmurHash} (@code{MurmurHash3}), a set of fast and
robust hash functions.")
    (license #f)))

(define-public python-fastembed
  (package
    (name "python-fastembed")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "fastembed" version))
       (sha256
        (base32 "1wwq158600fkmf6kplahbj191i52pn2yn5jq1xmnsxy65rlkgbdq"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-huggingface-hub
                             python-loguru
                             python-mmh3
                             python-numpy
                             python-onnx
                             python-onnxruntime
                             python-pillow
                             python-pystemmer
                             python-requests
                             python-snowballstemmer
                             python-tokenizers
                             python-tqdm))
    (home-page "https://github.com/qdrant/fastembed")
    (synopsis
     "Fast, light, accurate library built for retrieval embedding generation")
    (description
     "Fast, light, accurate library built for retrieval embedding generation.")
    (license #f)))

(define-public python-qdrant-client
  (package
    (name "python-qdrant-client")
    (version "1.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "qdrant_client" version))
       (sha256
        (base32 "0n449fv5laad4zyx3n2sg75br1nzx43wc89avq6fxlfgjrx4s7bw"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-fastembed
                             python-fastembed-gpu
                             python-grpcio
                             python-grpcio-tools
                             python-httpx
                             python-numpy
                             python-portalocker
                             python-pydantic
                             python-urllib3))
    (home-page "https://github.com/qdrant/qdrant-client")
    (synopsis "Client library for the Qdrant vector search engine")
    (description "Client library for the Qdrant vector search engine.")
    (license #f)))

(define-public python-async-property
  (package
    (name "python-async-property")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "async_property" version))
       (sha256
        (base32 "1033a3q4zp1l745b61n8km71gixmckglj9frfmd929vylrnbvn8p"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/ryananguiano/async_property")
    (synopsis "Python decorator for async properties.")
    (description "Python decorator for async properties.")
    (license license:expat)))

(define-public python-keycloak
  (package
    (name "python-keycloak")
    (version "4.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "python_keycloak" version))
       (sha256
        (base32 "1kn9q17v53svq5gbz5kq80mf8dff20ynxlifkinxgw3rgppcx1y1"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-async-property
                             python-deprecation
                             python-httpx
                             python-jwcrypto
                             python-requests
                             python-requests-toolbelt))
    (home-page #f)
    (synopsis
     "python-keycloak is a Python package providing access to the Keycloak API.")
    (description
     "python-keycloak is a Python package providing access to the Keycloak API.")
    (license license:expat)))

(define-public python-arango
  (package
    (name "python-arango")
    (version "8.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "python_arango" version))
       (sha256
        (base32 "0haks3cimxcvijsf7012jz96jbd39rln6zjp5d04gs5z8hangsm4"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-black
                             python-flake8
                             python-importlib-metadata
                             python-isort
                             python-mock
                             python-mypy
                             python-packaging
                             python-pre-commit
                             python-pyjwt
                             python-pytest
                             python-pytest-cov
                             python-requests
                             python-requests-toolbelt
                             python-sphinx
                             python-sphinx-rtd-theme
                             python-types-requests
                             python-types-setuptools
                             python-urllib3)) ; FIXME it had some other dep
    (home-page #f)
    (synopsis "Python Driver for ArangoDB")
    (description "Python Driver for @code{ArangoDB}.")
    (license #f)))

(define-public python-pymssql
  (package
    (name "python-pymssql")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pymssql" version))
       (sha256
        (base32 "1axbnhy738dsxphgz30f6jvzdmgr92kdxppi91qx2qc0army8d7h"))))
    (build-system pyproject-build-system)
    (home-page #f)
    (synopsis
     "DB-API interface to Microsoft SQL Server for Python. (new Cython-based version)")
    (description
     "DB-API interface to Microsoft SQL Server for Python. (new Cython-based version).")
    (license #f)))

(define-public python-events
  (package
    (name "python-events")
    (version "0.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "Events" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (home-page "http://github.com/pyeve/events")
    (synopsis "Bringing the elegance of C# EventHandler to Python")
    (description "Bringing the elegance of C# @code{EventHandler} to Python.")
    (license license:bsd-3)))

(define-public python-opensearch-py
  (package
    (name "python-opensearch-py")
    (version "2.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "opensearch_py" version))
       (sha256
        (base32 "15ms4daqwga14l1nvjh24nkqdwb1c5xr41l4anckrh44xpl2fz0b"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-certifi
                             python-events
                             python-dateutil
                             python-requests
                             python-six
                             python-urllib3))
    (native-inputs (list python-black
                         python-botocore
                         python-coverage
                         python-jinja2
                         python-mock
                         python-myst-parser
                         python-pytest
                         python-pytest-cov
                         python-pytest-mock
                         python-pytz
                         python-pyyaml
                         python-requests
                         python-sphinx
                         python-sphinx-copybutton
                         python-sphinx-rtd-theme))
    (home-page "https://github.com/opensearch-project/opensearch-py")
    (synopsis "Python client for OpenSearch")
    (description "Python client for @code{OpenSearch}.")
    (license #f)))

(define-public python-neo4j
  (package
    (name "python-neo4j")
    (version "5.23.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "neo4j" version))
       (sha256
        (base32 "1816dg9545i46rnr9ygyzzhqdq1shfcxlpjxna4r8c9426fkklz2"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pytz))
    (home-page #f)
    (synopsis "Neo4j Bolt driver for Python")
    (description "Neo4j Bolt driver for Python.")
    (license license:asl2.0)))

(define-public python-nats-py
  (package
    (name "python-nats-py")
    (version "2.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "nats_py" version))
       (sha256
        (base32 "0i3wb808h3plyph7plms4725dk16qnbdvp39nj83pnqisyndr679"))))
    (build-system pyproject-build-system)
    (home-page #f)
    (synopsis "NATS client for Python")
    (description "NATS client for Python.")
    (license #f)))

(define-public python-randomize
  (package
    (name "python-randomize")
    (version "0.14")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "randomize" version))
       (sha256
        (base32 "0srvk1rvlppvhpzj7p2dims1nx8hlycrqad0j748d5wgxlsp95zy"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/nloadholtes/nose-randomize")
    (synopsis
     "Randomize the order of the tests within a unittest.TestCase class")
    (description
     "Randomize the order of the tests within a unittest.@code{TestCase} class.")
    (license license:lgpl2.0)))

(define-public python-reactivex
  (package
    (name "python-reactivex")
    (version "4.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "reactivex" version))
       (sha256
        (base32 "1s041rjqmiyqr4qrjvzj06isg3wczr9scj43vxv93ar221cyc4p9"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-typing-extensions))
    (home-page "http://reactivex.io")
    (synopsis "ReactiveX (Rx) for Python")
    (description "@code{ReactiveX} (Rx) for Python.")
    (license license:expat)))

(define-public python-influxdb-client
  (package
    (name "python-influxdb-client")
    (version "1.45.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "influxdb_client" version))
       (sha256
        (base32 "1gm2d6bdf3d25jj3h17p998cmd9z32l4yr9c72r8g17m72la0jp2"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-certifi python-dateutil python-reactivex
                             python-urllib3)) ; FIXME it had some other dep
    (native-inputs (list python-aioresponses
                         python-coverage
                         python-flake8
                         python-httpretty
                         python-jinja2
                         python-nose
                         python-pluggy
                         python-psutil
                         python-py
                         python-pytest
                         python-pytest-cov
                         python-pytest-timeout
                         python-randomize
                         python-sphinx
                         python-sphinx-rtd-theme))
    (home-page "https://github.com/influxdata/influxdb-client-python")
    (synopsis "InfluxDB 2.0 Python client library")
    (description "@code{InfluxDB} 2.0 Python client library.")
    (license #f)))

(define-public python-nose-cov
  (package
    (name "python-nose-cov")
    (version "1.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "nose-cov" version))
       (sha256
        (base32 "04j4fw01bv648gimqqj4z88606lcczbm1k326agcc74gb4sh7v4b"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-cov-core python-nose))
    (home-page "http://bitbucket.org/memedough/nose-cov/overview")
    (synopsis
     "nose plugin for coverage reporting, including subprocesses and multiprocessing")
    (description
     "nose plugin for coverage reporting, including subprocesses and multiprocessing.")
    (license license:expat)))

(define-public python-influxdb
  (package
    (name "python-influxdb")
    (version "5.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "influxdb" version))
       (sha256
        (base32 "0w49230p935a90593jbv8qam9fzvrjs2xqdfx63ds4ip0kv4gijq"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-msgpack python-dateutil python-pytz
                             python-requests python-six))
    (native-inputs (list python-mock python-nose python-nose-cov
                         python-requests-mock))
    (home-page "https://github.com/influxdb/influxdb-python")
    (synopsis "InfluxDB client")
    (description "@code{InfluxDB} client.")
    (license license:expat)))

(define-public python-ibm-db
  (package
    (name "python-ibm-db")
    (version "3.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ibm_db" version))
       (sha256
        (base32 "0ylmf8y36a50c176yr52dhzqmrxylh2pni30kkbpwhs9d0j7aw7c"))))
    (build-system pyproject-build-system)
    (home-page "http://pypi.python.org/pypi/ibm_db/")
    (synopsis "Python DBI driver for DB2 (LUW, zOS, i5) and IDS")
    (description "Python DBI driver for DB2 (LUW, @code{zOS}, i5) and IDS.")
    (license #f)))

(define-public python-ibm-db-sa
  (package
    (name "python-ibm-db-sa")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ibm_db_sa" version))
       (sha256
        (base32 "1b21aglmd6jg1fvkkshyyy1n5d0jr8dlxkr5154lc5k8lcqg2vd4"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-ibm-db python-sqlalchemy))
    (home-page "http://pypi.python.org/pypi/ibm_db_sa/")
    (synopsis "SQLAlchemy support for IBM Data Servers")
    (description "SQLAlchemy support for IBM Data Servers.")
    (license #f)))

(define-public python-clickhouse-driver
  (package
    (name "python-clickhouse-driver")
    (version "0.2.9")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "clickhouse-driver" version))
       (sha256
        (base32 "11wzw7wqbcylgjbws78rx2r4ghy1bnbawzwync83k6dd1s3s83h5"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pytz python-tzlocal))
    (home-page "https://github.com/mymarilyn/clickhouse-driver")
    (synopsis "Python driver with native interface for ClickHouse")
    (description "Python driver with native interface for @code{ClickHouse}.")
    (license license:expat)))

(define-public python-posthog
  (package
    (name "python-posthog")
    (version "3.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "posthog" version))
       (sha256
        (base32 "1vzjbqj8jfknn8x16fhinxirym57hfdi18j2qp0d0547dqn3nzlg"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-backoff python-monotonic python-dateutil
                             python-requests python-six))
    (native-inputs (list python-black
                         python-coverage
                         python-flake8
                         python-flake8-print
                         python-freezegun
                         python-isort
                         python-mock
                         python-pre-commit
                         python-pylint
                         python-pytest
                         python-pytest-timeout))
    (home-page "https://github.com/posthog/posthog-python")
    (synopsis "Integrate PostHog into any python application.")
    (description "Integrate @code{PostHog} into any python application.")
    (license license:expat)))

(define-public python-opentelemetry-proto
  (package
    (name "python-opentelemetry-proto")
    (version "1.26.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "opentelemetry_proto" version))
       (sha256
        (base32 "07nwjcnqbb1j8i44p4i20h6fjdaqhm9yx3drqcgpbcyaq2b8ghf5"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-protobuf))
    (home-page #f)
    (synopsis "OpenTelemetry Python Proto")
    (description "@code{OpenTelemetry} Python Proto.")
    (license #f)))

(define-public python-opentelemetry-exporter-otlp-proto-common
  (package
    (name "python-opentelemetry-exporter-otlp-proto-common")
    (version "1.26.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "opentelemetry_exporter_otlp_proto_common" version))
       (sha256
        (base32 "14jc606v3i548ix76y2rb8p8hn6xmbpsd2qcman7271awbi51gmx"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-opentelemetry-proto))
    (home-page #f)
    (synopsis "OpenTelemetry Protobuf encoding")
    (description "@code{OpenTelemetry} Protobuf encoding.")
    (license #f)))

(define-public python-opentelemetry-exporter-otlp-proto-grpc
  (package
    (name "python-opentelemetry-exporter-otlp-proto-grpc")
    (version "1.26.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "opentelemetry_exporter_otlp_proto_grpc" version))
       (sha256
        (base32 "1bnq0swrwlkxa3r69i19vcf8rs5g4675c53183na2sxhlslnfnx6"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-deprecated
                             python-googleapis-common-protos
                             python-grpcio
                             python-opentelemetry-api
                             python-opentelemetry-exporter-otlp-proto-common
                             python-opentelemetry-proto
                             python-opentelemetry-sdk))
    (home-page #f)
    (synopsis "OpenTelemetry Collector Protobuf over gRPC Exporter")
    (description
     "@code{OpenTelemetry} Collector Protobuf over @code{gRPC} Exporter.")
    (license #f)))

(define-public python-chromadb-client
  (package
    (name "python-chromadb-client")
    (version "0.5.6.dev0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "chromadb_client" version))
       (sha256
        (base32 "06zkl79j9plvxj411cb88q95n2csj9apg63020jr7aps2k4wg14p"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-httpx
                             python-numpy
                             python-opentelemetry-api
                             python-opentelemetry-exporter-otlp-proto-grpc
                             python-opentelemetry-sdk
                             python-orjson
                             python-overrides
                             python-posthog
                             python-pydantic
                             python-pyyaml
                             python-tenacity
                             python-typing-extensions))
    (home-page #f)
    (synopsis "Chroma Client.")
    (description "Chroma Client.")
    (license #f)))

(define-public python-cassandra-driver
  (package
    (name "python-cassandra-driver")
    (version "3.29.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "cassandra-driver" version))
       (sha256
        (base32 "1rfga4mg72ygzxfv6p9bjiij3zxfrigjv18z7yq4nrm9yaic5s9q"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-geomet))
    (home-page "http://github.com/datastax/python-driver")
    (synopsis "DataStax Driver for Apache Cassandra")
    (description "@code{DataStax} Driver for Apache Cassandra.")
    (license #f)))

(define-public python-azure-cosmos
  (package
    (name "python-azure-cosmos")
    (version "4.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "azure-cosmos" version))
       (sha256
        (base32 "0hd2k6p4iqr3n46ac34b52yp61jrjd5pr5g8l8166r9l641i9mvj"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-azure-core python-typing-extensions))
    (home-page "https://github.com/Azure/azure-sdk-for-python")
    (synopsis "Microsoft Azure Cosmos Client Library for Python")
    (description "Microsoft Azure Cosmos Client Library for Python.")
    (license license:expat)))

(define-public python-testcontainers
  (package
    (name "python-testcontainers")
    (version "4.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "testcontainers" version))
       (sha256
        (base32 "1ma238h3jf971r283662dd8sdmlxw61czl3b1r7q9546jfskn5an"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-azure-cosmos
                             python-azure-storage-blob
                             python-bcrypt
                             python-boto3
                             python-cassandra-driver
                             python-chromadb-client
                             python-clickhouse-driver
                             python-cryptography
                             python-docker
                             python-google-cloud-datastore
                             python-google-cloud-pubsub
                             python-httpx
                             python-ibm-db-sa
                             python-influxdb
                             python-influxdb-client
                             python-kubernetes
                             python-minio
                             python-nats-py
                             python-neo4j
                             python-opensearch-py
                             python-oracledb
                             python-pika
                             python-pymongo
                             python-pymssql
                             python-pymysql
                             python-arango
                             python-keycloak
                             python-pyyaml
                             python-qdrant-client
                             python-redis
                             python-selenium
                             python-sqlalchemy
                             python-trino
                             python-typing-extensions
                             python-urllib3
                             python-weaviate-client
                             python-wrapt))
    (home-page #f)
    (synopsis
     "Python library for throwaway instances of anything that can run in a Docker container")
    (description
     "Python library for throwaway instances of anything that can run in a Docker
container.")
    (license #f)))

(define-public python-tensorflow-serving-api
  (package
    (name "python-tensorflow-serving-api")
    (version "2.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tensorflow-serving-api" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-grpcio python-protobuf python-tensorflow))
    (home-page "http://tensorflow.org/serving")
    (synopsis "TensorFlow Serving Python API.")
    (description "@code{TensorFlow} Serving Python API.")
    (license license:asl2.0)))

(define-public python-google-api-python-client
  (package
    (name "python-google-api-python-client")
    (version "2.141.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_api_python_client" version))
       (sha256
        (base32 "0fjnyvnxizb1im3y10cf2f0rmnnnyllqgx00lk1gi9nm8lgmn8hg"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core python-google-auth
                             python-google-auth-httplib2 python-httplib2
                             python-uritemplate))
    (home-page "https://github.com/googleapis/google-api-python-client/")
    (synopsis "Google API Client Library for Python")
    (description "Google API Client Library for Python.")
    (license license:asl2.0)))

(define-public python-tfx-bsl
  (package
    (name "python-tfx-bsl")
    (version "1.15.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tfx-bsl" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py
                             python-apache-beam
                             python-google-api-python-client
                             python-numpy
                             python-pandas
                             python-protobuf
                             python-pyarrow
                             python-tensorflow
                             python-tensorflow-metadata
                             python-tensorflow-serving-api))
    (home-page "https://www.tensorflow.org/tfx")
    (synopsis
     "tfx_bsl (TFX Basic Shared Libraries) contains libraries shared by many TFX (TensorFlow eXtended) libraries and components.")
    (description
     "tfx_bsl (TFX Basic Shared Libraries) contains libraries shared by many TFX
(@code{TensorFlow} @code{eXtended}) libraries and components.")
    (license license:asl2.0)))

(define-public python-tensorflow-transform
  (package
    (name "python-tensorflow-transform")
    (version "1.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tensorflow-transform" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py
                             python-apache-beam
                             python-numpy
                             python-protobuf
                             python-pyarrow
                             python-pydot
                             python-tensorflow
                             python-tensorflow-metadata
                             python-tfx-bsl))
    (home-page "https://www.tensorflow.org/tfx/transform/get_started")
    (synopsis "A library for data preprocessing with TensorFlow")
    (description
     "This package provides a library for data preprocessing with @code{TensorFlow}.")
    (license license:asl2.0)))

(define-public python-tensorflow-hub
  (package
    (name "python-tensorflow-hub")
    (version "0.16.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tensorflow-hub" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy python-protobuf python-tf-keras))
    (home-page "https://github.com/tensorflow/hub")
    (synopsis
     "TensorFlow Hub is a library to foster the publication, discovery, and consumption of reusable parts of machine learning models.")
    (description
     "@code{TensorFlow} Hub is a library to foster the publication, discovery, and
consumption of reusable parts of machine learning models.")
    (license license:asl2.0)))

(define-public python-onnxconverter-common
  (package
    (name "python-onnxconverter-common")
    (version "1.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "onnxconverter-common" version))
       (sha256
        (base32 "0jh1kmi8si5yc4wq5y2qxlilqqyms2z63ary5idmqchmplli8hvf"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy python-onnx python-packaging
                             python-protobuf))
    (home-page "https://github.com/microsoft/onnxconverter-common")
    (synopsis "ONNX Converter and Optimization Tools")
    (description "ONNX Converter and Optimization Tools.")
    (license #f)))

(define-public python-skl2onnx
  (package
    (name "python-skl2onnx")
    (version "1.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "skl2onnx" version))
       (sha256
        (base32 "00v4n0rqlrbgirq3xm00yw4vc5d8lpwzzk4lh3v8kx3hwj2dq9vi"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-onnx python-onnxconverter-common
                             python-scikit-learn))
    (home-page "https://github.com/onnx/sklearn-onnx")
    (synopsis "Convert scikit-learn models to ONNX")
    (description "Convert scikit-learn models to ONNX.")
    (license #f)))

(define-public python-sentence-transformers
  (package
    (name "python-sentence-transformers")
    (version "3.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sentence_transformers" version))
       (sha256
        (base32 "1xmzbyrlp6wa7adf42n67c544db17nz95b10ri603lf4gi9jqgca"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-huggingface-hub
                             python-numpy
                             python-pillow
                             python-scikit-learn
                             python-scipy
                             python-torch
                             python-tqdm
                             python-transformers))
    (native-inputs (list python-accelerate python-datasets python-pre-commit
                         python-pytest python-ruff))
    (home-page "https://www.SBERT.net")
    (synopsis "Multilingual text embeddings")
    (description "Multilingual text embeddings.")
    (license #f)))

(define-public python-onnxruntime
  (package
    (name "python-onnxruntime")
    (version "1.19.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "onnxruntime" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-coloredlogs
                             python-flatbuffers
                             python-numpy
                             python-packaging
                             python-protobuf
                             python-sympy))
    (home-page "https://onnxruntime.ai")
    (synopsis
     "ONNX Runtime is a runtime accelerator for Machine Learning models")
    (description
     "ONNX Runtime is a runtime accelerator for Machine Learning models.")
    (license license:expat)))

(define-public python-lexid
  (package
    (name "python-lexid")
    (version "2021.1006")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "lexid" version))
       (sha256
        (base32 "1rdgig13llvl0g9y1h5p7x3yc9bcqsj1hfr05grdplr6r563m6jh"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-typing))
    (home-page "https://github.com/mbarkhau/lexid")
    (synopsis "Variable width build numbers with lexical ordering.")
    (description "Variable width build numbers with lexical ordering.")
    (license license:expat)))

(define-public python-bumpver
  (package
    (name "python-bumpver")
    (version "2023.1129")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "bumpver" version))
       (sha256
        (base32 "042hw4iif3l0yyyj9i18x0sh3mpbi2d4ybc8pzmf4anrcqq8229a"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-click ; FIXME it had some other dep
                             python-colorama
                             python-enum34
                             python-lexid
                             python-looseversion
                             python-pathlib2
                             python-toml
                             python-typing))
    (home-page "https://github.com/mbarkhau/bumpver")
    (synopsis "Bump version numbers in project files.")
    (description "Bump version numbers in project files.")
    (license license:expat)))

(define-public python-objsize
  (package
    (name "python-objsize")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "objsize" version))
       (sha256
        (base32 "0aa7rb0xyf74d8cgsl5z3jz5w1lv7xsvb528m2mkr0218cmbnsyn"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-black
                         python-bumpver
                         python-coveralls
                         python-flake8
                         python-isort
                         python-mypy
                         python-pip-tools
                         python-pylint
                         python-pytest
                         python-pytest-cov
                         python-pyyaml))
    (home-page "")
    (synopsis
     "Traversal over Python's objects subtree and calculate the total size of the subtree in bytes (deep size).")
    (description
     "Traversal over Python's objects subtree and calculate the total size of the
subtree in bytes (deep size).")
    (license #f)))

(define-public python-needle
  (package
    (name "python-needle")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "needle" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-nose python-pillow python-selenium))
    (home-page "https://github.com/python-needle/needle")
    (synopsis "Automated testing for your CSS.")
    (description "Automated testing for your CSS.")
    (license #f)))

(define-public python-hdfs
  (package
    (name "python-hdfs")
    (version "2.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "hdfs" version))
       (sha256
        (base32 "0y843invdvs7j9xaawwc20w0hjdsaks76z398g77s6c27zj22akm"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-docopt python-requests python-six))
    (home-page "https://hdfscli.readthedocs.io")
    (synopsis "HdfsCLI: API and command line interface for HDFS.")
    (description "@code{HdfsCLI}: API and command line interface for HDFS.")
    (license license:expat)))

(define-public python-google-cloud-vision
  (package
    (name "python-google-cloud-vision")
    (version "3.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_cloud_vision" version))
       (sha256
        (base32 "16frm9qvc02xwjfzss4ls3xjagvp59lx5lw2fhfs71y55l57zdl0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core python-google-auth
                             python-proto-plus python-protobuf))
    (home-page
     "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-vision")
    (synopsis "Google Cloud Vision API client library")
    (description "Google Cloud Vision API client library.")
    (license license:asl2.0)))

(define-public python-google-cloud-videointelligence
  (package
    (name "python-google-cloud-videointelligence")
    (version "2.13.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_cloud_videointelligence" version))
       (sha256
        (base32 "18zq7dy4sd80bzhy584ixmdam3888swkfqy4mvy4llmm1x67g73j"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core python-google-auth
                             python-proto-plus python-protobuf))
    (home-page
     "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-videointelligence")
    (synopsis "Google Cloud Videointelligence API client library")
    (description "Google Cloud Videointelligence API client library.")
    (license license:asl2.0)))

(define-public python-grpc-interceptor
  (package
    (name "python-grpc-interceptor")
    (version "0.15.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "grpc-interceptor" version))
       (sha256
        (base32 "09h9zfxjx3fflxxypp0gmz32pc698wi66dy66wpk6vwbnnyc0i8z"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-grpcio python-protobuf))
    (home-page "https://github.com/d5h-foss/grpc-interceptor")
    (synopsis "Simplifies gRPC interceptors")
    (description "Simplifies @code{gRPC} interceptors.")
    (license license:expat)))

(define-public python-google-cloud-spanner
  (package
    (name "python-google-cloud-spanner")
    (version "3.48.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_cloud_spanner" version))
       (sha256
        (base32 "0nb3z3jv000f18gbg61ifncg5qq6f5bshp87kg0x76m2ld5j42wd"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core
                             python-google-cloud-core
                             python-grpc-google-iam-v1
                             python-grpc-interceptor
                             python-proto-plus
                             python-protobuf
                             python-sqlparse))
    (home-page "https://github.com/googleapis/python-spanner")
    (synopsis "Google Cloud Spanner API client library")
    (description "Google Cloud Spanner API client library.")
    (license license:asl2.0)))

(define-public python-google-cloud-recommendations-ai
  (package
    (name "python-google-cloud-recommendations-ai")
    (version "0.10.12")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_cloud_recommendations_ai" version))
       (sha256
        (base32 "0pf8j8m41wq11g39xyaf2vwjkzjdwqy5lg2f5i79hqfa43mn6d79"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core python-google-auth
                             python-proto-plus python-protobuf))
    (home-page
     "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-recommendations-ai")
    (synopsis "Google Cloud Recommendations Ai API client library")
    (description "Google Cloud Recommendations Ai API client library.")
    (license license:asl2.0)))

(define-public python-overrides
  (package
    (name "python-overrides")
    (version "7.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "overrides" version))
       (sha256
        (base32 "02l2j5pnsxn0q5i63is5g6i3q06ri83nf7lv55swr61vv6iqy5am"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-typing))
    (home-page "https://github.com/mkorpela/overrides")
    (synopsis
     "A decorator to automatically detect mismatch when overriding a method.")
    (description
     "This package provides a decorator to automatically detect mismatch when
overriding a method.")
    (license license:asl2.0)))

(define-public python-google-cloud-pubsublite
  (package
    (name "python-google-cloud-pubsublite")
    (version "1.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_cloud_pubsublite" version))
       (sha256
        (base32 "0zmqsx6nz1b4dckspbfnmrfymyww0k2wxq7fsr4nshp64ql4pl7a"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core python-google-cloud-pubsub
                             python-grpcio python-grpcio-status
                             python-overrides))
    (home-page "https://github.com/googleapis/python-pubsublite")
    (synopsis "Google Cloud Pubsublite API client library")
    (description "Google Cloud Pubsublite API client library.")
    (license license:asl2.0)))

(define-public python-google-cloud-language
  (package
    (name "python-google-cloud-language")
    (version "2.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_cloud_language" version))
       (sha256
        (base32 "1a8pjmhvz8lz5lvxajq2vlqlrdnbqnf346pm9sypmgls46ifgr85"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core python-google-auth
                             python-proto-plus python-protobuf))
    (home-page
     "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-language")
    (synopsis "Google Cloud Language API client library")
    (description "Google Cloud Language API client library.")
    (license license:asl2.0)))

(define-public python-google-cloud-dlp
  (package
    (name "python-google-cloud-dlp")
    (version "3.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_cloud_dlp" version))
       (sha256
        (base32 "18mx2kpv6r22xassk3jda86h4974vya2m9ribxk0wv8q800kxd2w"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core python-google-auth
                             python-proto-plus python-protobuf))
    (home-page
     "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-dlp")
    (synopsis "Google Cloud Dlp API client library")
    (description "Google Cloud Dlp API client library.")
    (license license:asl2.0)))

(define-public python-google-cloud-datastore
  (package
    (name "python-google-cloud-datastore")
    (version "2.20.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_cloud_datastore" version))
       (sha256
        (base32 "1flvgn5g0vsr7w6f2yfzkbcw7m05gbfkzyj5bxb7q235i2f0p587"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core python-google-auth
                             python-google-cloud-core python-proto-plus
                             python-protobuf))
    (home-page "https://github.com/googleapis/python-datastore")
    (synopsis "Google Cloud Datastore API client library")
    (description "Google Cloud Datastore API client library.")
    (license license:asl2.0)))

(define-public python-google-cloud-dataproc
  (package
    (name "python-google-cloud-dataproc")
    (version "5.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_cloud_dataproc" version))
       (sha256
        (base32 "0w8pc8glw971krzvs45fi6fwy48ccs51kky5lxcdzd55s7nk4dva"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core python-google-auth
                             python-grpc-google-iam-v1 python-proto-plus
                             python-protobuf))
    (home-page
     "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-dataproc")
    (synopsis "Google Cloud Dataproc API client library")
    (description "Google Cloud Dataproc API client library.")
    (license license:asl2.0)))

(define-public python-xgboost-ray
  (package
    (name "python-xgboost-ray")
    (version "0.1.19")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "xgboost_ray" version))
       (sha256
        (base32 "1l1n4a9924g1mi14gl5w34zfrdlv2a0ih5l6h0hc58fs28bndqq3"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy
                             python-packaging
                             python-pandas
                             python-ray
                             python-wrapt
                             python-xgboost))
    (home-page "https://github.com/ray-project/xgboost_ray")
    (synopsis "A Ray backend for distributed XGBoost")
    (description
     "This package provides a Ray backend for distributed XGBoost.")
    (license license:asl2.0)))

(define-public python-gviz-api
  (package
    (name "python-gviz-api")
    (version "1.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "gviz_api" version))
       (sha256
        (base32 "140vwz12cjsbmxv6a3090p6f2d6rkdc433mi67y28cn7ikfr4rl4"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-six))
    (home-page "https://github.com/google/google-visualization-python")
    (synopsis "Python API for Google Visualization")
    (description "Python API for Google Visualization.")
    (license license:asl2.0)))

(define-public python-tensorboard-plugin-profile
  (package
    (name "python-tensorboard-plugin-profile")
    (version "2.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tensorboard_plugin_profile" version))
       (sha256
        (base32 "1vaqxw4cdsw6c2kjdz655y3vnpdb0kz3zd1gpc33djj1kyp4xfx7"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-gviz-api python-protobuf ; FIXME it had some other dep
                             python-six python-werkzeug))
    (home-page "https://github.com/tensorflow/profiler")
    (synopsis "Profile Tensorboard Plugin")
    (description "Profile Tensorboard Plugin.")
    (license license:asl2.0)))

(define-public python-opentelemetry-resourcedetector-gcp
  (package
    (name "python-opentelemetry-resourcedetector-gcp")
    (version "1.6.0a0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "opentelemetry-resourcedetector-gcp" version))
       (sha256
        (base32 "033062kayx56wzc0blrqbx2p39lzc2wsn7yfy1d4f0w3v3padlhw"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-opentelemetry-api python-opentelemetry-sdk
                             python-requests python-typing-extensions))
    (home-page
     "https://github.com/GoogleCloudPlatform/opentelemetry-operations-python/tree/main/opentelemetry-resourcedetector-gcp")
    (synopsis "Google Cloud resource detector for OpenTelemetry")
    (description "Google Cloud resource detector for @code{OpenTelemetry}.")
    (license #f)))

(define-public python-opentelemetry-exporter-gcp-trace
  (package
    (name "python-opentelemetry-exporter-gcp-trace")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "opentelemetry-exporter-gcp-trace" version))
       (sha256
        (base32 "0yijfhchi90h74ndhsp2n04sxb8k8a7x0f9v0xfr8kj3nbd8afc6"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-cloud-trace
                             python-opentelemetry-api
                             python-opentelemetry-resourcedetector-gcp
                             python-opentelemetry-sdk))
    (home-page
     "https://github.com/GoogleCloudPlatform/opentelemetry-operations-python/tree/main/opentelemetry-exporter-gcp-trace")
    (synopsis "Google Cloud Trace exporter for OpenTelemetry")
    (description "Google Cloud Trace exporter for @code{OpenTelemetry}.")
    (license #f)))

(define-public python-respx
  (package
    (name "python-respx")
    (version "0.21.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "respx" version))
       (sha256
        (base32 "1bz8gqqg1vviblycc5szk230gwsc49hww8qjm9n10lmapwhzxmqb"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-httpx))
    (home-page "https://lundberg.github.io/respx/")
    (synopsis
     "A utility for mocking out the Python HTTPX and HTTP Core libraries.")
    (description
     "This package provides a utility for mocking out the Python HTTPX and HTTP Core
libraries.")
    (license #f)))

(define-public python-pytest-recording
  (package
    (name "python-pytest-recording")
    (version "0.13.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytest_recording" version))
       (sha256
        (base32 "0xs828g70ahlqf0y7n8pdh69lxy14ws74nyngx2q2rj6pfmkn300"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pytest python-vcrpy))
    (native-inputs (list python-pytest-httpbin python-pytest-mock
                         python-requests python-werkzeug))
    (home-page #f)
    (synopsis
     "A pytest plugin that allows you recording of network interactions via VCR.py")
    (description
     "This package provides a pytest plugin that allows you recording of network
interactions via VCR.py.")
    (license #f)))

(define-public python-langchain-openai
  (package
    (name "python-langchain-openai")
    (version "0.1.22")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "langchain_openai" version))
       (sha256
        (base32 "0jz4glx9dyagimp7ymwvhw79b015pwmpjancn3ir7a1hy8rk3y8c"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-langchain-core python-openai
                             python-tiktoken))
    (home-page "https://github.com/langchain-ai/langchain")
    (synopsis "An integration package connecting OpenAI and LangChain")
    (description
     "An integration package connecting @code{OpenAI} and @code{LangChain}.")
    (license license:expat)))

(define-public python-langchain-community
  (package
    (name "python-langchain-community")
    (version "0.2.12")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "langchain_community" version))
       (sha256
        (base32 "0zlc7g30b0jijr4lpz2n1afi0kqns0hb96p5l94mzdpklk3cywfn"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-aiohttp
                             python-dataclasses-json
                             python-langchain
                             python-langchain-core
                             python-langsmith
                             python-numpy
                             python-pyyaml
                             python-requests
                             python-sqlalchemy
                             python-tenacity))
    (home-page "https://github.com/langchain-ai/langchain")
    (synopsis "Community contributed LangChain integrations.")
    (description "Community contributed @code{LangChain} integrations.")
    (license license:expat)))

(define-public python-opentelemetry-instrumentation
  (package
    (name "python-opentelemetry-instrumentation")
    (version "0.47b0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "opentelemetry_instrumentation" version))
       (sha256
        (base32 "03rmga00zg1b755dg7qcj7m0lqmz5rgi8csgdbqy6d8c8mg8iycn"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-opentelemetry-api ; FIXME it had some other dep
                             python-wrapt))
    (home-page #f)
    (synopsis
     "Instrumentation Tools & Auto Instrumentation for OpenTelemetry Python")
    (description
     "Instrumentation Tools & Auto Instrumentation for @code{OpenTelemetry} Python.")
    (license #f)))

(define-public python-openinference-semantic-conventions
  (package
    (name "python-openinference-semantic-conventions")
    (version "0.1.10")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "openinference_semantic_conventions" version))
       (sha256
        (base32 "1709x8xa4br530nl5pqfhz2yyrp64r01z2il074qx63kp6x9irlq"))))
    (build-system pyproject-build-system)
    (home-page #f)
    (synopsis "OpenInference Semantic Conventions")
    (description "@code{OpenInference} Semantic Conventions.")
    (license #f)))

(define-public python-openinference-instrumentation
  (package
    (name "python-openinference-instrumentation")
    (version "0.1.15")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "openinference_instrumentation" version))
       (sha256
        (base32 "1a2bf5yy7b1byz155s0x4s59iyznjy03368skygc9c9466bg7wyk"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-openinference-semantic-conventions
                             python-opentelemetry-api))
    (native-inputs (list python-opentelemetry-sdk))
    (home-page #f)
    (synopsis "OpenInference instrumentation utilities")
    (description "@code{OpenInference} instrumentation utilities.")
    (license #f)))

(define-public python-openinference-instrumentation-langchain
  (package
    (name "python-openinference-instrumentation-langchain")
    (version "0.1.27")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "openinference_instrumentation_langchain" version))
       (sha256
        (base32 "16fp8f3s6qmn8s7c2na70cbbv639sc9xj67y921j61xrj8278zab"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-openinference-instrumentation
                             python-openinference-semantic-conventions
                             python-opentelemetry-api
                             python-opentelemetry-instrumentation
                             python-opentelemetry-semantic-conventions
                             python-wrapt))
    (native-inputs (list python-langchain
                         python-langchain-community
                         python-langchain-core
                         python-langchain-openai
                         python-opentelemetry-sdk
                         python-pytest-recording
                         python-respx))
    (home-page #f)
    (synopsis "OpenInference LangChain Instrumentation")
    (description "@code{OpenInference} @code{LangChain} Instrumentation.")
    (license #f)))

(define-public python-opentelemetry-semantic-conventions
  (package
    (name "python-opentelemetry-semantic-conventions")
    (version "0.47b0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "opentelemetry_semantic_conventions" version))
       (sha256
        (base32 "0ziak5kjy6rc3c07a0iywnn1vp6sjxmf43ai9pymyjg3pfcpkmd8"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-deprecated python-opentelemetry-api))
    (home-page #f)
    (synopsis "OpenTelemetry Semantic Conventions")
    (description "@code{OpenTelemetry} Semantic Conventions.")
    (license #f)))

(define-public python-opentelemetry-sdk
  (package
    (name "python-opentelemetry-sdk")
    (version "1.26.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "opentelemetry_sdk" version))
       (sha256
        (base32 "119gl1pxm97wrrnshmdx1pqb2krgkrljsmh5bi9ijml0z1l2h3f9"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-opentelemetry-api
                             python-opentelemetry-semantic-conventions
                             python-typing-extensions))
    (home-page #f)
    (synopsis "OpenTelemetry Python SDK")
    (description "@code{OpenTelemetry} Python SDK.")
    (license #f)))

(define-public python-databricks-connect
  (package
    (name "python-databricks-connect")
    (version "15.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "databricks-connect" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-databricks-sdk
                             python-googleapis-common-protos
                             python-grpcio
                             python-grpcio-status
                             python-numpy
                             python-packaging
                             python-pandas
                             python-py4j
                             python-pyarrow
                             python-six)) ; FIXME it had some other dep
    (home-page #f)
    (synopsis "Databricks Connect Client")
    (description "Databricks Connect Client.")
    (license #f)))

(define-public python-databricks-sdk
  (package
    (name "python-databricks-sdk")
    (version "0.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "databricks_sdk" version))
       (sha256
        (base32 "08bvappf96j2jzvjaqin10ssd17lsp54zfnfnvfdn2fs74ls3irp"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-auth python-requests))
    (native-inputs (list python-autoflake
                         python-databricks-connect
                         python-ipython
                         python-ipywidgets
                         python-isort
                         python-pycodestyle
                         python-pyfakefs
                         python-pytest
                         python-pytest-cov
                         python-pytest-mock
                         python-pytest-rerunfailures
                         python-pytest-xdist
                         python-requests-mock
                         python-wheel
                         python-yapf))
    (home-page "https://databricks-sdk-py.readthedocs.io")
    (synopsis "Databricks SDK for Python (Beta)")
    (description "Databricks SDK for Python (Beta).")
    (license #f)))

(define-public python-mlflow-skinny
  (package
    (name "python-mlflow-skinny")
    (version "2.15.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "mlflow_skinny" version))
       (sha256
        (base32 "01rr83w6m8vnv1dfjp2yxhzj0d16l1954vxh2z2xz2zwgxsljbrh"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-cachetools
                             python-click
                             python-cloudpickle
                             python-databricks-sdk
                             python-entrypoints
                             python-gitpython
                             python-importlib-metadata
                             python-opentelemetry-api
                             python-opentelemetry-sdk
                             python-packaging
                             python-protobuf
                             python-pytz
                             python-pyyaml
                             python-requests
                             python-sqlparse))
    (home-page #f)
    (synopsis
     "MLflow is an open source platform for the complete machine learning lifecycle")
    (description
     "MLflow is an open source platform for the complete machine learning lifecycle.")
    (license #f)))

(define-public python-mlflow
  (package
    (name "python-mlflow")
    (version "2.15.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "mlflow" version))
       (sha256
        (base32 "1gqih0rn1ylbkbfpjcc9kqvazkabyi3lajk1sj9fkp6f8zsi7nl8"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-alembic
                             python-docker
                             python-flask
                             python-graphene
                             python-gunicorn
                             python-jinja2
                             python-markdown
                             python-matplotlib
                             python-mlflow-skinny
                             python-numpy
                             python-pandas
                             python-pyarrow
                             python-querystring-parser
                             python-scikit-learn
                             python-scipy
                             python-sqlalchemy
                             python-waitress))
    (home-page #f)
    (synopsis
     "MLflow is an open source platform for the complete machine learning lifecycle")
    (description
     "MLflow is an open source platform for the complete machine learning lifecycle.")
    (license #f)))

(define-public python-lime
  (package
    (name "python-lime")
    (version "0.2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "lime" version))
       (sha256
        (base32 "10gpawd3scqa9fc6aqmcbgr66yy8mwxkh8jhkgl57ssz0m7hx5kn"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-matplotlib
                             python-numpy
                             python-scikit-image
                             python-scikit-learn
                             python-scipy
                             python-tqdm))
    (native-inputs (list python-flake8 python-pytest))
    (home-page "http://github.com/marcotcr/lime")
    (synopsis
     "Local Interpretable Model-Agnostic Explanations for machine learning classifiers")
    (description
     "Local Interpretable Model-Agnostic Explanations for machine learning
classifiers.")
    (license license:bsd-3)))

(define-public python-tf-keras
  (package
    (name "python-tf-keras")
    (version "2.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tf_keras" version))
       (sha256
        (base32 "03jn336v4kwlgk2xdnh6qbs0jfrlxqz0zs57lmr0znihv8c7ragx"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-tensorflow))
    (home-page "https://keras.io/")
    (synopsis "Deep learning for humans.")
    (description "Deep learning for humans.")
    (license license:asl2.0)))

(define-public python-pyod
  (package
    (name "python-pyod")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyod" version))
       (sha256
        (base32 "1ch4dgbip4xf2y82mxwnvhdd49czzl1bmm3ym9cis5nmscrk7hlg"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-joblib
                             python-matplotlib
                             python-numba
                             python-numpy
                             python-scikit-learn
                             python-scipy))
    (home-page "https://github.com/yzhao062/pyod")
    (synopsis
     "A Comprehensive and Scalable Python Library for Outlier Detection (Anomaly Detection)")
    (description
     "This package provides a Comprehensive and Scalable Python Library for Outlier
Detection (Anomaly Detection).")
    (license #f)))

(define-public python-opencv-python
  (package
    (name "python-opencv-python")
    (version "4.10.0.84")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "opencv-python" version))
       (sha256
        (base32 "09im5x3iffrhvj0jvwafk43av26lcddsx74fxbzmi5ifb3j39lkj"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy))
    (home-page "https://github.com/opencv/opencv-python")
    (synopsis "Wrapper package for OpenCV python bindings.")
    (description "Wrapper package for @code{OpenCV} python bindings.")
    (license license:asl2.0)))

(define-public python-nlp
  (package
    (name "python-nlp")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "nlp" version))
       (sha256
        (base32 "1m3rpx8gmcjvnphi22612zbiqa30hcjizmwb4kkjnbgwdybbr9ha"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-dataclasses
                             python-dill
                             python-filelock
                             python-numpy
                             python-pandas
                             python-pyarrow
                             python-requests
                             python-tqdm
                             python-xxhash))
    (native-inputs (list python-absl-py
                         python-apache-beam
                         python-black
                         python-bs4
                         python-elasticsearch
                         python-faiss-cpu
                         python-flake8
                         python-isort
                         python-langdetect
                         python-mwparserfromhell
                         python-nltk
                         python-pytest
                         python-pytest-xdist
                         python-tensorflow
                         python-tldextract
                         python-torch
                         python-zstandard))
    (home-page "https://github.com/huggingface/nlp")
    (synopsis "HuggingFace/NLP is an open library of NLP datasets.")
    (description "@code{HuggingFace/NLP} is an open library of NLP datasets.")
    (license license:asl2.0)))

(define-public python-ngboost
  (package
    (name "python-ngboost")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ngboost" version))
       (sha256
        (base32 "03zb2678i56v7989qb46fykas5x7c74b72scmhdi7jyz9lygd0m5"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-lifelines python-numpy python-scikit-learn
                             python-scipy python-tqdm))
    (home-page "https://github.com/stanfordmlgroup/ngboost")
    (synopsis "Library for probabilistic predictions via gradient boosting.")
    (description
     "Library for probabilistic predictions via gradient boosting.")
    (license #f)))

(define-public python-gpboost
  (package
    (name "python-gpboost")
    (version "1.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "gpboost" version))
       (sha256
        (base32 "15cbvi1rf5j4hsvn6hghx50w1wmnq7ylkvx0w84kvbiaarhhsimq"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy python-pandas python-scikit-learn
                             python-scipy python-wheel))
    (home-page "https://github.com/fabsig/GPBoost")
    (synopsis "GPBoost Python Package")
    (description "GPBoost Python Package.")
    (license #f)))

(define-public python-catboost
  (package
    (name "python-catboost")
    (version "1.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "catboost" version))
       (sha256
        (base32 "17xsbj2hnyvxg8mban63414r2cs537plwgc6nnd4x52mz981dhqj"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-graphviz
                             python-matplotlib
                             python-numpy
                             python-pandas
                             python-plotly
                             python-scipy
                             python-six))
    (home-page "https://catboost.ai")
    (synopsis "CatBoost Python Package")
    (description "@code{CatBoost} Python Package.")
    (license license:asl2.0)))

(define-public python-slicer
  (package
    (name "python-slicer")
    (version "0.0.8")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "slicer" version))
       (sha256
        (base32 "1dvf9mncymizbjar6ifgdwaz5ilprwzcrbzlap9w5h7hffpm6x9f"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/interpretml/slicer")
    (synopsis "A small package for big slicing.")
    (description "This package provides a small package for big slicing.")
    (license #f)))

(define-public python-shap
  (package
    (name "python-shap")
    (version "0.46.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "shap" version))
       (sha256
        (base32 "1805bglpn4d3k2c1yr8yvfskjhr6zpv41s8mh0s5iag5ic4mpamx"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-cloudpickle
                             python-numba
                             python-numpy
                             python-packaging
                             python-pandas
                             python-scikit-learn
                             python-scipy
                             python-slicer
                             python-tqdm))
    (native-inputs (list python-catboost
                         python-datasets
                         python-gpboost
                         python-jupyter
                         python-keras
                         python-lightgbm
                         python-nbconvert
                         python-nbformat
                         python-ngboost
                         python-nlp
                         python-opencv-python
                         python-protobuf
                         python-pyod
                         python-pyspark
                         python-pytest
                         python-pytest-cov
                         python-pytest-mpl
                         python-sentencepiece
                         python-tensorflow
                         python-tf-keras
                         python-torch
                         python-torchvision
                         python-transformers
                         python-xgboost))
    (home-page #f)
    (synopsis
     "A unified approach to explain the output of any machine learning model.")
    (description
     "This package provides a unified approach to explain the output of any machine
learning model.")
    (license license:expat)))

(define-public python-saliency
  (package
    (name "python-saliency")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "saliency" version))
       (sha256
        (base32 "0qwcn747hcqp5frm3zwy05hs0dhc2apjjrpl1di8kkm3jd1zd8vr"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy python-scikit-image))
    (home-page "https://github.com/pair-code/saliency")
    (synopsis "Framework-agnostic saliency methods")
    (description "Framework-agnostic saliency methods.")
    (license license:asl2.0)))

(define-public python-google-cloud-translate
  (package
    (name "python-google-cloud-translate")
    (version "3.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_cloud_translate" version))
       (sha256
        (base32 "1vv9fhl4wng24h3dqcdlaabwr943l0mh2l7954r0gspnqiadk5q7"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core
                             python-google-auth
                             python-google-cloud-core
                             python-grpc-google-iam-v1
                             python-proto-plus
                             python-protobuf))
    (home-page
     "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-translate")
    (synopsis "Google Cloud Translate API client library")
    (description "Google Cloud Translate API client library.")
    (license license:asl2.0)))

(define-public python-lit-nlp
  (package
    (name "python-lit-nlp")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "lit_nlp" version))
       (sha256
        (base32 "0jy3qvzpw4bmlyssy8f4y2ahqpzzzh8f59gj485q8k8scb68nqvs"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py
                             python-annoy
                             python-attrs
                             python-etils
                             python-filelock
                             python-google-cloud-translate
                             python-ipython
                             python-levenshtein
                             python-matplotlib
                             python-ml-collections
                             python-numpy
                             python-pandas
                             python-pillow
                             python-portpicker
                             python-requests
                             python-rouge-score
                             python-sacrebleu
                             python-saliency
                             python-scikit-learn
                             python-scipy
                             python-shap
                             python-six
                             python-termcolor
                             python-tqdm
                             python-umap-learn
                             python-werkzeug))
    (native-inputs (list python-lime python-pytest))
    (home-page #f)
    (synopsis "ð¥LIT: The Learning Interpretability Tool")
    (description "ð¥LIT: The Learning Interpretability Tool.")
    (license #f)))

(define-public python-anthropic
  (package
    (name "python-anthropic")
    (version "0.34.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "anthropic" version))
       (sha256
        (base32 "03v8wjg7j8m4jazy2v8gx2wikwdc5dz8z99015pybfzwgk3nq3c2"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-anyio
                             python-cached-property
                             python-distro
                             python-httpx
                             python-jiter
                             python-pydantic
                             python-sniffio
                             python-tokenizers
                             python-typing-extensions))
    (home-page #f)
    (synopsis "The official Python library for the anthropic API")
    (description "The official Python library for the anthropic API.")
    (license #f)))

(define-public python-langchain-google-vertexai
  (package
    (name "python-langchain-google-vertexai")
    (version "1.0.8")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "langchain_google_vertexai" version))
       (sha256
        (base32 "1hrzggj6b9jwrnqnqcxdw02srvzrfi9w4znrfnkx0b5fm6n2hnyv"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-anthropic python-google-cloud-aiplatform
                             python-google-cloud-storage python-langchain-core))
    (home-page "https://github.com/langchain-ai/langchain-google")
    (synopsis
     "An integration package connecting Google VertexAI and LangChain")
    (description
     "An integration package connecting Google @code{VertexAI} and @code{LangChain}.")
    (license license:expat)))

(define-public python-langchain-text-splitters
  (package
    (name "python-langchain-text-splitters")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "langchain_text_splitters" version))
       (sha256
        (base32 "0h310ww45ymrbi2h0dh8aaapwmanmgg2a1ggh2q6zyhr17hmvr51"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-langchain-core))
    (home-page "https://github.com/langchain-ai/langchain")
    (synopsis "LangChain text splitting utilities")
    (description "@code{LangChain} text splitting utilities.")
    (license license:expat)))

(define-public python-langsmith
  (package
    (name "python-langsmith")
    (version "0.1.99")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "langsmith" version))
       (sha256
        (base32 "1wfamzzsw0nwjckiznaqnwl4m2w4xs0m0i2a19h63nmbb3qs3imm"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-orjson python-pydantic python-requests))
    (home-page "https://smith.langchain.com/")
    (synopsis
     "Client library to connect to the LangSmith LLM Tracing and Evaluation Platform.")
    (description
     "Client library to connect to the @code{LangSmith} LLM Tracing and Evaluation
Platform.")
    (license license:expat)))

(define-public python-langchain-core
  (package
    (name "python-langchain-core")
    (version "0.2.33")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "langchain_core" version))
       (sha256
        (base32 "0xd9rlv90rn9l89lq8fxcx5nyjm1kacby1q145xriz30lph5j9nx"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-jsonpatch
                             python-langsmith
                             python-packaging
                             python-pydantic
                             python-pyyaml
                             python-tenacity
                             python-typing-extensions))
    (home-page "https://github.com/langchain-ai/langchain")
    (synopsis "Building applications with LLMs through composability")
    (description "Building applications with LLMs through composability.")
    (license license:expat)))

(define-public python-langchain
  (package
    (name "python-langchain")
    (version "0.2.14")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "langchain" version))
       (sha256
        (base32 "1qpg9w5gviz1d3d3jy7ii1ghbg9f6fw9mhs3s2sly1c2i2jsaanw"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-aiohttp
                             python-async-timeout
                             python-langchain-core
                             python-langchain-text-splitters
                             python-langsmith
                             python-numpy
                             python-pydantic
                             python-pyyaml
                             python-requests
                             python-sqlalchemy
                             python-tenacity))
    (home-page "https://github.com/langchain-ai/langchain")
    (synopsis "Building applications with LLMs through composability")
    (description "Building applications with LLMs through composability.")
    (license license:expat)))

(define-public python-kubernetes
  (package
    (name "python-kubernetes")
    (version "30.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "kubernetes" version))
       (sha256
        (base32 "1g4fx6cb8sczmgh89mnahzbxsab2iimd0fsf65n7m3pjz5xcgr21"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-certifi
                             python-google-auth
                             python-oauthlib
                             python-dateutil
                             python-pyyaml
                             python-requests
                             python-requests-oauthlib
                             python-six
                             python-urllib3
                             python-websocket-client))
    (home-page "https://github.com/kubernetes-client/python")
    (synopsis "Kubernetes python client")
    (description "Kubernetes python client.")
    (license #f)))

(define-public python-kfp-server-api
  (package
    (name "python-kfp-server-api")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "kfp-server-api" version))
       (sha256
        (base32 "0s9v8ggq4knrmmkags09pgga77xp9qqg2iviqi1bxj2ykjlca426"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-certifi python-dateutil python-six
                             python-urllib3))
    (home-page "https://github.com/kubeflow/pipelines")
    (synopsis "Kubeflow Pipelines API")
    (description "Kubeflow Pipelines API.")
    (license license:asl2.0)))

(define-public python-kfp-pipeline-spec
  (package
    (name "python-kfp-pipeline-spec")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "kfp-pipeline-spec" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-protobuf))
    (home-page "https://github.com/kubeflow/pipelines")
    (synopsis "Kubeflow Pipelines pipeline spec")
    (description "Kubeflow Pipelines pipeline spec.")
    (license license:asl2.0)))

(define-public python-kfp
  (package
    (name "python-kfp")
    (version "2.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "kfp" version))
       (sha256
        (base32 "1kim89kfddhispwxw0gjavn1zs9jljaiq8yhdj63305yxi75ib86"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-click
                             python-docstring-parser
                             python-google-api-core
                             python-google-auth
                             python-google-cloud-storage
                             python-kfp-pipeline-spec
                             python-kfp-server-api
                             python-kubernetes
                             python-protobuf
                             python-pyyaml
                             python-requests-toolbelt
                             python-tabulate
                             python-urllib3))
    (home-page "https://github.com/kubeflow/pipelines")
    (synopsis "Kubeflow Pipelines SDK")
    (description "Kubeflow Pipelines SDK.")
    (license #f)))

(define-public python-grpcio-testing
  (package
    (name "python-grpcio-testing")
    (version "1.65.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "grpcio_testing" version))
       (sha256
        (base32 "08pf5grllr0qxlngkpfgskjy262g0f87jlcnw36b3k6390kr7ssd"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-grpcio python-protobuf))
    (home-page "https://grpc.io")
    (synopsis "Testing utilities for gRPC Python")
    (description "Testing utilities for @code{gRPC} Python.")
    (license #f)))

(define-public python-tfp-nightly
  (package
    (name "python-tfp-nightly")
    (version "0.25.0.dev20240817")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tfp-nightly" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py
                             python-cloudpickle
                             python-decorator
                             python-dm-tree
                             python-gast
                             python-numpy
                             python-six))
    (home-page "http://github.com/tensorflow/probability")
    (synopsis "Probabilistic modeling and statistical inference in TensorFlow")
    (description
     "Probabilistic modeling and statistical inference in @code{TensorFlow}.")
    (license license:asl2.0)))

(define-public python-ray
  (package
    (name "python-ray")
    (version "2.34.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ray" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-aiosignal
                             python-click
                             python-filelock
                             python-frozenlist
                             python-jsonschema
                             python-msgpack
                             python-packaging
                             python-protobuf
                             python-pyyaml
                             python-requests))
    (home-page "https://github.com/ray-project/ray")
    (synopsis
     "Ray provides a simple, universal API for building distributed applications.")
    (description
     "Ray provides a simple, universal API for building distributed applications.")
    (license license:asl2.0)))

(define-public python-optproblems
  (package
    (name "python-optproblems")
    (version "1.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "optproblems" version))
       (sha256
        (base32 "1z1n32rrjhfpkrfb2va6nwvynjv2jhyr8j9g6m7bal75i32z1bcl"))))
    (build-system pyproject-build-system)
    (home-page
     "https://ls11-www.cs.tu-dortmund.de/people/swessing/optproblems/doc/")
    (synopsis
     "Infrastructure to define optimization problems and some test problems for black-box optimization")
    (description
     "Infrastructure to define optimization problems and some test problems for
black-box optimization.")
    (license license:bsd-3)))

(define-public python-nats-bench
  (package
    (name "python-nats-bench")
    (version "1.8")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "nats_bench" version))
       (sha256
        (base32 "1cfr88cxzcdn4ifngaghgsgy5k3y0f0q60xnjxwlwnsmp4xvdwhp"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy))
    (home-page "https://github.com/D-X-Y/NATS-Bench")
    (synopsis
     "API for NATS-Bench (a dataset/benchmark for neural architecture topology and size).")
    (description
     "API for NATS-Bench (a dataset/benchmark for neural architecture topology and
size).")
    (license #f)))

(define-public python-lightgbm
  (package
    (name "python-lightgbm")
    (version "4.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "lightgbm" version))
       (sha256
        (base32 "1fm16yb1vmz3v2lj4dmdcvw8vw1m8qxacxb5l84f7m0q0fpppkg1"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-cffi
                             python-dask
                             python-numpy
                             python-pandas
                             python-pyarrow
                             python-scikit-learn
                             python-scipy))
    (home-page "https://github.com/microsoft/LightGBM")
    (synopsis "LightGBM Python Package")
    (description "@code{LightGBM} Python Package.")
    (license #f)))

(define-public python-jaxopt
  (package
    (name "python-jaxopt")
    (version "0.8.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "jaxopt" version))
       (sha256
        (base32 "0ih6k5i0v107qpa94p6w90d3fsb0mx2n4q4r2qlz790mz6kdy1jb"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-jax python-jaxlib python-numpy
                             python-scipy))
    (home-page "https://github.com/google/jaxopt")
    (synopsis
     "Hardware accelerated, batchable and differentiable optimizers in JAX.")
    (description
     "Hardware accelerated, batchable and differentiable optimizers in JAX.")
    (license license:asl2.0)))

(define-public python-evojax
  (package
    (name "python-evojax")
    (version "0.2.17")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "evojax" version))
       (sha256
        (base32 "1cgzn35g1w73dxyh46lw77z8n3498ixpcb1qwd1r8g1da3a4pv3q"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-cma
                             ; python-flax ; cycle
                             python-jax
                             python-jaxlib
                             python-matplotlib
                             python-pillow
                             python-pyyaml))
    (home-page "https://github.com/google/evojax")
    (synopsis "EvoJAX: Hardware-accelerated Neuroevolution.")
    (description "@code{EvoJAX}: Hardware-accelerated Neuroevolution.")
    (license license:asl2.0)))

(define-public python-equinox
  (package
    (name "python-equinox")
    (version "0.11.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "equinox" version))
       (sha256
        (base32 "086kvz6knl7ry3cqdappa5v51a0am1vhfamianl05x4321rxjcq0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-jax python-jaxtyping
                             python-typing-extensions))
    (home-page #f)
    (synopsis "Elegant easy-to-use neural networks in JAX.")
    (description "Elegant easy-to-use neural networks in JAX.")
    (license #f)))

(define-public python-emukit
  (package
    (name "python-emukit")
    (version "0.4.10")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "emukit" version))
       (sha256
        (base32 "1jl8skq5ylp8zl1bm1gc1inm9d7hrivxw43v273a8h5mk8s4dcds"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-emcee python-gpy python-numpy python-scipy
                             )) ; FIXME it had some other dep
    (home-page "https://github.com/emukit/emukit")
    (synopsis "Toolkit for decision making under uncertainty.")
    (description "Toolkit for decision making under uncertainty.")
    (license #f)))

(define-public python-diversipy
  (package
    (name "python-diversipy")
    (version "0.9")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "diversipy" version))
       (sha256
        (base32 "171g4bvl0h196jwhqjbllwm5ia9d9r97056wnx4hsdma8vlk2nhn"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy python-scipy))
    (home-page "https://www.simonwessing.de/diversipy/doc/")
    (synopsis
     "Sample in hypercubes, select diverse subsets, and measure diversity")
    (description
     "Sample in hypercubes, select diverse subsets, and measure diversity.")
    (license license:bsd-3)))

(define-public python-ale-py
  (package
    (name "python-ale-py")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ale-py" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-importlib-metadata
                             python-importlib-resources python-numpy
                             python-typing-extensions))
    (native-inputs (list python-gymnasium python-pytest))
    (home-page #f)
    (synopsis
     "The Arcade Learning Environment (ALE) - a platform for AI research.")
    (description
     "The Arcade Learning Environment (ALE) - a platform for AI research.")
    (license #f)))

(define-public python-google-vizier
  (package
    (name "python-google-vizier")
    (version "0.1.18")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google-vizier" version))
       (sha256
        (base32 "0ls25sr4v47b2qqa6xr66jqd4r5bhfa22xmcjvcbwz0zv96fj0yn"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py
                             python-ale-py
                             python-attrs
                             python-chex
                             python-coverage
                             python-cvxopt
                             python-cvxpy
                             python-diversipy
                             python-emukit
                             python-equinox
                             python-evojax
                                        ; python-flax ;cycle
                             python-googleapis-common-protos
                             python-grpcio
                             python-grpcio-tools
                             python-jax
                             python-jaxlib
                             python-jaxopt
                             python-jaxtyping
                             python-lightgbm
                             python-matplotlib
                             python-mock
                             python-nats-bench
                             python-numpy
                             python-optax
                             python-optproblems
                             python-pandas
                             python-portpicker
                             python-protobuf
                             python-pytest
                             python-ray
                             python-scikit-learn
                             python-scipy
                             python-sqlalchemy
                             python-tensorflow
                             python-tfp-nightly
                             python-typeguard
                             python-xgboost))
    (home-page "https://github.com/google/vizier")
    (synopsis
     "Open Source Vizier: Distributed service framework for blackbox optimization and research.")
    (description
     "Open Source Vizier: Distributed service framework for blackbox optimization and
research.")
    (license #f)))

(define-public python-google-cloud-trace
  (package
    (name "python-google-cloud-trace")
    (version "1.13.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_cloud_trace" version))
       (sha256
        (base32 "18n60yzx9cz86vprb7awsf5p0qz9bh36swvlqdf6ylz298f4r5b8"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core python-google-auth
                             python-proto-plus python-protobuf))
    (home-page
     "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-trace")
    (synopsis "Google Cloud Trace API client library")
    (description "Google Cloud Trace API client library.")
    (license license:asl2.0)))

(define-public python-opentelemetry-api
  (package
    (name "python-opentelemetry-api")
    (version "1.26.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "opentelemetry_api" version))
       (sha256
        (base32 "1km18czkdpy43a580pi2zhc5mppzm8habdghzs389cfmpvj3kmib"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-deprecated python-importlib-metadata))
    (home-page #f)
    (synopsis "OpenTelemetry Python API")
    (description "@code{OpenTelemetry} Python API.")
    (license #f)))

(define-public python-google-cloud-audit-log
  (package
    (name "python-google-cloud-audit-log")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google-cloud-audit-log" version))
       (sha256
        (base32 "0szb09ly27495w7rbvd7vapf9cv0z7a7zgd50kywibc36fxgmql6"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-googleapis-common-protos python-protobuf))
    (home-page "https://github.com/googleapis/python-audit-log")
    (synopsis "Google Cloud Audit Protos")
    (description "Google Cloud Audit Protos.")
    (license #f)))

(define-public python-google-cloud-appengine-logging
  (package
    (name "python-google-cloud-appengine-logging")
    (version "1.4.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_cloud_appengine_logging" version))
       (sha256
        (base32 "10ybwkdczrr0wd0xjgr8zfymnaidnc2vax1rhg2rzcb7bmp7czfy"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core python-google-auth
                             python-proto-plus python-protobuf))
    (home-page
     "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-appengine-logging")
    (synopsis "Google Cloud Appengine Logging API client library")
    (description "Google Cloud Appengine Logging API client library.")
    (license license:asl2.0)))

(define-public python-google-cloud-logging
  (package
    (name "python-google-cloud-logging")
    (version "3.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_cloud_logging" version))
       (sha256
        (base32 "063rqr3x6lagpr82bxgvjgnfvnjas5yy029lnsl7w8vhgb8k63x7"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core
                             python-google-auth
                             python-google-cloud-appengine-logging
                             python-google-cloud-audit-log
                             python-google-cloud-core
                             python-grpc-google-iam-v1
                             python-opentelemetry-api
                             python-proto-plus
                             python-protobuf))
    (home-page "https://github.com/googleapis/python-logging")
    (synopsis "Stackdriver Logging API client library")
    (description "Stackdriver Logging API client library.")
    (license license:asl2.0)))

(define-public python-google-auth
  (package
    (name "python-google-auth")
    (version "2.33.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_auth" version))
       (sha256
        (base32 "15avcn13wlvl0xivfi8dmlw48zknj2ippm5l6kir0whd2r1279fn"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-cachetools python-pyasn1-modules
                             python-rsa))
    (home-page "https://github.com/googleapis/google-auth-library-python")
    (synopsis "Google Authentication Library")
    (description "Google Authentication Library.")
    (license license:asl2.0)))

(define-public python-explainable-ai-sdk
  (package
    (name "python-explainable-ai-sdk")
    (version "1.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "explainable-ai-sdk" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-auth
                             python-ipython
                             python-matplotlib
                             python-numpy
                             python-requests
                             python-tensorflow))
    (home-page "")
    (synopsis "Helper library for CAIP explanations.")
    (description "Helper library for CAIP explanations.")
    (license #f)))

(define-public python-pandas-gbq
  (package
    (name "python-pandas-gbq")
    (version "0.23.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pandas-gbq" version))
       (sha256
        (base32 "1gkrz25g5m36m96pja53kknzkcwqd9hhgj304cvz2fk4fjsl4jba"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-db-dtypes
                             python-google-api-core
                             python-google-auth
                             python-google-auth-oauthlib
                             python-google-cloud-bigquery
                             python-numpy
                             python-packaging
                             python-pandas
                             python-pyarrow
                             python-pydata-google-auth
                             )) ; FIXME it had some other dep
    (home-page "https://github.com/googleapis/python-bigquery-pandas")
    (synopsis "Google BigQuery connector for pandas")
    (description "Google @code{BigQuery} connector for pandas.")
    (license #f)))

(define-public python-google-cloud-testutils
  (package
    (name "python-google-cloud-testutils")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google-cloud-testutils" version))
       (sha256
        (base32 "1jqb7jzzrkbi89q9iqk9kf6cksfbhldcd7cxsq08bcmcw8i1r2nn"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-click python-google-auth
                             python-importlib-metadata python-packaging))
    (home-page "https://github.com/googleapis/python-test-utils")
    (synopsis "")
    (description #f)
    (license license:asl2.0)))

(define-public python-requests-gssapi
  (package
    (name "python-requests-gssapi")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "requests-gssapi" version))
       (sha256
        (base32 "1ji0khajd1rbbfcannj5fnmd1za3970qbjpw1q9jka525a6byljd"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-gssapi python-requests))
    (native-inputs (list python-black python-isort python-pytest python-tox))
    (home-page "")
    (synopsis "A GSSAPI authentication handler for python-requests")
    (description
     "This package provides a GSSAPI authentication handler for python-requests.")
    (license #f)))

(define-public python-backports.zoneinfo
  (package
    (name "python-backports.zoneinfo")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "backports.zoneinfo" version))
       (sha256
        (base32 "1wk2k1wqnkgg8ihv1idmd34fl48n0273n8kz0cjd0la0ywvzxnzs"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-importlib-resources))
    (home-page "https://github.com/pganssle/zoneinfo")
    (synopsis "Backport of the standard library zoneinfo module")
    (description "Backport of the standard library zoneinfo module.")
    (license #f)))

(define-public python-trino
  (package
    (name "python-trino")
    (version "0.329.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "trino" version))
       (sha256
        (base32 "16wqmx9ajry25hg0a1xjblli7bwcvcgycr0a2bxd1hvff9kn95qx"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-backports.zoneinfo python-dateutil
                             python-pytz python-requests python-tzlocal))
    (native-inputs (list python-black
                         python-httpretty
                         python-isort
                         python-pre-commit
                         python-pytest
                         python-pytest-runner
                         python-requests-gssapi
                         python-requests-kerberos
                         python-sqlalchemy))
    (home-page "https://github.com/trinodb/trino-python-client")
    (synopsis "Client for the Trino distributed SQL Engine")
    (description "Client for the Trino distributed SQL Engine.")
    (license license:asl2.0)))

(define-public python-types-python-dateutil
  (package
    (name "python-types-python-dateutil")
    (version "2.9.0.20240316")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "types-python-dateutil" version))
       (sha256
        (base32 "00h2xi8p6ygdv9nhgwdyx86ky9m9dpdqgmsdji05x4461cj2wbsx"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/python/typeshed")
    (synopsis "Typing stubs for python-dateutil")
    (description "Typing stubs for python-dateutil.")
    (license #f)))

(define-public python-sqlglotrs
  (package
    (name "python-sqlglotrs")
    (version "0.2.8")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sqlglotrs" version))
       (sha256
        (base32 "0n4vq3rfs9q4nxcrcqid59bbmkp65akn1xhzvbr1yqjhv0f4b73s"))))
    (build-system pyproject-build-system)
    (home-page #f)
    (synopsis #f)
    (description #f)
    (license #f)))

(define-public python-maturin
  (package
    (name "python-maturin")
    (version "1.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "maturin" version))
       (sha256
        (base32 "175mxzr9d4px9x45hl428l4m5cwp5cc0b8393lcccbc3sxyjg98v"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-tomli))
    (home-page "https://github.com/pyo3/maturin")
    (synopsis
     "Build and publish crates with pyo3, cffi and uniffi bindings as well as rust binaries as python packages")
    (description
     "Build and publish crates with pyo3, cffi and uniffi bindings as well as rust
binaries as python packages.")
    (license #f)))

(define-public python-sqlglot
  (package
    (name "python-sqlglot")
    (version "25.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sqlglot" version))
       (sha256
        (base32 "0zavgk7pvd2qzb2pchhmsbjlryhamn99xz7xlk8va282zslc41ii"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-duckdb
                             python-maturin
                             python-mypy
                             python-pandas
                             python-pandas-stubs
                             python-pdoc
                             python-pre-commit
                             python-dateutil
                             python-ruff
                             python-sqlglotrs
                             python-types-python-dateutil
                             python-typing-extensions))
    (home-page "https://github.com/tobymao/sqlglot")
    (synopsis "An easily customizable SQL parser and transpiler")
    (description "An easily customizable SQL parser and transpiler.")
    (license license:expat)))

(define-public python-snowflake-connector-python
  (package
    (name "python-snowflake-connector-python")
    (version "3.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "snowflake_connector_python" version))
       (sha256
        (base32 "10kxm1yxc21ilg3sy4w3jnr3h0kh674ljwmqr0cnwmfqiiphn3ij"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-asn1crypto
                             python-certifi
                             python-cffi
                             python-charset-normalizer
                             python-cryptography
                             python-filelock
                             python-idna
                             python-importlib-metadata
                             python-packaging
                             python-platformdirs
                             python-pyjwt
                             python-pyopenssl
                             python-pytz
                             python-requests
                             python-sortedcontainers
                             python-tomlkit
                             python-typing-extensions
                             python-urllib3))
    (native-inputs (list python-coverage
                         python-cython
                         python-more-itertools
                         python-numpy
                         python-pendulum
                         python-pexpect
                         python-pytest
                         python-pytest-cov
                         python-pytest-rerunfailures
                         python-pytest-timeout
                         python-pytest-xdist
                         python-pytzdata))
    (home-page "https://www.snowflake.com/")
    (synopsis "Snowflake Connector for Python")
    (description "Snowflake Connector for Python.")
    (license #f)))

(define-public python-pyspark
  (package
    (name "python-pyspark")
    (version "3.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyspark" version))
       (sha256
        (base32 "0pnyxpliyygrfslnl7712k3r06q4hslygmr315pfh97s16x6xcxv"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-py4j))
    (home-page "https://github.com/apache/spark/tree/master/python")
    (synopsis "Apache Spark Python API")
    (description "Apache Spark Python API.")
    (license #f)))

(define-public python-pproxy
  (package
    (name "python-pproxy")
    (version "2.7.9")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pproxy" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/qwj/python-proxy")
    (synopsis
     "Proxy server that can tunnel among remote servers by regex rules.")
    (description
     "Proxy server that can tunnel among remote servers by regex rules.")
    (license license:expat)))

(define-public python-pyexasol
  (package
    (name "python-pyexasol")
    (version "0.26.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyexasol" version))
       (sha256
        (base32 "1frzc1b8lzdz5j9aiy40g8n9lmql6namzgjh5hrpqxinb7hdh3yh"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy
                             python-orjson
                             python-packaging
                             python-pandas
                             python-pproxy
                             python-pyopenssl
                             python-rapidjson
                             python-rsa
                             python-ujson
                             python-websocket-client))
    (home-page #f)
    (synopsis "Exasol python driver with extra features")
    (description "Exasol python driver with extra features.")
    (license license:expat)))

(define-public python-pydruid
  (package
    (name "python-pydruid")
    (version "0.6.9")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pydruid" version))
       (sha256
        (base32 "0jgy8hgiv16xca411yj7x6zii3ypr8b36gsxq8fbgys7mcripi33"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-requests))
    (home-page "https://druid.apache.org")
    (synopsis "A Python connector for Druid.")
    (description "This package provides a Python connector for Druid.")
    (license license:asl2.0)))

(define-public python-pydata-google-auth
  (package
    (name "python-pydata-google-auth")
    (version "1.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pydata-google-auth" version))
       (sha256
        (base32 "00w3h423mrgqiy7bi8jr583frss0hvdwb1q8spndqmx6pq7nqysl"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-auth python-google-auth-oauthlib
                             )) ; ; FIXME it had some other dep
    (home-page "https://github.com/pydata/pydata-google-auth")
    (synopsis "PyData helpers for authenticating to Google APIs")
    (description "@code{PyData} helpers for authenticating to Google APIs.")
    (license license:bsd-3)))

(define-public python-pyarrow-hotfix
  (package
    (name "python-pyarrow-hotfix")
    (version "0.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyarrow_hotfix" version))
       (sha256
        (base32 "0icr9r9klgpwv5y8kmq2lm24vc80dxnw22hhi900v2gzywqf1lvr"))))
    (build-system pyproject-build-system)
    (home-page "")
    (synopsis "")
    (description #f)
    (license license:asl2.0)))

(define-public python-polars
  (package
    (name "python-polars")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "polars" version))
       (sha256
        (base32 "0sm5gfhp13a2wrrbn82y5zr11rgrdy6db3x3bbqlzrbnip96gxr2"))))
    (build-system pyproject-build-system)
    (home-page #f)
    (synopsis "Blazingly fast DataFrame library")
    (description "Blazingly fast @code{DataFrame} library.")
    (license #f)))

(define-public python-pytest-parallel
  (package
    (name "python-pytest-parallel")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytest-parallel" version))
       (sha256
        (base32 "1axzznpx8m0b67hcw4lcymxdwm5jksfj8q4vanlc0s51k70kzb4s"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pytest python-tblib))
    (home-page "https://github.com/browsertron/pytest-parallel")
    (synopsis "a pytest plugin for parallel and concurrent testing")
    (description "a pytest plugin for parallel and concurrent testing.")
    (license license:expat)))

(define-public python-functools32
  (package
    (name "python-functools32")
    (version "3.2.3-2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "functools32" version))
       (sha256
        (base32 "0v8ya0b58x47wp216n1zamimv4iw57cxz3xxhzix52jkw3xks9gn"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/MiCHiLU/python-functools32")
    (synopsis
     "Backport of the functools module from Python 3.2.3 for use on 2.7 and PyPy.")
    (description
     "Backport of the functools module from Python 3.2.3 for use on 2.7 and
@code{PyPy}.")
    (license #f)))

(define-public python-ordereddict
  (package
    (name "python-ordereddict")
    (version "1.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ordereddict" version))
       (sha256
        (base32 "07qvy11nvgxpzarrni3wrww3vpc9yafgi2bch4j2vvvc42nb8d8w"))))
    (build-system pyproject-build-system)
    (home-page "UNKNOWN")
    (synopsis
     "A drop-in substitute for Py2.7's new collections.OrderedDict that works in Python 2.4-2.6.")
    (description "This package provides a drop-in substitute for Py2.7's new
collections.@code{OrderedDict} that works in Python 2.4-2.6.")
    (license #f)))

(define-public python-funcsigs
  (package
    (name "python-funcsigs")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "funcsigs" version))
       (sha256
        (base32 "0l4g5818ffyfmfs1a924811azhjj8ax9xd1cffr1mzd3ycn0zfx7"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-ordereddict))
    (home-page "http://funcsigs.readthedocs.org")
    (synopsis
     "Python function signatures from PEP362 for Python 2.6, 2.7 and 3.2+")
    (description
     "Python function signatures from PEP362 for Python 2.6, 2.7 and 3.2+.")
    (license #f)))

(define-public python-enum34
  (package
    (name "python-enum34")
    (version "1.1.10")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "enum34" version))
       (sha256
        (base32 "0j7ji699fwswm4vg6w1v07fkbf8dkzdm6gfh88jvs5nqgr3sgrnc"))))
    (build-system pyproject-build-system)
    (home-page "https://bitbucket.org/stoneleaf/enum34")
    (synopsis
     "Python 3.4 Enum backported to 3.3, 3.2, 3.1, 2.7, 2.6, 2.5, and 2.4")
    (description
     "Python 3.4 Enum backported to 3.3, 3.2, 3.1, 2.7, 2.6, 2.5, and 2.4.")
    (license license:bsd-3)))

(define-public python-decopatch
  (package
    (name "python-decopatch")
    (version "1.4.10")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "decopatch" version))
       (sha256
        (base32 "082pnnc7a1d7rk40k7m72w7kw8dk7g8m3yzq4cn1hl217z4ljzwm"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-enum34 python-funcsigs python-makefun))
    (home-page "https://github.com/smarie/python-decopatch")
    (synopsis "Create decorators easily in python.")
    (description "Create decorators easily in python.")
    (license #f)))

(define-public python-pytest-cases
  (package
    (name "python-pytest-cases")
    (version "3.8.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytest-cases" version))
       (sha256
        (base32 "05ic23bvd5jwr00ffjr33570x0qacyqryw5ni86x79s7g0c58869"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-decopatch python-funcsigs
                             python-functools32 python-makefun
                             python-packaging))
    (home-page "https://github.com/smarie/python-pytest-cases")
    (synopsis "Separate test code from test cases in pytest.")
    (description "Separate test code from test cases in pytest.")
    (license #f)))

(define-public python-pip-tools
  (package
    (name "python-pip-tools")
    (version "7.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pip-tools" version))
       (sha256
        (base32 "1jdw2hgm4yskpygdd8s8k2qdy34jwdfbivnv4h74ar1q0zsjcj46"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-build ; FIXME it had some other dep
                             python-click
                             python-pip
                             python-pyproject-hooks
                             python-tomli
                             python-wheel))
    (native-inputs (list python-flit-core
                         python-poetry-core
                         python-pytest
                         python-pytest-rerunfailures
                         python-pytest-xdist
                         python-tomli-w))
    (home-page "")
    (synopsis "pip-tools keeps your pinned dependencies fresh.")
    (description "pip-tools keeps your pinned dependencies fresh.")
    (license license:bsd-3)))

(define-public python-azure-datalake-store
  (package
    (name "python-azure-datalake-store")
    (version "0.0.53")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "azure-datalake-store" version))
       (sha256
        (base32 "14vkfmsrihab6byf5z3ggwz0r01bg4xr7rj1d5p0laizxridxdh5"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-azure-nspkg
                             python-cffi
                             python-futures
                             python-msal
                             python-pathlib2
                             python-requests))
    (home-page "https://github.com/Azure/azure-data-lake-store-python")
    (synopsis "Azure Data Lake Store Filesystem Client Library for Python")
    (description "Azure Data Lake Store Filesystem Client Library for Python.")
    (license license:expat)))

(define-public python-adlfs
  (package
    (name "python-adlfs")
    (version "2024.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "adlfs" version))
       (sha256
        (base32 "1psxn1dgsrjwysqn783i6bpzl54s1lc7v5fmpisygd8f3ywras8h"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-aiohttp
                             python-azure-core
                             python-azure-datalake-store
                             python-azure-identity
                             python-azure-storage-blob
                             python-fsspec))
    (native-inputs (list python-arrow python-dask python-docker python-pytest
                         python-pytest-mock))
    (home-page #f)
    (synopsis "Access Azure Datalake Gen1 with fsspec and dask")
    (description "Access Azure Datalake Gen1 with fsspec and dask.")
    (license license:bsd-3)))

(define-public python-pins
  (package
    (name "python-pins")
    (version "0.8.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pins" version))
       (sha256
        (base32 "12rr7b5ddckbd73j8j23r957vlpjrj3qddds655kiba3vrxppfj9"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-appdirs
                             python-fsspec
                             python-humanize
                             python-importlib-metadata
                             python-importlib-resources
                             python-jinja2
                             python-joblib
                             python-pandas
                             python-pyyaml
                             python-requests
                             python-xxhash))
    (native-inputs (list python-adlfs
                         python-fastparquet
                         python-gcsfs
                         python-pip-tools
                         python-pyarrow
                         python-pytest
                         python-pytest-cases
                         python-pytest-dotenv
                         python-pytest-parallel
                         python-s3fs))
    (home-page "https://github.com/rstudio/pins-python")
    (synopsis
     "Publish data sets, models, and other python objects, making it easy to share them across projects and with your colleagues.")
    (description
     "Publish data sets, models, and other python objects, making it easy to share
them across projects and with your colleagues.")
    (license license:expat)))

(define-public python-parsy
  (package
    (name "python-parsy")
    (version "2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "parsy" version))
       (sha256
        (base32 "1b6phq0m6c2kydbqbn42bb7h435263s6b1p8bqkzhq8bgf6x2pgx"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/python-parsy/parsy")
    (synopsis "Easy-to-use parser combinators, for parsing in pure Python")
    (description "Easy-to-use parser combinators, for parsing in pure Python.")
    (license license:expat)))

(define-public python-oracledb
  (package
    (name "python-oracledb")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "oracledb" version))
       (sha256
        (base32 "1m83j45phw52p7h69glyascawd94vhyx5gl9cwz0c40b53nc9c5r"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-cryptography))
    (home-page "https://oracle.github.io/python-oracledb")
    (synopsis "Python interface to Oracle Database")
    (description "Python interface to Oracle Database.")
    (license #f)))

(define-public python-pure-sasl
  (package
    (name "python-pure-sasl")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pure-sasl" version))
       (sha256
        (base32 "1x1qa61xqpx6xshgm4qir0hdr3ji6ps6m6ncna2jnpm9bmgkbhak"))))
    (build-system pyproject-build-system)
    (home-page "http://github.com/thobbs/pure-sasl")
    (synopsis "Pure Python client SASL implementation")
    (description "Pure Python client SASL implementation.")
    (license license:expat)))

(define-public python-thrift-sasl
  (package
    (name "python-thrift-sasl")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "thrift_sasl" version))
       (sha256
        (base32 "1nkkyyj6f16csc95kwkbinm62n22n0yqgkmz7adkv8ch1mv5ppav"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pure-sasl python-six python-thrift))
    (home-page "https://github.com/cloudera/thrift_sasl")
    (synopsis
     "Thrift SASL Python module that implements SASL transports for Thrift (`TSaslClientTransport`).")
    (description
     "Thrift SASL Python module that implements SASL transports for Thrift
(`T@code{SaslClientTransport`}).")
    (license license:asl2.0)))

(define-public python-thrift
  (package
    (name "python-thrift")
    (version "0.20.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "thrift" version))
       (sha256
        (base32 "1fpyx2rp64jdysz1qs58lbm6rpwssrxm4a8plklfp2kbvzm65mjd"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-six))
    (home-page "http://thrift.apache.org")
    (synopsis "Python bindings for the Apache Thrift RPC system")
    (description "Python bindings for the Apache Thrift RPC system.")
    (license #f)))

(define-public python-impyla
  (package
    (name "python-impyla")
    (version "0.19.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "impyla" version))
       (sha256
        (base32 "0kza41vkc6n18b8y84ccvjcf4r2944i1ildrbx6j080ax5kh16vj"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-bitarray python-six python-thrift
                             python-thrift-sasl))
    (home-page "https://github.com/cloudera/impyla")
    (synopsis "Python client for the Impala distributed query engine")
    (description "Python client for the Impala distributed query engine.")
    (license license:asl2.0)))

(define-public python-google-cloud-bigquery-storage
  (package
    (name "python-google-cloud-bigquery-storage")
    (version "2.25.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google-cloud-bigquery-storage" version))
       (sha256
        (base32 "0j2d3c8xga394bs7qrijrdp19k8ynsh40gmbpqiam7hf30mzspqr"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core python-google-auth
                             python-proto-plus python-protobuf))
    (home-page "https://github.com/googleapis/python-bigquery-storage")
    (synopsis "Google Cloud Bigquery Storage API client library")
    (description "Google Cloud Bigquery Storage API client library.")
    (license license:asl2.0)))

(define-public python-geoarrow-types
  (package
    (name "python-geoarrow-types")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "geoarrow_types" version))
       (sha256
        (base32 "09790xvpa5f0mhf5ywrnj64iqkwh8sm78ghwlskpj80br2wkvjrd"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-pyarrow python-pytest))
    (home-page #f)
    (synopsis #f)
    (description #f)
    (license #f)))

(define-public python-deltalake
  (package
    (name "python-deltalake")
    (version "0.19.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "deltalake" version))
       (sha256
        (base32 "0p3f9kyqy4dpijpp264s5bgal670j9fdziclnvf2p90isv7ygw9s"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pyarrow))
    (native-inputs (list python-azure-storage-blob
                         python-mypy
                         python-packaging
                         python-pytest
                         python-pytest-benchmark
                         python-pytest-cov
                         python-pytest-mock
                         python-pytest-timeout
                         python-ruff
                         python-sphinx
                         python-sphinx-rtd-theme
                         python-toml
                         python-wheel))
    (home-page "https://github.com/delta-io/delta-rs")
    (synopsis
     "Native Delta Lake Python binding based on delta-rs with Pandas integration")
    (description
     "Native Delta Lake Python binding based on delta-rs with Pandas integration.")
    (license #f)))

(define-public python-db-dtypes
  (package
    (name "python-db-dtypes")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "db_dtypes" version))
       (sha256
        (base32 "06z9qf5i3n9rijsp7spm6q9qv5w8whx2zfvpbg44siq7if2wijvv"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy python-packaging python-pandas
                             python-pyarrow))
    (home-page "https://github.com/googleapis/python-db-dtypes-pandas")
    (synopsis "Pandas Data Types for SQL systems (BigQuery, Spanner)")
    (description
     "Pandas Data Types for SQL systems (@code{BigQuery}, Spanner).")
    (license #f)))

(define-public python-datafusion
  (package
    (name "python-datafusion")
    (version "39.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "datafusion" version))
       (sha256
        (base32 "0a716mydsdaw45ai0z74sshs8ysaj9p0qiyn1cx39c04k075xxjk"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pyarrow))
    (home-page "https://datafusion.apache.org/python")
    (synopsis "Build and run queries against data")
    (description "Build and run queries against data.")
    (license #f)))

(define-public python-ibis-framework
  (package
    (name "python-ibis-framework")
    (version "9.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ibis_framework" version))
       (sha256
        (base32 "0jfzsl8ccgfhc4bggzd5msipq4hdp7scp7ds30rfaz2djqc862ay"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-atpublic
                             python-black
                             python-clickhouse-connect
                             python-dask
                             python-datafusion
                             python-db-dtypes
                             python-deltalake
                             python-duckdb
                             python-fsspec
                             python-geoarrow-types
                             python-geopandas
                             python-google-cloud-bigquery
                             python-google-cloud-bigquery-storage
                             python-graphviz
                             python-impyla
                             python-numpy
                             python-oracledb
                             python-packaging
                             python-pandas
                             python-parsy
                             python-pins
                             python-polars
                             python-psycopg2
                             python-pyarrow
                             python-pyarrow-hotfix
                             python-pydata-google-auth
                             python-pydruid
                             python-pyexasol
                             python-pymysql
                             python-pyodbc
                             python-pyproj
                             python-pyspark
                             python-dateutil
                             python-pytz
                             python-regex
                             python-rich
                             python-shapely
                             python-snowflake-connector-python
                             python-sqlglot
                             python-toolz
                             python-trino
                             python-typing-extensions))
    (home-page "https://ibis-project.org")
    (synopsis "The portable Python dataframe library")
    (description "The portable Python dataframe library.")
    (license #f)))

(define-public python-grpcio-status
  (package
    (name "python-grpcio-status")
    (version "1.65.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "grpcio_status" version))
       (sha256
        (base32 "1l9kz25vp1xxigyakfapafy76s8hrrfk0i3xhc0nzlpg6aps77rc"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-googleapis-common-protos python-grpcio
                             python-protobuf))
    (home-page "https://grpc.io")
    (synopsis "Status proto mapping for gRPC")
    (description "Status proto mapping for @code{gRPC}.")
    (license #f)))

(define-public python-google-cloud-pubsub
  (package
    (name "python-google-cloud-pubsub")
    (version "2.23.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_cloud_pubsub" version))
       (sha256
        (base32 "0n5nv2f2czn1r5i1fvv6v44b8rhxxvjwmm571by8sp0vn4m6ygfg"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core
                             python-google-auth
                             python-grpc-google-iam-v1
                             python-grpcio
                             python-grpcio-status
                             python-proto-plus
                             python-protobuf))
    (home-page "https://github.com/googleapis/python-pubsub")
    (synopsis "Google Cloud Pub/Sub API client library")
    (description "Google Cloud Pub/Sub API client library.")
    (license license:asl2.0)))

(define-public python-google-cloud-iam
  (package
    (name "python-google-cloud-iam")
    (version "2.15.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_cloud_iam" version))
       (sha256
        (base32 "10hshzs04qs7bhadcg5jif75ill9dr1i307dly06zkx2dgckbc89"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core python-google-auth
                             python-grpc-google-iam-v1 python-proto-plus
                             python-protobuf))
    (home-page
     "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-iam")
    (synopsis "Google Cloud Iam API client library")
    (description "Google Cloud Iam API client library.")
    (license license:asl2.0)))

(define-public python-google-cloud-functions
  (package
    (name "python-google-cloud-functions")
    (version "1.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_cloud_functions" version))
       (sha256
        (base32 "1x98kcjhkyg1xl7a9wa8b2p09jmhjn07anxb5h8q4dj3k65026sl"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core python-google-auth
                             python-grpc-google-iam-v1 python-proto-plus
                             python-protobuf))
    (home-page
     "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-functions")
    (synopsis "Google Cloud Functions API client library")
    (description "Google Cloud Functions API client library.")
    (license license:asl2.0)))

(define-public python-google-cloud-bigtable
  (package
    (name "python-google-cloud-bigtable")
    (version "2.26.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_cloud_bigtable" version))
       (sha256
        (base32 "1dqq5dv034r69jqbkzb3bj4c25qj4i6mmbpgk6rq8d1knfni1kw3"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core
                             python-google-auth
                             python-google-cloud-core
                             python-grpc-google-iam-v1
                             python-proto-plus
                             python-protobuf))
    (home-page "https://github.com/googleapis/python-bigtable")
    (synopsis "Google Cloud Bigtable API client library")
    (description "Google Cloud Bigtable API client library.")
    (license license:asl2.0)))

(define-public python-google-cloud-bigquery-connection
  (package
    (name "python-google-cloud-bigquery-connection")
    (version "1.15.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_cloud_bigquery_connection" version))
       (sha256
        (base32 "1smd8zyrbdxcrcyiarsx84g0zgdl8q6rgq08jr6b6ai6s3b9m5s3"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core python-google-auth
                             python-grpc-google-iam-v1 python-proto-plus
                             python-protobuf))
    (home-page
     "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-bigquery-connection")
    (synopsis "Google Cloud Bigquery Connection API client library")
    (description "Google Cloud Bigquery Connection API client library.")
    (license license:asl2.0)))

(define-public python-bigframes
  (package
    (name "python-bigframes")
    (version "1.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "bigframes" version))
       (sha256
        (base32 "0mh2c32bxq10rrk04mxkiq33vfh39ypdpzp39visz1jrrghbnzph"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-cloudpickle
                             python-fsspec
                             python-gcsfs
                             python-geopandas
                             python-google-auth
                             python-google-cloud-bigquery
                             python-google-cloud-bigquery-connection
                             python-google-cloud-bigtable
                             python-google-cloud-functions
                             python-google-cloud-iam
                             python-google-cloud-pubsub
                             python-google-cloud-resource-manager
                             python-google-cloud-storage
                             python-humanize
                             python-ibis-framework
                             python-ipywidgets
                             python-jellyfish
                             python-matplotlib
                             python-pandas
                             python-pyarrow
                             python-pydata-google-auth
                             python-requests
                             python-scikit-learn
                             python-sqlalchemy
                             python-sqlglot
                             python-tabulate))
    (native-inputs (list python-google-cloud-testutils
                         python-nox
                         python-pandas-gbq
                         python-pre-commit
                         python-pytest
                         python-pytest-mock))
    (home-page "https://github.com/googleapis/python-bigquery-dataframes")
    (synopsis
     "BigQuery DataFrames -- scalable analytics and machine learning with BigQuery")
    (description
     "@code{BigQuery} @code{DataFrames} -- scalable analytics and machine learning
with @code{BigQuery}.")
    (license license:asl2.0)))

(define-public python-google-cloud-resource-manager
  (package
    (name "python-google-cloud-resource-manager")
    (version "1.12.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_cloud_resource_manager" version))
       (sha256
        (base32 "14aqvsbkan25br47h6prpak3z06v7p5jkad3mfiyzm0y81a45bxp"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core python-google-auth
                             python-grpc-google-iam-v1 python-proto-plus
                             python-protobuf))
    (home-page
     "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-resource-manager")
    (synopsis "Google Cloud Resource Manager API client library")
    (description "Google Cloud Resource Manager API client library.")
    (license license:asl2.0)))

(define-public python-google-cloud-bigquery
  (package
    (name "python-google-cloud-bigquery")
    (version "3.25.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google-cloud-bigquery" version))
       (sha256
        (base32 "02c5lbnmgzbai2c0m0g6jhjizw832jp3cs232w8lhm580lrgyajv"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core
                             python-google-auth
                             python-google-cloud-core
                             python-google-resumable-media
                             python-packaging
                             python-dateutil
                             python-requests))
    (home-page "https://github.com/googleapis/python-bigquery")
    (synopsis "Google BigQuery API client library")
    (description "Google @code{BigQuery} API client library.")
    (license license:asl2.0)))

(define-public python-google-cloud-aiplatform
  (package
    (name "python-google-cloud-aiplatform")
    (version "1.62.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google-cloud-aiplatform" version))
       (sha256
        (base32 "1s3g00phxgkad7md49wh3aj6sbln560zn765yhb4l3g3k4m5npg1"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-docstring-parser
                             python-google-api-core
                             python-google-auth
                             python-google-cloud-bigquery
                             python-google-cloud-resource-manager
                             python-google-cloud-storage
                             python-packaging
                             python-proto-plus
                             python-protobuf
                             python-pydantic
                             python-shapely))
    (native-inputs (list python-absl-py ; FIXME it had some other dep
                         python-bigframes
                         python-cloudpickle
                         python-docker
                         python-explainable-ai-sdk
                         python-fastapi
                         python-google-api-core
                         python-google-cloud-bigquery
                         python-google-cloud-bigquery-storage
                         python-google-cloud-logging
                         python-google-cloud-trace
                         python-google-vizier
                         python-grpcio-testing
                         python-httpx
                         python-immutabledict
                         python-ipython
                         python-kfp
                         python-langchain
                         python-langchain-core
                         python-langchain-google-vertexai
                         python-lit-nlp
                         python-mlflow
                         python-nltk
                         python-numpy
                         python-openinference-instrumentation-langchain
                         python-opentelemetry-exporter-gcp-trace
                         python-opentelemetry-sdk
                         python-orjson
                         python-pandas
                         python-pyarrow
                         python-pydantic
                         python-pyfakefs
                         python-pytest-asyncio
                         python-pytest-xdist
                         python-pyyaml
                         python-ray
                         python-requests
                         python-requests-toolbelt
                         python-scikit-learn
                         python-sentencepiece
                         python-starlette
                         python-tenacity
                         python-tensorboard-plugin-profile
                         python-tensorflow
                         python-torch
                         python-tqdm
                         python-urllib3
                         python-uvicorn
                         python-werkzeug
                         python-xgboost
                         python-xgboost-ray))
    (home-page "https://github.com/googleapis/python-aiplatform")
    (synopsis "Vertex AI API client library")
    (description "Vertex AI API client library.")
    (license license:asl2.0)))

(define-public python-google-apitools
  (package
    (name "python-google-apitools")
    (version "0.5.32")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google-apitools" version))
       (sha256
        (base32 "04xdigdp01s6zn38d2q8994ci76szch1wlym84ff4qcz5193wxn3"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-fasteners python-httplib2
                             python-oauth2client python-six))
    (native-inputs (list python-mock))
    (home-page "http://github.com/google/apitools")
    (synopsis "client libraries for humans")
    (description "client libraries for humans.")
    (license license:asl2.0)))

(define-public python-fastavro
  (package
    (name "python-fastavro")
    (version "1.9.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "fastavro" version))
       (sha256
        (base32 "0ls5j5ppr5agi40yv2324dybj2zisiaya7y58ncjl4w8bzsfn6b4"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/fastavro/fastavro")
    (synopsis "Fast read/write of AVRO files")
    (description "Fast read/write of AVRO files.")
    (license license:expat)))

(define-public python-facets-overview
  (package
    (name "python-facets-overview")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "facets-overview" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy python-pandas python-protobuf))
    (home-page "http://github.com/pair-code/facets")
    (synopsis "Python code to support the Facets Overview visualization")
    (description "Python code to support the Facets Overview visualization.")
    (license license:asl2.0)))

(define-public python-embeddings
  (package
    (name "python-embeddings")
    (version "0.0.8")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "embeddings" version))
       (sha256
        (base32 "0yhd6w4gil1apfk2nscyjmgy27q1dq92zckin6drvvrpqyxmzsak"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy python-requests python-tqdm))
    (native-inputs (list python-check-manifest python-coverage python-nose
                         python-sphinx python-sphinx-rtd-theme))
    (home-page "https://github.com/vzhong/embeddings")
    (synopsis "Pretrained word embeddings in Python.")
    (description "Pretrained word embeddings in Python.")
    (license license:expat)))

(define-public python-datatable
  (package
    (name "python-datatable")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "datatable" version))
       (sha256
        (base32 "0xfphzc0xi6am18m9paq5nzv3j8qbiyz3464sziys0kbxx9nk7wa"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-docutils python-pytest))
    (home-page "https://github.com/h2oai/datatable")
    (synopsis
     "Python library for fast multi-threaded data manipulation and munging.")
    (description
     "Python library for fast multi-threaded data manipulation and munging.")
    (license #f)))

(define-public python-chromedriver-binary
  (package
    (name "python-chromedriver-binary")
    (version "129.0.6661.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "chromedriver_binary" version))
       (sha256
        (base32 "06vdfziqx0c6nf3fx0b171adk7jdmknaf6p3apl1mgxkmvymi1b6"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/danielkaiser/python-chromedriver-binary")
    (synopsis "Installer for chromedriver.")
    (description "Installer for chromedriver.")
    (license license:expat)))

(define-public python-apache-beam
  (package
    (name "python-apache-beam")
    (version "2.58.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "apache_beam" version))
       (sha256
        (base32 "0hb0g5mfx0yhb7fllfsy5rv2lcc2g4w32590yp9dk630nl9iy6lj"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-azure-core ; FIXME it had some other dep
                             python-azure-identity
                             python-azure-storage-blob
                             python-boto3
                             python-cachetools
                             python-chromedriver-binary
                             python-cloudpickle
                             python-crcmod
                             python-cryptography
                             python-dask
                             python-datatable
                             python-dill
                             python-distributed
                             python-docstring-parser
                             python-docutils
                             python-embeddings
                             python-facets-overview
                             python-fastavro
                             python-fasteners
                             python-freezegun
                             python-google-api-core
                             python-google-apitools
                             python-google-auth
                             python-google-auth-httplib2
                             python-google-cloud-aiplatform
                             python-google-cloud-bigquery
                             python-google-cloud-bigquery-storage
                             python-google-cloud-bigtable
                             python-google-cloud-core
                             python-google-cloud-dataproc
                             python-google-cloud-datastore
                             python-google-cloud-dlp
                             python-google-cloud-language
                             python-google-cloud-pubsub
                             python-google-cloud-pubsublite
                             python-google-cloud-recommendations-ai
                             python-google-cloud-spanner
                             python-google-cloud-storage
                             python-google-cloud-videointelligence
                             python-google-cloud-vision
                             python-grpcio
                             python-hdfs
                             python-httplib2
                             python-hypothesis
                             python-ipykernel
                             python-ipython
                             python-ipywidgets
                             python-jinja2
                             python-joblib
                             python-js2py
                             python-jsonpickle
                             python-jsonschema
                             python-jupyter-client
                             python-mock
                             python-nbconvert
                             python-nbformat
                             python-needle
                             python-numpy
                             python-objsize
                             python-onnxruntime
                             python-orjson
                             python-packaging
                             python-pandas
                             python-parameterized
                             python-pillow
                             python-proto-plus
                             python-protobuf
                             python-psycopg2-binary
                             python-pyarrow
                             python-pyarrow-hotfix
                             python-pydot
                             python-pyhamcrest
                             python-pymongo
                             python-pytest
                             python-pytest-timeout
                             python-pytest-xdist
                             python-dateutil
                             python-pytz
                             python-pyyaml
                             python-redis
                             python-regex
                             python-requests
                             python-requests-mock
                             python-scikit-learn
                             python-sentence-transformers
                             python-skl2onnx
                             python-sphinx
                             python-sqlalchemy
                             python-tenacity
                             python-tensorflow
                             python-tensorflow-hub
                             python-tensorflow-transform
                             python-testcontainers
                             python-tf2onnx
                             python-timeloop
                             python-torch
                             python-transformers
                             python-typing-extensions
                             python-urllib3
                             python-virtualenv-clone
                             python-xgboost
                             python-zstandard))
    (home-page "https://beam.apache.org")
    (synopsis "Apache Beam SDK for Python")
    (description "Apache Beam SDK for Python.")
    (license license:asl2.0)))

(define-public python-tensorflow-metadata
  (package
    (name "python-tensorflow-metadata")
    (version "1.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tensorflow-metadata" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py python-googleapis-common-protos
                             python-protobuf))
    (home-page #f)
    (synopsis "Library and standards for schema and statistics.")
    (description "Library and standards for schema and statistics.")
    (license license:asl2.0)))

(define-public python-simple-parsing
  (package
    (name "python-simple-parsing")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "simple_parsing" version))
       (sha256
        (base32 "1z6i343v0d46mp9j6g6bs8m4c7n1af0scwg1fj0z4g0pwmdw2snj"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-docstring-parser python-typing-extensions))
    (native-inputs (list python-numpy python-pytest python-pytest-benchmark
                         python-pytest-regressions python-pytest-xdist))
    (home-page "https://github.com/lebrice/SimpleParsing")
    (synopsis
     "A small utility for simplifying and cleaning up argument parsing scripts.")
    (description
     "This package provides a small utility for simplifying and cleaning up argument
parsing scripts.")
    (license #f)))

(define-public python-array-record
  (package
    (name "python-array-record")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "array-record" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py python-etils))
    (home-page "https://github.com/google/array_record")
    (synopsis "A file format that achieves a new frontier of IO efficiency")
    (description
     "This package provides a file format that achieves a new frontier of IO
efficiency.")
    (license #f)))

(define-public python-tensorflow-datasets
  (package
    (name "python-tensorflow-datasets")
    (version "4.9.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tensorflow_datasets" version))
       (sha256
        (base32 "19kl5f7invpg2if1lkrnf35qg8bsj6m4nms9i5swy4b7ppnr3vph"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py
                             python-array-record
                             python-click
                             python-dm-tree
                             python-etils
                             python-immutabledict
                             python-importlib-resources
                             python-numpy
                             python-promise
                             python-protobuf
                             python-psutil
                             python-pyarrow
                             python-requests
                             python-simple-parsing
                             python-tensorflow-metadata
                             python-termcolor
                             python-toml
                             python-tqdm
                             python-wrapt))
    (native-inputs (list python-apache-beam
                         python-bs4
                         python-conllu
                         python-dill
                         python-envlogger
                         python-gcld3
                         python-gcsfs
                         python-h5py
                         python-imagecodecs
                         python-jax
                         python-jupyter
                         python-langdetect
                         python-lxml
                         python-matplotlib
                         python-mwparserfromhell
                         python-mwxml
                         python-networkx
                         python-nltk
                         python-opencv-python
                         python-pandas
                         python-pillow
                         python-pretty-midi
                         python-pycocotools
                         python-pydub
                         python-pylint
                         python-pytest
                         python-pytest-shard
                         python-pytest-xdist
                         python-pyyaml
                         python-scikit-image
                         python-scipy
                         python-tensorflow-io
                         python-tifffile
                         python-tldextract
                         python-yapf
                         python-zarr))
    (home-page "https://github.com/tensorflow/datasets")
    (synopsis
     "tensorflow/datasets is a library of datasets ready to use with TensorFlow.")
    (description
     "tensorflow/datasets is a library of datasets ready to use with
@code{TensorFlow}.")
    (license license:asl2.0)))

(define-public python-sphinxcontrib-katex
  (package
    (name "python-sphinxcontrib-katex")
    (version "0.9.10")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinxcontrib_katex" version))
       (sha256
        (base32 "1v0dmp8jz7959nvhh875wjaswyvj95jzp9byzy2cbns5wbd956ih"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-sphinx))
    (home-page #f)
    (synopsis "A Sphinx extension for rendering math in HTML pages")
    (description
     "This package provides a Sphinx extension for rendering math in HTML pages.")
    (license #f)))

(define-public python-sphinx-contributors
  (package
    (name "python-sphinx-contributors")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinx_contributors" version))
       (sha256
        (base32 "1x5lrc4ly98caacxcjf1vs6pc4ab6nwpgjkfl0222vq9cq9p7kma"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-furo python-pre-commit python-pytest
                             python-sphinx))
    (home-page "https://github.com/dgarcia360/sphinx-contributors")
    (synopsis "Contributors extension for Sphinx.")
    (description "Contributors extension for Sphinx.")
    (license #f)))

(define-public python-sphinx-collections
  (package
    (name "python-sphinx-collections")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinx-collections" version))
       (sha256
        (base32 "0q7n6smpxbhihi7n0a87kj6q78k7fb92s8wzka8j8x8ir88nh9pb"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-gitpython python-jinja2 python-sphinx))
    (home-page "http://github.com/useblocks/sphinx-collections")
    (synopsis
     "Sphinx extension for collecting external data for Sphinx build.")
    (description
     "Sphinx extension for collecting external data for Sphinx build.")
    (license license:expat)))

(define-public python-simple-parsing
  (package
    (name "python-simple-parsing")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "simple_parsing" version))
       (sha256
        (base32 "1z6i343v0d46mp9j6g6bs8m4c7n1af0scwg1fj0z4g0pwmdw2snj"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-docstring-parser python-typing-extensions))
    (native-inputs (list python-numpy python-pytest python-pytest-benchmark
                         python-pytest-regressions python-pytest-xdist))
    (home-page "https://github.com/lebrice/SimpleParsing")
    (synopsis
     "A small utility for simplifying and cleaning up argument parsing scripts.")
    (description
     "This package provides a small utility for simplifying and cleaning up argument
parsing scripts.")
    (license #f)))

(define-public python-awscli
  (package
    (name "python-awscli")
    (version "1.34.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "awscli" version))
       (sha256
        (base32 "06gq34kgkiwmf6cyfl91aca34ay9w32njby8scm1qv4wgp7c956l"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-botocore
                             python-colorama
                             python-docutils
                             python-pyyaml
                             python-rsa
                             python-s3transfer))
    (home-page "http://aws.amazon.com/cli/")
    (synopsis "Universal Command Line Environment for AWS.")
    (description "Universal Command Line Environment for AWS.")
    (license #f)))

(define-public python-aioitertools
  (package
    (name "python-aioitertools")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "aioitertools" version))
       (sha256
        (base32 "0cb8gp3bp1sixl1aqljjr9xmb2xm9ggzffr3ybvjp756sf6qpij2"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-typing-extensions))
    (home-page "https://aioitertools.omnilib.dev")
    (synopsis "itertools and builtins for AsyncIO and mixed iterables")
    (description
     "itertools and builtins for @code{AsyncIO} and mixed iterables.")
    (license #f)))

(define-public python-aiobotocore
  (package
    (name "python-aiobotocore")
    (version "2.13.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "aiobotocore" version))
       (sha256
        (base32 "0bxk8ka3nqblwwad5fwd7n2r6z1wf9x1n9qjkv326y92zpizzqla"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-aiohttp
                             python-aioitertools
                             python-awscli
                             python-boto3
                             python-botocore
                             python-wrapt))
    (home-page "https://github.com/aio-libs/aiobotocore")
    (synopsis "Async client for aws services using botocore and aiohttp")
    (description "Async client for aws services using botocore and aiohttp.")
    (license #f)))

(define-public python-s3fs
  (package
    (name "python-s3fs")
    (version "2024.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "s3fs" version))
       (sha256
        (base32 "1shvahy1mhh1cdlrca2isgimwvc9f8sny36jwf4bpgsgqgb0c8bc"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-aiobotocore python-aiohttp python-fsspec))
    (home-page "http://github.com/fsspec/s3fs/")
    (synopsis "Convenient Filesystem interface over S3")
    (description "Convenient Filesystem interface over S3.")
    (license license:bsd-3)))

(define-public python-gcsfs
  (package
    (name "python-gcsfs")
    (version "2024.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "gcsfs" version))
       (sha256
        (base32 "1msf4b08yf6v064548scqx4f78i4l1qf4byfpzlna8ivi5x8r1g8"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-aiohttp
                             python-decorator
                             python-fsspec
                             python-google-auth
                             python-google-auth-oauthlib
                             python-google-cloud-storage
                             python-requests))
    (home-page "https://github.com/fsspec/gcsfs")
    (synopsis "Convenient Filesystem interface over GCS")
    (description "Convenient Filesystem interface over GCS.")
    (license license:bsd-3)))

(define-public python-tb-nightly
  (package
    (name "python-tb-nightly")
    (version "2.18.0a20240817")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tb-nightly" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py ; FIXME it had some other dep
                             python-grpcio
                             python-markdown
                             python-numpy
                             python-packaging
                             python-protobuf
                             python-six
                             python-tensorboard-data-server
                             python-werkzeug))
    (home-page "https://github.com/tensorflow/tensorboard")
    (synopsis "TensorBoard lets you watch Tensors Flow")
    (description "@code{TensorBoard} lets you watch Tensors Flow.")
    (license license:asl2.0)))

(define-public python-keras-nightly
  (package
    (name "python-keras-nightly")
    (version "3.5.0.dev2024081703")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "keras_nightly" version))
       (sha256
        (base32 "1d4z1z7mikplmb9hj3bllspw4zjgw8va5279lnq5q80glsjj53fc"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py
                             python-h5py
                             python-ml-dtypes
                             python-namex
                             python-numpy
                             python-optree
                             python-packaging
                             python-rich))
    (home-page "https://github.com/keras-team/keras")
    (synopsis "Multi-backend Keras.")
    (description "Multi-backend Keras.")
    (license #f)))

(define-public python-tf-nightly
  (package
    (name "python-tf-nightly")
    (version "2.18.0.dev20240816")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tf-nightly" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py ; FIXME it had some other dep
                             python-astunparse
                             python-flatbuffers
                             python-gast
                             python-google-pasta
                             python-grpcio
                             python-h5py
                             python-keras-nightly
                             python-libclang
                             python-ml-dtypes
                             python-numpy
                             python-opt-einsum
                             python-packaging
                             python-protobuf
                             python-requests
                             python-six
                             python-tb-nightly
                             python-tensorflow-io-gcs-filesystem
                             python-termcolor
                             python-typing-extensions
                             python-wrapt))
    (home-page "https://www.tensorflow.org/")
    (synopsis
     "TensorFlow is an open source machine learning framework for everyone.")
    (description
     "@code{TensorFlow} is an open source machine learning framework for everyone.")
    (license license:asl2.0)))

(define-public python-sphinx-book-theme
  (package
    (name "python-sphinx-book-theme")
    (version "1.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinx_book_theme" version))
       (sha256
        (base32 "0kavxw5aw08fm5ymsrj5z2ng8cdh8lxipikb78skvjs630xlh98z"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-ablog
                             python-beautifulsoup4
                             python-coverage
                             python-defusedxml
                             python-folium
                             python-ipywidgets
                             python-matplotlib
                             ;python-myst-nb ;cycle
                             python-nbclient
                             python-numpy
                             python-numpydoc
                             python-pandas
                             python-plotly
                             python-pre-commit
                             python-pydata-sphinx-theme
                             python-pytest
                             python-pytest-cov
                             python-pytest-regressions
                             python-sphinx
                             python-sphinx-copybutton
                             python-sphinx-design
                             ;python-sphinx-examples ;cycle
                             python-sphinx-tabs
                             python-sphinx-thebe
                             python-sphinx-togglebutton
                             python-sphinx-thebe
                             python-sphinxcontrib-bibtex
                             python-sphinxcontrib-youtube
                             python-sphinxext-opengraph))
    (home-page #f)
    (synopsis
     "A clean book theme for scientific explanations and documentation with Sphinx")
    (description
     "This package provides a clean book theme for scientific explanations and
documentation with Sphinx.")
    (license #f)))

(define-public python-lazyasd
  (package
    (name "python-lazyasd")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "lazyasd" version))
       (sha256
        (base32 "0nqlvg1jjwl8l5g3zcl99vmb8r6mbxryarsps0m9azzjrw2ny6d3"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/xonsh/lazyasd")
    (synopsis "Lazy & self-destructive tools for speeding up module imports")
    (description
     "Lazy & self-destructive tools for speeding up module imports.")
    (license #f)))

(define-public python-github3.py
  (package
    (name "python-github3.py")
    (version "4.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "github3.py" version))
       (sha256
        (base32 "0dnxbps444wvygani2adnljcnkwa6gpsmyf7xn4w7vskcw3p3m9h"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pyjwt python-dateutil python-requests
                             python-uritemplate))
    (native-inputs (list python-betamax
                         python-betamax-matchers
                         python-build
                         python-github3-py
                         python-pytest
                         python-pytest-xdist
                         python-tox
                         python-twine
                         python-wheel))
    (home-page #f)
    (synopsis
     "Python wrapper for the GitHub API(http://developer.github.com/v3)")
    (description
     "Python wrapper for the @code{GitHub} API(http://developer.github.com/v3).")
    (license #f)))

(define-public python-github3-py
  (package
    (name "python-github3-py")
    (version "4.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "github3.py" version))
       (sha256
        (base32 "0dnxbps444wvygani2adnljcnkwa6gpsmyf7xn4w7vskcw3p3m9h"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pyjwt python-dateutil python-requests
                             python-uritemplate))
    (native-inputs (list python-betamax
                         python-betamax-matchers
                         python-build
                         python-pytest
                         python-pytest-xdist
                         python-tox
                         python-twine
                         python-wheel))
    (home-page #f)
    (synopsis
     "Python wrapper for the GitHub API(http://developer.github.com/v3)")
    (description
     "Python wrapper for the @code{GitHub} API(http://developer.github.com/v3).")
    (license #f)))

(define-public python-re-ver
  (package
    (name "python-re-ver")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "re-ver" version))
       (sha256
        (base32 "1aqqnb5851m6acy8fwg3qqwpxc5hyd51cm0mp83i6nyvychmygr7"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-github3.py python-lazyasd
                             python-ruamel.yaml ;python-xonsh ; cycle
                             ))
    (home-page "https://github.com/scopatz/rever")
    (synopsis "Release Versions of Software")
    (description "Release Versions of Software.")
    (license license:bsd-3)))

(define-public python-case-insensitive-dictionary
  (package
    (name "python-case-insensitive-dictionary")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "case-insensitive-dictionary" version))
       (sha256
        (base32 "1012ljsar8fhh185wgk6xxnrkz0gnlfrf29jqpm0qb7bjxpp553y"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-importlib-metadata))
    (home-page "https://github.com/DeveloperRSquared/case-insensitive-dict")
    (synopsis "Typed Python Case Insensitive Dictionary")
    (description "Typed Python Case Insensitive Dictionary.")
    (license license:expat)))

(define-public python-xonsh
  (package
    (name "python-xonsh")
    (version "0.18.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "xonsh" version))
       (sha256
        (base32 "0fx5ywsckwdxk4l5dmaf12z1b4nfd4zqdx5gapc11hhl9waks1y5"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-case-insensitive-dictionary))
    (native-inputs (list python-coverage
                         python-pre-commit
                         python-prompt-toolkit
                         python-pygments
                         python-pyte
                         python-pytest
                         python-pytest-cov
                         python-pytest-mock
                         python-pytest-rerunfailures
                         python-pytest-subprocess
                         python-pytest-timeout
                         python-re-ver
                         python-requests
                         python-restructuredtext-lint
                         python-tomli
                         python-virtualenv))
    (home-page #f)
    (synopsis "Python-powered shell. Full-featured and cross-platform.")
    (description "Python-powered shell.  Full-featured and cross-platform.")
    (license #f)))

(define-public python-vprof
  (package
    (name "python-vprof")
    (version "0.38")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "vprof" version))
       (sha256
        (base32 "1nzs1za7b8891g6apm81zz85mx4sffbcrlwlgh64aypb5s8h043z"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-psutil))
    (home-page "http://github.com/nvdv/vprof")
    (synopsis "Visual profiler for Python")
    (description "Visual profiler for Python.")
    (license license:bsd-3)))

(define-public python-types-backports
  (package
    (name "python-types-backports")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "types-backports" version))
       (sha256
        (base32 "1kqh00najbvvff4v4vx6rmhgv1b1a0kks7l901i8vy1x0xn21dzl"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/python/typeshed")
    (synopsis "Typing stubs for backports")
    (description "Typing stubs for backports.")
    (license #f)))

(define-public python-pywinpty
  (package
    (name "python-pywinpty")
    (version "2.0.13")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pywinpty" version))
       (sha256
        (base32 "1phxyja9bsm3fb9i9j2azqr0v1jwhdzx48yssz8ds4rk38sk4kn3"))))
    (build-system pyproject-build-system)
    (home-page "")
    (synopsis "Pseudo terminal support for Windows from Python.")
    (description "Pseudo terminal support for Windows from Python.")
    (license license:expat)))

(define-public python-pyright
  (package
    (name "python-pyright")
    (version "1.1.376")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyright" version))
       (sha256
        (base32 "1palx50whsgd8ib0xykbvxfsi58zn035q95kbcwi026djyqn7zdz"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-nodeenv python-twine
                             python-typing-extensions))
    (home-page "https://github.com/RobertCraigie/pyright-python")
    (synopsis "Command line wrapper for pyright")
    (description "Command line wrapper for pyright.")
    (license license:expat)))

(define-public python-py-spy
  (package
    (name "python-py-spy")
    (version "0.3.14")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "py-spy" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/benfred/py-spy")
    (synopsis "Sampling profiler for Python programs")
    (description "Sampling profiler for Python programs.")
    (license license:expat)))

(define-public python-url-normalize
  (package
    (name "python-url-normalize")
    (version "1.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "url-normalize" version))
       (sha256
        (base32 "1clrr7xc1qlxph0v90w7ag6x2246izka0n8w7aw6fan5183klgfj"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-six))
    (home-page "https://github.com/niksite/url-normalize")
    (synopsis "URL normalization for Python")
    (description "URL normalization for Python.")
    (license license:expat)))

(define-public python-sphinxemoji
  (package
    (name "python-sphinxemoji")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinxemoji" version))
       (sha256
        (base32 "049vvabhlilis7gs264sgkcwx0fsny357d43j3j96lvn3qgzzv13"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-sphinx))
    (home-page "")
    (synopsis "An extension to use emoji codes in your Sphinx documentation")
    (description
     "An extension to use emoji codes in your Sphinx documentation.")
    (license #f)))

(define-public python-sphinx-autoapi
  (package
    (name "python-sphinx-autoapi")
    (version "3.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinx_autoapi" version))
       (sha256
        (base32 "143by55awv935kvnw4ja63n2q11cxnz4lr6mzb8m6mldm6rmd78z"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-astroid python-jinja2 python-pyyaml
                             python-sphinx))
    (home-page "http://github.com/readthedocs/sphinx-autoapi")
    (synopsis "Sphinx API documentation generator")
    (description "Sphinx API documentation generator.")
    (license license:expat)))

(define-public python-sphinx-notfound-page
  (package
    (name "python-sphinx-notfound-page")
    (version "1.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinx_notfound_page" version))
       (sha256
        (base32 "1bjsqbzb9v53p7ng9aq0hl4i8xrnrj8ibpkj83kc9db7sffg8lia"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-sphinx
                             python-sphinx-autoapi
                             python-sphinx-rtd-theme
                             python-sphinx-tabs
                             python-sphinxemoji
                             python-tox))
    (home-page #f)
    (synopsis "Sphinx extension to build a 404 page with absolute URLs")
    (description "Sphinx extension to build a 404 page with absolute URLs.")
    (license #f)))

(define-public python-pydantic-extra-types
  (package
    (name "python-pydantic-extra-types")
    (version "2.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pydantic_extra_types" version))
       (sha256
        (base32 "0fxs05kb048jpcfgxqpdpz7vh9zkj79xqs7kd6xl71qq6qbc0qg0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pydantic))
    (home-page #f)
    (synopsis "Extra Pydantic types.")
    (description "Extra Pydantic types.")
    (license #f)))

(define-public python-sphinx-immaterial
  (package
    (name "python-sphinx-immaterial")
    (version "0.12.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinx_immaterial" version))
       (sha256
        (base32 "1i1y5ypvk12475mqlmb5360x878198fpz7nf0jpa7j7zinqz41hc"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-appdirs
                             python-markupsafe
                             python-pydantic
                             python-pydantic-extra-types
                             python-requests
                             python-sphinx
                             python-typing-extensions))
    (home-page "https://github.com/jbms/sphinx-immaterial")
    (synopsis
     "Adaptation of mkdocs-material theme for the Sphinx documentation system")
    (description
     "Adaptation of mkdocs-material theme for the Sphinx documentation system.")
    (license license:expat)))

(define-public python-sphinxcontrib-youtube
  (package
    (name "python-sphinxcontrib-youtube")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinxcontrib_youtube" version))
       (sha256
        (base32 "0nc0z0ic0nwfzawlbgp89dawwnzrnxa56q97jxf2pza7mz472y7b"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-beautifulsoup4
                             python-nox
                             python-pydata-sphinx-theme
                             python-pytest
                             python-pytest-cov
                             python-pytest-regressions
                             python-requests
                             python-sphinx
                             python-sphinx-copybutton
                             ;python-sphinx-design ;cycle
                             ))
    (home-page "")
    (synopsis "Sphinx \"youtube\" extension.")
    (description "Sphinx \"youtube\" extension.")
    (license #f)))

(define-public python-sphinx-thebe
  (package
    (name "python-sphinx-thebe")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinx_thebe" version))
       (sha256
        (base32 "14x44n721gb5i8d573sv3kzdr55h3q5j05azm9j2zs30aps4fq2p"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-sphinx))
    (native-inputs (list python-beautifulsoup4
                         python-matplotlib
                         ;python-myst-nb ;cycle
                         python-pytest
                         python-pytest-regressions
                         python-sphinx-copybutton
                         python-sphinx-design))
    (home-page "")
    (synopsis
     "Integrate interactive code blocks into your documentation with Thebe and Binder.")
    (description
     "Integrate interactive code blocks into your documentation with Thebe and Binder.")
    (license #f)))

(define-public python-sphinx-togglebutton
  (package
    (name "python-sphinx-togglebutton")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinx-togglebutton" version))
       (sha256
        (base32 "0ynwb4jl982gqchxa4lxdvx2gi3jhh3msbc0i561xc17chv8n35b"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-docutils python-sphinx
                             python-wheel)) ; FIXME it had some other dep
    (home-page "https://github.com/executablebooks/sphinx-togglebutton")
    (synopsis "Toggle page content and collapse admonitions in Sphinx.")
    (description "Toggle page content and collapse admonitions in Sphinx.")
    (license license:expat)))

(define-public python-sphinx-thebe
  (package
    (name "python-sphinx-thebe")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinx_thebe" version))
       (sha256
        (base32 "14x44n721gb5i8d573sv3kzdr55h3q5j05azm9j2zs30aps4fq2p"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-sphinx))
    (native-inputs (list python-beautifulsoup4
                         python-matplotlib
                         ;python-myst-nb ;cycle
                         python-pytest
                         python-pytest-regressions
                         python-sphinx-copybutton
                                        ;python-sphinx-design ;cycle
                         ))
    (home-page "")
    (synopsis
     "Integrate interactive code blocks into your documentation with Thebe and Binder.")
    (description
     "Integrate interactive code blocks into your documentation with Thebe and Binder.")
    (license #f)))

(define-public python-sphinx-examples
  (package
    (name "python-sphinx-examples")
    (version "0.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinx-examples" version))
       (sha256
        (base32 "1x1zz7mckgigiqnc1zashwnppyx9f9i5y4ih175bd5yywsjp49sm"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-furo
                             python-myst-parser
                             python-sphinx
                             python-sphinx-book-theme
                             python-sphinx-copybutton
                             python-sphinx-design
                             python-sphinx-rtd-theme))
    (home-page #f)
    (synopsis
     "A lightweight example directive to make it easy to demonstrate code / results.")
    (description
     "This package provides a lightweight example directive to make it easy to
demonstrate code / results.")
    (license #f)))

(define-public python-pybtex-docutils
  (package
    (name "python-pybtex-docutils")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pybtex-docutils" version))
       (sha256
        (base32 "0srwv58lv5ncb9qj8493hhnxk9dw42dalf65q7l00gjr5gwvszis"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-docutils python-pybtex))
    (home-page "https://github.com/mcmtroffaes/pybtex-docutils")
    (synopsis "A docutils backend for pybtex.")
    (description "This package provides a docutils backend for pybtex.")
    (license license:expat)))

(define-public python-sphinxcontrib-bibtex
  (package
    (name "python-sphinxcontrib-bibtex")
    (version "2.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinxcontrib-bibtex" version))
       (sha256
        (base32 "1bkhimgly9r4jwvs401hqjz69lm7ac4hf5vagpxqpwin8dlsz1zl"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-dataclasses
                             python-docutils
                             python-importlib-metadata
                             python-pybtex
                             python-pybtex-docutils
                             python-sphinx))
    (home-page "https://github.com/mcmtroffaes/sphinxcontrib-bibtex")
    (synopsis "Sphinx extension for BibTeX style citations.")
    (description "Sphinx extension for @code{BibTeX} style citations.")
    (license license:bsd-3)))

(define-public python-jupyter-cache
  (package
    (name "python-jupyter-cache")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "jupyter_cache" version))
       (sha256
        (base32 "11w6yhhnadd914n64bxjscp3ihd8d61332c8ilcrhmyd6dspvynh"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-attrs
                             python-click
                             python-click-log
                             python-coverage
                             python-importlib-metadata
                             python-ipykernel
                             python-jupytext
                             python-matplotlib
                             ;python-myst-nb ;cycle
                             python-nbclient
                             python-nbdime
                             python-nbformat
                             python-numpy
                             python-pandas
                             python-pre-commit
                             python-pytest
                             python-pytest-cov
                             python-pytest-regressions
                             python-pyyaml
                             python-sphinx-book-theme
                             python-sphinx-copybutton
                             python-sqlalchemy
                             python-sympy
                             python-tabulate))
    (home-page #f)
    (synopsis
     "A defined interface for working with a cache of jupyter notebooks.")
    (description
     "This package provides a defined interface for working with a cache of jupyter
notebooks.")
    (license #f)))

(define-public python-myst-nb
  (package
    (name "python-myst-nb")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "myst_nb" version))
       (sha256
        (base32 "0lz5r71whas128lhl8zgxm6lzfb1n5cqcy5p8d7lj0vdyw8pq8kl"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-alabaster
                             python-altair
                             python-beautifulsoup4
                             python-bokeh
                             python-coconut
                             python-coverage
                             python-importlib-metadata
                             python-ipykernel
                             python-ipython
                             python-ipywidgets
                             python-jupyter-cache
                             python-jupytext
                             python-matplotlib
                             python-myst-parser
                             python-nbclient
                             python-nbdime
                             python-nbformat
                             python-numpy
                             python-pandas
                             python-plotly
                             python-pre-commit
                             python-pyarrow
                             python-pytest
                             python-pytest-cov
                             python-pytest-param-files
                             python-pytest-regressions
                             python-pyyaml
                             python-sphinx
                             python-sphinx-book-theme
                             python-sphinx-copybutton
                             python-sphinx-design
                             python-sphinxcontrib-bibtex
                             python-sympy
                             python-typing-extensions))
    (home-page #f)
    (synopsis
     "A Jupyter Notebook Sphinx reader built on top of the MyST markdown parser.")
    (description
     "This package provides a Jupyter Notebook Sphinx reader built on top of the
@code{MyST} markdown parser.")
    (license #f)))

(define-public python-feedgen
  (package
    (name "python-feedgen")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "feedgen" version))
       (sha256
        (base32 "0sjljdip5ffkwphqh49irhprywic9n671hwq56js4mp9np1m3gfr"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-lxml python-dateutil))
    (home-page "https://lkiesow.github.io/python-feedgen")
    (synopsis "Feed Generator (ATOM, RSS, Podcasts)")
    (description "Feed Generator (ATOM, RSS, Podcasts).")
    (license #f)))

(define-public python-ablog
  (package
    (name "python-ablog")
    (version "0.11.11")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ablog" version))
       (sha256
        (base32 "0ifisk89rrij0lhzzgpqkqv2c7a6abfv43q13qmw6ldz091vqdm2"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-alabaster
                             python-defusedxml
                             python-docutils
                             python-feedgen
                             python-invoke
                             python-ipython
                             python-myst-parser
                             python-nbsphinx
                             python-packaging
                             python-pytest
                             python-dateutil
                             python-sphinx
                             python-sphinx-automodapi
                             python-watchdog))
    (home-page "https://ablog.readthedocs.io/")
    (synopsis
     "A Sphinx extension that converts any documentation or personal website project into a full-fledged blog.")
    (description
     "This package provides a Sphinx extension that converts any documentation or
personal website project into a full-fledged blog.")
    (license license:expat)))

(define-public python-sphinx-book-theme
  (package
    (name "python-sphinx-book-theme")
    (version "1.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinx_book_theme" version))
       (sha256
        (base32 "0kavxw5aw08fm5ymsrj5z2ng8cdh8lxipikb78skvjs630xlh98z"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-ablog
                             python-beautifulsoup4
                             python-coverage
                             python-defusedxml
                             python-folium
                             python-ipywidgets
                             python-matplotlib
                             ;python-myst-nb ; cycle
                             python-nbclient
                             python-numpy
                             python-numpydoc
                             python-pandas
                             python-plotly
                             python-pre-commit
                             python-pydata-sphinx-theme
                             python-pytest
                             python-pytest-cov
                             python-pytest-regressions
                             python-sphinx
                             python-sphinx-copybutton
                             ;python-sphinx-design ;cycle
                             ;python-sphinx-examples ;cycle
                             python-sphinx-tabs
                             python-sphinx-thebe
                             python-sphinx-togglebutton
                             python-sphinx-thebe
                             python-sphinxcontrib-bibtex
                             python-sphinxcontrib-youtube
                             python-sphinxext-opengraph))
    (home-page #f)
    (synopsis
     "A clean book theme for scientific explanations and documentation with Sphinx")
    (description
     "This package provides a clean book theme for scientific explanations and
documentation with Sphinx.")
    (license #f)))

(define-public python-sphinx-design
  (package
    (name "python-sphinx-design")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinx_design" version))
       (sha256
        (base32 "0cp6higx83rcfig3lyqx8bwfdcx2miy2ba61cpbh8v9q34vylkml"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-defusedxml
                             python-furo
                             python-myst-parser
                             python-pre-commit
                             python-pydata-sphinx-theme
                             python-pytest
                             python-pytest-cov
                             python-pytest-regressions
                             python-sphinx
                             python-sphinx-book-theme
                             python-sphinx-immaterial
                             python-sphinx-rtd-theme))
    (home-page #f)
    (synopsis
     "A sphinx extension for designing beautiful, view size responsive web components.")
    (description
     "This package provides a sphinx extension for designing beautiful, view size
responsive web components.")
    (license #f)))

(define-public python-sphinx-automodapi
  (package
    (name "python-sphinx-automodapi")
    (version "0.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinx-automodapi" version))
       (sha256
        (base32 "1893qiaq7sjn25dp7d4009cqp3wcy9fbpwnr968smm5daynsvkbw"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-sphinx))
    (native-inputs (list python-coverage python-cython python-pytest
                         python-pytest-cov)) ; FIXME it had some other dep
    (home-page "https://github.com/astropy/sphinx-automodapi")
    (synopsis
     "Sphinx extension for auto-generating API documentation for entire modules")
    (description
     "Sphinx extension for auto-generating API documentation for entire modules.")
    (license #f)))

(define-public python-requests-cache
  (package
    (name "python-requests-cache")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "requests_cache" version))
       (sha256
        (base32 "1l8i4l2pd26gbrlcdb5z056wvsqfr3vvbyqq2f8x1f65zn3ckav8"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-attrs
                             python-boto3
                             python-botocore
                             python-bson
                             python-cattrs
                             python-furo
                             python-itsdangerous
                             python-linkify-it-py
                             python-myst-parser
                             python-platformdirs
                             python-pymongo
                             python-pyyaml
                             python-redis
                             python-requests
                             python-sphinx
                             python-sphinx-autodoc-typehints
                             python-sphinx-automodapi
                             python-sphinx-copybutton
                             python-sphinx-design
                             python-sphinx-notfound-page
                             python-sphinxcontrib-apidoc
                             python-sphinxext-opengraph
                             python-ujson
                             python-url-normalize
                             python-urllib3))
    (home-page "https://github.com/requests-cache/requests-cache")
    (synopsis "A persistent cache for python requests")
    (description
     "This package provides a persistent cache for python requests.")
    (license license:bsd-2)))

(define-public python-hatch
  (package
    (name "python-hatch")
    (version "1.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "hatch" version))
       (sha256
        (base32 "1bgnicfgig9ih8vpcjyfvpn3mlyl5sy977359nsg4b9i226lg05f"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-click
                             python-hatchling
                             python-httpx
                             python-hyperlink
                             python-keyring
                             python-packaging
                             python-pexpect
                             python-platformdirs
                             python-rich
                             python-shellingham
                             python-tomli-w
                             python-tomlkit
                             python-userpath
                             python-uv
                             python-virtualenv
                             python-zstandard))
    (home-page #f)
    (synopsis "Modern, extensible Python project management")
    (description "Modern, extensible Python project management.")
    (license #f)))

(define-public python-uv
  (package
    (name "python-uv")
    (version "0.2.37")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "uv" version))
       (sha256
        (base32 "0c4wyyz2v5q67m28nzivrzbbj7cqirbdj2q72vyjgh5lfvr0kd20"))))
    (build-system pyproject-build-system)
    (home-page "https://pypi.org/project/uv/")
    (synopsis
     "An extremely fast Python package installer and resolver, written in Rust.")
    (description
     "An extremely fast Python package installer and resolver, written in Rust.")
    (license #f)))

(define-public python-sphinx-argparse-cli
  (package
    (name "python-sphinx-argparse-cli")
    (version "1.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinx_argparse_cli" version))
       (sha256
        (base32 "0kys96nb5y8353vh9lmccbw46z1w9a9j47913qyi3fjnjwsisapk"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-sphinx))
    (native-inputs (list python-covdefaults python-defusedxml python-pytest
                         python-pytest-cov))
    (home-page #f)
    (synopsis
     "render CLI arguments (sub-commands friendly) defined by argparse module")
    (description
     "render CLI arguments (sub-commands friendly) defined by argparse module.")
    (license #f)))

(define-public python-furo
  (package
    (name "python-furo")
    (version "2024.8.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "furo" version))
       (sha256
        (base32 "00aa740hwsviq4j4sdynljnhp1balx2ksfn07dni7hxzibp4qgmn"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-beautifulsoup4 python-pygments
                             python-sphinx python-sphinx-basic-ng))
    (home-page #f)
    (synopsis "A clean customisable Sphinx documentation theme.")
    (description
     "This package provides a clean customisable Sphinx documentation theme.")
    (license #f)))

(define-public python-build
  (package
    (name "python-build")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "build" version))
       (sha256
        (base32 "17g1wcx8f7h0db3ymwdni1sjnyrpfna5fi9m8dng49hchzs66qjj"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list 
                             python-colorama
                             python-filelock
                             python-furo
                             python-importlib-metadata
                             python-mypy
                             python-packaging
                             python-pyproject-hooks
                             python-pytest
                             python-pytest-cov
                             python-pytest-mock
                             python-pytest-rerunfailures
                             python-pytest-xdist
                             python-sphinx
                             python-sphinx-argparse-cli
                             python-sphinx-autodoc-typehints
                             python-sphinx-issues
                             python-tomli
                             python-typing-extensions
                             python-uv
                             python-virtualenv
                             python-wheel))
    (home-page #f)
    (synopsis "A simple, correct Python build frontend")
    (description
     "This package provides a simple, correct Python build frontend.")
    (license #f)))

(define-public python-pytest-jupyter
  (package
    (name "python-pytest-jupyter")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytest_jupyter" version))
       (sha256
        (base32 "114y9py29j6p2iymhc3vj55x65gg1ncbhwal5mads0g2z7p59pq0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-jupyter-core python-pytest))
    (native-inputs (list python-pytest-timeout))
    (home-page #f)
    (synopsis "A pytest plugin for testing Jupyter libraries and extensions.")
    (description
     "This package provides a pytest plugin for testing Jupyter libraries and
extensions.")
    (license #f)))

(define-public python-notebook-shim
  (package
    (name "python-notebook-shim")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "notebook_shim" version))
       (sha256
        (base32 "1jrqqrm5xjwsx13plyyh7wybb1g71yrzaqa3l9y3162xnshwzcml"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-jupyter-server))
    (native-inputs (list python-pytest python-pytest-console-scripts
                         python-pytest-jupyter python-pytest-tornasync))
    (home-page "")
    (synopsis "A shim layer for notebook traits and config")
    (description
     "This package provides a shim layer for notebook traits and config.")
    (license #f)))

(define-public python-jupyter-lsp
  (package
    (name "python-jupyter-lsp")
    (version "2.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "jupyter-lsp" version))
       (sha256
        (base32 "00ahai7wp0m98glpqsrd1bymcllzkb8irvskzl4zhinlbah4fcbr"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-importlib-metadata python-jupyter-server))
    (home-page #f)
    (synopsis
     "Multi-Language Server WebSocket proxy for Jupyter Notebook/Lab server")
    (description
     "Multi-Language Server @code{WebSocket} proxy for Jupyter Notebook/Lab server.")
    (license #f)))

(define-public python-async-lru
  (package
    (name "python-async-lru")
    (version "2.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "async-lru" version))
       (sha256
        (base32 "09sn3bc3gc2flijm9k8kn4hmbnlkaddhqahb49izy188yrfrm9dq"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-typing-extensions))
    (home-page "https://github.com/aio-libs/async-lru")
    (synopsis "Simple LRU cache for asyncio")
    (description "Simple LRU cache for asyncio.")
    (license license:expat)))

(define-public python-jupyterlab
  (package
    (name "python-jupyterlab")
    (version "4.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "jupyterlab" version))
       (sha256
        (base32 "0dr5gzdgwynwmz6rn150fb81qa030wr3x0hihn6d0bsqp6grffil"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-async-lru ; FIXME it had some other dep
                             python-httpx
                             python-importlib-metadata
                             python-importlib-resources
                             python-ipykernel
                             python-jinja2
                             python-jupyter-core
                             python-jupyter-lsp
                             python-jupyter-server
                             python-jupyterlab-server
                             python-notebook-shim
                             python-packaging
                             python-tomli
                             python-tornado
                             python-traitlets))
    (native-inputs (list python-build
                         python-bump2version
                         python-coverage
                         python-hatch
                         python-pre-commit
                         python-pytest
                         python-pytest-check-links
                         python-pytest-console-scripts
                         python-pytest-cov
                         python-pytest-jupyter
                         python-pytest-timeout
                         python-pytest-tornasync
                         python-requests
                         python-requests-cache
                         python-ruff
                         python-virtualenv))
    (home-page #f)
    (synopsis "JupyterLab computational environment")
    (description "@code{JupyterLab} computational environment.")
    (license #f)))

(define-public python-jupyter
  (package
    (name "python-jupyter")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "jupyter" version))
       (sha256
        (base32 "0pwf3pminkzyzgx5kcplvvbvwrrzd3baa7lmh96f647k30rlpp6r"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-ipykernel
                             python-ipywidgets
                             python-jupyter-console
                             python-nbconvert
                             python-notebook
                             python-qtconsole))
    (home-page "http://jupyter.org")
    (synopsis
     "Jupyter metapackage. Install all the Jupyter components in one go.")
    (description
     "Jupyter metapackage.  Install all the Jupyter components in one go.")
    (license license:bsd-3)))

(define-public python-typing
  (package
    (name "python-typing")
    (version "3.10.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "typing" version))
       (sha256
        (base32 "0c5il4d68fd4qrm5k3dps70j0xz0n5krj6lhwn9vzpal3whsvd0k"))))
    (build-system pyproject-build-system)
    (home-page "https://docs.python.org/3/library/typing.html")
    (synopsis "Type Hints for Python")
    (description "Type Hints for Python.")
    (license #f)))

(define-public python-trollius
  (package
    (name "python-trollius")
    (version "2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "trollius" version))
       (sha256
        (base32 "1jhhqgay8ylaf3lrjwjgp2v08lbgn0xvjx896a9k52f5h17bj9g5"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-futures python-six))
    (home-page "https://github.com/jamadden/trollius")
    (synopsis
     "Deprecated, unmaintained port of the asyncio module (PEP 3156) on Python 2")
    (description
     "Deprecated, unmaintained port of the asyncio module (PEP 3156) on Python 2.")
    (license #f)))

(define-public python-futures
  (package
    (name "python-futures")
    (version "3.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "futures" version))
       (sha256
        (base32 "1lpx31mgbdh911wf89z4bm04aqiadf6xph9rfnm4fmdqs7ncxj1y"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/agronholm/pythonfutures")
    (synopsis "Backport of the concurrent.futures package from Python 3")
    (description "Backport of the concurrent.futures package from Python 3.")
    (license #f)))

(define-public python-cpyparsing
  (package
    (name "python-cpyparsing")
    (version "2.4.7.2.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "cpyparsing" version))
       (sha256
        (base32 "0zgfy9jp20gk0092xfnrllkm36153dynhc81chm2bb8j4wk2yggf"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/evhub/cpyparsing")
    (synopsis "Cython implementation of PyParsing for use in Coconut.")
    (description
     "Cython implementation of @code{PyParsing} for use in Coconut.")
    (license #f)))

(define-public python-pytest-ruff
  (package
    (name "python-pytest-ruff")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytest_ruff" version))
       (sha256
        (base32 "1dvyiwkvxbnnybapvp9hjp9pj7mgry3fqlhvi2f24k1qbzqk16ic"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pytest python-ruff))
    (home-page #f)
    (synopsis "pytest plugin to check ruff requirements.")
    (description "pytest plugin to check ruff requirements.")
    (license #f)))

(define-public python-jaraco.classes
  (package
    (name "python-jaraco.classes")
    (version "3.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "jaraco.classes" version))
       (sha256
        (base32 "1k9s7wxhsy15730qab8bry7kpgl4yk3wch45ikfw0f823nsj9827"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-more-itertools))
    (native-inputs (list python-pytest
                         python-pytest-checkdocs
                         python-pytest-cov
                         python-pytest-enabler
                         python-pytest-mypy
                         python-pytest-ruff))
    (home-page "https://github.com/jaraco/jaraco.classes")
    (synopsis "Utility functions for Python class constructs")
    (description "Utility functions for Python class constructs.")
    (license #f)))

(define-public python-jaraco.functools
  (package
    (name "python-jaraco.functools")
    (version "4.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "jaraco.functools" version))
       (sha256
        (base32 "1x935ssc9mmfca51bx91gardar23gi9b7fvnjlmzhayks16cfq1l"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-more-itertools))
    (native-inputs (list python-jaraco.classes
                         python-pytest
                         python-pytest-checkdocs
                         python-pytest-cov
                         python-pytest-enabler
                         python-pytest-mypy
                         python-pytest-ruff))
    (home-page #f)
    (synopsis "Functools like those found in stdlib")
    (description "Functools like those found in stdlib.")
    (license #f)))

(define-public python-jaraco.text
  (package
    (name "python-jaraco.text")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "jaraco.text" version))
       (sha256
        (base32 "1c0dy5jvhigcyryi2h8n1m87dnhyxr7w01n9shwzkdlslv7gwwav"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-autocommand python-importlib-resources
                             ;python-jaraco.context ;cycle
                             python-jaraco.functools
                             python-more-itertools))
    (native-inputs (list python-pathlib2
                         python-pytest
                         python-pytest-checkdocs
                         python-pytest-cov
                         ;python-pytest-enabler ; cycle
                         python-pytest-mypy
                         python-pytest-ruff))
    (home-page #f)
    (synopsis "Module for text manipulation")
    (description "Module for text manipulation.")
    (license #f)))

(define-public python-jaraco.collections
  (package
    (name "python-jaraco.collections")
    (version "5.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "jaraco.collections" version))
       (sha256
        (base32 "1ykc3aw47p4qc1r1bxx08y05vhfzc8pxd414b4m4wjmqfjqk31l0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-jaraco.text))
    (native-inputs (list python-pytest
                         python-pytest-checkdocs
                         python-pytest-cov
                         ;python-pytest-enabler ;cycle
                         python-pytest-mypy
                         python-pytest-ruff))
    (home-page "https://github.com/jaraco/jaraco.collections")
    (synopsis "Collection objects similar to those in stdlib by jaraco")
    (description "Collection objects similar to those in stdlib by jaraco.")
    (license #f)))

(define-public python-jaraco.test
  (package
    (name "python-jaraco.test")
    (version "5.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "jaraco.test" version))
       (sha256
        (base32 "1hky66x96c14a0lj2fq7qhgv7bc92x35q4fn8x2cbbaqhy3l7lyv"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-jaraco.collections python-jaraco.context
                             python-jaraco.functools))
    (native-inputs (list python-pytest
                         python-pytest-checkdocs
                         python-pytest-cov
                         ;python-pytest-enabler ;cycle
                         python-pytest-mypy
                         python-pytest-ruff))
    (home-page "https://github.com/jaraco/jaraco.test")
    (synopsis "Testing support by jaraco")
    (description "Testing support by jaraco.")
    (license #f)))

(define-public python-backports.tarfile
  (package
    (name "python-backports.tarfile")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "backports.tarfile" version))
       (sha256
        (base32 "14d9xibla5aahjqf9y0nmpk5vs4qds5rfy628j0invkld3104pnp"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-jaraco.test python-pytest
                         python-pytest-checkdocs python-pytest-cov
                         python-pytest-enabler))
    (home-page #f)
    (synopsis "Backport of CPython tarfile module")
    (description "Backport of CPython tarfile module.")
    (license #f)))

(define-public python-jaraco.context
  (package
    (name "python-jaraco.context")
    (version "5.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "jaraco.context" version))
       (sha256
        (base32 "1lkn6mv90pxkdzh8mr7fi9m69hfzirfz4l7n687y56qzrrjp3xn2"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-backports.tarfile))
    (native-inputs (list python-portend
                         python-pytest
                         python-pytest-checkdocs
                         python-pytest-cov
                         ;python-pytest-enabler ; cycle
                         python-pytest-mypy
                         python-pytest-ruff))
    (home-page "https://github.com/jaraco/jaraco.context")
    (synopsis "Useful decorators and context managers")
    (description "Useful decorators and context managers.")
    (license #f)))

(define-public python-pytest-enabler
  (package
    (name "python-pytest-enabler")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytest-enabler" version))
       (sha256
        (base32 "10sl68566yhgxg0hkfbpiq5ll4f29r3v8g8w7yxgj0b8f5z1b8cy"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-importlib-resources
                             ;python-jaraco.context ; cycle
                             ;python-jaraco.functools ; cycle
                             python-toml))
    (native-inputs (list python-pytest
                         python-pytest-checkdocs
                         python-pytest-cov
                         python-pytest-mypy
                         python-pytest-ruff
                         python-types-toml))
    (home-page "https://github.com/jaraco/pytest-enabler")
    (synopsis "Enable installed pytest plugins")
    (description "Enable installed pytest plugins.")
    (license #f)))

(define-public python-backports.functools-lru-cache
  (package
    (name "python-backports.functools-lru-cache")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "backports.functools_lru_cache" version))
       (sha256
        (base32 "16bggzq8n97xg3xw2xmgylfxgsiysckf1j87i0b19878vbhabgyw"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-pytest
                         python-pytest-black
                         python-pytest-checkdocs
                         python-pytest-cov
                         python-pytest-enabler
                         python-pytest-mypy
                         python-pytest-ruff))
    (home-page "https://github.com/jaraco/backports.functools_lru_cache")
    (synopsis "Backport of functools.lru_cache")
    (description "Backport of functools.lru_cache.")
    (license #f)))

(define-public python-coconut
  (package
    (name "python-coconut")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "coconut" version))
       (sha256
        (base32 "1wnlxgn868da1y9fbvgw4k3k7125nv2ybvqc1gg9s6sz8q1gbi8l"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-aenum ; FIXME it had some other dep
                             python-anyio
                             python-async-generator
                             python-backports.functools-lru-cache
                             python-cpyparsing
                             python-dataclasses
                             python-exceptiongroup
                             python-futures
                             python-prompt-toolkit
                             python-psutil
                             python-pygments
                             python-pyparsing
                             python-trollius
                             python-typing
                             python-typing-extensions))
    (native-inputs (list python-ipykernel
                         python-ipython
                         python-jedi
                         python-jupyter
                         python-jupyter-client
                         python-jupyter-console
                         python-jupyterlab
                         python-jupytext
                         python-mypy
                         python-myst-parser
                         python-numpy
                         python-pandas
                         python-papermill
                         python-pexpect
                         python-pre-commit
                         python-py-spy
                         python-pydata-sphinx-theme
                         python-pygments
                         python-pyparsing
                         python-pyright
                         python-pytest
                         python-pywinpty
                         python-requests
                         python-sphinx
                         python-types-backports
                         python-typing
                         python-vprof
                         python-watchdog
                         python-xarray
                         python-xonsh))
    (home-page "http://coconut-lang.org")
    (synopsis "Simple, elegant, Pythonic functional programming.")
    (description "Simple, elegant, Pythonic functional programming.")
    (license license:asl2.0)))

(define-public python-alabaster
  (package
    (name "python-alabaster")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "alabaster" version))
       (sha256
        (base32 "17px8hhvngzx732yjczykdp04gjzwv69y2kxdlmacvx2pibwl3f0"))))
    (build-system pyproject-build-system)
    (home-page #f)
    (synopsis "A light, configurable Sphinx theme")
    (description "This package provides a light, configurable Sphinx theme.")
    (license #f)))

(define-public python-myst-nb
  (package
    (name "python-myst-nb")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "myst_nb" version))
       (sha256
        (base32 "0lz5r71whas128lhl8zgxm6lzfb1n5cqcy5p8d7lj0vdyw8pq8kl"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-alabaster
                             python-altair
                             python-beautifulsoup4
                             python-bokeh
                             python-coconut
                             python-coverage
                             python-importlib-metadata
                             python-ipykernel
                             python-ipython
                             python-ipywidgets
                             python-jupyter-cache
                             python-jupytext
                             python-matplotlib
                             python-myst-parser
                             python-nbclient
                             python-nbdime
                             python-nbformat
                             python-numpy
                             python-pandas
                             python-plotly
                             python-pre-commit
                             python-pyarrow
                             python-pytest
                             python-pytest-cov
                             python-pytest-param-files
                             python-pytest-regressions
                             python-pyyaml
                             python-sphinx
                             python-sphinx-book-theme
                             python-sphinx-copybutton
                             python-sphinx-design
                             python-sphinxcontrib-bibtex
                             python-sympy
                             python-typing-extensions))
    (home-page #f)
    (synopsis
     "A Jupyter Notebook Sphinx reader built on top of the MyST markdown parser.")
    (description
     "This package provides a Jupyter Notebook Sphinx reader built on top of the
@code{MyST} markdown parser.")
    (license #f)))

(define-public python-sphinx-apitree
  (package
    (name "python-sphinx-apitree")
    (version "1.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinx_apitree" version))
       (sha256
        (base32 "0xa1ajy1kydw6rmpqy213vmx10v5hj7wg5riv8yij2qy17ccy4dl"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list ;python-etils ;cycle
                             python-myst-nb
                             python-pyink
                             python-pylint
                             python-pytest
                             python-pytest-xdist
                             python-sphinx
                             python-sphinx-book-theme
                             python-typing-extensions))
    (home-page "")
    (synopsis "Sphinx extension to auto-generate API tree.")
    (description "Sphinx extension to auto-generate API tree.")
    (license #f)))

(define-public python-lark
  (package
    (name "python-lark")
    (version "1.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "lark" version))
       (sha256
        (base32 "107d1w24b3ln4zwsw4yvkfhff6bk5n3cpvlgbbqww5ndc80pv06a"))))
    (build-system pyproject-build-system)
    (home-page #f)
    (synopsis "a modern parsing library")
    (description "a modern parsing library.")
    (license license:expat)))

(define-public python-dataclass-array
  (package
    (name "python-dataclass-array")
    (version "1.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "dataclass_array" version))
       (sha256
        (base32 "153v23c6zfjw58l02yr57gvz5ds8x8fv7d3gv774m74c2d3khd1r"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-chex
                             ;python-dataclass-array
                             python-einops
                             ;python-etils ; cycle
                             python-jax
                             python-lark
                             python-numpy
                             python-pyink
                             python-pylint
                             python-pytest
                             python-pytest-xdist
                             python-sphinx-apitree
                             python-tf-nightly
                             python-torch
                             python-typing-extensions))
    (home-page "")
    (synopsis
     "Dataclasses that behave like numpy arrays (with indexing, slicing, vectorization).")
    (description
     "Dataclasses that behave like numpy arrays (with indexing, slicing,
vectorization).")
    (license #f)))

(define-public python-etils
  (package
    (name "python-etils")
    (version "1.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "etils" version))
       (sha256
        (base32 "0yb3kn5pxqjig7skc3yqsdpqfkncydm89h3anh229k60q1dd7p0m"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py
                             python-chex
                             python-dataclass-array
                             python-dm-tree
                             python-fsspec
                             python-gcsfs
                             python-importlib-resources
                             python-jax
                             python-jupyter
                             python-mediapy
                             python-numpy
                             python-optree
                             python-packaging
                             python-protobuf
                             python-pydantic
                             python-pyink
                             python-pylint
                             python-pytest
                             python-pytest-subtests
                             python-pytest-xdist
                             python-s3fs
                             python-simple-parsing
                             python-sphinx-apitree
                             python-tensorflow
                             python-torch
                             python-tqdm
                             python-typing-extensions
                             python-zipp))
    (home-page #f)
    (synopsis "Collection of common python utils")
    (description "Collection of common python utils.")
    (license #f)))

(define-public python-dp-accounting
  (package
    (name "python-dp-accounting")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "dp_accounting" version))
       (sha256
        (base32 "0qci00blh5g4ad0xh2af2iqb5kxcpfyn33ndgayjkc184vbjnqvz"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py
                             python-attrs
                             python-dm-tree
                             python-mpmath
                             python-numpy
                             python-scipy))
    (home-page "https://github.com/google/differential-privacy/")
    (synopsis "Tools for tracking differential privacy budgets")
    (description
     "This package provides tools for tracking differential privacy budgets.")
    (license license:asl2.0)))

(define-public python-chex
  (package
    (name "python-chex")
    (version "0.1.86")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "chex" version))
       (sha256
        (base32 "1lcih0vwfmjhdmffa8dhrgl63capg87pqqg1b531997b61izkc78"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py ; FIXME it had some other dep
                             python-jax
                             python-jaxlib
                             python-numpy
                             python-toolz
                             python-typing-extensions))
    (home-page "https://github.com/deepmind/chex")
    (synopsis "Chex: Testing made fun, in JAX!")
    (description "Chex: Testing made fun, in JAX!")
    (license license:asl2.0)))

(define-public python-optax
  (package
    (name "python-optax")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "optax" version))
       (sha256
        (base32 "1n81v8vrs7k9g9nlklnmgw57cz9yzfhgn90z5r8ml30b8hjvjypc"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py
                             python-attrs
                             python-chex
                             python-dm-tree
                             python-dp-accounting
                             python-etils
                             ;python-flax ;cycle
                             python-ipython
                             python-ipywidgets
                             python-jax
                             python-jaxlib
                             python-matplotlib
                             python-mpmath
                             python-myst-nb
                             python-numpy
                             python-scikit-learn
                             python-scipy
                             python-sphinx
                             python-sphinx-autodoc-typehints
                             python-sphinx-book-theme
                             python-sphinx-collections
                             python-sphinx-gallery
                             python-sphinx-contributors
                             python-sphinxcontrib-katex
                             python-tensorflow
                             ;python-tensorflow-datasets ;cycle
                             ))
    (home-page #f)
    (synopsis "A gradient processing and optimisation library in JAX.")
    (description
     "This package provides a gradient processing and optimisation library in JAX.")
    (license #f)))

(define-public python-jaxlib
  (package
    (name "python-jaxlib")
    (version "0.4.31")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "jaxlib" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-ml-dtypes python-numpy python-scipy))
    (home-page "https://github.com/google/jax")
    (synopsis "XLA library for JAX")
    (description "XLA library for JAX.")
    (license #f)))

(define-public python-jax
  (package
    (name "python-jax")
    (version "0.4.31")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "jax" version))
       (sha256
        (base32 "11y2x863kvlmg4p5pk32gspmc5irf67piw1p4y13s1x08c34fbgx"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-jaxlib python-ml-dtypes python-numpy
                             python-opt-einsum python-scipy))
    (home-page "https://github.com/google/jax")
    (synopsis "Differentiate, compile, and transform Numpy code.")
    (description "Differentiate, compile, and transform Numpy code.")
    (license #f)))

(define-public python-flax
  (package
    (name "python-flax")
    (version "0.8.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "flax" version))
       (sha256
        (base32 "16xhnb6217g7gfc02gbqps6i6ijflbmpfgd7vanv0m6f1savg72a"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-jax
                             python-msgpack
                             python-numpy
                             python-optax
                             python-orbax-checkpoint
                             python-pyyaml
                             python-rich
                             python-tensorstore
                             python-typing-extensions))
    (native-inputs (list python-black
                         python-clu
                         python-einops
                         python-gymnasium
                         python-jaxlib
                         python-jaxtyping
                         python-jraph
                         python-ml-collections
                         python-mypy
                         python-nbstripout
                         python-opencv-python
                         python-penzai
                         python-pytest
                         python-pytest-cov
                         python-pytest-custom-exit-code
                         python-pytest-xdist
                         python-pytype
                         python-sentencepiece
                         python-tensorflow
                         python-tensorflow-datasets
                         python-tensorflow-text
                         python-torch))
    (home-page #f)
    (synopsis
     "Flax: A neural network library for JAX designed for flexibility")
    (description
     "Flax: A neural network library for JAX designed for flexibility.")
    (license #f)))

(define-public python-bs4
  (package
    (name "python-bs4")
    (version "0.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "bs4" version))
       (sha256
        (base32 "099rcncbfhzykzizfmabsl0gbbbbzs1swys149vi5zjhiz2qb1m4"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-beautifulsoup4))
    (home-page #f)
    (synopsis "Dummy package for Beautiful Soup (beautifulsoup4)")
    (description "Dummy package for Beautiful Soup (beautifulsoup4).")
    (license license:expat)))

(define-public python-trectools
  (package
    (name "python-trectools")
    (version "0.0.49")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "trectools" version))
       (sha256
        (base32 "06p4c09v9kh7aaxaq56313nc9s68ip5w4066l3x0ij18mqb741ss"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-bs4
                             python-lxml
                             python-matplotlib
                             python-numpy
                             python-pandas
                             python-sarge
                             python-scikit-learn
                             python-scipy))
    (home-page "https://github.com/joaopalotti/trec_tools")
    (synopsis
     "An open-source Python library for assisting Information Retrieval (IR) practitioners with TREC-like campaigns.")
    (description
     "An open-source Python library for assisting Information Retrieval (IR)
practitioners with TREC-like campaigns.")
    (license license:bsd-3)))

(define-public python-tensorflow-io-gcs-filesystem
  (package
    (name "python-tensorflow-io-gcs-filesystem")
    (version "0.37.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tensorflow-io-gcs-filesystem" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/tensorflow/io")
    (synopsis "TensorFlow IO")
    (description "@code{TensorFlow} IO.")
    (license #f)))

(define-public python-pyink
  (package
    (name "python-pyink")
    (version "24.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyink" version))
       (sha256
        (base32 "1njd6lm2rmy5qlqizvq3w3dwr2jrnjk4jnx89cxsgz31aj3iii0a"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-black
                             python-click
                             python-mypy-extensions
                             python-packaging
                             python-pathspec
                             python-platformdirs
                             python-tomli
                             python-typing-extensions))
    (home-page #f)
    (synopsis
     "Pyink is a python formatter, forked from Black with slightly different behavior.")
    (description
     "Pyink is a python formatter, forked from Black with slightly different behavior.")
    (license license:expat)))

(define-public python-ml-dtypes
  (package
    (name "python-ml-dtypes")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ml_dtypes" version))
       (sha256
        (base32 "1ssdwz9lrn5isjfbzrq7frswcf3bhihqpjz3kyhpcwag5zkrgwga"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy))
    (native-inputs (list python-absl-py python-pyink python-pylint
                         python-pytest python-pytest-xdist))
    (home-page #f)
    (synopsis #f)
    (description #f)
    (license #f)))

(define-public python-libclang
  (package
    (name "python-libclang")
    (version "18.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "libclang" version))
       (sha256
        (base32 "0l42yyxvp7c5ngc80xhrzc3yp0mgvzcfmhvz51qxjwwds1k4j8d1"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/sighingnow/libclang")
    (synopsis
     "Clang Python Bindings, mirrored from the official LLVM repo: https://github.com/llvm/llvm-project/tree/main/clang/bindings/python, to make the installation process easier.")
    (description
     "Clang Python Bindings, mirrored from the official LLVM repo:
https://github.com/llvm/llvm-project/tree/main/clang/bindings/python, to make
the installation process easier.")
    (license #f)))

(define-public python-tensorflow
  (package
    (name "python-tensorflow")
    (version "2.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tensorflow" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py ; FIXME it had some other dep
                             python-astunparse
                             python-flatbuffers
                             python-gast
                             python-google-pasta
                             python-grpcio
                             python-h5py
                             python-keras
                             python-libclang
                             python-ml-dtypes
                             python-numpy
                             python-opt-einsum
                             python-packaging
                             python-protobuf
                             python-requests
                             python-six
                             python-tensorboard
                             python-tensorflow-io-gcs-filesystem
                             python-termcolor
                             python-typing-extensions
                             python-wrapt))
    (home-page "https://www.tensorflow.org/")
    (synopsis
     "TensorFlow is an open source machine learning framework for everyone.")
    (description
     "@code{TensorFlow} is an open source machine learning framework for everyone.")
    (license license:asl2.0)))

(define-public python-seqeval
  (package
    (name "python-seqeval")
    (version "1.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "seqeval" version))
       (sha256
        (base32 "0vvfqlz72w1rkgd3jnghhyxcy29fzww693v45g9zrmlnmg1rg3pj"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy python-scikit-learn))
    (home-page "https://github.com/chakki-works/seqeval")
    (synopsis "Testing framework for sequence labeling")
    (description "Testing framework for sequence labeling.")
    (license license:expat)))

(define-public python-sacremoses
  (package
    (name "python-sacremoses")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sacremoses" version))
       (sha256
        (base32 "0d1rcv7vq7m2zdz8r5y055bd47qym7f2v5hbv171a0kbfqx5vzdn"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-click python-joblib python-regex
                             python-tqdm))
    (home-page "https://github.com/hplt-project/sacremoses")
    (synopsis "SacreMoses")
    (description "@code{SacreMoses}.")
    (license #f)))

(define-public python-rouge-score
  (package
    (name "python-rouge-score")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "rouge_score" version))
       (sha256
        (base32 "010gzwbsszlz3f55b3l4dxk46rm4cdfr3vrm06zrm376hckdmm67"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py python-nltk python-numpy
                             python-six))
    (home-page
     "https://github.com/google-research/google-research/tree/master/rouge")
    (synopsis "Pure python implementation of ROUGE-1.5.5.")
    (description "Pure python implementation of ROUGE-1.5.5.")
    (license #f)))

(define-public python-faiss-cpu
  (package
    (name "python-faiss-cpu")
    (version "1.8.0.post1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "faiss_cpu" version))
       (sha256
        (base32 "04yc055yfc32wmqr00np935yjmkivxsdga2gkkac6y2684saz1jn"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy python-packaging))
    (home-page #f)
    (synopsis
     "A library for efficient similarity search and clustering of dense vectors.")
    (description
     "This package provides a library for efficient similarity search and clustering
of dense vectors.")
    (license license:expat)))

(define-public python-mauve-text
  (package
    (name "python-mauve-text")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "mauve-text" version))
       (sha256
        (base32 "0kyr9wk4lkq9d2rwx75qiwvyqnn69b23jj170sqgxk8sgmc2kkd9"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-faiss-cpu python-numpy python-requests
                             python-scikit-learn python-tqdm))
    (home-page "https://github.com/krishnap25/mauve")
    (synopsis "Implementation of the MAUVE to evaluate text generation")
    (description "Implementation of the MAUVE to evaluate text generation.")
    (license #f)))

(define-public python-jiwer
  (package
    (name "python-jiwer")
    (version "3.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "jiwer" version))
       (sha256
        (base32 "1s3a58d2ihvdwdnp6nvqfdg2p7c0jnshvrjbmgy2h8d2gkfaqf14"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-click python-rapidfuzz))
    (home-page "https://github.com/jitsi/jiwer")
    (synopsis
     "Evaluate your speech-to-text system with similarity measures such as word error rate (WER)")
    (description
     "Evaluate your speech-to-text system with similarity measures such as word error
rate (WER).")
    (license #f)))

(define-public python-charcut
  (package
    (name "python-charcut")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "charcut" version))
       (sha256
        (base32 "1ayn28ldqmacjdqs2bq8880la86ssl2jkh4gnrsm3g5gc76sqsd1"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-black python-flake8 python-isort python-pytest))
    (home-page "https://github.com/BramVanroy/CharCut")
    (synopsis "Character-based MT evaluation and difference highlighting")
    (description "Character-based MT evaluation and difference highlighting.")
    (license #f)))

(define-public python-cer
  (package
    (name "python-cer")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "cer" version))
       (sha256
        (base32 "0klhlmdn4v4pnpjqyncfp8y4b9f30syhay8lsapgrfkc5vmbfp28"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-levenshtein))
    (native-inputs (list python-black python-flake8 python-isort python-pytest))
    (home-page "https://github.com/BramVanroy/CharacTER")
    (synopsis "Translation Edit Rate on the character level")
    (description "Translation Edit Rate on the character level.")
    (license #f)))

(define-public python-bert-score
  (package
    (name "python-bert-score")
    (version "0.3.13")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "bert_score" version))
       (sha256
        (base32 "191bka4sjw8d2vns24f0r24121s9gyprda5ip24dkkf8x8w5izlg"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-matplotlib
                             python-numpy
                             python-packaging
                             python-pandas
                             python-requests
                             python-torch
                             python-tqdm
                             python-transformers))
    (home-page "https://github.com/Tiiiger/bert_score")
    (synopsis "PyTorch implementation of BERT score")
    (description "@code{PyTorch} implementation of BERT score.")
    (license license:expat)))

(define-public python-evaluate
  (package
    (name "python-evaluate")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "evaluate" version))
       (sha256
        (base32 "0d12441cgsfzpz4w9j6jcnxdyjhpv24fn4n5cq9h7i4fvxkvf6l5"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list ; python-datasets cycle
                             python-dill
                             python-fsspec
                             python-huggingface-hub
                             python-importlib-metadata
                             python-multiprocess
                             python-numpy
                             python-packaging
                             python-pandas
                             python-requests
                             python-tqdm
                             python-xxhash))
    (native-inputs (list python-absl-py
                         python-accelerate
                         ; python-bert-score ; cycle
                         python-black
                         python-cer
                         python-charcut
                         python-flake8
                         python-isort
                         python-jiwer
                         python-mauve-text
                         python-nltk
                         python-pytest
                         python-pytest-datadir
                         python-pytest-xdist
                         python-pyyaml
                         python-requests-file
                         python-rouge-score
                         python-sacrebleu
                         python-sacremoses
                         python-scikit-learn
                         python-scipy
                         python-sentencepiece
                         python-seqeval
                         python-six
                         python-tensorflow
                         python-texttable
                         python-tldextract
                         python-toml
                         python-torch
                         ; python-transformers ; cycle
                         python-trectools
                         python-unidecode
                         python-werkzeug))
    (home-page "https://github.com/huggingface/evaluate")
    (synopsis "HuggingFace community-driven open-source library of evaluation")
    (description
     "@code{HuggingFace} community-driven open-source library of evaluation.")
    (license license:asl2.0)))

(define-public python-wandb
  (package
    (name "python-wandb")
    (version "0.17.7")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "wandb" version))
       (sha256
        (base32 "13dkgd1cl8a0yq87m1jysc9kanzgvjsvh08ip6x4w2gz31vgn8s6"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-click ; FIXME it had some other dep
                             python-docker-pycreds
                             python-gitpython
                             python-platformdirs
                             python-protobuf
                             python-psutil
                             python-pyyaml
                             python-requests
                             python-sentry-sdk
                             python-setproctitle
                             python-typing-extensions))
    (home-page #f)
    (synopsis
     "A CLI and library for interacting with the Weights & Biases API.")
    (description
     "This package provides a CLI and library for interacting with the Weights &
Biases API.")
    (license #f)))

(define-public python-tensorboard-data-server
  (package
    (name "python-tensorboard-data-server")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tensorboard-data-server" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (home-page
     "https://github.com/tensorflow/tensorboard/tree/master/tensorboard/data/server")
    (synopsis "Fast data loading for TensorBoard")
    (description "Fast data loading for @code{TensorBoard}.")
    (license license:asl2.0)))

(define-public python-tensorboard
  (package
    (name "python-tensorboard")
    (version "2.17.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tensorboard" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-absl-py ; FIXME it had some other dep
                             python-grpcio
                             python-markdown
                             python-numpy
                             python-packaging
                             python-protobuf
                             python-six
                             python-tensorboard-data-server
                             python-werkzeug))
    (home-page "https://github.com/tensorflow/tensorboard")
    (synopsis "TensorBoard lets you watch Tensors Flow")
    (description "@code{TensorBoard} lets you watch Tensors Flow.")
    (license license:asl2.0)))

(define-public python-qtorch
  (package
    (name "python-qtorch")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "qtorch" version))
       (sha256
        (base32 "1gr0vb179fbixyvabxj4562hzciy7ah1wla6mh287laqgnrfkhiz"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-torch))
    (home-page "")
    (synopsis "Low-Precision Arithmetic Simulation in Pytorch")
    (description "Low-Precision Arithmetic Simulation in Pytorch.")
    (license license:expat)))

(define-public python-mup
  (package
    (name "python-mup")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "mup" version))
       (sha256
        (base32 "0x6g484z6l71xyvgr2047jgh92igxm14ai7dhpwm9rwhkz8y6fcn"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy
                             python-pandas
                             python-pyyaml
                             python-seaborn
                             python-torch
                             python-torchvision
                             python-tqdm))
    (home-page "https://github.com/microsoft/mup")
    (synopsis "Maximal Update Parametrization")
    (description "Maximal Update Parametrization.")
    (license #f)))

(define-public python-cmake
  (package
    (name "python-cmake")
    (version "3.30.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "cmake" version))
       (sha256
        (base32 "1rcm8rp94bfzikhm2d0z10kl1c7kyz3p2as5dgc7pdy62a6aknsl"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-coverage python-importlib-metadata
                             python-pytest python-pytest-cov))
    (home-page #f)
    (synopsis
     "CMake is an open-source, cross-platform family of tools designed to build, test and package software")
    (description
     "CMake is an open-source, cross-platform family of tools designed to build, test
and package software.")
    (license license:asl2.0)))

(define-public python-deepspeed-kernels
  (package
    (name "python-deepspeed-kernels")
    (version "0.0.1.dev1698255861")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "deepspeed-kernels" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-cmake python-packaging))
    (home-page "http://deepspeed.ai")
    (synopsis "deepspeed kernels")
    (description "deepspeed kernels.")
    (license #f)))

(define-public python-clang-format
  (package
    (name "python-clang-format")
    (version "18.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "clang_format" version))
       (sha256
        (base32 "0ddzwvk4hrkpd6i2a36m7msxjq6m1m807yhmc6bjkcqcvmzxnp86"))))
    (build-system pyproject-build-system)
    (home-page #f)
    (synopsis "Clang-Format is an LLVM-based code formatting tool")
    (description "Clang-Format is an LLVM-based code formatting tool.")
    (license license:asl2.0)))

(define-public python-ninja
  (package
    (name "python-ninja")
    (version "1.11.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ninja" version))
       (sha256
        (base32 "0g6c2xhdn36a0m4s1znw89d4hz2x2jvydsgznv83hzl5vl43nycx"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-codecov
                         python-coverage
                         python-flake8
                         python-pytest
                         python-pytest-cov
                         python-pytest-runner
                         python-pytest-virtualenv
                         python-virtualenv))
    (home-page "http://ninja-build.org/")
    (synopsis "Ninja is a small build system with a focus on speed")
    (description "Ninja is a small build system with a focus on speed.")
    (license license:asl2.0)))

(define-public python-deepspeed
  (package
    (name "python-deepspeed")
    (version "0.14.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "deepspeed" version))
       (sha256
        (base32 "0nnwbnqxm9hghmpy2f4pz6x0rvk132n0plbyj03h7k0vmcj1512g"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-hjson
                             python-ninja
                             python-numpy
                             python-packaging
                             python-psutil
                             python-py-cpuinfo
                             python-pydantic
                             python-torch
                             python-tqdm))
    (native-inputs (list python-accelerate
                         python-clang-format
                         python-comet-ml
                         python-deepspeed-kernels
                         python-docutils
                         python-future
                         python-importlib-metadata
                         python-mup
                         python-pre-commit
                         python-pytest
                         python-pytest-forked
                         python-pytest-randomly
                         python-pytest-xdist
                         python-qtorch
                         python-recommonmark
                         python-sphinx
                         python-sphinx-rtd-theme
                         python-tensorboard
                         python-torchvision
                         python-transformers
                         python-wandb))
    (home-page "http://deepspeed.ai")
    (synopsis "DeepSpeed library")
    (description "@code{DeepSpeed} library.")
    (license #f)))

(define-public python-decord
  (package
    (name "python-decord")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "decord" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy))
    (home-page "https://github.com/dmlc/decord")
    (synopsis "Decord Video Loader")
    (description "Decord Video Loader.")
    (license #f)))

(define-public python-rapidfuzz
  (package
    (name "python-rapidfuzz")
    (version "3.9.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "rapidfuzz" version))
       (sha256
        (base32 "13cy7gigk20zp147m9rjx35z4zzp7db96bkjhkp5ylg447bagwjw"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy))
    (home-page "https://github.com/rapidfuzz/RapidFuzz")
    (synopsis "rapid fuzzy string matching")
    (description "rapid fuzzy string matching.")
    (license license:expat)))

(define-public python-questionary
  (package
    (name "python-questionary")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "questionary" version))
       (sha256
        (base32 "12zwv083p91xgmczbw2686jj56pvqv2qc343cbzldd6vyf5qkkmw"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-prompt-toolkit))
    (home-page "https://github.com/tmbo/questionary")
    (synopsis
     "Python library to build pretty command line user prompts â­ï¸")
    (description
     "Python library to build pretty command line user prompts â­ï¸.")
    (license license:expat)))

(define-public python-pynvml
  (package
    (name "python-pynvml")
    (version "11.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pynvml" version))
       (sha256
        (base32 "0adjwynwcfcqamsyx4sp56lzi3lpik30dnnq082g1rc7whx24g8q"))))
    (build-system pyproject-build-system)
    (home-page "http://www.nvidia.com/")
    (synopsis "Python utilities for the NVIDIA Management Library")
    (description "Python utilities for the NVIDIA Management Library.")
    (license license:bsd-3)))

(define-public python-codecarbon
  (package
    (name "python-codecarbon")
    (version "2.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "codecarbon" version))
       (sha256
        (base32 "0yq596kn98mygarqlk1fm99pi772pzf2zdry9cpgl3v5c2fd7c05"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-arrow
                             python-click
                             python-pandas
                             python-prometheus-client
                             python-psutil
                             python-py-cpuinfo
                             python-pynvml
                             python-questionary
                             python-rapidfuzz
                             python-requests
                             python-rich
                             python-typer))
    (home-page #f)
    (synopsis #f)
    (description #f)
    (license #f)))

(define-public python-transformers
  (package
    (name "python-transformers")
    (version "4.44.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "transformers" version))
       (sha256
        (base32 "15pi6yf7byzi6dz3hnw73aspls4c2cp3g3ad8k53axhbwfar8sbm"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-filelock
                             python-huggingface-hub
                             python-numpy
                             python-packaging
                             python-pyyaml
                             python-regex
                             python-requests
                             python-safetensors
                             python-tokenizers
                             python-tqdm))
    (native-inputs (list python-accelerate
                         python-av
                         python-beautifulsoup4
                         python-codecarbon
                         python-cookiecutter
                         ; python-datasets ; cycle
                         python-decord
                         ; python-deepspeed ; cycle
                         python-dill
                         python-evaluate
                         python-faiss-cpu
                         python-flax
                         python-fugashi
                         python-gitpython
                         python-ipadic
                         python-isort
                         python-jax
                         python-jaxlib
                         python-kenlm
                         python-keras-nlp
                         python-librosa
                         python-nltk
                         python-onnxconverter-common
                         python-onnxruntime
                         python-onnxruntime-tools
                         python-optax
                         python-optuna
                         python-parameterized
                         python-phonemizer
                         python-pillow
                         python-protobuf
                         python-psutil
                         python-pyctcdecode
                         python-pydantic
                         python-pytest
                         python-pytest-rich
                         python-pytest-timeout
                         python-pytest-xdist
                         python-ray
                         python-rhoknp
                         python-rjieba
                         python-rouge-score
                         python-ruff
                         python-sacrebleu
                         python-sacremoses
                         python-scikit-learn
                         python-scipy
                         python-sentencepiece
                         python-sigopt
                         python-sudachidict-core
                         python-sudachipy
                         python-tensorboard
                         python-tensorflow
                         python-tensorflow-text
                         python-tf2onnx
                         python-timeout-decorator
                         python-timm
                         python-tokenizers
                         python-torch
                         python-torchaudio
                         python-torchvision
                         python-unidic
                         python-unidic-lite
                         python-urllib3))
    (home-page "https://github.com/huggingface/transformers")
    (synopsis
     "State-of-the-art Machine Learning for JAX, PyTorch and TensorFlow")
    (description
     "State-of-the-art Machine Learning for JAX, @code{PyTorch} and @code{TensorFlow}.")
    (license #f)))

(define-public python-compel
  (package
    (name "python-compel")
    (version "2.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "compel" version))
       (sha256
        (base32 "0z37bgyfdrk5zyd8f93b7fh0hsfy26d4wnrxdpi8asqn801vjj35"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-diffusers python-pyparsing python-torch
                             python-transformers))
    (home-page #f)
    (synopsis
     "A prompting enhancement library for transformers-type text embedding systems.")
    (description
     "This package provides a prompting enhancement library for transformers-type text
embedding systems.")
    (license #f)))

(define-public python-diffusers
  (package
    (name "python-diffusers")
    (version "0.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "diffusers" version))
       (sha256
        (base32 "1amjxhf6q52ic3qfk2izbf59irkn7v4w93qhw6yn4pq3mffdbb2p"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-accelerate
                             python-compel
                             python-datasets
                             python-filelock
                             python-flax
                             python-gitpython
                             python-hf-doc-builder
                             python-huggingface-hub
                             python-importlib-metadata
                             python-invisible-watermark
                             python-isort
                             python-jax
                             python-jaxlib
                             python-jinja2
                             python-k-diffusion
                             python-librosa
                             python-numpy
                             python-parameterized
                             python-peft
                             python-pillow
                             python-protobuf
                             python-pytest
                             python-pytest-timeout
                             python-pytest-xdist
                             python-regex
                             python-requests
                             python-requests-mock
                             python-ruff
                             python-safetensors
                             python-scipy
                             python-sentencepiece
                             python-tensorboard
                             python-torch
                             python-torchvision
                             python-transformers
                             python-urllib3))
    (home-page "https://github.com/huggingface/diffusers")
    (synopsis "State-of-the-art diffusion in PyTorch and JAX.")
    (description "State-of-the-art diffusion in @code{PyTorch} and JAX.")
    (license #f)))

(define-public python-everett
  (package
    (name "python-everett")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "everett" version))
       (sha256
        (base32 "055qf0cz8f4rb6wnlsi31x6gr2657xddpj1bm2641wmxq5fcbv6k"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/willkg/everett")
    (synopsis "Configuration library for Python applications")
    (description "Configuration library for Python applications.")
    (license #f)))

(define-public python-comet-ml
  (package
    (name "python-comet-ml")
    (version "3.44.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "comet-ml" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-dulwich ; FIXME it had some other dep
                             python-everett
                             python-importlib-metadata
                             python-jsonschema
                             python-psutil
                             python-box
                             python-requests
                             python-requests-toolbelt
                             python-rich
                             python-semantic-version
                             python-sentry-sdk
                             python-simplejson
                             python-urllib3
                             python-wrapt
                             python-wurlitzer))
    (home-page "https://www.comet.com")
    (synopsis "Supercharging Machine Learning")
    (description "Supercharging Machine Learning.")
    (license license:expat)))

(define-public python-bitsandbytes
  (package
    (name "python-bitsandbytes")
    (version "0.43.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "bitsandbytes" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-numpy python-torch))
    (native-inputs (list python-scipy))
    (home-page "https://github.com/TimDettmers/bitsandbytes")
    (synopsis "k-bit optimizers and matrix multiplication routines.")
    (description "k-bit optimizers and matrix multiplication routines.")
    (license license:expat)))

(define-public python-textx-lang-questionnaire
  (package
    (name "python-textx-lang-questionnaire")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "textx-lang-questionnaire" version))
       (sha256
        (base32 "0zwgpv0ravn2vmx6bryshhfv5vzlmbwz8x8ixqlq55pr1hnwkh4y"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-textx))
    (native-inputs (list python-coverage
                         python-coveralls
                         python-flake8
                         python-pytest
                         python-tox
                         python-twine))
    (home-page "https://github.com/textX/textx-lang-questionnaire")
    (synopsis "A DSL for describing questionnaires")
    (description "This package provides a DSL for describing questionnaires.")
    (license license:expat)))

(define-public python-textx-jinja
  (package
    (name "python-textx-jinja")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "textX-jinja" version))
       (sha256
        (base32 "0aisgcps5fmxxw0rp3rgham2hf06wi1jdm0gbvc2m7pgvh3ywhz5"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-click python-jinja2 python-textx))
    (native-inputs (list python-coverage
                         python-coveralls
                         python-flake8
                         python-pytest
                         python-tox
                         python-twine
                         python-wheel))
    (home-page "")
    (synopsis "textX generator framework based on Jinja template engine")
    (description
     "@code{textX} generator framework based on Jinja template engine.")
    (license license:expat)))

(define-public python-textx-dev
  (package
    (name "python-textx-dev")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "textX-dev" version))
       (sha256
        (base32 "1xf9z45q813k7vkyrinf0hmiavsj8kdy548c1v10virgxmhramna"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-appdirs
                             python-click
                             python-jinja2
                             python-textx
                             python-textx-jinja
                             python-textx-lang-questionnaire))
    (native-inputs (list python-coverage
                         python-coveralls
                         python-flake8
                         python-pytest
                         python-tox
                         python-wheel))
    (home-page "https://github.com/textX/textX-dev")
    (synopsis "Development tools for textX")
    (description "Development tools for @code{textX}.")
    (license license:expat)))

(define-public python-ruff
  (package
    (name "python-ruff")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ruff" version))
       (sha256
        (base32 "0dil98if9szqhfh9qhghcwv99zlvkfk1kk9kin2bib33cn6gsgxg"))))
    (build-system pyproject-build-system)
    (home-page "https://docs.astral.sh/ruff")
    (synopsis
     "An extremely fast Python linter and code formatter, written in Rust.")
    (description
     "An extremely fast Python linter and code formatter, written in Rust.")
    (license license:expat)))

(define-public python-textx
  (package
    (name "python-textx")
    (version "4.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "textx" version))
       (sha256
        (base32 "06l35p2r7waf322anr1lxp7snfn2vpp3xs6b5x04gjfjbz4zbbw4"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-arpeggio
                             python-attrs
                             python-click
                             python-coverage
                             python-coveralls
                             python-flit
                             python-html5lib
                             python-importlib-metadata
                             python-jinja2
                             python-mike
                             python-mkdocs
                             python-pytest
                             python-ruff
                             ;python-textx-dev
                             ))
    (home-page #f)
    (synopsis "Meta-language for DSL implementation inspired by Xtext")
    (description "Meta-language for DSL implementation inspired by Xtext.")
    (license #f)))

(define-public python-caliper-reader
  (package
    (name "python-caliper-reader")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "caliper-reader" version))
       (sha256
        (base32 "0dsw5pq45kp5lsahw1hg6l8kynvqrdvi96jpb2pdnr86b8bc1hh0"))))
    (build-system pyproject-build-system)
    (home-page "")
    (synopsis "A Python library for reading Caliper .cali files")
    (description
     "This package provides a Python library for reading Caliper .cali files.")
    (license #f)))

(define-public python-llnl-hatchet
  (package
    (name "python-llnl-hatchet")
    (version "2024.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "llnl_hatchet" version))
       (sha256
        (base32 "1x6q32irq6r0gfkl81khfp28nr5pbpvpy1ca96daydrd9xfrsxk1"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-caliper-reader
                             python-matplotlib
                             python-multiprocess
                             python-numpy
                             python-pandas
                             python-pydot
                             python-pyyaml
                             python-textx))
    (home-page "https://github.com/llnl/hatchet")
    (synopsis "A Python library for analyzing hierarchical performance data")
    (description
     "This package provides a Python library for analyzing hierarchical performance
data.")
    (license license:expat)))

(define-public python-triton
  (package
    (name "python-triton")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "triton" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-filelock))
    (native-inputs (list python-autopep8
                         python-flake8
                         python-isort
                         python-llnl-hatchet
                         python-numpy
                         python-pytest
                         python-scipy))
    (home-page "https://github.com/triton-lang/triton/")
    (synopsis "A language and compiler for custom Deep Learning operations")
    (description
     "This package provides a language and compiler for custom Deep Learning
operations.")
    (license #f)))

(define-public python-torch
  (package
    (name "python-torch")
    (version "2.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "torch" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-filelock
                             python-fsspec
                             python-jinja2
                             python-networkx
                             python-sympy
                             python-triton
                             python-typing-extensions))
    (home-page "https://pytorch.org/")
    (synopsis
     "Tensors and Dynamic neural networks in Python with strong GPU acceleration")
    (description
     "Tensors and Dynamic neural networks in Python with strong GPU acceleration.")
    (license license:bsd-3)))

(define-public python-safetensors
  (package
    (name "python-safetensors")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "safetensors" version))
       (sha256
        (base32 "01rafw1sv2500bkvjribzd9qc4232n0hl42fxmr023950nvykqsz"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-h5py
                         python-huggingface-hub
                         python-hypothesis
                         python-pytest
                         python-pytest-benchmark
                         ;python-safetensors
                         python-setuptools-rust))
    (home-page #f)
    (synopsis #f)
    (description #f)
    (license #f)))

(define-public python-accelerate
  (package
    (name "python-accelerate")
    (version "0.33.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "accelerate" version))
       (sha256
        (base32 "0sp276s0zcvp9fj620mx4jh6gfpf993cwmfzflbij2gasqg4ifhi"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-huggingface-hub
                             python-numpy
                             python-packaging
                             python-psutil
                             python-pyyaml
                             python-safetensors
                             python-torch))
    (native-inputs (list python-bitsandbytes
                         python-black
                         python-comet-ml
                         ; python-datasets ; cycle
                         ; python-diffusers ; cycle
                         ; python-dvclive ; cycle
                         ; python-evaluate ; cycle
                         ; python-hf-doc-builder ; cycle
                         python-parameterized
                         python-pytest
                         python-pytest-subtests
                         python-pytest-xdist
                         python-rich
                         python-ruff
                         python-scikit-learn
                         python-scipy
                         python-tensorboard
                         python-timm
                         python-torchpippy
                         python-tqdm
                         ; python-transformers ; cycle
                         python-wandb))
    (home-page "https://github.com/huggingface/accelerate")
    (synopsis "Accelerate")
    (description "Accelerate.")
    (license #f)))

(define-public python-datasets
  (package
    (name "python-datasets")
    (version "2.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "datasets" version))
       (sha256
        (base32 "18lbvk8cr56mrplg2gcy4hjg9vh81258y1dxwn1dj6qg8sl8b3wr"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-aiohttp
                             python-dill
                             python-filelock
                             python-fsspec
                             python-huggingface-hub
                             python-multiprocess
                             python-numpy
                             python-packaging
                             python-pandas
                             python-pyarrow
                             python-pyyaml
                             python-requests
                             python-tqdm
                             python-xxhash))
    (native-inputs (list python-absl-py
                         python-accelerate
                         python-bert-score
                         python-decorator
                         python-elasticsearch
                         python-faiss-cpu
                         python-jax
                         python-jaxlib
                         python-jiwer
                         python-joblib
                         python-joblibspark
                         python-langdetect
                         python-librosa
                         python-lz4
                         python-mauve-text
                         python-moto
                         python-nltk
                         python-pillow
                         python-polars
                         python-protobuf
                         python-py7zr
                         python-pyspark
                         python-pytest
                         python-pytest-datadir
                         python-pytest-xdist
                         python-rarfile
                         python-requests-file
                         python-rouge-score
                         python-ruff
                         python-s3fs
                         python-sacrebleu
                         python-sacremoses
                         python-scikit-learn
                         python-scipy
                         python-sentencepiece
                         python-seqeval
                         python-six
                         python-soundfile
                         python-soxr
                         python-spacy
                         python-sqlalchemy
                         python-tensorflow
                         python-texttable
                         python-tiktoken
                         python-tldextract
                         python-toml
                         python-torch
                         python-transformers
                         python-typer
                         python-typing-extensions
                         python-werkzeug
                         python-zstandard))
    (home-page "https://github.com/huggingface/datasets")
    (synopsis "HuggingFace community-driven open-source library of datasets")
    (description
     "@code{HuggingFace} community-driven open-source library of datasets.")
    (license license:asl2.0)))

(define-public python-tokenizers
  (package
    (name "python-tokenizers")
    (version "0.20.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tokenizers" version))
       (sha256
        (base32 "13dc9vdbi9ln0abk26nyaqj36vykx7dd3z6ahm02fk2n7z2armrr"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-huggingface-hub))
    (native-inputs (list python-black
                         ;python-datasets ;cycle
                         python-numpy
                         python-pytest
                         python-requests
                         python-ruff))
    (home-page #f)
    (synopsis #f)
    (description #f)
    (license #f)))

(define-public python-tiktoken
  (package
    (name "python-tiktoken")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tiktoken" version))
       (sha256
        (base32 "1dpnzvggkff37fi77cg2xiji75zhqqrh8dbc3wly094wjip2cxqh"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-regex python-requests))
    (home-page #f)
    (synopsis "tiktoken is a fast BPE tokeniser for use with OpenAI's models")
    (description
     "tiktoken is a fast BPE tokeniser for use with @code{OpenAI's} models.")
    (license #f)))

(define-public python-resend
  (package
    (name "python-resend")
    (version "2.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "resend" version))
       (sha256
        (base32 "15d0cxxqal6i6zn20x1x7bpv0xq0d3bdqa7qsbr72p6wmz4hcaqg"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-requests python-typing-extensions))
    (home-page "https://github.com/resendlabs/resend-python")
    (synopsis "Resend Python SDK")
    (description "Resend Python SDK.")
    (license #f)))

(define-public python-gunicorn
  (package
    (name "python-gunicorn")
    (version "23.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "gunicorn" version))
       (sha256
        (base32 "1v04l35k103289h5inwv1v4s89q2njk8rhgnjki5gp0105x4857h"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-importlib-metadata python-packaging))
    (native-inputs (list python-coverage python-eventlet python-gevent
                         python-pytest python-pytest-cov))
    (home-page #f)
    (synopsis "WSGI HTTP Server for UNIX")
    (description "WSGI HTTP Server for UNIX.")
    (license license:expat)))

(define-public python-grpc-google-iam-v1
  (package
    (name "python-grpc-google-iam-v1")
    (version "0.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "grpc-google-iam-v1" version))
       (sha256
        (base32 "00chiahwrgkf3k1w94c2b9fj0rkgvb056lln23j6a2crkpyv5x1z"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-googleapis-common-protos python-grpcio
                             python-protobuf))
    (home-page "https://github.com/googleapis/python-grpc-google-iam-v1")
    (synopsis "IAM API client library")
    (description "IAM API client library.")
    (license license:asl2.0)))

(define-public python-google-cloud-kms
  (package
    (name "python-google-cloud-kms")
    (version "2.24.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google_cloud_kms" version))
       (sha256
        (base32 "18973caw17p6wznskq88dmcpzxgl0gzvagy0frf0796imyzqpqg9"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-google-api-core python-google-auth
                             python-grpc-google-iam-v1 python-proto-plus
                             python-protobuf))
    (home-page
     "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-kms")
    (synopsis "Google Cloud Kms API client library")
    (description "Google Cloud Kms API client library.")
    (license license:asl2.0)))

(define-public python-fastapi-sso
  (package
    (name "python-fastapi-sso")
    (version "0.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "fastapi_sso" version))
       (sha256
        (base32 "05dw1as1kxzbvm3i7cj19hd658jzp3k2f67s8g5wrrwaz3hc65wp"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-fastapi python-httpx python-oauthlib
                             python-pydantic))
    (home-page "https://tomasvotava.github.io/fastapi-sso/")
    (synopsis
     "FastAPI plugin to enable SSO to most common providers (such as Facebook login, Google login and login via Microsoft Office 365 Account)")
    (description
     "@code{FastAPI} plugin to enable SSO to most common providers (such as Facebook
login, Google login and login via Microsoft Office 365 Account).")
    (license license:expat)))

(define-public python-azure-keyvault-secrets
  (package
    (name "python-azure-keyvault-secrets")
    (version "4.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "azure-keyvault-secrets" version))
       (sha256
        (base32 "05781y5sycqqhqk9bbkwrcd0sgxz9vywyg6bk5bkq3m2v2hw0djn"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-azure-core python-isodate
                             python-typing-extensions))
    (home-page
     "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/keyvault/azure-keyvault-secrets")
    (synopsis "Microsoft Azure Key Vault Secrets Client Library for Python")
    (description
     "Microsoft Azure Key Vault Secrets Client Library for Python.")
    (license license:expat)))

(define-public python-msal-extensions
  (package
    (name "python-msal-extensions")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "msal_extensions" version))
       (sha256
        (base32 "1vvbckn78n3xj7750bqspn27vrnk1p592p1139ikv4yjpwhb6hbg"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-msal python-portalocker))
    (home-page #f)
    (synopsis
     "Microsoft Authentication Library extensions (MSAL EX) provides a persistence API that can save your data on disk, encrypted on Windows, macOS and Linux. Concurrent data access will be coordinated by a file lock mechanism.")
    (description
     "Microsoft Authentication Library extensions (MSAL EX) provides a persistence API
that can save your data on disk, encrypted on Windows, @code{macOS} and Linux.
Concurrent data access will be coordinated by a file lock mechanism.")
    (license license:expat)))

(define-public python-azure-identity
  (package
    (name "python-azure-identity")
    (version "1.17.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "azure-identity" version))
       (sha256
        (base32 "1spg8qka66lzmv98xyg69xpih1fdcp5b2r2gbrcx0jrzqxycdv1j"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-azure-core python-cryptography python-msal
                             python-msal-extensions python-typing-extensions))
    (home-page
     "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/identity/azure-identity")
    (synopsis "Microsoft Azure Identity Library for Python")
    (description "Microsoft Azure Identity Library for Python.")
    (license license:expat)))

(define-public python-litellm
  (package
    (name "python-litellm")
    (version "1.43.17")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "litellm" version))
       (sha256
        (base32 "0zwbryvx1mxp5xyv29vhzcr5n1rz32dxirg84ybc5rvapwc2pj4a"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-aiohttp
                             python-apscheduler
                             python-azure-identity
                             python-azure-keyvault-secrets
                             python-backoff
                             python-click
                             python-cryptography
                             python-fastapi
                             python-fastapi-sso
                             python-google-cloud-kms
                             python-gunicorn
                             python-importlib-metadata
                             python-jinja2
                             python-jsonschema
                             python-openai
                             python-orjson
                             python-prisma
                             python-pydantic
                             python-pyjwt
                             python-pynacl
                             python-dotenv
                             python-multipart
                             python-pyyaml
                             python-requests
                             python-resend
                             python-rq
                             python-tiktoken
                             python-tokenizers
                             python-uvicorn))
    (home-page #f)
    (synopsis "Library to easily interface with LLM API providers")
    (description "Library to easily interface with LLM API providers.")
    (license license:expat)))

(define-public python-referencing
  (package
    (name "python-referencing")
    (version "0.35.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "referencing" version))
       (sha256
        (base32 "0g3hvzz6ci6dcf701q7ilr4b7vw3fw428kqp4nj35dn8lqj23d15"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-attrs python-rpds-py))
    (home-page #f)
    (synopsis "JSON Referencing + Python")
    (description "JSON Referencing + Python.")
    (license #f)))

(define-public python-jsonschema-specifications
  (package
    (name "python-jsonschema-specifications")
    (version "2023.12.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "jsonschema_specifications" version))
       (sha256
        (base32 "1k348xkq45jx13kmv32ls6k4qvjq3ywd4q0i7zamw3z7nf3ng9s8"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-importlib-resources python-referencing))
    (home-page "")
    (synopsis
     "The JSON Schema meta-schemas and vocabularies, exposed as a Registry")
    (description
     "The JSON Schema meta-schemas and vocabularies, exposed as a Registry.")
    (license license:expat)))

(define-public python-jiter
  (package
    (name "python-jiter")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "jiter" version))
       (sha256
        (base32 "12incc2z3slbwn937pzdvhklssfbqjcgjzcjgmgmraxwfnl6p48x"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/pydantic/jiter/")
    (synopsis "Fast iterable JSON parser.")
    (description "Fast iterable JSON parser.")
    (license license:expat)))

(define-public python-tree-sitter-languages
  (package
    (name "python-tree-sitter-languages")
    (version "1.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tree-sitter-languages" version))
       (sha256
        (base32 "1y9fmj8yzg6k2cn09r7rzhz5fnfwsifzm68xza5rqkkh6gvcpal0"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-tree-sitter))
    (home-page "https://github.com/grantjenks/py-tree-sitter-languages")
    (synopsis "Binary Python wheels for all tree sitter languages.")
    (description "Binary Python wheels for all tree sitter languages.")
    (license license:asl2.0)))

(define-public python-grep-ast
  (package
    (name "python-grep-ast")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "grep_ast" version))
       (sha256
        (base32 "1x6c9xhdngacnp4ijkgvv89wjjcwkra8v3rn6ibca79haxyqif22"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pathspec python-tree-sitter-languages))
    (home-page "https://github.com/paul-gauthier/grep-ast")
    (synopsis "A tool to grep through the AST of a source file")
    (description
     "This package provides a tool to grep through the AST of a source file.")
    (license #f)))

(define-public python-backoff
  (package
    (name "python-backoff")
    (version "2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "backoff" version))
       (sha256
        (base32 "1fjwz9x81wpfn22j96ck49l3nb2hn19qfgv44441h8qrpgsjky03"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/litl/backoff")
    (synopsis "Function decoration for backoff and retry")
    (description "Function decoration for backoff and retry.")
    (license license:expat)))

(define-public python-aiohappyeyeballs
  (package
    (name "python-aiohappyeyeballs")
    (version "2.3.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "aiohappyeyeballs" version))
       (sha256
        (base32 "0ydfml6348bb5l1b3y3n8zakdzr677gdfmir0cv083m4s9l108c8"))))
    (build-system pyproject-build-system)
    (native-inputs
     (list poetry)) ;  - Additional properties are not allowed ('group' was unexpected)
    (home-page "https://github.com/aio-libs/aiohappyeyeballs")
    (synopsis "Happy Eyeballs for asyncio")
    (description "Happy Eyeballs for asyncio.")
    (license license:psfl)))

(define-public python-aider-chat
  (package
    (name "python-aider-chat")
    (version "0.50.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "aider_chat" version))
       (sha256
        (base32 "1q3a7ma199kng67a3ivnl722mnlw8g5q8iq5mqb366yx7s30ghgn"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-aiohappyeyeballs
                             python-aiohttp
                             python-aiosignal
                             python-annotated-types
                             python-anyio
                             python-attrs
                             python-backoff
                             python-beautifulsoup4
                             python-certifi
                             python-cffi
                             python-charset-normalizer
                             python-click
                             python-configargparse
                             python-diff-match-patch
                             python-diskcache
                             python-distro
                             python-filelock
                             python-flake8
                             python-frozenlist
                             python-fsspec
                             python-gitdb
                             python-gitpython
                             python-grep-ast
                             python-h11
                             python-httpcore
                             python-httpx
                             python-huggingface-hub
                             python-idna
                             python-importlib-metadata
                             python-importlib-resources
                             python-jinja2
                             python-jiter
                             python-jsonschema
                             python-jsonschema-specifications
                             python-litellm
                             python-markdown-it-py
                             python-markupsafe
                             python-mccabe
                             python-mdurl
                             python-multidict
                             python-networkx
                             python-numpy
                             python-openai
                             python-packaging
                             python-pathspec
                             python-pillow
                             python-prompt-toolkit
                             python-pycodestyle
                             python-pycparser
                             python-pydantic
                             python-pydantic-core
                             python-pyflakes
                             python-pygments
                             python-pypager
                             python-pypandoc
                             python-pyperclip
                             python-dotenv
                             python-pyyaml
                             python-referencing
                             python-regex
                             python-requests
                             python-rich
                             python-rpds-py
                             python-scipy
                             python-smmap
                             python-sniffio
                             python-sounddevice
                             python-soundfile
                             python-soupsieve
                             python-tiktoken
                             python-tokenizers
                             python-tqdm
                             python-tree-sitter
                             python-tree-sitter-languages
                             python-typing-extensions
                             python-urllib3
                             python-wcwidth
                             python-yarl
                             python-zipp))
    (native-inputs (list python-alabaster
                         python-babel
                         python-build
                         python-certifi
                         python-cfgv
                         python-charset-normalizer
                         python-click
                         python-cogapp
                         python-contourpy
                         python-cycler
                         python-dill
                         python-distlib
                         python-docutils
                         python-filelock
                         python-fonttools
                         python-identify
                         python-idna
                         python-imagesize
                         python-imgcat
                         python-iniconfig
                         python-jinja2
                         python-kiwisolver
                         python-lox
                         python-markdown-it-py
                         python-markupsafe
                         python-matplotlib
                         python-mdurl
                         python-multiprocess
                         python-nodeenv
                         python-numpy
                         python-packaging
                         python-pandas
                         python-pathos
                         python-pillow
                         python-pip-tools
                         python-platformdirs
                         python-pluggy
                         python-pox
                         python-ppft
                         python-pre-commit
                         python-pygments
                         python-pyparsing
                         python-pyproject-hooks
                         python-pytest
                         python-dateutil
                         python-pytz
                         python-pyyaml
                         python-requests
                         python-rich
                         python-semver
                         python-shellingham
                         python-six
                         python-snowballstemmer
                         python-sphinx
                         python-sphinx-rtd-theme
                         python-sphinxcontrib-applehelp
                         python-sphinxcontrib-devhelp
                         python-sphinxcontrib-htmlhelp
                         python-sphinxcontrib-jquery
                         python-sphinxcontrib-jsmath
                         python-sphinxcontrib-qthelp
                         python-sphinxcontrib-serializinghtml
                         python-typer
                         python-typing-extensions
                         python-tzdata
                         python-urllib3
                         python-virtualenv
                         python-wheel))
    (home-page #f)
    (synopsis "Aider is AI pair programming in your terminal")
    (description "Aider is AI pair programming in your terminal.")
    (license #f)))

python-aider-chat
