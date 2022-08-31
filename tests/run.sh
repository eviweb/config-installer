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

TESTS=($(get_test_files))

for test in "${TESTS[@]}"; do
    echo -e "\n** \e[2mRun ${test}\e[0m **\n"
    . "${test}"
    echo -e "\n---------------------------"
done
