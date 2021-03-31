# LuCI-thermal
OpenWrt LuCI thermal monitor for OrangePi R1 Plus.<br>

**Warning:** Take care with your OrangePi board, or it burn your house! without a fan, it's hotter than my old NVIDIA GTX750Ti GPU. A heatsink and fan are recommended<br>

Adding simple thermal graph to bottom of page "luci/admin/status/overview".
As this:
![image](https://user-images.githubusercontent.com/42743399/113169032-6943ac80-926f-11eb-9833-bf0abcef8276.png)

Testing on OrangePi R1 Plus only, should be modified for other SoC.
If it isn't working, edit hwinfo.lua, change the following lines adapt to your system:<br>
	info["cpu_temp"] = get_cmd("cat /sys/class/thermal/thermal_zone0/temp")<br>
	info["cpu_freq"] = get_cmd("cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq")<br>

# Installation
Copy hwinfo.lua to /usr/lib/lua/luci/controller<br>
Copy 10-hwinfo.htm to /usr/lib/lua/luci/view/admin_status/index<br>
I Used WinSCP to upload these files to OpenWrt.
Reboot OpenWrt and all done!
