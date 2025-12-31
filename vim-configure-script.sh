./configure --with-features=huge --enable-multibyte --enable-rubyinterp=yes --enable-perlinterp=yes --enable-luainterp=yes --with-lua-prefix=/usr/local --enable-python3interp=yes --with-python3-config-dir=/home/biqu/.pyenv/versions/3.8.20/lib/python3.8/config-3.8-aarch64-linux-gnu --enable-gui=gtk2 --enable-cscope

# ruby는 libruby-dev 형식이 아니고 ruby-dev 로 apt-get install 해야..
# 나머지 include 파일은 sudo apt-get install libXXX-dev 형식이었다 대부분

# youcompleteme git 페이지에 나온 (즐겨찾기) wiki 로부터..
# sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
#libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
#libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
#python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git

# 또한 lua는 그냥 홈페이지로부터 빌드하면 됩니다. apt install 로 하니 점점 더 복잡하고
#문제해결이 안되다가 찾았습니다
# https://gist.github.com/yarko/956b801e8f5f1a15ea4d55fb42b9a0a1
