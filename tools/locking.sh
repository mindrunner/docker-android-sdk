#!/usr/bin/env bash

LOCKFILE=${ANDROID_SDK}/.update.lock

function lockfile_waithold()
{
   declare -ir time_beg=$(date '+%s')
   declare -ir maxtime=7140  # 7140 s = 1 hour 59 min.

   # waiting up to ${maxtime}s for /tmp/global.lock ...
   while ! \
      (set -o noclobber ; \
       echo -e "DATE:$(date)\nUSER:$(whoami)\nPID:$$" > ${LOCKFILE} \
      ) 2>/dev/null
   do
       if [ $(( $(date '+%s') - ${time_beg})) -gt ${maxtime} ] ; then
           echo "waited too long for ${LOCKFILE}" 1>&2
           return 1
       fi
       sleep 1
   done

   return 0
}

function lockfile_release()
{
   rm -f ${LOCKFILE}
}
