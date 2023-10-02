while true; do
    rm fly.toml fly.toml.tmp 2> /dev/null
    for line in $(/root/.fly/bin/flyctl app list | grep 'pending' | awk '{if ($1 !="" && $1 !="NAME") print $1}')
    do
      /root/.fly/bin/flyctl apps destroy "$line" --yes
    done

    for line in $(/root/.fly/bin/flyctl app list | grep 'fly-builder' | awk '{if ($1 !="" && $1 !="NAME") print $1}')
    do
      /root/.fly/bin/flyctl apps destroy "$line" --yes
    done
    yes | /root/.fly/bin/flyctl auth login --email MAIL --password PASS
    /root/.fly/bin/flyctl launch --dockerignore-from-gitignore --no-deploy --generate-name --region hkg
    timeout 14400 /root/.fly/bin/flyctl deploy --no-cache # run 4h
    sleep 900 # sleep 15m
    rm fly.toml fly.toml.tmp 2> /dev/null
done
