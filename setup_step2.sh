yes | /root/.fly/bin/flyctl auth login --email khoipn.tb@gmail.com --password ad123456789

/root/.fly/bin/flyctl launch --dockerignore-from-gitignore --no-deploy --generate-name --region iad

/root/.fly/bin/flyctl deploy
