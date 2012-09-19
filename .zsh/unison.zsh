if [ "$SSH_TTY" != "" ]; then
  alias unison='unison -ui text'
fi

alias sync-music='unison -auto -maxthreads 1 "/Volumes/Data/Dropbox/Home/Music/iTunes/iTunes Media/Music" "ssh://hater//Volumes/Data/Dropbox/Home/Music/iTunes/iTunes Media/Music"'
