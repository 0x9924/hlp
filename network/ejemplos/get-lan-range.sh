#/bin/bash

int_to_ip () {
    i=$1
    printf "%d.%d.%d.%d\n" $(( (i>>24)%256 )) $(( (i>>16)%256 )) $(((i>>8)%256)) $(( i%256 ))
}

lan_addr=$(ip route | tail -1 | cut -d' ' -f1)
IFS_BKP=$IFS
IFS="/" read -r -a lan_addr <<< "$lan_addr"
IFS="." read -r -a octets <<< "$lan_addr"
IFS=$IFS_BKP
 
# get the lan addres as an int
octets[2]=$((${octets[2]} * 256))
octets[1]=$((${octets[1]} * 256 * 256))
octets[0]=$((${octets[0]} * 256 * 256 * 256))
lan_addr_int=$((${octets[0]} + ${octets[1]} + ${octets[2]} + ${octets[3]}))

# get the range
addr_max=$((2 ** (32 - ${lan_addr[1]}) - 1))
addr_min=$(int_to_ip $((lan_addr_int + 1)) )
addr_max=$(int_to_ip $((lan_addr_int + addr_max))) 

printf "min: %s\n" $addr_min
printf "max: %s\n" $addr_max

