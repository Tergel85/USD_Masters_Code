#!/bin/bash

LOGFILE="./sd_edu_ips.txt"

echo "Report started `date`" > $LOGFILE

echo -en "######################################################\n" | tee -a $LOGFILE
echo -en "## Welcome to IP range and lookup enumeration tool  ##\n" | tee -a $LOGFILE
echo -en "## This tool will discover subnets of the IP        ##\n" | tee -a $LOGFILE
echo -en "## related to a URL. This version can eval class b  ##\n" | tee -a $LOGFILE
echo -en "## and class c ranges.                              ##\n" | tee -a $LOGFILE
echo -en "######################################################\n" | tee -a $LOGFILE

read -p 'URL to evaluate: ' BASEURL

BASEIP=`dig +short $BASEURL`

if [ "$BASEIP" = "" ]; then
	echo "The URL does not appear to be valid. Please try again!" | tee -a $LOGFILE
	exit 1
fi

RANGES=(`whois $BASEIP | grep "CIDR" | egrep -o [0-9][0-9]?[0-9]?\.[0-9][0-9]?[0-9]?\.[0-9][0-9]?[0-9]?\.[0-9][0-9]?[0-9]?\/[0-9][0-9]?`)

echo -en "Subnets found that are related to $BASEURL ($BASEIP) are ${RANGES[*]}\n"  | tee -a $LOGFILE
echo -en "If DNS does not resolve the IP will not display.\n\n" | tee -a $LOGFILE

