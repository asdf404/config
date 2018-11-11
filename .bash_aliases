alias composer='docker run --rm -it -u $(id -u):$(id -g) -v $(pwd):/app composer'
alias npm='docker run --rm -it -u $(id -u):$(id -g) -v ~/.npm:/home/node/.npm -v ~/.npm:/root/.npm -v $(pwd):/app -w /app -e NO_UPDATE_NOTIFIER=1 node:11.1 npm'
alias go='docker run --rm -it -u $(id -u):$(id -g) -v ~/.golang:/go -v $(pwd):/app -w /app golang:1.11 go'
