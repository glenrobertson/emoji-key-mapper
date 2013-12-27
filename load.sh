#! /bin/bash
function load_emojis () {
    while read line
    do
        echo "loading $(echo $line | awk '{print "mapping "$1"  = :"$2":"}')"
        defaults write -g NSUserDictionaryReplacementItems -array-add "$(echo $line | awk '{print "{\"on\"=1;\"replace\"=\":"$2":\";\"with\"=\""$1"\";}"}')";
    done < $1
}
load_emojis `pwd`/nature.txt
load_emojis `pwd`/objects.txt
load_emojis `pwd`/people.txt
load_emojis `pwd`/places.txt
load_emojis `pwd`/symbols.txt
