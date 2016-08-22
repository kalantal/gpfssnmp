#!/bin/sh
set -e
#aborts on error

#This script exists removes existing symlinks and
#creates the appropriate links.

#Logs saved to /var/tmp/symlinks.log

#Wrapped for reuse and logging
function symLinksForced() {

#remove existing links
rm libcrypto.so -f
rm libnetsnmp.so -f
rm libnetsnmphelpers.so -f
rm libperl.so -f
rm libnetsnmpagent.so -f
rm libnetsnmpmibs.so -f
rm libwrap.so -f

#link the libraries
ln -s libcrypto.so.10 libcrypto.so
ln -s libnetsnmp.so.31 libnetsnmp.so
ln -s libnetsnmphelpers.so.31 libnetsnmphelpers.so
ln -s perl5/CORE/libperl.so libperl.so
ln -s libnetsnmpagent.so.31.0.2 libnetsnmpagent.so
ln -s libnetsnmpmibs.so.31 libnetsnmpmibs.so
ln -s libwrap.so.0 libwrap.so

#Verify
ls -l libcrypto.so
ls -l libnetsnmp.so
ls -l libnetsnmphelpers.so
ls -l libperl.so
ls -l libnetsnmpagent.so
ls -l libnetsnmpmibs.so
ls -l libwrap.so
}

#symLinksForced 2>&1 | tee /var/tmp/symlinks.log
