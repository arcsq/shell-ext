# shell-ext
## Creating ssh key

```
ssh-keygen -t rsa -C "username readable" -f "username"
```

## Show Fingerprint of key
```
ssh-keygen -E md5 -lf <<key-file>>
```

## tmux

Create a file called .tmux.conf and add following
```
source-file /path/to/tmux_init.conf
```

## Start portainer in an auto-start mode
```
docker run --name portainer --restart unless-stopped -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
```

## Stubby - generate a certified hash for DNS server
```
echo | openssl s_client -connect '9.9.9.9:853' 2>/dev/null | openssl x509 -pubkey -noout | openssl pkey -pubin -outform der | openssl dgst -sha256 -binary | openssl enc -base64
```

## Connect AWS Instance
```
ssh -i <<path_to_pem>> ec2-user@<<host>>
```
