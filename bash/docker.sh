# docker container ls
alias dcl='docker container ls -a --format "table {{.Names}}\t{{.Status}}"'
# docker volume ls
alias dvl='docker volume    ls'
# docker volume ls
alias dnl='docker network   ls'
# docker image ls
alias dil='docker image     ls'

# docker rm containers
alias drmc='sudo docker container rm -f $(sudo docker container ls -aq)'
# docker rm volumes
alias drmv='sudo docker volume    rm -f $(sudo docker volume    ls -q)'
# docker rm networks
alias drmn='sudo docker network   rm    $(sudo docker network   ls --format '\''{{.ID}}'\'')'
# docker rm images
alias drmi='sudo docker image     rm    $(sudo docker image     ls --format '\''{{.ID}}'\'')'
# docker rm "all" (but not images)
alias drma='drmc; drmn; drmv'


function docker_run_bash () {
    docker run -it $1 bash
}
alias drun=docker_run_bash
