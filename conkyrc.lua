-----------------------------------------------------------------------------
--                               conkyrc_seamod
-- Date    : 04/23/2016
-- Author  : SeaJey and Maxiwell
-- Conky   : >= 1.10 
-- License : Distributed under the terms of GNU GPL version 2 or later
-----------------------------------------------------------------------------

conky.config = {

	background = true,
	update_interval = 1,

	cpu_avg_samples = 2,
	net_avg_samples = 2,
	temperature_unit = 'celsius',

	double_buffer = true,
	no_buffers = true,
	text_buffer_size = 2048,

	gap_x = 80,
	gap_y = 70,
	minimum_width = 300, minimum_height = 900,
	maximum_width = 350,

	own_window = true,
	own_window_type = 'normal',
	own_window_transparent = false,
	own_window_colour = '#000033',
	own_window_argb_visual = true,
	own_window_class = 'conky-semi',
	own_window_hints = 'undecorated,sticky,skip_taskbar,skip_pager,below',

	border_inner_margin = 0,
	border_outer_margin = 0,
	alignment = 'top_right',


	draw_shades = false,
	draw_outline = false,
	draw_borders = false,
	draw_graph_borders = false,

	override_utf8_locale = true,
	use_xft = true,
	font = 'caviar dreams:size=11',
	xftalpha = 0.5,
	uppercase = false,

-- Defining colors
	default_color = '#FFFFFF',
-- Shades of Gray
	color1 = '#DDDDDD',
	color2 = '#AAAAAA',
	color3 = '#888888',
-- Orange
	color4 = '#EF5A29',
-- Green
	color5 = '#77B753',
-- blue Azul
	color6 = '#3875ac',
-- red
	color7 = '#ff0000',
-- Loading lua script for drawning rings
	lua_load = '~/.conky/conky-seamod/seamod_rings.lua',
	lua_draw_hook_pre = 'main',

};

