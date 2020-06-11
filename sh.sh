git reset --hard 
git clean -df
version=`git symbolic-ref --short -q HEAD`
if [ "$version" ==  "$1" ]
then
	echo '是当前分支，重置到远程服务的代码去'
	git fetch --all
	git reset --hard origin/${1}
else
	echo '不是当前分支，重置到远程服务的代码去'
	git checkout ${1} 
	git reset --hard origin/${1}
	echo 'not find $1'
fi
