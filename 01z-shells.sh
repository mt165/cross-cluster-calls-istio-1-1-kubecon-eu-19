source 00-common.sh

if [[ "$TERM" =~ screen* || -n "${TMUX+x}" ]]
then
    echo "don't run inside screen or tmux"
    exit 1
fi

declare -r session_name="$C"

tmux new-session -d -s "$session_name"

for z in zone-*
do
    declare window_name="$(cat $z)"

    tmux new-window -n "$window_name"
    tmux send-keys -t "${session_name}:${window_name}" "export Z=$(cat $z)" Enter
    tmux send-keys -t "${session_name}:${window_name}" "export KUBECONFIG=kubeconfig-$(cat $z)" Enter
done

tmux attach -t "$session_name"
