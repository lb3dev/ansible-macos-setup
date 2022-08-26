all:
		ansible-playbook main.yml

dep:
		pip3 install -r requirements.txt

init:
		cd scripts && ./initial_setup.sh

lint:
		yamllint .