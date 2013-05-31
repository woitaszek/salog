#!/bin/bash

# Directory containing a git repository of salog files
GITSALOGDIR=salog.d

# ----------------------------------------
# File collection
# ----------------------------------------

# Change to the SA log git repository directory
cd $GITSALOGDIR

# Get all of the files from the hosts
# TODO


# Add all new files and changes into git
git add --all



# ----------------------------------------
# Get the file lsit
# ----------------------------------------

FILELIST="$(git diff --cached --name-only)"

# If there is nothing to diff, exit now
if [ -z "${FILELIST}" ]
then
    echo "$0: No changes to salog"
    exit 0
fi

# ----------------------------------------
# Prepare the message
# ----------------------------------------

# Open a temporary file for the message
TEMPFILE=`mktemp -t salogmail.XXXXXX`
echo "TEMPFILE=$TEMPFILE"

for f in $FILELIST
do
    echo "----------------------------------------" >> $TEMPFILE
    echo $f >> $TEMPFILE
    echo >> $TEMPFILE

    # git blame produces output like this:
    #   00000000 (Not Committed Yet 2013-05-30 22:16:56 -0700 4) 
    #   00000000 (Not Committed Yet 2013-05-30 22:16:56 -0700 5) 2013-01-02 matthew test2
    #   00000000 (Not Committed Yet 2013-05-30 22:16:56 -0700 6)  - This is a test
    # Look for lines starting with all zeroes, and print the contents.
    # Strip double blank lines (cat -s), and strip the first line 
    # and last lines if they are blank.

    git blame $f | grep -E "^000000" | cut -d\) -f2 | cut -c2- | \
        cat -s | sed '1{/^$/d;}' | sed '${/^$/d;}' >> $TEMPFILE
    echo >> $TEMPFILE
done
echo >> $TEMPFILE


# ----------------------------------------
# Send the message
# ----------------------------------------

# TODO
# cat $TEMPFILE | mailx -s "salog report `date +\"%Y-%m-%d %H:%M:%S\"`"

# ----------------------------------------
# Commit the changes
# ----------------------------------------

git commit -m "Automatic commit `date +\"%Y-%m-%d %H:%M:%S\"`"
cd ..

