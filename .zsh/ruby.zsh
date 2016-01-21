export RUBYOPT="rubygems"

function _rake_command () {
  if [ -e "bin/rake" ]; then
    bin/rake $@
  else
    bundled_rake $@
  fi
}
