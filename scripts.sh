#----------Envonment Variables -------- #
export PS1="\[\033[01;32m\](\u)\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\] "
export PATH="$PATH:$HOME/.local/bin"
#------------------------------------------ #

#----------- Aliases configuration --------- #
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# ------------- AUTO-COMPLETION ----------------------- #
# enable programmable completion features (you don't need to enable this if  is already enabled in
# /etc/bash.bashrc and /etc/profile

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#----------- Aliases examples--------- #
alias ls="ls -G"
alias ll="ls -l -a"
alias bconfig="vim ~/.bashrc && source ~/.bashrc"
alias myip="ifconfig | grep en0 -A 5 | grep 'inet' | awk '/inet/ {gsub(/.*inet | netmask.*/, \"\"); print \$1; exit}'"
#------------------- #

#---------- remote servers --------#
alias moon="ssh $moonusername@$moonhost"
alias mars="ssh -i $marspem $marsusername@$marshost"

#----------- Functions --------- #
des () {
    cd ~/Desktop
}

upload-mars () { 
  # first argument is the path of a file or folder from local
  # eg; upload-mars playground.js
  scp -r -i "$marspem" "$1" "$marsusername@$marshost":~/
}


download-mars () {
  # first argument is the path of a file or folder from the server
  scp -r -i "$marspem" "$marsusername@$marshost":"$1" ~/Downloads/
}

windows-downloads () {
  cd /mnt/c/Users/kofid/Downloads/
}

mongo-start(){
  sudo systemctl start mongod
}

mongo-stop(){
  sudo systemctl stop mongod
}

mongo-status(){
  sudo systemctl status mongod
}

mogo-restart(){
  sudo systemctl restart mongod
}


# ------------------------------- #

# ----------------------------------------- #
# ---------- OTHER APPS -------------------- #
# ----------------------------------------- #

# ------------- NVM ----------------------- #
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
