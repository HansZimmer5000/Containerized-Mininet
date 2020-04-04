# Containerized-Mininet
Mininet in Version 2.2.2 in a Docker Image

## Execution

Start the container with "--privileged" to make it work. 
Which of the extra rights mininet needs, I haven't look up yet.

Test if the container works with a simple `mn --test pingall`, you may want to add `-v debug` at the end for more output.

