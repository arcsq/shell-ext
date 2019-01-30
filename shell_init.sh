set_bash_prompt(){
   if [ `whoami` = 'admin' ]; then
       PS1="\[\e[1m\]\[\e[35m\]\u\[\e[0m\]:\[\e[1m\]\[\e[34m\]\w\[\e[0m\]$(prompt_info) \[\e[1m\]\[\e[34m\]$\[\e[0m\] "
   else
       PS1="\[\e[1m\]\[\e[32m\]\u\[\e[0m\]:\[\e[1m\]\[\e[34m\]\w\[\e[0m\]$(prompt_info) \[\e[1m\]\[\e[34m\]$\[\e[0m\] "
   fi
}

prompt_info() {
        if [ -d .git ]; then
                tracked=`git status -s -uno | wc -l | awk '{$1=$1};1'`
                all=`git status -s -unormal | wc -l | awk '{$1=$1};1'`
                branch=`git branch | grep -e "^*" | cut -d' ' -f 2`
		ahead=`git status -bs -unormal | grep -i '\[ahead' | wc -l | awk '{$1=$1};1'`
		aheadmark=''
		if [ "$ahead" = "1" ]; then
			aheadmark='++++ '
		fi
                if [ "$all" = "0" ]; then
                        echo " \[\033[0;32m\]($aheadmark$branch)\[\033[0m\]"
                elif [ "$all" = "$tracked" ]; then
                        echo " \[\033[1;33m\]($aheadmark$branch+)\[\033[0m\]"
                else
                        echo " \[\033[1;31m\]($aheadmark$branch*)\[\033[0m\]"
                fi
        fi
}

PROMPT_COMMAND=set_bash_prompt

export CLICOLOR=1
export LSCOLORS=DxFxBxDxCxegedabagacad


#The order of the attributes are as follows:

#1. directory
#2. symbolic link
#3. socket
#4. pipe
#5. executable
#6. block special
#7. character special
#8. executable with setuid bit set
#9. executable with setgid bit set
#10. directory writable to others, with sticky bit
#11. directory writable to others, without sticky

#The color designators are as follows:

#a black
#b red
#c green
#d brown
#e blue
#f magenta
#g cyan
#h light grey
#A bold black, usually shows up as dark grey
#B bold red
#C bold green
#D bold brown, usually shows up as yellow
#E bold blue
#F bold magenta
#G bold cyan
#H bold light grey; looks like bright white
#x default foreground or background

alias gitgr="git log --pretty='%h, %s, %ar, %cn' --graph | column -s ',' -t"
alias gitlg="git log --pretty='%h, %s, %ar, %cn' | column -s ',' -t"

export PATH=.:$PATH$
