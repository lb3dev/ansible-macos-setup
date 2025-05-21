all:
		./initial_setup.sh

run:
		ansible-playbook main.yml -K

terminal:
		ansible-playbook main.yml --tags "terminal"

dotfiles:
		ansible-playbook main.yml --tags "dotfiles"

browser:
		ansible-playbook main.yml --tags "browser"

dep:
		source ~/.setup/venv-ansible/bin/activate && pip install -r requirements.txt

lint:
		source ~/.setup/venv-ansible/bin/activate && yamllint .