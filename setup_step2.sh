yes | /root/.fly/bin/flyctl auth login --email MAIL --password PASS

/root/.fly/bin/flyctl launch --dockerignore-from-gitignore --no-deploy --generate-name --region hkg

while true; do
    timeout 10800 /root/.fly/bin/flyctl deploy # run 3h
    sleep 900 # sleep 15m
    for line in $(/root/.fly/bin/flyctl app list | awk '{if ($1 !="" && $1 !="NAME") print $1}')
    do
      /root/.fly/bin/flyctl apps destroy "$line" --yes
    done
done
