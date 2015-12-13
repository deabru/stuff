## Scripts related to disks, partitions, volumes, etc

# check_space_on_disk.sh

Edit to configure it, put it on /etc/cron.hourly (or daily). By default it will send a mail if a partition is at 90% full or more, and it will warn the local user by notify-send if a partition is at 80% full or more.

And please, check if it works first, some commands may behave differently in your system.
