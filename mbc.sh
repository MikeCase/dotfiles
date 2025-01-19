#!/usr/bin/env bash
export INSTDIR="${HOME}/.config/dotfiles"
export BASHRC="${HOME}/.bashrc"
APPLIST=("dig" "tmux" "ansible-playbook" "ssh" )
check_dependencies() {
    for app in "${APPLIST[@]}"; do
        if command -v "$app" &> /dev/null; then
            echo "$app is installed!"
        else
            echo "$app is not installed"
        fi
    done
}

case $1 in
      install)
        echo "Checking for .bashrc in your home directory."
        if [ -e "${BASHRC}" ]; then
            echo "Found .bashrc, moving to a backup file."
            mv "$BASHRC" "${BASHRC}".bak
        fi
        if [ -d ${INSTDIR} ]; then
            echo "Moving files to the install dir"
            cp "${PWD}/.bashrc" "${PWD}/.bash_paths" "${PWD}/.bash_aliases" "${PWD}/.bash_funcs" "${PWD}/.bash_vars" "${PWD}/mbc.sh" "${INSTDIR}"
            touch "${INSTDIR}/.bookmarks"
            cp -r "${PWD}/functions/" "${INSTDIR}"
        elif [ ! -d "${INSTDIR}" ]; then
            echo "Creating install directory and coppying files to ${INSTDIR}"
            mkdir -p "${INSTDIR}"
            cp -r "${PWD}/functions" "${INSTDIR}"
            cp "${PWD}/.bashrc" "${PWD}/.bash_paths" "${PWD}/.bash_aliases" "${PWD}/.bash_funcs" "${PWD}/.bash_vars" "${PWD}/mbc.sh" "${INSTDIR}"
            touch "${INSTDIR}/.bookmarks"
        fi
        echo "Creating symbolic link to this configs .bashrc file in your home directory."
        eval "$(ln -s "${INSTDIR}/.bashrc" "${HOME}")"
        eval "$(ln -s "${INSTDIR}/mbc.sh" "$HOME/.local/bin/")"
        echo "Activating new bash environment."
        source "${BASHRC}"
        
    ;;

    remove)
        echo "Removing link to current .bashrc script"
        unlink "${BASHRC}"
        unlink "${HOME}/.local/bin/${0##*/}"
        if [ -e "${HOME}/.bashrc.bak" ]; then
            echo "Found backup of original .bashrc script."
            echo "Making that the new .bashrc script."
            mv "${HOME}"/.bashrc.bak "${BASHRC}"
            echo "Sourcing backed up .bashrc script."
            source "${BASHRC}"
        fi
        if [ -d "${INSTDIR}" ]; then
            echo "Removing directory ${INSTDIR}"
            rm -rf ${INSTDIR}
        fi
        echo "Removed Mike's Bash Config"
    ;;

    checkdeps)
        echo "Checking for recommended dependencies"
        check_dependencies
    ;;

    *)
        echo "
        ${0##*/} install            Install bash scripts.
        ${0##*/} remove             Remove bash scripts and revert to original system.
        ${0##*/} checkdeps          Check for recommended dependencies.
        "
    ;;

esac
