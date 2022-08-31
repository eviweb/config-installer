. "$(main_dir)"/install.sh

##
path="$(main_dir)/config/copy/common/some/path/with/common/inside/file.config"
expected="/some/path/with/common/inside/file.config"

assert_equals "${expected}" "$(get_target_file "${path}")"

##
export HOSTNAME="hostname1"
path="$(main_dir)/config/copy/${HOSTNAME}/some/path/with/${HOSTNAME}/inside/file.config"
expected="/some/path/with/${HOSTNAME}/inside/file.config"

assert_equals "${expected}" "$(get_target_file "${path}")"
