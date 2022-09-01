

# Display Chinese in webtop browser
$ sudo apt update
$ sudo apt install wget
$ wget https://github.com/sonatype/maven-guide-zh/raw/master/content-zh/src/main/resources/fonts/simsun.ttc
$ sudo mkdir /usr/share/fonts/win
$ mv simsun.ttc /usr/share/fonts/win
$ fc-cache -vf
$ fc-list :lang=zh
