sudo apt-get install sshpass


ansible-playbook -i hosts ansible-playbook.yml -e "my_username"="testadmin" -e "my_password"="test@dmin99" -o StrictHostKeyChecking=no

[frontend]   
ssh testadmin@23.96.81.183   test@dmin99
[backend]   
ssh testadmin@20.25.76.45  test@dmin99