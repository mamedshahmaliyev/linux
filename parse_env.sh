if [ -f .env ]
then
  set -o allexport
  source .env
  set +o allexport
else
  echo ".env file not found"
  exit
fi




