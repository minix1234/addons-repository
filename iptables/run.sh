#!/usr/bin/with-contenv bashio


#delete rules if they exist
if su -c 'iptables -D INPUT -i tailscale0 -p tcp -m tcp --dport 8123 -j ACCEPT'; then
    echo 'Removed: port 8123 -j ACCEPT'
fi

if su -c 'iptables -D INPUT -i tailscale0 -p udp -m udp --dport 41641 -j ACCEPT'; then
    echo 'Removed: port 41641 -j ACCEPT'
fi

if su -c 'iptables -D INPUT -i tailscale0 -j DROP'; then
    echo 'Removed: tailscale0 -j DROP'
fi



#add the rules in to protect Home Assistant
su -c 'iptables -I INPUT -i tailscale0 -j DROP'
echo 'Added: iptables -I INPUT -i tailscale0 -j DROP'
su -c 'iptables -I INPUT -i tailscale0 -p tcp -m tcp --dport 8123 -j ACCEPT'
echo 'Added: iptables -I INPUT -i tailscale0 -p tcp -m tcp --dport 8123 -j ACCEPT'
su -c 'iptables -I INPUT -i tailscale0 -p udp -m udp --dport 41641 -j ACCEPT'
echo 'Added: iptables -I INPUT -i tailscale0 -p udp -m udp --dport 41641 -j ACCEPT'