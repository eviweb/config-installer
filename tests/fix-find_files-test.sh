. "$(main_dir)"/install.sh

##
export HOSTNAME="hostname1"
id="${RANDOM}"
tempdir="$(mktemp -d)"
links=(
    "${tempdir}/common/install.sh"
    "${tempdir}/${HOSTNAME}/install.sh"
)

for link in "${links[@]}"; do
    directory="$(dirname "${link}")"
    mkdir -p "${directory}"
    ln -s "$(main_dir)"/install.sh "${link}"

    assert_equals "${link}" "$(find_files "${directory}")"
done

rm -rf "${tempdir}"
