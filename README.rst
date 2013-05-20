
.h1 salog - System administration logfile editor

``salog`` is a tool for system administrators to record their activities on an
administered system.  Every invocation of ``salog -e`` opens the sysadmin log
and inserts a timestamped header line, ready for notes regarding activity on
the system.  System administration log files are named based on the hostname
and month, supporting storage on a network file system or aggregation on a
centralized host for the generation of environment-wide digests.

``salog`` is based on a legacy script called ``vilog`` that doesn't seem to
exist on the Internet anymore. This rewrite as ``salog`` has a simpler
command-line interface and also supports emacs. The editor of choice is
selected via the command-line invocation (e.g, ``vilog`` or ``emacslog``), or,
for ``salog``, by the ``$VISUAL`` environment variable. 


.h2 Usage

Invocation:

    salog [options]
    vilog [options]
    emacslog [options]

Options:

    -e  Edit the current month's log file
    -f  Force editing the current log file, overriding lock


.h2 Installation

* The ``salog`` script may be installed in any directory accessible via
  the system's configured path. For vilog or emacslog shortcuts, install 
  symlinks:

    $ ln -s salog vilog
    $ ln -s salog emacslog

* The centralized user directory should be created with group permissions
  that allow all members of the system administration team to create and
  edit files. For example:

    $ sudo mkdir /var/log/salog
    $ sudo chown root:admin /var/log/salog
    $ sudo chmod g+ws /var/log/salog


.h2 Other Tools

Other tools under development include:

* sadiff - concatenate multiple log files and generate diff for e-mail digest


