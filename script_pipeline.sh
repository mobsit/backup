
#!/bin/sh
p=$(git log  --pretty=oneline   --reverse | sed 's/\|/ /'|awk '{print $1}' | awk -v string="$1" -f tst.awk)
# my_array=( $(git log --pretty=oneline --reverse | sed 's/\|/ /'|awk '{print $1}') )
my_array=( $(git log --name-status "$1"^.."$1" | sed -e '1,6d'|awk '{print $2}') )
# if [ "$p" = 1 ]
#   then 
#       mkdir data/N
#       cp --parents readme.md data/N
#   else
      
length=${#my_array[@]}
echo $length
echo "$p"
mkdir  data/N+"$p" 
for (( j=0; j<${length} ; j++ ));
    do
        cp --parents "${my_array[j]}" data/N+"$p"
    done
