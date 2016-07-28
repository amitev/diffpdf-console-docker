xfvb is runned before diffpdf because it tries to connect to X window even when a console is used

Usage:

docker run --rm -v <host path do pdfs>:<container path> <docker image name> <first pdf> <second pdf> <output pdf>
