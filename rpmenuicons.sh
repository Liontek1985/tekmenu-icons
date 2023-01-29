#!/usr/bin/env bash

# This file is part of The RetroPie Project
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

function depends_rpmenu-icons() {
    getDepends mc
}


function sources_rpmenu-icons() {
    gitPullOrClone
}

function install_rpmenu-icons() {
    local rpdir="$datadir/retropiemenu/icons"
    local rpicondir="$scriptdir/scriptmodules/supplementary/rpmenu-icons"
    local rpiconsetup="$scriptdir/scriptmodules/supplementary"
	
    mkdir -p "$rpicondir"
    chown -R $user:$user "$rpicondir"
	
	cp  -r "icons_modern" "$rpicondir/icons_modern"
	cp  -r "icons_fds" "$rpicondir/icons_fds"
	cp  -r "icons_nes" "$rpicondir/icons_nes"
	cp  -r "icons_snes" "$rpicondir/icons_snes"
	cp  -r "icons_gb" "$rpicondir/icons_gb"
	cp  -r "icons_smd" "$rpicondir/icons_smd"
	cp  -r "icons_pce" "$rpicondir/icons_pce"
	
    cp -r "$rpdir/icons" "$rpicondir/icons"
	
	cp  -r "rpmenuicons.sh" "$rpiconsetup/rpmenuicons.sh"
    chown -R $user:$user "$rpiconsetup/rpmenuicons.sh"
	
}


function remove_rpmenu-icons() {

    rm -rf "$scriptdir/scriptmodules/supplementary/rpmenu-icons"
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
                cp -r "$scriptdir/scriptmodules/supplementary/rpmenu-icons/icons" "$datadir/retropiemenu/icons"
                chown -R $user:$user "$datadir/retropiemenu/icons"
                printMsgs "dialog" "Settings menu default icons installed\n\nRestart EmulationStation to apply."
                ;;
            2)
                rm -rf "$datadir/retropiemenu/icons"
                cp -r "$scriptdir/scriptmodules/supplementary/rpmenu-icons/icons_nes" "$datadir/retropiemenu/icons"
                chown -R $user:$user "$datadir/retropiemenu/icons"
                printMsgs "dialog" "Settings menu nes icons installed.\n\nRestart EmulationStation to apply."
                ;;
            3)
                rm -rf "$datadir/retropiemenu/icons"
                cp -r "$scriptdir/scriptmodules/supplementary/rpmenu-icons/icons_snes" "$datadir/retropiemenu/icons"
                chown -R $user:$user "$datadir/retropiemenu/icons"
                printMsgs "dialog" "Settings menu snes icons installed.\n\nRestart EmulationStation to apply."
                ;;
            4)
                rm -rf "$datadir/retropiemenu/icons"
                cp -r "$scriptdir/scriptmodules/supplementary/rpmenu-icons/icons_smd" "$datadir/retropiemenu/icons"
                chown -R $user:$user "$datadir/retropiemenu/icons"
                printMsgs "dialog" "Settings menu smd-genesis icons installed.\n\nRestart EmulationStation to apply."
                ;;
            5)
                rm -rf "$datadir/retropiemenu/icons"
                cp -r "$scriptdir/scriptmodules/supplementary/rpmenu-icons/icons_pce" "$datadir/retropiemenu/icons"
                chown -R $user:$user "$datadir/retropiemenu/icons"
                printMsgs "dialog" "Settings menu pce-tg16 icons installed.\n\nRestart EmulationStation to apply."
                ;;
            6)
                rm -rf "$datadir/retropiemenu/icons"
                cp -r "$scriptdir/scriptmodules/supplementary/rpmenu-icons/icons_gb" "$datadir/retropiemenu/icons"
                chown -R $user:$user "$datadir/retropiemenu/icons"
                printMsgs "dialog" "Settings menu gameboy icons installed.\n\nRestart EmulationStation to apply."
                ;;
            7)
                rm -rf "$datadir/retropiemenu/icons"
                cp -r "$scriptdir/scriptmodules/supplementary/rpmenu-icons/icons_fds" "$datadir/retropiemenu/icons"
                chown -R $user:$user "$datadir/retropiemenu/icons"
                printMsgs "dialog" "Settings menu famicom icons installed.\n\nRestart EmulationStation to apply."
                ;;
            8)
                rm -rf "$datadir/retropiemenu/icons"
                cp -r "$scriptdir/scriptmodules/supplementary/rpmenu-icons/icons_modern" "$datadir/retropiemenu/icons"
                chown -R $user:$user "$datadir/retropiemenu/icons"
                printMsgs "dialog" "Settings menu modern icons installed.\n\nRestart EmulationStation to apply."
                ;;
        esac
    done
}
