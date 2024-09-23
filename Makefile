all:
		./initial_setup.sh

run:
		source ~/.setup/venv-ansible/bin/activate && ansible-playbook main.yml -K

dep:
		source ~/.setup/venv-ansible/bin/activate && pip install -r requirements.txt

lint:
		source ~/.setup/venv-ansible/bin/activate && yamllint .