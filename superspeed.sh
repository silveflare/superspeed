#!/usr/bin/env bash
#
# Description: Test your server's network with Speedtest
#
# Copyright (C) 2017 - 2017 
#

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
SKYBLUE='\033[0;36m'
PLAIN='\033[0m'

# check root
[[ $EUID -ne 0 ]] && echo -e "${RED}Error:${PLAIN} This script must be run as root!" && exit 1

# check python
if  [ ! -e '/usr/bin/python' ]; then
        echo -e
        read -p "${RED}Error:${PLAIN} python is not install. You must be install python command at first.\nDo you want to install? [y/n]" is_install
        if [[ ${is_install} == "y" || ${is_install} == "Y" ]]; then
            if [ "${release}" == "centos" ]; then
                        yum -y install python
                else
                        apt-get -y install python
                fi
        else
            exit
        fi
        
fi

# check wget
if  [ ! -e '/usr/bin/wget' ]; then
        echo -e
        read -p "${RED}Error:${PLAIN} wget is not install. You must be install wget command at first.\nDo you want to install? [y/n]" is_install
        if [[ ${is_install} == "y" || ${is_install} == "Y" ]]; then
                if [ "${release}" == "centos" ]; then
                        yum -y install wget
                else
                        apt-get -y install wget
                fi
        else
                exit
        fi
fi


clear
echo "#############################################################"
echo "# Description: Test your server's network with Speedtest    #"
echo "# Copyright (C) 2017 - 2017                                 #"
echo "#############################################################"
echo
echo "���Է�������"
echo -ne "1.�й����� 2.�й���ͨ 3.�й��ƶ� 4.����Ĭ�� 5.ȫ�����"

while :; do echo
        read -p "����������ѡ�� " telecom
        if [[ ! $telecom =~ ^[1-5]$ ]]; then
                echo "�������! ��������ȷ������!"
        else
                break   
        fi
done

if [[ ${telecom} == 1 ]]; then
        telecomName="����"
        echo -e "\nѡ�������ķ�λ"
    echo -ne "1.���� 2.�Ϸ�"
    while :; do echo
            read -p "����������ѡ�� " pos
            if [[ ! $pos =~ ^[1-2]$ ]]; then
                    echo "�������! ��������ȷ������!"
            else
                    break
            fi
    done
    echo -e "\nѡ�������ĳ���"
    if [[ ${pos} == 1 ]]; then
        echo -ne "1.֣�� 2.����"
        while :; do echo
                read -p "����������ѡ�� " city
                if [[ ! $city =~ ^[1-2]$ ]]; then
                        echo "�������! ��������ȷ������!"
                else
                        break
            fi
        done
        if [[ ${city} == 1 ]]; then
                num=4595
                cityName="֣��"
        fi
        if [[ ${city} == 2 ]]; then
                num=12637
                cityName="����"
        fi
    fi
    if [[ ${pos} == 2 ]]; then
        echo -ne "1.�Ϻ� 2.���� 3.���� 4.�ϲ� 5.��ɳ 6.���� 7.���� 8.�ɶ�"
        while :; do echo
                read -p "����������ѡ�� " city
                if [[ ! $city =~ ^[1-8]$ ]]; then
                        echo "�������! ��������ȷ������!"
                else
                        break
            fi
        done
        if [[ ${city} == 1 ]]; then
                num=3633
                cityName="�Ϻ�"
        fi
        if [[ ${city} == 2 ]]; then
                num=7509
                cityName="����"
        fi
        if [[ ${city} == 3 ]]; then
                num=10305
                cityName="����"
        fi
        if [[ ${city} == 4 ]]; then
                num=7230
                cityName="�ϲ�"
        fi
        if [[ ${city} == 5 ]]; then
                num=6132
                cityName="��ɳ"
        fi
        if [[ ${city} == 6 ]]; then
                num=5081
                cityName="����"
        fi
        if [[ ${city} == 7 ]]; then
                num=6592
                cityName="����"
        fi
        if [[ ${city} == 8 ]]; then
                num=4624
                cityName="�ɶ�"
        fi
    fi
fi

