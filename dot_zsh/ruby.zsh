export RUBYOPT="rubygems"

chruby 2.6

function _rake_command () {
  if [ -e "bin/rake" ]; then
    bin/rake $@
  else
    bundled_rake $@
  fi
}
