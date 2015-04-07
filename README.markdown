# My Dotfiles for Ubuntu

* NodeJS
* Ruby (Rbenv)
* Xmonad
```
sudo apt-get install cabal-install
sudo apt-get install libghc-libxml-sax-dev c2hs libasound2-dev libiw-dev libgd2-xpm-dev
cabal install xmobar --flags="all_extensions"
```

* zsh
```
chsh -s $(which zsh)
```

* Sublime

* solarized gnome terminal
```
git clone git@github.com:Anthony25/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized && ./install.sh
rm -rf gnome-terminal-colors-solarized
```

* zsh-syntax-highlighting
```
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
```

* Spotify
```
sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free" &&
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59 &&
sudo apt-get update -qq &&
sudo apt-get install spotify-client
```

* nginx
```
sudo vim /etc/nginx/sites-available/devlocal
sudo ln -s /etc/nginx/sites-available/devlocal /etc/nginx/sites-enabled/devlocal
sudo service nginx restart


sudo vim /etc/dnsmasq.conf
sudo service dnsmasq restart
```

devlocal file :

```
server {
	listen 80;
	server_name app localhost .devlocal;

	set $basepath "/home/adrien/Sites";

	set $domain $host;
	if ($domain ~ "^(.*)\.devlocal$") {
		set $domain $1;
	}
	set $rootpath "${domain}";
	if (-d $basepath/$domain/htdocs) {
		set $rootpath "${domain}/htdocs";
	}
	if (-d $basepath/$domain/webroot) {
		set $rootpath "${domain}/webroot";
	}

	root $basepath/$rootpath;
	index index.php index.html index.htm;

	error_page	500 502 503 504  /50x.html;
	location = /50x.html {
		root	html;
	}

	location ~ \.php$ {
		try_files $uri =404;
		fastcgi_split_path_info ^(.+\.php)(/.+)$;
		fastcgi_pass unix:/var/run/php5-fpm.sock;
		fastcgi_index index.php;
		include fastcgi_params;
	}
}
```

dnsmasq.conf file :
```
# Add domains which you want to force to an IP address here.
# The example below send any host in double-click.net to a local
# web-server.
address=/.devlocal/127.0.0.1
```