if [[ ${telecom} == 2 ]]; then
        telecomName="��ͨ"
    echo -ne "\n1.���� 2.�Ϸ�"
    while :; do echo
            read -p "����������ѡ�� " pos
            if [[ ! $pos =~ ^[1-2]$ ]]; then
                    echo "�������! ��������ȷ������!"
            else
                    break
            fi
    done
    echo -e "\nѡ�������ĳ���"
    if [[ ${pos} == 1 ]]; then
        echo -ne "1.���� 2.���� 3.������ 4.��� 5.���� 6.���� 7.֣�� 8.���� 9.̫ԭ 10.���� 11.���� 12.����"
        while :; do echo
                read -p "����������ѡ�� " city
                if [[ ! $city =~ ^(([1-9])|(1([0-2]{1})))$ ]]; then
                        echo "�������! ��������ȷ������!"
                else
                        break
            fi
        done
        if [[ ${city} == 1 ]]; then
                num=5017
                cityName="����"
        fi
        if [[ ${city} == 2 ]]; then
                num=9484
                cityName="����"
        fi
        if [[ ${city} == 3 ]]; then
                num=5460
                cityName="������"
        fi
        if [[ ${city} == 4 ]]; then
                num=5475
                cityName="���"
        fi
        if [[ ${city} == 5 ]]; then
                num=5039
                cityName="����"
        fi
        if [[ ${city} == 6 ]]; then
                num=5145
                cityName="����"
        fi
        if [[ ${city} == 7 ]]; then
                num=5131
                cityName="֣��"
        fi
        if [[ ${city} == 8 ]]; then
                num= 4863
                cityName="����"
        fi
        if [[ ${city} == 9 ]]; then
                num=12868
                cityName="̫ԭ"
        fi
        if [[ ${city} == 10 ]]; then
                num=5509
                cityName="����"
        fi
        if [[ ${city} == 11 ]]; then
                num=4690
                cityName="����"
        fi
        if [[ ${city} == 12 ]]; then
                num=5992
                cityName="����"
        fi
    fi
    if [[ ${pos} == 2 ]]; then
        echo -ne "1.�Ϻ� 2.���� 3.���� 4.�Ϸ� 5.�ϲ� 6.��ɳ 7.���� 8.���� 9.���� 10.���� 11.�ɶ�"
        while :; do echo
                read -p "����������ѡ�� " city
                if [[ ! $city =~ ^(([1-9])|(1([0-1]{1})))$ ]]; then
                        echo "�������! ��������ȷ������!"
                else
                        break
            fi
        done
        if [[ ${city} == 1 ]]; then
                num=5083
                cityName="�Ϻ�"
        fi
        if [[ ${city} == 2 ]]; then
                num=5300
                cityName="����"
        fi
        if [[ ${city} == 3 ]]; then
                num=5674
                cityName="����"
        fi
        if [[ ${city} == 4 ]]; then
                num=5724
                cityName="�Ϸ�"
        fi
        if [[ ${city} == 5 ]]; then
                num=5079
                cityName="�ϲ�"
        fi
        if [[ ${city} == 6 ]]; then
                num=4870
                cityName="��ɳ"
        fi
        if [[ ${city} == 7 ]]; then
                num=10201
                cityName="����"
        fi
        if [[ ${city} == 8 ]]; then
                num=3891
                cityName="����"
        fi
        if [[ ${city} == 9 ]]; then
                num=5726
                cityName="����"
        fi
        if [[ ${city} == 10 ]]; then
                num=5103
                cityName="����"
        fi
        if [[ ${city} == 11 ]]; then
                num=2461
                cityName="�ɶ�"
        fi
    fi
fi

if [[ ${telecom} == 3 ]]; then
        telecomName="�ƶ�"
    echo -ne "\n1.���� 2.�Ϸ�"
    while :; do echo
            read -p "����������ѡ�� " pos
            if [[ ! $pos =~ ^[1-2]$ ]]; then
                    echo "�������! ��������ȷ������!"
            else
                    break
            fi
    done
    echo -e "\nѡ�������ĳ���"
    if [[ ${pos} == 1 ]]; then
        echo -ne "1.����"
        while :; do echo
                read -p "����������ѡ�� " city
                if [[ ! $city =~ ^[1]$ ]]; then
                        echo "�������! ��������ȷ������!"
                else
                        break
            fi
        done
        if [[ ${city} == 1 ]]; then
                num=5292
        fi
    fi
    if [[ ${pos} == 2 ]]; then
        echo -ne "1.�Ϻ� 2.���� 3.���� 4.���� 5.�Ϸ� 6.�ɶ�"
        while :; do echo
                read -p "����������ѡ�� " city
                if [[ ! $city =~ ^[1-6]$ ]]; then
                        echo "�������! ��������ȷ������!"
                else
                        break
            fi
        done
        if [[ ${city} == 1 ]]; then
                num=4665
                cityName="�Ϻ�"
        fi
        if [[ ${city} == 2 ]]; then
                num=6715
                cityName="����"
        fi
        if [[ ${city} == 3 ]]; then
                num=5122
                cityName="����"
        fi
        if [[ ${city} == 4 ]]; then
                num=4647
                cityName="����"
        fi
        if [[ ${city} == 5 ]]; then
                num=4377 
                cityName="�Ϸ�"
        fi
        if [[ ${city} == 6 ]]; then
                num=4575
                cityName="�ɶ�"
        fi
    fi
