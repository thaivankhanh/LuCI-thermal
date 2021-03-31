-- written by: khanhtv.vn@gmail.com
-- copy this file to: /usr/lib/lua/luci/controller
-- request url: /cgi-bin/luci/admin/status/hwinfo

module("luci.controller.hwinfo", package.seeall)

local http = require("luci.http")

function index()
	entry({"admin", "status", "hwinfo"}, call("hwinfo")).leaf=true
end

function get_cmd(cmd)
    local r = ""
    local f = io.popen(cmd, "r")
	if f then
        r = f:read("*l")
        f:close()
    end
	return r
end

function hwinfo()
	local info = {}

	info["cpu_temp"] = get_cmd("cat /sys/class/thermal/thermal_zone0/temp")
	info["cpu_freq"] = get_cmd("cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq")

	http.prepare_content("application/json")
	http.write_json(info);
end
