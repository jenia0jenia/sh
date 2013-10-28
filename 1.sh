#!/bin/bash
sudo mount -t cifs -o guest //192.168.10.40/downloads /home/student/smb\
sudo svnadmin dump /home/student/svn/ > /home/backup/temp.dump
CURRENT_DATE=`date  +%H:%M_%d.%m.%Y`
BACKUP_DIR=~/backup
SVN_DIR=~/svn
NUMBER=`ls -1rt "$BACKUP_DIR" | wc -l`
if [ $NUMBER -lt 7 ]
then
cp -r "$SVN_DIR" "$BACKUP_DIR"
mv "$BACKUP_DIR"/svn "$BACKUP_DIR"/svn_${CURRENT_DATE}
mv"$BACKUP_DIR"/temp.dump"$BACKUP_DIR"/svn_${CURRENT_DATE}/${CURRENT_DATE}.dump
else
OLDEST_BACKUP=`ls -1rt "$BACKUP_DIR" | head -1`
rm -r "$BACKUP_DIR"/"$OLDEST_BACKUP"
cp -r "$SVN_DIR" "$BACKUP_DIR"
mv "$BACKUP_DIR"/svn "$BACKUP_DIR"/svn_${CURRENT_DATE}
mv"$BACKUP_DIR"/temp.dump"$BACKUP_DIR"/svn_${CURRENT_DATE}/${CURRENT_DATE}.dump
fi
