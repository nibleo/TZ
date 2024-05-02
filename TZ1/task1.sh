#!/bin/bash
func(){
if [[ -f $1 ]]; then
find $input -name $1 -print0 | while IFS= read -r -d '' path
do   
way=$path
name1=${way##*.} 
name2=${name1##*/}
accurate_name_1=${way##*/}
accurate_name_2=${accurate_name_1%.*}
if [[ $name1 == $name2 ]]; then
extension="${way##*.}"
new_way=$output/"$accurate_name_2"$cntr".$extension"
cp "$path" "$new_way"
cntr=$(( $cntr+1 ))
else
new_way=$output/"$accurate_name_1"$cntr
cp "$path" "$new_way"
cntr=$(( $cntr+1 ))
fi
done
else
cd $1 
for name3 in *; do
func $name3
done
cd ../
fi
}

input=~/Desktop/inpt
output=~/Desktop/output
cd $input
cntr=0
for file in *;do
func $file
done
