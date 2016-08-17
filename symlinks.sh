#!/bin/sh
set -e
#aborts on error

#This script exists to link or re-link the libraries for net-snmp and GPFS
#After a new installation, these will not be linked, or after an update of
#net-snmp. It checks for the existence of a valid symbolic link, and then
#creates one if it is not.

#Logs saved to /var/tmp/symlinks.log

#Wrapped for reuse and logging
function symLinks() {

#Makes sure net-snmp is installed
if [ -f /etc/redhat-release ]; then
		if [ "$(rpm -qa net-snmp 2>/dev/null)" == "" ]; then
			sudo yum -y install net-snmp
		fi
fi

#Change to the proper directory
cd /usr/lib64

#Check there is not already a file or a dead symlink
if ! readlink -e libcrypto.so >/dev/null 2>&1
then
ln -s libcrypto.so.10 libcrypto.so
fi
#Verify
ls -l libcrypto.so

#Check there is not already a file or a dead symlink
if ! readlink -e libnetsnmp.so >/dev/null 2>&1
then
ln -s libnetsnmp.so.31 libnetsnmp.so
fi
#Verify
ls -l libnetsnmp.so

#Check there is not already a file or a dead symlink
if ! readlink -e libnetsnmphelpers.so >/dev/null 2>&1
then
ln -s libnetsnmphelpers.so.31 libnetsnmphelpers.so
fi
#Verify
ls -l libnetsnmphelpers.so

#Check there is not already a file or a dead symlink
if ! readlink -e libperl.so >/dev/null 2>&1
then
ln -s perl5/CORE/libperl.so libperl.so
fi
#Verify
ls -l libperl.so

#Check there is not already a file or a dead symlink
if ! readlink -e libnetsnmpagent.so >/dev/null 2>&1
then
ln -s libnetsnmpagent.so.31.0.2 libnetsnmpagent.so
fi
#Verify
ls -l libnetsnmpagent.so

#Check there is not already a file or a dead symlink
if ! readlink -e libnetsnmpmibs.so >/dev/null 2>&1
then
ln -s libnetsnmpmibs.so.31 libnetsnmpmibs.so
fi
#Verify
ls -l libnetsnmpmibs.so

#Check there is not already a file or a dead symlink
if ! readlink -e libwrap.so >/dev/null 2>&1
then
ln -s libwrap.so.0 libwrap.so
fi
#Verify
ls -l libwrap.so
}

symLinks 2>&1 | tee /var/tmp/symlinks.log

#function symLinksForced() {

#Alternatively, these are the raw commands
#if you wanted to force these actions

#remove existing links
#rm libcrypto.so -f
#rm libnetsnmp.so -f
#rm libnetsnmphelpers.so -f
#rm libperl.so -f
#rm libnetsnmpagent.so -f
#rm libnetsnmpmibs.so -f
#rm libwrap.so -f

#link the libraries
#ln -s libcrypto.so.10 libcrypto.so
#ln -s libnetsnmp.so.31 libnetsnmp.so
#ln -s libnetsnmphelpers.so.31 libnetsnmphelpers.so
#ln -s perl5/CORE/libperl.so libperl.so
#ln -s libnetsnmpagent.so.31.0.2 libnetsnmpagent.so
#ln -s libnetsnmpmibs.so.31 libnetsnmpmibs.so
#ln -s libwrap.so.0 libwrap.so

#ls -l libcrypto.so
#ls -l libnetsnmp.so
#ls -l libnetsnmphelpers.so
#ls -l libperl.so
#ls -l libnetsnmpagent.so
#ls -l libnetsnmpmibs.so
#ls -l libwrap.so
}

#symLinksForced 2>&1 | tee /var/tmp/symlinks.log
