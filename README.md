# akaunting

To get this working cp config/akaunting.example.conf to akaunting.conf
Edit the servername variable to fit. Right now this works for your private network but i haven't
got it working for external proxied service yet.
For right now use an external Mysql/Mariadb server to host the data. In the future I plan to
add an internal mariadb server.
After the service comes up you can acces it at <machine ip>:3186.
If you want to build this your self you can edit config/akaunting.conf before you build.
Fixed mirror to github.
