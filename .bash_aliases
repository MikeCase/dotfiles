
# aliases for venv (python-venv)
alias create-venv='python3 -m venv /home/${USER}/.config/venv/${PWD##*/}'
alias remove-venv='rm -rf /home/${USER}/.config/venv/${PWD##*/}'
alias activate-venv='source /home/${USER}/.config/venv/${PWD##*/}/bin/activate'
alias cv310='python3.10 -m venv /home/$USER/.config/venv/${PWD##*/}'
alias cv311='python3.11 -m venv /home/$USER/.config/venv/${PWD##*/}'
alias cv312='python3.12 -m venv /home/$USER/.config/venv/${PWD##*/}'


# Aliases for DJango
alias dj='python manage.py'
alias djr='python manage.py runserver'
alias djmm='python manage.py makemigrations'
alias djm='python manage.py migrate'
alias dju='python manage.py show_urls'

# Get public IP
alias pubip="dig @resolver4.opendns.com myip.opendns.com +short"

# Better tail experience.
alias ltail="less +F"

# Ansible
alias ap='ansible-playbook'

# Tmux
alias tma='tmux attach-session'

# Update
alias update='sudo apt update && sudo apt upgrade -y'