for testip in ${RANGES[@]} 
do
	IP=`echo $testip | awk -F "/" '{print $1}'`
	SUBNET=`echo $testip | awk -F "/" '{print $2}'`

	if [ $SUBNET -eq 16 ]; then
		SUBIP=`echo $IP | awk -F "." '{print $1"."$2"."}'`
		SUBSTART1=`echo $IP | awk -F "." '{print $3}'`
		SUBEND1=$(expr $SUBSTART1 + 255)
		SUBSTART2=`echo $IP | awk -F "." '{print $4}'`
		SUBEND2=$(expr $SUBSTART2 + 254)

		for resolvetest1 in $(seq $SUBSTART1 $SUBEND1)
		do
			for resolvetest2 in $(seq $SUBSTART2 $SUBEND2)
			do
				DIGRESULTS=(`dig +short -x $SUBIP$resolvetest1\.$resolvetest2`)
				if ! [[ $DIGRESULTS = "" ]]; then
					echo "Domains that resolve to $SUBIP$resolvetest1.$resolvetest2===" | tee -a $LOGFILE
					printf '%s\n' "${DIGRESULTS[@]}" | tee -a $LOGFILE
					echo -e "\n" | tee -a $LOGFILE
				fi
			done
		done
	fi

	if [ $SUBNET -eq 17 ]; then
		SUBIP=`echo $IP | awk -F "." '{print $1"."$2"."}'`
		SUBSTART1=`echo $IP | awk -F "." '{print $3}'`
		SUBEND1=$(expr $SUBSTART1 + 127)
		SUBSTART2=`echo $IP | awk -F "." '{print $4}'`
		SUBEND2=$(expr $SUBSTART2 + 254)

		for resolvetest1 in $(seq $SUBSTART1 $SUBEND1)
		do
			for resolvetest2 in $(seq $SUBSTART2 $SUBEND2)
			do
				DIGRESULTS=(`dig +short -x $SUBIP$resolvetest1\.$resolvetest2`)
				if ! [[ $DIGRESULTS = "" ]]; then
					echo "Domains that resolve to $SUBIP$resolvetest1.$resolvetest2===" | tee -a $LOGFILE
					printf '%s\n' "${DIGRESULTS[@]}" | tee -a $LOGFILE
					echo -e "\n" | tee -a $LOGFILE
				fi
			done
		done
	fi

	if [ $SUBNET -eq 18 ]; then
		SUBIP=`echo $IP | awk -F "." '{print $1"."$2"."}'`
		SUBSTART1=`echo $IP | awk -F "." '{print $3}'`
		SUBEND1=$(expr $SUBSTART1 + 63)
		SUBSTART2=`echo $IP | awk -F "." '{print $4}'`
		SUBEND2=$(expr $SUBSTART2 + 254)

		for resolvetest1 in $(seq $SUBSTART1 $SUBEND1)
		do
			for resolvetest2 in $(seq $SUBSTART2 $SUBEND2)
			do
				DIGRESULTS=(`dig +short -x $SUBIP$resolvetest1\.$resolvetest2`)
				if ! [[ $DIGRESULTS = "" ]]; then
					echo "Domains that resolve to $SUBIP$resolvetest1.$resolvetest2===" | tee -a $LOGFILE
					printf '%s\n' "${DIGRESULTS[@]}" | tee -a $LOGFILE
					echo -e "\n" | tee -a $LOGFILE
				fi
			done
		done
	fi

	if [ $SUBNET -eq 19 ]; then
		SUBIP=`echo $IP | awk -F "." '{print $1"."$2"."}'`
		SUBSTART1=`echo $IP | awk -F "." '{print $3}'`
		SUBEND1=$(expr $SUBSTART1 + 31)
		SUBSTART2=`echo $IP | awk -F "." '{print $4}'`
		SUBEND2=$(expr $SUBSTART2 + 254)

		for resolvetest1 in $(seq $SUBSTART1 $SUBEND1)
		do
			for resolvetest2 in $(seq $SUBSTART2 $SUBEND2)
			do
				DIGRESULTS=(`dig +short -x $SUBIP$resolvetest1\.$resolvetest2`)
				if ! [[ $DIGRESULTS = "" ]]; then
					echo "Domains that resolve to $SUBIP$resolvetest1.$resolvetest2===" | tee -a $LOGFILE
					printf '%s\n' "${DIGRESULTS[@]}" | tee -a $LOGFILE
					echo -e "\n" | tee -a $LOGFILE
				fi
			done
		done
	fi

	if [ $SUBNET -eq 20 ]; then
		SUBIP=`echo $IP | awk -F "." '{print $1"."$2"."}'`
		SUBSTART1=`echo $IP | awk -F "." '{print $3}'`
		SUBEND1=$(expr $SUBSTART1 + 15)
		SUBSTART2=`echo $IP | awk -F "." '{print $4}'`
		SUBEND2=$(expr $SUBSTART2 + 254)

		for resolvetest1 in $(seq $SUBSTART1 $SUBEND1)
		do
			for resolvetest2 in $(seq $SUBSTART2 $SUBEND2)
			do
				DIGRESULTS=(`dig +short -x $SUBIP$resolvetest1\.$resolvetest2`)
				if ! [[ $DIGRESULTS = "" ]]; then
					echo "Domains that resolve to $SUBIP$resolvetest1.$resolvetest2===" | tee -a $LOGFILE
					printf '%s\n' "${DIGRESULTS[@]}" | tee -a $LOGFILE
					echo -e "\n" | tee -a $LOGFILE
				fi
			done
		done
	fi

	if [ $SUBNET -eq 21 ]; then
		SUBIP=`echo $IP | awk -F "." '{print $1"."$2"."}'`
		SUBSTART1=`echo $IP | awk -F "." '{print $3}'`
		SUBEND1=$(expr $SUBSTART1 + 7)
		SUBSTART2=`echo $IP | awk -F "." '{print $4}'`
		SUBEND2=$(expr $SUBSTART2 + 254)

		for resolvetest1 in $(seq $SUBSTART1 $SUBEND1)
		do
			for resolvetest2 in $(seq $SUBSTART2 $SUBEND2)
			do
				DIGRESULTS=(`dig +short -x $SUBIP$resolvetest1\.$resolvetest2`)
				if ! [[ $DIGRESULTS = "" ]]; then
					echo "Domains that resolve to $SUBIP$resolvetest1.$resolvetest2===" | tee -a $LOGFILE
					printf '%s\n' "${DIGRESULTS[@]}" | tee -a $LOGFILE
					echo -e "\n" | tee -a $LOGFILE
				fi
			done
		done
	fi
	
	if [ $SUBNET -eq 22 ]; then
		SUBIP=`echo $IP | awk -F "." '{print $1"."$2"."}'`
		SUBSTART1=`echo $IP | awk -F "." '{print $3}'`
		SUBEND1=$(expr $SUBSTART1 + 3)
		SUBSTART2=`echo $IP | awk -F "." '{print $4}'`
		SUBEND2=$(expr $SUBSTART2 + 254)

		for resolvetest1 in $(seq $SUBSTART1 $SUBEND1)
		do
			for resolvetest2 in $(seq $SUBSTART2 $SUBEND2)
			do
				DIGRESULTS=(`dig +short -x $SUBIP$resolvetest1\.$resolvetest2`)
				if ! [[ $DIGRESULTS = "" ]]; then
					echo "Domains that resolve to $SUBIP$resolvetest1.$resolvetest2===" | tee -a $LOGFILE
					printf '%s\n' "${DIGRESULTS[@]}" | tee -a $LOGFILE
					echo -e "\n" | tee -a $LOGFILE
				fi
			done
		done
	fi
	
	if [ $SUBNET -eq 23 ]; then
		SUBIP=`echo $IP | awk -F "." '{print $1"."$2"."}'`
		SUBSTART1=`echo $IP | awk -F "." '{print $3}'`
		SUBEND1=$(expr $SUBSTART1 + 1)
		SUBSTART2=`echo $IP | awk -F "." '{print $4}'`
		SUBEND2=$(expr $SUBSTART2 + 254)

		for resolvetest1 in $(seq $SUBSTART1 $SUBEND1)
		do
			for resolvetest2 in $(seq $SUBSTART2 $SUBEND2)
			do
				DIGRESULTS=(`dig +short -x $SUBIP$resolvetest1\.$resolvetest2`)
				if ! [[ $DIGRESULTS = "" ]]; then
					echo "Domains that resolve to $SUBIP$resolvetest1.$resolvetest2===" | tee -a $LOGFILE
					printf '%s\n' "${DIGRESULTS[@]}" | tee -a $LOGFILE
					echo -e "\n" | tee -a $LOGFILE
				fi
			done
		done
	fi

	if [ $SUBNET -eq 24 ]; then
		SUBIP=`echo $IP | awk -F "." '{print $1"."$2"."$3"."}'`
		SUBSTART=`echo $IP | awk -F "." '{print $4}'`
		SUBEND=$(expr $SUBSTART + 255)
		for resolvetest in $(seq $SUBSTART $SUBEND)
		do
			DIGRESULTS=`dig +short -x $SUBIP$resolvetest`
			if ! [[ $DIGRESULTS = "" ]]; then
				echo "Domains that resolve to $SUBIP$resolvetest===" | tee -a $LOGFILE
				printf '%s\n' "${DIGRESULTS[@]}" | tee -a $LOGFILE
				echo -e "\n" | tee -a $LOGFILE
			fi
		done
	fi
	
		if [ $SUBNET -eq 25 ]; then
		SUBIP=`echo $IP | awk -F "." '{print $1"."$2"."$3"."}'`
		SUBSTART=`echo $IP | awk -F "." '{print $4}'`
		SUBEND=$(expr $SUBSTART + 127)
		for resolvetest in $(seq $SUBSTART $SUBEND)
		do
			DIGRESULTS=`dig +short -x $SUBIP$resolvetest`
			if ! [[ $DIGRESULTS = "" ]]; then
				echo "Domains that resolve to $SUBIP$resolvetest===" | tee -a $LOGFILE
				printf '%s\n' "${DIGRESULTS[@]}" | tee -a $LOGFILE
				echo -e "\n" | tee -a $LOGFILE
			fi
		done
	fi
	
		if [ $SUBNET -eq 26 ]; then
		SUBIP=`echo $IP | awk -F "." '{print $1"."$2"."$3"."}'`
		SUBSTART=`echo $IP | awk -F "." '{print $4}'`
		SUBEND=$(expr $SUBSTART + 63)
		for resolvetest in $(seq $SUBSTART $SUBEND)
		do
			DIGRESULTS=`dig +short -x $SUBIP$resolvetest`
			if ! [[ $DIGRESULTS = "" ]]; then
				echo "Domains that resolve to $SUBIP$resolvetest===" | tee -a $LOGFILE
				printf '%s\n' "${DIGRESULTS[@]}" | tee -a $LOGFILE
				echo -e "\n" | tee -a $LOGFILE
			fi
		done
	fi
	
		if [ $SUBNET -eq 27 ]; then
		SUBIP=`echo $IP | awk -F "." '{print $1"."$2"."$3"."}'`
		SUBSTART=`echo $IP | awk -F "." '{print $4}'`
		SUBEND=$(expr $SUBSTART + 31)
		for resolvetest in $(seq $SUBSTART $SUBEND)
		do
			DIGRESULTS=`dig +short -x $SUBIP$resolvetest`
			if ! [[ $DIGRESULTS = "" ]]; then
				echo "Domains that resolve to $SUBIP$resolvetest===" | tee -a $LOGFILE
				printf '%s\n' "${DIGRESULTS[@]}" | tee -a $LOGFILE
				echo -e "\n" | tee -a $LOGFILE
			fi
		done
	fi
	
		if [ $SUBNET -eq 28 ]; then
		SUBIP=`echo $IP | awk -F "." '{print $1"."$2"."$3"."}'`
		SUBSTART=`echo $IP | awk -F "." '{print $4}'`
		SUBEND=$(expr $SUBSTART + 14)
		for resolvetest in $(seq $SUBSTART $SUBEND)
		do
			DIGRESULTS=`dig +short -x $SUBIP$resolvetest`
			if ! [[ $DIGRESULTS = "" ]]; then
				echo "Domains that resolve to $SUBIP$resolvetest===" | tee -a $LOGFILE
				printf '%s\n' "${DIGRESULTS[@]}" | tee -a $LOGFILE
				echo -e "\n" | tee -a $LOGFILE
			fi
		done
	fi
	
		if [ $SUBNET -eq 29 ]; then
		SUBIP=`echo $IP | awk -F "." '{print $1"."$2"."$3"."}'`
		SUBSTART=`echo $IP | awk -F "." '{print $4}'`
		SUBEND=$(expr $SUBSTART + 6)
		for resolvetest in $(seq $SUBSTART $SUBEND)
		do
			DIGRESULTS=`dig +short -x $SUBIP$resolvetest`
			if ! [[ $DIGRESULTS = "" ]]; then
				echo "Domains that resolve to $SUBIP$resolvetest===" | tee -a $LOGFILE
				printf '%s\n' "${DIGRESULTS[@]}" | tee -a $LOGFILE
				echo -e "\n" | tee -a $LOGFILE
			fi
		done
	fi
	
		if [ $SUBNET -eq 30 ]; then
		SUBIP=`echo $IP | awk -F "." '{print $1"."$2"."$3"."}'`
		SUBSTART=`echo $IP | awk -F "." '{print $4}'`
		SUBEND=$(expr $SUBSTART + 2)
		for resolvetest in $(seq $SUBSTART $SUBEND)
		do
			DIGRESULTS=`dig +short -x $SUBIP$resolvetest`
			if ! [[ $DIGRESULTS = "" ]]; then
				echo "Domains that resolve to $SUBIP$resolvetest===" | tee -a $LOGFILE
				printf '%s\n' "${DIGRESULTS[@]}" | tee -a $LOGFILE
				echo -e "\n" | tee -a $LOGFILE
			fi
		done
	fi
	
done

echo "Report completed `date`" >> $LOGFILE
echo "Report run has completed. A copy of the report can be found at `pwd`$LOGIFILE." 
