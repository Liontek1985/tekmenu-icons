#!/usr/bin/env bash

# This file is part of the microplay-hub
# Designs by Liontek1985
# for RetroPie and offshoot
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="rpmenu-icons"
rp_module_desc="Retropiemenu Icon-Settings for ES"
rp_module_repo="git https://github.com/Liontek1985/rpmenu-icons.git master"
rp_module_section="main"
rp_module_flags="noinstclean"

function depends_wiringOP() {
    local depends=(cmake)
     getDepends "${depends[@]}"
}


function sources_rpmenu-icons() {
    if [[ -d "$md_inst" ]]; then
        git -C "$md_inst" reset --hard  # ensure that no local changes exist
    fi
    gitPullOrClone "$md_inst"
}

function install_rpmenu-icons() {
    local rpdir="$datadir/retropiemenu"
    local rpiconsetup="$scriptdir/scriptmodules/supplementary"
	
    cd "$md_inst"
	
    cp -r "$rpdir/icons" "$md_inst/icons"
    cp -r "$rpdir/icons" "$md_inst/icons_bkup"
	cp -r "rpmenuicons.sh" "$rpiconsetup/rpmenuicons.sh"
    chown -R $user:$user "$rpdir/icons"	
    chown -R $user:$user "$rpiconsetup/rpmenuicons.sh"
	chmod 755 "$rpiconsetup/rpmenuicons.sh"
	chmod 755 "$rpdir/icons"
	rm -r "rpmenuicons.sh"
	
}


function remove_rpmenu-icons() {
    local rpdir="$datadir/retropiemenu"
	
    rm -rf "$rpdir/icons"	
    cp -r "$md_inst/icons_bkup" "$rpdir/icons"
    chown -R $user:$user "$rpdir/icons"
	chmod 755 "$rpdir/icons"
	rm -rf "$md_inst"
	
}

function gui_rpmenu-icons() {
    while true; do
        local options=(
            1 "choose default icon set"
            2 "choose nes style icon set"
            3 "choose snes style icon set"
            4 "choose smd-genesis style icon set"
            5 "choose pce-tg16 style icon set"
            6 "choose gameboy style icon set"
            7 "choose famicom style icon set"
            8 "choose modern icon set"
        )
        local cmd=(dialog --default-item "$default" --backtitle "$__backtitle" --menu "Choose an option" 22 76 16)
        local choice=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
        default="$choice"
        [[ -z "$choice" ]] && break
        case "$choice" in
            1)
                rm -rf "$datadir/retropiemenu/icons"
				cd "$md_inst"
                cp -r "icons" "$datadir/retropiemenu/icons"
                chown -R $user:$user "$datadir/retropiemenu/icons"
				chmod 755 "$datadir/retropiemenu/icons"
                printMsgs "dialog" "Settings menu default icons installed."
                ;;
            2)
                rm -rf "$datadir/retropiemenu/icons"
				cd "$md_inst"
                cp -r "icons_nes" "$datadir/retropiemenu/icons"
                chown -R $user:$user "$datadir/retropiemenu/icons"
				chmod 755 "$datadir/retropiemenu/icons"
                printMsgs "dialog" "Settings menu nes icons installed."
                ;;
            3)
                rm -rf "$datadir/retropiemenu/icons"
				cd "$md_inst"
                cp -r "icons_snes" "$datadir/retropiemenu/icons"
                chown -R $user:$user "$datadir/retropiemenu/icons"
				chmod 755 "$datadir/retropiemenu/icons"
                printMsgs "dialog" "Settings menu snes icons installed."
                ;;
            4)
                rm -rf "$datadir/retropiemenu/icons"
				cd "$md_inst"
                cp -r "icons_smd" "$datadir/retropiemenu/icons"
                chown -R $user:$user "$datadir/retropiemenu/icons"
				chmod 755 "$datadir/retropiemenu/icons"
                printMsgs "dialog" "Settings menu smd-genesis icons installed."
                ;;
            5)
                rm -rf "$datadir/retropiemenu/icons"
				cd "$md_inst"
                cp -r "icons_pce" "$datadir/retropiemenu/icons"
                chown -R $user:$user "$datadir/retropiemenu/icons"
				chmod 755 "$datadir/retropiemenu/icons"
                printMsgs "dialog" "Settings menu pce-tg16 icons installed."
                ;;
            6)
                rm -rf "$datadir/retropiemenu/icons"
				cd "$md_inst"
                cp -r "icons_gb" "$datadir/retropiemenu/icons"
                chown -R $user:$user "$datadir/retropiemenu/icons"
				chmod 755 "$datadir/retropiemenu/icons"
                printMsgs "dialog" "Settings menu gameboy icons installed."
                ;;
            7)
                rm -rf "$datadir/retropiemenu/icons"
				cd "$md_inst"
                cp -r "icons_fds" "$datadir/retropiemenu/icons"
                chown -R $user:$user "$datadir/retropiemenu/icons"
				chmod 755 "$datadir/retropiemenu/icons"
                printMsgs "dialog" "Settings menu famicom icons installed."
                ;;
            8)
                rm -rf "$datadir/retropiemenu/icons"
				cd "$md_inst"
                cp -r "icons_modern" "$datadir/retropiemenu/icons"
                chown -R $user:$user "$datadir/retropiemenu/icons"
				chmod 755 "$datadir/retropiemenu/icons"
                printMsgs "dialog" "Settings menu modern icons installed."
                ;;
        esac
    done
}
