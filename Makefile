all:
		./initial_setup.sh

run:
		source ~/.macos-setup/venv-ansible/bin/activate && ansible-playbook main.yml

dep:
		source ~/.macos-setup/venv-ansible/bin/activate && pip install -r requirements.txt

lint:
		source ~/.macos-setup/venv-ansible/bin/activate && yamllint .