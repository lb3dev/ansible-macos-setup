all:
		./initial_setup.sh

run:
		ansible-playbook main.yml -K

dotfiles:
		ansible-playbook main.yml --tags "dotfiles"

dep:
		source ~/.setup/venv-ansible/bin/activate && pip install -r requirements.txt

lint:
		source ~/.setup/venv-ansible/bin/activate && yamllint .