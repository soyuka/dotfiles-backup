myip() {
  curl -s http://whatismyip.akamai.com/
}

calc() {
  node
}

open() {
  xdg-open $@ &
}

c() {
  clear
}

a() {
  f=$(node -p "require('url').parse(process.argv[1], true).query.path" $1 | xargs basename)
  addic7ed $f
}

copy() {
  xclip -selection clipboard
}

v() {
  vim $@
}

rmi() {
  # https://unix.stackexchange.com/questions/114240/is-there-a-simple-way-to-get-array-of-all-arguments-that-do-not-begin-with-a-hyp
  to_remove=("${(@)@:#-*}")
  dir=~/.trash/$(date -Ins)
  mkdir -p $dir
  mv -f $to_remove $dir
}

rmd() {
  pandoc $1 | lynx -stdin
}
