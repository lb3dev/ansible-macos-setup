all:
		ansible-galaxy install -r requirements.yml && ansible-playbook main.yml --ask-become-pass

dep:
		pip3 install -r requirements.txt

init:
		cd scripts && ./initial_setup.sh

lint:
		yamllint .