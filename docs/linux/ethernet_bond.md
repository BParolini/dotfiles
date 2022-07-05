# [Bond WiFi and Ethernet for easier networking mobility](https://fedoramagazine.org/bond-wifi-and-ethernet-for-easier-networking-mobility/)

by [Ben Cotton](https://fedoramagazine.org/author/bcotton/)

---

###### tags: `Linux` `Article`

---

<img src="https://fedoramagazine.org/wp-content/uploads/2019/07/networkingmobility-1024x433.jpg" alt="Network Mobility" style="display: block; margin:auto;">

Sometimes one network interface isn’t enough. Network bonding allows multiple network connections to act together with a single logical interface. You might do this because you want more bandwidth than a single connection can handle. Or maybe you want to switch back and forth between your wired and wireless networks without losing your network connection.

The latter applies to me. One of the benefits to working from home is that when the weather is nice, it’s enjoyable to work from a sunny deck instead of inside. But every time I did that, I lost my network connections. IRC, SSH, VPN — everything goes away, at least for a moment while some clients reconnect. This article describes how I set up network bonding on my Fedora 30 laptop to seamlessly move from the wired connection my laptop dock to a WiFi connection.

In Linux, interface bonding is handled by the bonding kernel module. Fedora does not ship with this enabled by default, but it is included in the kernel-core package. This means that enabling interface bonding is only a command away:

```shell
sudo modprobe bonding
```

Note that this will only have effect until you reboot. To permanently enable interface bonding, create a file called bonding.conf in the /etc/modules-load.d directory that contains only the word “bonding”.

Now that you have bonding enabled, it’s time to create the bonded interface. First, you must get the names of the interfaces you want to bond. To list the available interfaces, run:

```shell
sudo nmcli device status
```

You will see output that looks like this:

```shell
DEVICE          TYPE      STATE         CONNECTION         
enp12s0u1       ethernet  connected     Wired connection 1
tun0            tun       connected     tun0               
virbr0          bridge    connected     virbr0             
wlp2s0          wifi      disconnected  --                 
p2p-dev-wlp2s0  wifi-p2p  disconnected  --                 
enp0s31f6       ethernet  unavailable   --                 
lo              loopback  unmanaged     --                 
virbr0-nic      tun       unmanaged     --        
```

In this case, there are two (wired) Ethernet interfaces available. `enp12s0u1` is on a laptop docking station, and you can tell that it’s connected from the STATE column. The other, `enp0s31f6`, is the built-in port in the laptop. There is also a WiFi connection called `wlp2s0`. `enp12s0u1` and `wlp2s0` are the two interfaces we’re interested in here. (Note that it’s not necessary for this exercise to understand how network devices are named, but if you’re interested you can see the [systemd.net-naming-scheme man page](https://www.freedesktop.org/software/systemd/man/systemd.net-naming-scheme.html).)

The first step is to create the bonded interface:

```shell
sudo nmcli connection add type bond ifname bond0 con-name bond0
```

In this example, the bonded interface is named `bond0`. The “`con-name bond0`” sets the connection name to `bond0`; leaving this off would result in a connection named `bond-bond0`. You can also set the connection name to something more human-friendly, like “Docking station bond” or “Ben”

The next step is to add the interfaces to the bonded interface:

```shell
sudo nmcli connection add type ethernet ifname enp12s0u1 master bond0 con-name bond-ethernet
sudo nmcli connection add type wifi ifname wlp2s0 master bond0 ssid Cotton con-name bond-wifi
```

As above, the connection name is specified to be [more descriptive](https://en.wikipedia.org/wiki/Master/slave_(technology)#Terminology_concerns). Be sure to replace `enp12s0u1` and `wlp2s0` with the appropriate interface names on your system. For the WiFi interface, use your own network name (SSID) where I use “Cotton”. If your WiFi connection has a password (and of course it does!), you’ll need to add that to the configuration, too. The following assumes you’re using [WPA2-PSK](https://en.wikipedia.org/wiki/Wi-Fi_Protected_Access#Target_users_(authentication_key_distribution)) authentication:

```shell
sudo nmcli connection modify bond-wifi wifi-sec.key-mgmt wpa-psk
sudo nmcli connection edit bond-wifi
```

The second command will bring you into the interactive editor where you can enter your password without it being logged in your shell history. Enter the following, replacing _password_ with your actual password:

```shell
set wifi-sec.psk password
save
quit
```

Now you’re ready to start your bonded interface and the secondary interfaces you created:

```shell
sudo nmcli connection up bond0
sudo nmcli connection up bond-ethernet
sudo nmcli connection up bond-wifi
```

You should now be able to disconnect your wired or wireless connections without losing your network connections.

## A caveat: using other WiFi networks

This configuration works well when moving around on the specified WiFi network, but when away from this network, the SSID used in the bond is not available. Theoretically, one could add an interface to the bond for every WiFi connection used, but that doesn’t seem reasonable. Instead, you can disable the bonded interface:

```shell
sudo nmcli connection down bond0
```

When back on the defined WiFi network, simply start the bonded interface as above.

## Fine-tuning your bond

By default, the bonded interface uses the “load balancing (round-robin)” mode. This spreads the load equally across the interfaces. But if you have a wired and a wireless connection, you may want to prefer the wired connection. The “active-backup” mode enables this. You can specify the mode and primary interface when you are creating the interface, or afterward using this command (the bonded interface should be down):

```shell
sudo nmcli connection modify bond0 +bond.options "mode=active-backup,primary=enp12s0u1"
```

The [kernel documentation](https://www.kernel.org/doc/Documentation/networking/bonding.txt) has much more information about bonding options.
