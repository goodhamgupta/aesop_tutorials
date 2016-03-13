ssh -q shubham@52.3.169.78 << EOF
str="The MySQL service has crashed on the server with IP: 52.3.169.78. Please look into it."
echo "BLAH"| mutt -s "Automatic Alert" shubham@zopper.com
EOF
