#! /usr/bin/env bash
main_dir()
{
    dirname "$(dirname "$(readlink -f "${BASH_SOURCE}")")"
}

test_dir()
{
    echo "$(main_dir)"/tests
}

get_test_files()
{
    ls "$(test_dir)"/*-test.sh
}

# Assert two strings are equal
#
# Usage:
#   assert_equals "string 1" "string 2" "message"
function assert_equals {
    local string1="$1"
    local string2="$2"
    local message="$3"
    local fails="\u2718"
    local succeed="\u2714"
    local result=0

    [ -n "${message}" ] || {
        message="Assert \e[34m'${string1}'\e[0m equals \e[35m'${string2}'\e[0m."
    }

    local diff="$(diff  <(echo "${string1}" ) <(echo "${string2}"))"

    if [ -z "${diff}" ]; then
        echo -e "\e[32m${succeed}\e[0m ${message}"
    else

        result=1
        echo -e "\e[31m${fails}\e[0m ${message}"
        echo -e "\e[2m${diff}\e[22m"
    fi

    return $result
}

TESTS=($(get_test_files))

for test in "${TESTS[@]}"; do
    echo -e "\n** \e[2mRun ${test}\e[0m **\n"
    . "${test}"
    echo -e "\n---------------------------"
done
