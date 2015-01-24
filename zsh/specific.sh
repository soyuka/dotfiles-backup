OS='Linux'

if [[ `uname` == 'Darwin' ]]; then
    OS='OS X'
fi

if [[ $OS == 'OS X' ]]; then

  export HOMEBREW_GITHUB_API_TOKEN=de28d1e4f1c85aa8c6b7e7eceb5f9e6d5768d7e9

  sites() {
    cd "/Users/soyuka/Sites/$1"
  }

  ez() {
    sites ezseed/ezseed
  }

  hdd() {
     cd "/Volumes/HDD$1/$2"
  }

  alias movies='cd /Volumes/HDD\ Soyu2/Movies/'
  export ES_HOME=/usr/local/opt/elasticsearch
  export GOPATH=/usr/local/Cellar/go/1.3.3/

else


# TODO
fi
