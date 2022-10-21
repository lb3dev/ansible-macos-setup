all:
		./initial_setup.sh

run:
		ansible-playbook main.yml

dep:
		pip3 install -r requirements.txt

lint:
		yamllint .