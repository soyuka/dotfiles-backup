myip() {
  curl -s http://whatismyip.akamai.com/
}

calc() {
  echo "$(($@))"
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
