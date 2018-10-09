set_bash_prompt(){
    PS1="\u:\w$(prompt_info) $ "
}

prompt_info() {
        if [ -d .git ]; then
                tracked=`git status -s -uno | wc -l | awk '{$1=$1};1'`
                all=`git status -s -unormal | wc -l | awk '{$1=$1};1'`
                branch=`git branch | grep -e "^*" | cut -d' ' -f 2`
                if [ "$all" = "0" ]; then
                        echo " \033[1;32m($branch)\033[0m"
                elif [ "$all" = "$tracked" ]; then
                        echo " \033[1;36m($branch+)\033[0m"
                else
                        echo " \033[1;31m($branch*)\033[0m"
                fi
        fi
}


PROMPT_COMMAND=set_bash_prompt

