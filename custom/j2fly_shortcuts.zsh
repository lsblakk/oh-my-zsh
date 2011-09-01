# alias proxyhome='ssh -D 2384 -C macpro@j2fly.redirectme.net'
# alias proxyhome='ssh -p2384 -C macpro@j2fly.redirectme.net'
# alias proxyhome='ssh -L 8000:j2fly.redirectme.net:80 theda-ec2'
# alias proxyhome='ssh -L 8080:localhost:80 mini@j2fly.redirectme.net -p'

# Tunnels
# -------
alias ec2_tunnel_theda='ssh -L 3307:thedacareprod.cqgtmgitcxs6.us-east-1.rds.amazonaws.com:3306 theda-ec2'
alias bbg_tunnel_theda='ssh -L 3307:ds608.blueboxgrid.com:3306 bbgapp'

# DB Stuff
# --------
# PG
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgtail='tail -f /usr/local/var/postgres/server.log'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
# MySQL
alias mysqlstart='mysql.server start'
alias mysqlstop='mysql.server stop'
# Both
alias startdbs='pgstart;mysqlstart' # now both at once!
alias stopdbs='pgstop;mysqlstop' # now both at once!
alias restartdbs='stopdbs;startdbs' # now both at once!

# System Level
# ------------
alias goodbye='sudo shutdown -r now'
alias uldb='sudo /usr/libexec/locate.updatedb' #update the location database
alias rvm_install_shortcut='bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)'
alias flush_dns='dscacheutil -flushcache'
alias fixbrew='sudo chown -R `whoami` /usr/local'
alias c='clear'

# RUBY / RAILS
# ------------
# you need to use bundle exec before each command you run in a app controled by bundler so this alias helps make that easier
alias b='bundle exec $*'
alias p='powder $*'
alias pc='pickler $*'
alias migrate="rake db:migrate db:test:prepare"
alias dbm='migrate'

# Git Goggles
# -----------------
alias gg='git goggles'
# alias ggc='git goggles codereview'
alias ggc='git log -p --reverse master..'
alias ggcc='git goggles codereview complete'
alias -g bd='git diff --name-status'
alias glg='git log --no-merges --pretty=format:"%Cgreen%h%Creset%x09%an%x09%Cblue%ar%Creset%x09%s"'
alias glgl='git log --no-merges --reverse --pretty=format:"%Cgreen%h%Creset%x09%an%x09%Cblue%ar%Creset%x09%s"'
alias gt='git tag'
alias gt_remote='git ls-remote --tags'
alias gt_delete='git push origin :refs/tags/'

# Nocorrect Aliases
# -----------------
alias grb='nocorrect grb'

# Apps
# ----
alias pandora='pianobar'
alias vim='mvim -v'
alias bolstr='cd /rails/intridea/bolstr'

# VIM
# ---
alias jonvim='vim ~/Dropbox/Documents/Web\ Development/Vim/jons_vim_guide.txt'
alias gvim='vim --remote-silent'

function v() {
if [[ -z "$_V" ]] ; then
  # No vim in the background.
  vim --servername vim$$ $@ &
  # Get the JOB number of the vim server!
  _V=$(jobs -l | grep $! | sed -e "s/^\[\(.*\)\].*/\1/")
  fg $_V && unset _V
else
  # There is a v in the background, so we'll resume that and load the new
  # file.
  bash -c "sleep .1 ; vim --servername vim$$ --remote-silent $@ ; \
    vim --servername vim$$ --remote-send ':redraw<CR>'" &
  fg $_V && unset _V
fi
                                           }

# RAILS
# -----
alias rc='rails console'
alias rdbc='rails dbconsole'
