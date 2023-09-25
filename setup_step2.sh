yes | /root/.fly/bin/flyctl auth login --email email --password password

/root/.fly/bin/flyctl launch --dockerignore-from-gitignore --no-deploy --generate-name --region iad

/root/.fly/bin/flyctl deploy
