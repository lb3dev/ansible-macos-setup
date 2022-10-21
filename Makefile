all:
		ansible-galaxy install -r requirements.yml && ansible-playbook main.yml

run:
		ansible-playbook main.yml

dep:
		pip3 install -r requirements.txt

init:
		./initial_setup.sh

lint:
		yamllint .