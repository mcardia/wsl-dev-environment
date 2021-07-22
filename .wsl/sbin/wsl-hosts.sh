#!/usr/bin/bash

IP=$(hostname -I | sed -E 's/^[[:space:]]*|[[:space:]]*$//g')
HOSTS_FILE=/mnt/c/Windows/System32/drivers/etc/hosts
HOSTS_BACKUP=/tmp/hosts.backup
HOSTS_TMP=/tmp/hosts.tmp
HOSTNAME=$(echo $WSL_DISTRO_NAME | sed s/^[.]/dot/)
PAD=0
[ ! -z "$1" ] && PAD=$1

HOST=(
    ${HOSTNAME}.wsl
)
BLOCK_BEGIN="#wsl:begin:${WSL_DISTRO_NAME}"
BLOCK_END="#wsl:end:${WSL_DISTRO_NAME}"

BAK_COUNT=10
for i in $(seq -w 2 $BAK_COUNT | sort -r); do
    a=$HOSTS_BACKUP.$i
    b=$HOSTS_BACKUP.$(printf "%0${#BAK_COUNT}d" $((10#$i-1)))
    [ -f $b ] && mv -f $b $a
done
HOSTS_BACKUP=$HOSTS_BACKUP.$(printf "%0${#BAK_COUNT}d" 1)
cp $HOSTS_FILE $HOSTS_BACKUP

dos2unix -n $HOSTS_FILE $HOSTS_TMP  >/dev/null 2>&1
rm -f $HOSTS_TMP.new
touch $HOSTS_TMP.new

skip="false"
while IFS= read -r line
do
    if [[ "$line" == "${BLOCK_BEGIN}" ]]; then
        skip="true"
    fi
    if [[ "$line" == "${BLOCK_END}" ]]; then
        skip="false"
        continue
    fi
    [[ "$skip" == "true" ]] && continue;
    echo "$line" >> $HOSTS_TMP.new
done < "$HOSTS_TMP"

echo ${BLOCK_BEGIN} >> $HOSTS_TMP.new
for i in "${HOST[@]}"; do
    printf "%-${PAD}s- $i => $IP\n"
    echo $IP $i >> $HOSTS_TMP.new
done
echo ${BLOCK_END} >> $HOSTS_TMP.new
unix2dos $HOSTS_TMP.new >/dev/null 2>&1
cat $HOSTS_TMP.new > $HOSTS_FILE
