function share() {
  zip -r ~/Dropbox/Public/$(basename ${1}).zip $@
  echo "https://dl.dropboxusercontent.com/u/211124/$(basename ${1} | sed 's/\ /%20/g').zip" | pbcopy
}