--${offset 15}${font Ubuntu:size=11:style=normal}${color1}${pre_exec lsb_release -d | cut -f 2} - $sysname $kernel
conky.text = [[
${font Ubuntu:size=11:style=bold}${color6}${nodename} ${hr 2}
${offset 15}${font Ubuntu:size=11:style=normal}${color1}$sysname $kernel
${offset 15}${font Ubuntu:size=11:style=normal}${color1}Battery:  ${if_match ${battery_percent BAT0} < 20}${color yellow}${else}${if_match ${battery_percent BAT0} < 5}${color7}${else}${color5}${endif}${endif}${battery_bar 5,150 BAT0} ${if_match ${battery_percent BAT0} < 20}${color yellow}${else}${if_match ${battery_percent BAT0} < 5}${color7}${else}${color5}${endif}${endif}${battery_percent BAT0}%
${offset 15}${font Ubuntu:size=11:style=normal}${color1}Uptime: ${color3}$uptime

# Showing CPU Graph
${voffset -20}
${offset 140}${font Ubuntu:size=11:style:bold}${color6}TEMP
${offset 160}${font Ubuntu:size=11:style=bold}${color1}CPU0: ${if_match ${execi 30 sensors|grep 'Core 0'| awk -F'+' '{print $2}' | awk -F'.' '{print $1}'} > 85}${color7}${else}${color5}${endif}${execi 30 sensors|grep 'Core 0'| awk -F'+' '{print $2}' | awk -F'.' '{print $1}'} °C ${goto 265}${color1}CPU1: ${if_match ${execi 30 sensors|grep 'Core 1'| awk -F'+' '{print $2}' | awk -F'.' '{print $1}'} > 85}${color7}${else}${color5}${endif}${execi 30 sensors|grep 'Core 1'| awk -F'+' '{print $2}' | awk -F'.' '{print $1}'} °C
${offset 125}${cpugraph cpu0 40,220 00FF00 FF0000 -0.3 -t}${voffset -25}
${offset 90}${font Ubuntu:size=11:style=bold}${color6}CPU
# Showing TOP 5 CPU-consumers
${offset 105}${font Ubuntu:size=11:style=normal}${color6}${top name 1}${alignr}${top cpu 1}%
${offset 105}${font Ubuntu:size=11:style=normal}${color1}${top name 2}${alignr}${top cpu 2}%
${offset 105}${font Ubuntu:size=11:style=normal}${color2}${top name 3}${alignr}${top cpu 3}%
${offset 105}${font Ubuntu:size=11:style=normal}${color3}${top name 4}${alignr}${top cpu 4}%
${offset 105}${font Ubuntu:size=11:style=normal}${color3}${top name 5}${alignr}${top cpu 5}%

#Showing memory part with TOP 5
${voffset 40}
${offset 90}${font Ubuntu:size=11:style=bold}${color6}MEM
${offset 105}${font Ubuntu:size=11:style=normal}${color6}${top_mem name 1}${alignr}${top_mem mem_res 1}
${offset 105}${font Ubuntu:size=11:style=normal}${color1}${top_mem name 2}${alignr}${top_mem mem_res 2}
${offset 105}${font Ubuntu:size=11:style=normal}${color2}${top_mem name 3}${alignr}${top_mem mem_res 3}
${offset 105}${font Ubuntu:size=11:style=normal}${color3}${top_mem name 4}${alignr}${top_mem mem_res 4}
${offset 105}${font Ubuntu:size=11:style=normal}${color3}${top_mem name 4}${alignr}${top_mem mem_res 5}

# Showing disk partitions: root, home and files
${voffset 12}
${offset 180}${color1}${font Ubuntu:size=10:style=bold}Disk Read: ${alignr}${font Ubuntu:size=10:style=normal}${color2}${diskio_read}
${offset 180}${color1}${font Ubuntu:size=10:style=bold}Disk Write: ${alignr}${font Ubuntu:size=10:style=normal}${color2}${diskio_write}
${voffset -25}
${offset 90}${font Ubuntu:size=11:style=bold}${color6}DISKS

${voffset -20}
${offset 115}${alignc}${font Ubuntu:size=10:style=bold}${color6}Root:${goto 170}${font Ubuntu:size=10:style=bold}${color1}Free: $color3${font Ubuntu:size=10:style=normal}${fs_free /}${alignr}${goto 260}${font Ubuntu:size=10:style=bold}${color1}Used: $color3${font Ubuntu:size=10:style=normal}${fs_used /}
${offset 115}${alignc}${font Ubuntu:size=10:style=bold}${color6}Home:${goto 170}${font Ubuntu:size=10:style=bold}${color1}Free: $color3${font Ubuntu:size=10:style=normal}${fs_free /home}${alignr}${goto 260}${font Ubuntu:size=10:style=bold}${color1}Used: $color3${font Ubuntu:size=10:style=normal}${fs_used /home}

# Network data (my desktop have only LAN). ETHERNET ring is mostly useless but looks pretty, main info is in the graphs
${voffset 45}
${offset 200}${font Ubuntu:size=10:style=bold}${color1}Lan IP: ${alignr}$color3${addr enp1s0}
${offset 200}${font Ubuntu:size=10:style=bold}${color1}Wifi IP: ${alignr}$color3${addr wlp2s0}
${offset 200}${font Ubuntu:size=10:style=bold}${color1}Ext IP: ${alignr}$color3${execi 600 wget -q -O /dev/stdout http://checkip.dyndns.org/ | cut -d : -f 2- | cut -d \< -f -1} 
${offset 190}${font Ubuntu:size=10:style=bold}${alignr}$color3${execi 600 wget -q -O /dev/stdout https://www.dnsleaktest.com/ | grep from | grep -o '<p>.*<img' | grep -o '>.*<' | grep -oEi '[a-zA-Z0-9 ,]+'}

${voffset -60}
${offset 90}${font Ubuntu:size=11:style=bold}${color6}ETHERNET
${voffset 40}             
${offset 15}${color1}${font ubuntu:size=10:style=bold}Up: ${alignr}${font Ubuntu:size=10:style=normal}$color2${upspeed enp1s0} / ${totalup enp1s0}
${offset 15}${upspeedgraph enp1s0 40,320 4B1B0C FF5C2B 1280KiB -l}
${offset 15}${color1}${font Ubuntu:size=10:style=bold}Down: ${alignr}${font Ubuntu:size=10:style=normal}$color2${downspeed enp1s0} / ${totaldown enp1s0}
${offset 15}${downspeedgraph enp1s0 40,320 324D23 77B753 1280KiB -l}

${color6}${hr 2}
]];
