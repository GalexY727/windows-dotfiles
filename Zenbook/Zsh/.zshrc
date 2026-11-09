export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Give Oh My Zsh's compinit the extra completion definitions.
fpath+=("${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-completions/src")
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)
source "$ZSH/oh-my-zsh.sh"

# Load the first installed ROS 2 release that targets this Ubuntu version.
() {
  [[ -z ${ROS_DISTRO:-} && -r /etc/os-release ]] || return 0

  local ID VERSION_ID distro
  local -a ros_distros
  source /etc/os-release

  case "$ID:$VERSION_ID" in
    ubuntu:22.04) ros_distros=(humble iron) ;;
    ubuntu:24.04) ros_distros=(jazzy kilted) ;;
    *) return 0 ;;
  esac

  for distro in "${ros_distros[@]}"; do
    if [[ -r "/opt/ros/$distro/setup.zsh" ]]; then
      source "/opt/ros/$distro/setup.zsh"
      return
    fi
  done
}
