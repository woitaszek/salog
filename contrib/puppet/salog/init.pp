
#
# salog/init.pp
# System administration log editor
#
# class { 'salog':
#     logdir  => "/var/log/salog",
#     group   => "admin",
# }

class salog( $logdir, $group ){

    # Create the directory for the logfiles
    file { 'logdir':
        path    => $logdir,
        ensure  => directory,
        mode    => 2770,
        owner   => "root",
        group   => $group,
    }

    # Install the executable
    file { "/usr/local/sbin/salog":
        ensure  => file,
        source  => "puppet:///modules/salog/salog",
        owner   => "root",
        group   => "root",
        mode    => "u=rx,g=rx,o=rx",
    }

    # Install the links
    file { "/usr/local/sbin/vilog":
        ensure  => link,
        target  => "/usr/local/sbin/salog",
    }
    file { "/usr/local/bin/emacslog":
        ensure  => link,
        target  => "/usr/local/sbin/salog",
    }

}

