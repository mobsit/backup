
#!/bin/sh
#echo $1
p=$(git log  --pretty=oneline   --reverse | sed 's/\|/ /'|awk '{print $1}' | awk -v string="$1" -f tst.awk)
if p==1
then 
mkdir data/N
cp --parents readme.md data/N
else
my_array=($(git log --name-status $1^..$1 | sed -e '1,6d'|awk '{print $2}'  ) )

length=${#my_array[@]}
# echo ${length}
# for (( i=0; i<=${length} ; i++ ));
# do
#    echo "${my_array[i]}"
# done

echo $p
mkdir  data/N+$p 
# p=$(( $p - 1 ))

for (( j=0; j<${length} ; j++ ));
do
  # array=( $(git diff ${my_array[j-1]} ${my_array[j]}  --stat |  sed 's/\|/ /'|awk '{print $1}'  | sed '$d' ))
  #echo ${my_array[j-1]}
  #echo ${my_array[j]} 
#   p=$(( $p - $j )) 
#   echo $p
#   echo   N+$p
#   mkdir  data/N+$p 
  cp --parents ${my_array[j]} data/N+$p
 
  
  
  
# #   for (( i=0; i<${#array[@]} ; i++ ));
# #   do
# #     #echo ${array[i]}
# #     echo $j
# #     cp --parents ${array[i]} data/N+$p
# #     p=$(( $p + 1 )) 
# #     echo $p
# #   done	  
done
fi

# # # git log  --pretty=oneline   --reverse | sed 's/\|/ /'|awk '{print $1}' | awk -v string="$(git log  --pretty=oneline   --reverse | sed 's/\|/ /'|awk '{print $1}' | grep $(git log  --pretty=oneline  --after 2.hours.ago  --reverse | sed 's/\|/ /'|awk '{print $1}'| sed -n 1p))" -f tst.awk

# # #git diff 89be1cfbf27cf5c73e8dd50f58802609fd9e62aa  904bebf5639b066afa1ac4fad9f42a1e285f7639  --stat |  sed 's/\|/ /'|awk '{print $1}'  | sed '$d' 