. "$(main_dir)"/install.sh

paths=(
    "$(config_copy_dir)/hostname/b.file"
    "$(config_copy_dir)/anotherhostname/a.file"
    "$(config_copy_dir)/common/a.file"
    "$(config_copy_dir)/hostname/a.file"
    "$(config_copy_dir)/anotherhostname/b.file"
    "$(config_copy_dir)/common/b.file"
)

expected=(
    "$(config_copy_dir)/common/a.file"
    "$(config_copy_dir)/common/b.file"
    "$(config_copy_dir)/anotherhostname/a.file"
    "$(config_copy_dir)/anotherhostname/b.file"
    "$(config_copy_dir)/hostname/a.file"
    "$(config_copy_dir)/hostname/b.file"
)

actual=( $(sort_files "${paths[@]}") )

for i in "${!actual[@]}"; do
    assert_equals "${expected[$i]}" "${actual[$i]}"
done
