tempdir="$(mktemp -d)"

[ -d "${tempdir}" ] || {
    echo -e "Failed to create ${tempdir}"
    exit 1
}

dirs=(
    "${tempdir}/config/copy"
    "${tempdir}/config/link"
    "${tempdir}/config/run"
)

cp "$(main_dir)"/install.sh "${tempdir}"
"${tempdir}"/install.sh -i

for dir in "${dirs[@]}"; do
    assert_dir_exists "${dir}"
done

rm -rf "${tempdir}"
