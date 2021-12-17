

ssh -R 5000:host2:22 user@host1
rsync -e "ssh -p 5000" -vuar /host1/path userhost2@localhost:/host2/path