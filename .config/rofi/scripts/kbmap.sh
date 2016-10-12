### Keyboard Layout selection through rofi

if [ -z $@ ]
then
    echo 'us'
    echo 'de'
else
    setxkbmap -layout $@
fi
