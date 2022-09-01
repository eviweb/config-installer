#! /usr/bin/env bash
#
# Configuration Installer
#

VERSION="0.1.3"

main_dir()
{
    dirname "$(readlink -f "${BASH_SOURCE}")"
}

config_dir()
{
    echo "$(main_dir)/config"
}

config_copy_dir()
{
    echo "$(main_dir)/config/copy"
}

config_link_dir()
{
    echo "$(main_dir)/config/link"
}

config_run_dir()
{
    echo "$(main_dir)/config/run"
}

log()
{
    echo -e "$@"
}

version()
{
    cat << VERSION
Configuration Installer
    Version: ${VERSION}
VERSION
}

usage()
{
    version

    cat << USAGE
    Usage: 
        Run ./install.sh [OPTIONS]

        Options:
            -f              force overwriting files
            -h              display this help message
            -V              display the version number
            -v              set verbosity level, can be used multiple times            
USAGE
}

find_files()
{
    local directory="$1"

    find "${directory}" \( -type f -or -type l \) -and \( -path "*/common/*" -or -path "*/${HOSTNAME}/*" \) | sort
}

get_target_file()
{
    local sourcefile="$1"
    local configdir="$(config_dir)"
    
    echo "${sourcefile}" | sed -r "s/${configdir//\//\\\/}\/[^\/]+\/(common|${HOSTNAME})//"
}

ensure_parent_dir()
{
    local parentdir="$(dirname "$1")"

    [ -f "${parentdir}" ] || mkdir -p "${parentdir}"
}

assert_same_file()
{
    local file1="$1"
    local file2="$2"

    cmp --silent "${file1}" "${file2}"
}

assert_same_source()
{
    local source="$1"
    local link="$2"

    [ "${source}" == "$(readlink "${link}")" ]
}

is_sourced()
{
    [ "${BASH_SOURCE[0]}" != "${0}" ]
}

is_verbosed()
{
    local level="$1"

    [ -n "${level}" ] || level=1

    [ "${VERBOSITY}" -ge "${level}" ]
}

copy_files()
{
    local files=( $(find_files "$(config_copy_dir)") )
    local targetfile
    local msg=""

    for file in "${files[@]}"; do
        targetfile="$(get_target_file "${file}")"
        msg="   Copy ${file/$(main_dir)/.} to ${targetfile}"

        ensure_parent_dir "${targetfile}"
        cp -a "${OVERWRITING}" "${file}" "${targetfile}"

        if ([[ -h "${targetfile}" ]] && assert_same_source "${file}" "${targetfile}") ||
            ([[ -f "${targetfile}" ]] && assert_same_file "${file}" "${targetfile}"); then
            msg="${msg}: \e[32mSucceed\e[0m"
        else
            msg="${msg}: \e[31mFailed\e[0m"
        fi

        is_verbosed && log "${msg}"
    done
}

link_files()
{
    local files=( $(find_files "$(config_link_dir)") )
    local targetfile
    local msg=""

    for file in "${files[@]}"; do
        targetfile="$(get_target_file "${file}")"
        msg="   Link ${file/$(main_dir)/.} to ${targetfile}"

        ensure_parent_dir "${targetfile}"
        ln -s "${OVERWRITING}" "${file}" "${targetfile}"

        if assert_same_source "${file}" "${targetfile}"; then
            msg="${msg}: \e[32mSucceed\e[0m"
        else
            msg="${msg}: \e[31mFailed\e[0m"
        fi

        is_verbosed && log "${msg}"
    done
}

run_scripts()
{
    local scripts=( $(find_files "$(config_run_dir)") )
    local msg=""
    local result

    for script in "${scripts[@]}"; do
        msg="    Run ${script/$(main_dir)/.}"
        result="$(bash -c "${script}")"

        if [ "$?" -eq 0 ]; then
            msg="${msg}: \e[32mSucceed\e[0m"
        else
            msg="${msg}: \e[31mFailed\e[0m"
        fi

        is_verbosed && log "${msg}"
        is_verbosed 2 && log "${result}"
    done
}

if ! is_sourced; then
    VERBOSITY=0
    OVERWRITING="-i"

    while getopts "fhVv" option; do
        case "${option}" in
            f)  OVERWRITING="-f"
                ;;
            h)  usage && exit 0
                ;;
            V)  version && exit 0
                ;;
            v)  ((VERBOSITY=VERBOSITY+1))
                ;;
            \?) log "\e[31mInvalid Option: ${OPTARG}\e[0m" && exit 1
                ;;
        esac
    done

    if [ -d "$(config_copy_dir)" ]; then
        log "\e[34mCopy configuration files...\e[0m"
        copy_files
    else
        log "\e[34mNothing to copy\e[0m"
    fi

    if [ -d "$(config_link_dir)" ]; then
        log "\e[34mLink configuration files...\e[0m"
        link_files
    else
        log "\e[34mNothing to link\e[0m"
    fi

    if [ -d "$(config_link_dir)" ]; then
        log "\e[34mRun configuration scripts...\e[0m"
        run_scripts
    else
        log "\e[34mNothing to execute\e[0m"
    fi
fi
