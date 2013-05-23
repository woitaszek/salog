# salog - System administration log editor

The system administrator log **(salog)** is a wrapper for vim and emacs that
allows system administrators and operators to quickly and easily record and
view administrative activities on a computer system.

With **salog**, system administration log files are stored in a customizable
directory. Log files are based on the hostname and month (e.g.,
``salog_$HOSTNAME_$YEAR_$MONTH.txt``), so that all of the files may stored on a
centralized file system or consolidated in a centralized location and used to
generate a daily digest.

By default, logfiles are stored on each system in ``/var/log/salog``.


## Usage


### Invocation

    salog [options]
    vilog [options]
    emacslog [options]

    -e  Edit the current month's log file
    -f  Force editing the current log file, overriding lock


### Examples

* To add an entry to the system administration log:

        $ salog -e          # Uses $VISUAL if set to vim or emacs
        $ vilog -e          # Always uses vim (if present)
        $ emacslog -e       # Always uses emacs (if present)

* To view the current month's system administration log, simply run ``salog``,
``vilog``, or ``emacslog`` with no options.
 

## Installation

* The ``salog`` script may be installed in any directory accessible via
  the system's configured path. Use symlinks to enable vilog or emacslog:
        
        $ ln -s salog vilog
        $ ln -s salog emacslog


* The centralized user directory should be created with group permissions
  that allow all members of the system administration team to create and
  edit files. For example:
        
        $ sudo mkdir /var/log/salog
        $ sudo chown root:admin /var/log/salog
        $ sudo chmod g+ws /var/log/salog


## History 

``salog`` is based on a legacy script called ``vilog`` that doesn't seem to
exist on the Internet anymore. This rewrite as ``salog`` has a simpler
command-line interface and also supports emacs. The editor of choice is
selected via the command-line invocation (e.g, ``vilog`` or ``emacslog``), or,
when invoked using ``salog``, by the ``$VISUAL`` environment variable. 


## See Also

Other tools under development include:

* sadiff - concatenate multiple log files and generate diff for e-mail digest


