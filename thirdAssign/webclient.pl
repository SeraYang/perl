#!/usr/bin/perl
# simple perl client to download homepage

use Socket;
use FileHandle;

my ($SERVER) = @ARGV;  # server name is in command line parameter
                       # @ARGV is key word.
my $saddr;             # structure that holds server info (ip, port)
my @buffer;            # used for reading data as an array of different lines
my ($x, $y, $i, $j); # utility

socket(cfd,AF_INET,SOCK_STREAM,getprotobyname('tcp')) || die "error";
$saddr = sockaddr_in (80, inet_aton("$SERVER")); # $SERVER can be ip or name
connect(cfd,$saddr) || die "connection error";   # connect to server
cfd->autoflush(1);

print cfd "GET /index.html\n";  # send request to server

# without the autoflush line above, this print will be buffered.
# autoflush is not needed when doing the low level IO (sysread/write).

@buffer = <cfd>;  # read all available lines from socket

########### Student code! ###########
my $match = sub {
    my $string = $_[0];

    $string =~ m/<a href="(.+)">/;
    if($1){print $1,"\n";}
};
#####################################
 
print "Below is all the links: \n";
foreach (@buffer) {$match->($_);}

# print STDOUT @buffer;   # print'em all

#foreach (@buffer) { print $_, "\n"; }  # not needed, since \n already there

close(cfd);

# run this program with "perl webclient.txt www.cs.hofstra.edu"

