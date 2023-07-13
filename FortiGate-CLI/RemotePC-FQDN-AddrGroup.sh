# Create Addresses & Address Group Group-RemotePC-Foreign to allow RemotePC through GeoBlock.

config firewall address
    edit "RemotePC-Ankara"
        set type fqdn
        set fqdn "ankara.remotepc.com"
    next
    edit "RemotePC-Taipei"
        set type fqdn
        set fqdn "taipei.remotepc.com"
    next
    edit "RemotePC-Capetown"
        set type fqdn
        set fqdn "capetown.remotepc.com"
    next
    edit "RemotePC-Dubai"
        set type fqdn
        set fqdn "dubai.remotepc.com"
    next
    edit "RemotePC-Bratislava"
        set type fqdn
        set fqdn "bratislava.remotepc.com"
    next
    edit "RemotePC-Istanbul"
        set type fqdn
        set fqdn "istanbul.remotepc.com"
    next
    edit "RemotePC-Bucharest1"
        set type fqdn
        set fqdn "bucharest1.remotepc.com"
    next
    edit "RemotePC-Johannesburg"
        set type fqdn
        set fqdn "johannesburg.remotepc.com"
    next
    edit "RemotePC-CzechRepublic"
        set type fqdn
        set fqdn "czechrepublic.remotepc.com"
    next
    edit "RemotePC-Croatia"
        set type fqdn
        set fqdn "croatia.remotepc.com"
    next
    edit "RemotePC-Medellin"
        set type fqdn
        set fqdn "medellin.remotepc.com"
    next
    edit "RemotePC-Sofia"
        set type fqdn
        set fqdn "sofia.remotepc.com"
    next
    edit "RemotePC-Bucharest"
        set type fqdn
        set fqdn "bucharest.remotepc.com"
    next
    edit "RemotePC-Bangkok"
        set type fqdn
        set fqdn "bangkok.remotepc.com"
    next
    edit "RemotePC-Buenosaires"
        set type fqdn
        set fqdn "buenosaires.remotepc.com"
    next
    edit "RemotePC-Bahrain"
        set type fqdn
        set fqdn "bahrain.remotepc.com"
    next
        edit "RemotePC-Kiev"
        set type fqdn
        set fqdn "kiev.remotepc.com"
    next
end


config firewall addrgrp
    edit "Group-RemotePC-Foreign"
        set member "RemotePC-Ankara" "RemotePC-Bratislava" "RemotePC-Bucharest1" "RemotePC-Capetown" "RemotePC-Croatia" "RemotePC-CzechRepublic" "RemotePC-Dubai" "RemotePC-Istanbul" "RemotePC-Johannesburg" "RemotePC-Medellin" "RemotePC-Taipei" "RemotePC-Bahrain" "RemotePC-Bangkok" "RemotePC-Bucharest" "RemotePC-Buenosaires" "RemotePC-Kiev" "RemotePC-Sofia"
    next
end