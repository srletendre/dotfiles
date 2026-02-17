. $BASHRC_ROOT/formats.sh
    FORMATS_SH=TRUE

    PLAIN="\e[0m"
    BOLD="\e[1m"
    DIM="\e[2m"
    ITALICS="\e[3m"
    UNDERLINED="\e[4m"
    BLINK="\e[5m"
    INVERTED="\e[7m"
    HIDDEN="\e[8m"
    STRIKETHROUGH="\e[9m"
    RED="\e[31m"
    GREEN="\e[32m"
    YELLOW="\e[33m"
    BLUE="\e[34m"
    MAGENTA="\e[35m"
    CYAN="\e[36m"
    LIGHTGRAY="\e[37m"
    DEFAULTFMT="\e[39m"
    DARKGRAY="\e[90m"
    LIGHTRED="\e[91m"
    LIGHTGREEN="\e[92m"
    LIGHTYELLOW="\e[93m"
    LIGHTBLUE="\e[94m"
    LIGHTMAGENTA="\e[95m"
    LIGHTCYAN="\e[96m"
    WHITE="\e[97m"
    BLACKBACK="\e[40m"
    REDBACK="\e[41m"
    GREENBACK="\e[42m"
    YELLOWBACK="\e[43m"
    BLUEBACK="\e[44m"
    MAGENTABACK="\e[45m"
    CYANBACK="\e[46m"
    LIGHTGRAYBACK="\e[47m"
    DEFAULTBACK="\e[100m"
    DARKGRAYBACK="\e[101m"
    LIGHTREDBACK="\e[102m"
    LIGHTGREENBACK="\e[103m"
    LIGHTYELLOWBACK="\e[104m"
    LIGHTBLUEBACK="\e[105m"
    LIGHTMAGENTABACK="\e[106m"
    WHITEBACK="\e[107m"
function jobs_function () {
    echo $1 $3
}
function prompt_function () {
    local curr=$PWD
    local in_git_repo=""
    local in_project=""
    local project_and_git_the_same=""

    NON_GIT_PATH=${PWD/$HOME/'~'}
    GIT_PATH=""
    GIT_ROOT=""

    until [[ "$curr" == "/" ]]
    do
        if [ -d "$curr/.git" ]
        then
            in_git_repo=true
            
            NON_GIT_PATH=$(realpath "$curr/..")
            GIT_ROOT=${curr##$NON_GIT_PATH}/
            NON_GIT_PATH=${NON_GIT_PATH/$HOME/'~'}
            GIT_PATH=${PWD##$curr/}
            GIT_PATH=${GIT_PATH##$curr}
            break
        fi

        curr=$(realpath "$curr/..")
    done

    if [ "$in_git_repo" ]
    then
        GIT_BRANCH=$(git branch --show-current)
        GIT_PART="[$GIT_BRANCH]"
    else
        GIT_PART=""
    fi

    if [ "$VIRTUAL_ENV" ]
    then
        VIRTUAL_ENV_NAME_BACK_TRIMMED=${VIRTUAL_ENV%/venv}
        VIRTUAL_ENV_NAME=${VIRTUAL_ENV_NAME_BACK_TRIMMED##'/'*'/'}
        VENV_PART=" ($VIRTUAL_ENV_NAME)"
    else
        VENV_PART=""
    fi

    local jobs_output=$(jobs)
    if [ "$jobs_output" ]
    then
        JOBS_PART=$(jobs_function $jobs_output)
    else
        JOBS_PART=""
    fi
}

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]
then
    PROMPT_COMMAND='prompt_function'
    PS1=\
"\[$LIGHTBLUE\]╭──────────────────────────────────╼ "\
"\[$LIGHTMAGENTA\]"\
'$JOBS_PART\n'\
"\[$LIGHTBLUE\]│ "\
"\[$GREEN\]"\
'$NON_GIT_PATH'\
"\[$YELLOW\]"\
'$GIT_ROOT'\
"\[$LIGHTGREEN\]"\
'$GIT_PATH '\
"\[$BLUE\] "\
'$GIT_PART'\
"\[$MAGENTA\]"\
'$VENV_PART'\
" \[$CYAN\]\n"\
"\[$LIGHTBLUE\]╰─────╼\[$PLAIN\] "
# ^- it is important that this string is not indented

    #PS1="\[$BLUE\]\w \[$CYAN\]  \[$PLAIN\]"
else
    PS1='\u@\h:\w\$ '
fi
