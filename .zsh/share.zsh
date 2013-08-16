function share() {
  zip -r /Volumes/Data/Dropbox/Public/$(basename ${1}).zip $@
  echo "https://dl.dropbox.com/u/211124/$(basename ${1}).zip" | pbcopy
}
