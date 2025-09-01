#!/usr/bin/env bash
# TODO: Introduce better error handling

echo -en "\033[0;32mAuthor name: \033[0;0m"; read author
echo -en "\033[0;32mRepository name: \033[0;0m"; read repo
echo -en "\033[0;32mNickname for plugin (avoid . and / or \\ or ' or \"): \033[0;0m"; read nickname
echo -en "\033[0;32mEnter the BRANCH from which you want to clone: \033[0;0m"; read branch
echo -en "\033[0;32mEnter the DIRECTORY (imp/{start,opt} OR fun/{start,opt} OR mine/{start,opt}): \033[0;0m"; read dir
echo -en "\033[0;32mShould we make a config file (y/n)? \033[0;0m"; read conf
echo -en "\033[0;32mEnter the PURPOSE of this plugin: \033[0;0m"; read purpose

nd=~/.config/nvim

# Cloning the repo
echo -e "\033[0;32mCloning into $dir/$repo @ branch:$branch\033[0;0m"
git clone --single-branch --branch "$branch" "https://github.com/$author/$repo.git" "$nd"/pack/"$dir"/"$nickname" && \
	echo -e "\033[0;33mCloning Complete!!\033[0;0m"

echo -e "\033[0;32mEditing the packed.lua file\033[0;0m"
packed=$nd/extras/packman/packed.txt
apnd=$nd/extras/packman/apndln.sh
touch $packed && \
	$apnd $packed "$author/$repo @ $branch IN $dir/$nickname for $purpose,"
	echo -e "\033[0;33mEdited the packed.lua file\033[0;0m"

if [ "$conf" == 'y' ]; then
	echo -e "\033[0;32mCreating a config file\033[0;0m"
	touch "$nd"/lua/custom/plugins/"$nickname"__"$purpose".lua && \
		echo "require('nickname').setup({})" >> "$nd"/lua/custom/plugins/"$nickname"__"$purpose".lua && \
		echo -e "\033[0;33mCreated file\033[0;0m"
fi
