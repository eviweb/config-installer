. "$(main_dir)"/install.sh

export HOSTNAME="hostname1"

log "> Run install script..."
"$(main_dir)"/install.sh -v
log "  \e[32mDone\e[0m"

log "> Clean up test env..."
[ -d "/tmp/my" ] && rm -rf "/tmp/my"
log "  \e[32mDone\e[0m"
