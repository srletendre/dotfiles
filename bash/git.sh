alias gcm='git commit -m'
alias gcmu='git commit -m updates'
alias gd='git diff'
alias ga='git add'
alias gs='git status --untracked-files=no'
alias gf='git fetch'
alias gsl='git stash list'
alias gpod='git pull origin dev'
alias gpob='git pull origin $(git branch --show-current)'
alias guob='git push origin $(git branch --show-current)'
alias gl='git log -n 5'
alias gr='git restore'

function iga () {
        # Interactive Git Add
        for modified_file in $(git status --porcelain=2 | gs --porcelain=2 | awk '$2==".M" {print $9}');
                do
                echo "--------------------------------------------------------------------------------"
                git diff $modified_file
                read -a answer -p "Add $modified_file?  [(y)es (n)o (p)atch] >"
                if [ "$answer" = y ]
                then
                        git add $modified_file
                elif [ "$answer" = n ]
                then
                        echo "Not adding $modified_file"
                elif [ "$answer" = p ]
                then
                        git add -p $modified_file
                fi
        done
}
