#!/bin/bash

myip () {
  pub=$(curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+')
  loc=$(ifconfig | grep "inet " | awk '{ print $2 }')
  echo "public:"
  echo "${bold_green}$pub${normal}"
  echo "local:"
  echo "${bold_green}$loc${normal}"
}

alias ips="myip"

# check to see if a domain is registered or not
isreg () {
  dig soa $1 | grep -q ^$1 && echo "${bold_red}Sorry! it's already registered.${normal}" || echo "${bold_green}No, You can go and register it for yourself :) ${normal}"
}

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias http_dump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

