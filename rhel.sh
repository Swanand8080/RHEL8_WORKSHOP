#!/bin/bash
echo "Enter your name"
read name
echo "Enter your email"
read email
echo "Enter you college name"
read college
mkdir /rhel8_data
apk add nfs-utils 
mount 3.224.211.85:/nfsdata /rhel8_data
mkdir /rhel8_data/$email
ls /rhel8_data

#Task 1
#checking for /var/tmp/passwd
check=0
if [ -f /var/tmp/passwd ]
then
        check=$((check+1))
fi
#checking for executable permissions
v3=$(ls -l /var/tmp/passwd | cut -b 4,7,10)
if [[ "$v3" == "---" ]]
then
        check=$((check+1))
fi

#checking for read permission
v4=$(ls -l /var/tmp/passwd | cut -b 8)
if [[ "$v4" == "r" ]]
then
        check=$((check+1))

fi

if [ "$check" == "3" ]
then
        echo -e "\e[1;32m-------Task2 completed successfully-------\e[0m"
	touch /rhel8_data/$email/1.txt
else
        echo -e "\e[1;31m-------Task2 did not completed successfully-------\e[0m"
fi


#Task4
check=0
#!/bin/bash
v1=$( id rhel8 | grep workshop )
if [ $? == 0 ]
then
        check=$((check+1))
fi

if su -c true "rhel8"; then
        check=$((check+1))
fi

FILENAME="/etc/passwd"
while IFS=: read -r username password userid groupid comment homedir cmdshell
do
  if [[ "$username" == "rhel7" ]]
  then
          if [[ "$cmdshell" == "/sbin/nologin" ]]
          then
                  check=$((check+1))
          fi
  fi
done < $FILENAME


if [ "$check" == "3" ]
then
        echo -e "\e[1;32m-------Task4 completed successfully-------\e[0m"
	touch /rhel8_data/$email/2.txt
else
        echo -e "\e[1;31m-------Task4 did not completed successfully-------\e[0m"
fi

#Task6
#!/bin/bash
v5=$(hostname | grep rhel8.example.com)
if [ $? == 0 ]
then
        echo -e "\e[1;32m-------Task6 completed successfully-------\e[0m"
	touch /rhel8_data/$email/3.txt
else
        echo -e "\e[1;31m-------Task6 did not completed successfully-------\e[0m"
fi

#Task7
#!/bin/bash
v6=$(grep "WELCOME TO RHEL8 WORKSHOP" /etc/motd)
if [ $? == 0 ]
then
echo -e "\e[1;32m-------Task7 completed successfully-------\e[0m"
touch /rhel8_data/$email/4.txt
else
echo -e "\e[1;31m-------Task7 did not completed successfully-------\e[0m"
fi
