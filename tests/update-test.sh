. "$(main_dir)"/install.sh

tempdir="$(mktemp -d)"

[ -d "${tempdir}" ] || {
    echo -e "Failed to create ${tempdir}"
    exit 1
}

major="${VERSION%%.*}"
minor="$(echo "${VERSION}" | grep -Poe '(?<=\.)\d+(?=\.)')"
patch="${VERSION##*.}"

declare -A versions=(
    [0.1.0]=1
    ["${VERSION}"]=1
    ["${major}.${minor}.$((patch+1))"]=0
    ["${major}.$((minor+1)).${patch}"]=0
    ["$((major+1)).${minor}.${patch}"]=0
)

curl()
{
    cat "$(main_dir)"/install.sh
}

alter_version()
{
    local file="$1"
    local version="$2"

    sed -r "s/VERSION=\"[^\"]+\"/VERSION=\"${version}\"/" -i "${file}"
}

## test get_latest_version
assert_equals "$(get_latest_version)" "$(cat "$(main_dir)"/install.sh | grep -Poe '\d+\.\d+\.\d+')"

## test should_update
for version in "${!versions[@]}"; do
    message="Should update because ${version} is greater than ${VERSION}."
    [ "${versions["${version}"]}" -eq 0 ] || message="Should not update because ${version} is lesser than ${VERSION}."

    should_update "${version}"
    result="$?"

    assert_equals "${result}" "${versions["${version}"]}" "${message}"
done

## test update
OLD_VERSION="0.1.0"
cp "$(main_dir)"/install.sh "${tempdir}"
alter_version "${tempdir}"/install.sh "${OLD_VERSION}"

## no update
assert_equals "${OLD_VERSION}" "$(echo 'n' | "${tempdir}"/install.sh -V | grep -Poe '\d+\.\d+\.\d+')"

## do update
unset curl
echo 'y' | "${tempdir}"/install.sh

assert_equals "${VERSION}" "$("${tempdir}"/install.sh -V | grep -Poe '\d+\.\d+\.\d+')"

rm -rf "${tempdir}"