fi

# install speedtest
if  [ ! -e '/tmp/speedtest.py' ]; then
    wget --no-check-certificate -P /tmp https://raw.github.com/sivel/speedtest-cli/master/speedtest.py > /dev/null 2>&1
fi
chmod a+rx /tmp/speedtest.py

result() {
    download=`cat /tmp/speed.log | awk -F ':' '/Download/{print $2}'`
    upload=`cat /tmp/speed.log | awk -F ':' '/Upload/{print $2}'`
    hostby=`cat /tmp/speed.log | awk -F ':' '/Hosted/{print $1}'`
    latency=`cat /tmp/speed.log | awk -F ':' '/Hosted/{print $2}'`
    clear
    echo "$hostby"
    echo "�ӳ�  : $latency"
    echo "�ϴ�  : $upload"
    echo "����  : $download"
    echo -ne "\n��ǰʱ��: "
    echo $(date +%Y-%m-%d" "%H:%M:%S)
}

speed_test(){
	temp=$(python /tmp/speedtest.py --server $1 --share 2>&1)
	is_down=$(echo "$temp" | grep 'Download') 
	if [[ ${is_down} ]]; then
        local REDownload=$(echo "$temp" | awk -F ':' '/Download/{print $2}')
        local reupload=$(echo "$temp" | awk -F ':' '/Upload/{print $2}')
        local relatency=$(echo "$temp" | awk -F ':' '/Hosted/{print $2}')
        temp=$(echo "$relatency" | awk -F '.' '{print $1}')
        if [[ ${temp} -gt 1000 ]]; then
            relatency=" 000.000 ms"
        fi
        local nodeName=$2

        printf "${YELLOW}%-17s${GREEN}%-18s${RED}%-20s${SKYBLUE}%-12s${PLAIN}\n" "${nodeName}" "${reupload}" "${REDownload}" "${relatency}"
	else
        local cerror="ERROR"
	fi
}

if [[ ${telecom} =~ ^[1-3]$ ]]; then
    python /tmp/speedtest.py --server ${num} --share 2>/dev/null | tee /tmp/speed.log 2>/dev/null
    is_down=$(cat /tmp/speed.log | grep 'Download')

    if [[ ${is_down} ]]; then
        result
        echo "���Ե� ${cityName}${telecomName} ��ɣ�"
        rm -rf /tmp/speedtest.py
        rm -rf /tmp/speed.log
    else
	    echo -e "\n${RED}ERROR:${PLAIN} ��ǰ�ڵ㲻���ã�����������ڵ㣬�򻻸�ʱ����ٲ��ԡ�"
	fi
fi

if [[ ${telecom} == 4 ]]; then
    python /tmp/speedtest.py | tee /tmp/speed.log
    result
    echo "���ز�����ɣ�"
    rm -rf /tmp/speedtest.py
    rm -rf /tmp/speed.log
fi

if [[ ${telecom} == 5 ]]; then
	echo ""
	printf "%-14s%-18s%-20s%-12s\n" "Node Name" "Upload Speed" "Download Speed" "Latency"
	start=$(date +%s) 
    speed_test '6435' '��������'
    speed_test '7509' '��������'
	speed_test '3633' '�Ϻ�����'
	speed_test '4624' '�ɶ�����'
	speed_test '5017' '������ͨ'
	speed_test '4863' '������ͨ'
	speed_test '5083' '�Ϻ���ͨ'
	speed_test '5726' '������ͨ'
	speed_test '5292' '�����ƶ�'
	speed_test '16314' 'ɽ���ƶ�'
    speed_test '6715' '�����ƶ�'
	speed_test '4575' '�ɶ��ƶ�'
	end=$(date +%s)  
	rm -rf /tmp/speedtest.py
	echo ""
	time=$(( $end - $start ))
	if [[ $time -gt 60 ]]; then
		min=$(expr $time / 60)
		sec=$(expr $time % 60)
		echo -ne "����ʱ�䣺${min} �� ${sec} ��"
	else
		echo -ne "����ʱ�䣺${time} ��"
	fi
	echo -ne "\n��ǰʱ��: "
    echo $(date +%Y-%m-%d" "%H:%M:%S)
	echo "ȫ�������ɣ�"
fi