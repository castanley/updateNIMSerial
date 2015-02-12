lsnim -t standalone | awk '{print $1}' | while read i
do
#add all members of standalone into a num group 'all'
#nim -o change -a add_member=$i all
dsh -n $i -c -- 'sed s/OLDSERIAL/NEWSERIAL/ /etc/niminfo > afile; mv afile /etc/niminfo; stopsrc -s nimsh; startsrc -s nimsh'
done
