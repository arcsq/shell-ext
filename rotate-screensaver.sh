cd ~/tmp/screen

ls -t | awk 'NR>15'
rm `ls -t | awk 'NR>15'`
curl -L https://source.unsplash.com/800x600/?nature > ~/tmp/screen/`jot -r 1 0 9999999`.jpeg

