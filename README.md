This is my $HOME. There are many like it, but this one is mine.

This is very much an ongoing work in progress. I'll continue documenting
stuff as I live with this setup and there's plenty that can be cleaned
up and re-organized, which is a big part of the motivation for doing
this in the first place.

There are a few utils in `bin` to automate installing and updating my dotfiles.

`bootstrap-home`

This checks out my dotfiles repository into $HOME, configures some stuff,
clones the stuff specified in ~/.vendor, and chsh's my shell to zsh if it's not
already.

`bootstrap-host HOSTNAME`

Copies `bootstrap-home` to HOSTNAME and runs it to setup my dotfiles on
remote hosts.

`update-home`

This pulls the latest changes from my dotfiles repo and then runs
`update-vendored` to update those.

`update-vendored`

This reads ~/.vendor, git clones the directories specified there and runs the
specified update_cmd (ex. `rake` for janus, `upgrade.sh for oh-my-zsh).
