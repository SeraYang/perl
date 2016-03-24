sub pc
{
    my $cpu = $_[0];
    my $ghz = $_[1];
    my $gigs = $_[2];
    my $teras = $_[3];

    my $upgrade = sub {$gigs *= 2; $ghz *= $ghz + $ghz/2.0;};

    my $giveghz = sub{ $ghz;};

    my $fasterthan = sub
    {
        my $oghz = $_[0];
        $ghz-$oghz->("giveghz")->();
    };

    sub
    {
        my $str = $_[0];
        if($str eq "upgrade"){
            return $upgrade;
        }
        if($str eq "giveghz"){
            return $giveghz;
        }
        if($str eq "fasterthan"){
            return $fasterthan;
        }
    }
}

my $ca = pc(1,1,1,1);
my $cb = pc(2,2,2,2);
$ca->("upgrade")->();
$ca->("upgrade")->();
print "0----",$ca->("giveghz")->(),"\n";
print $ca->("fasterthan")->($cb);
#my $yang = 1;
#$yang = $yang + $yang/2.0;
#$yang = $yang + $yang/2.0;
#print "\n",$yang;

sub multicorepc
{
    my $cpu = $_[0];
    my $ghz = $_[1];
    my $gigs = $_[2];
    my $teras = $_[3];
    my $cores = $_[4];

    my $pc = pc($cpu,$ghz,$gigs,$teras);
    my $givecore = sub {$cores;};
    #print "\n the cores is $cores \n";
    #print $givecore->(),"\n";
    my $giveghz = sub {$pc->("giveghz")->();};
    
    my $fasterthan = sub{
        $opc = $_[0];
        #print "the ghz is $ghz\n";
        #print "the cores is $cores\n";
        #print $ghz*$cores,"\n";
        #print $opc->("givecore")->(),"\n";
        #print $opc->("giveghz")->(),"\n";
        #print ($opc->("givecore")->() * $opc -> ("giveghz")->()),"\n";
        return $ghz*$cores >= $opc->("givecore")->() * $opc -> ("giveghz")->();
    };

    sub{
        my $str = $_[0];
        if($str eq "givecore"){return $givecore;}
        if($str eq "giveghz"){return $giveghz;}
        if($str eq "fasterthan"){return $fasterthan;}
    }
}

my $mpc1 = multicorepc("cpu1",1,1,1,2);
my $mpc2 = multicorepc("cpu2",2,2,2,1);
print "###############################";
print $mpc1->("givecore")->(),"\n";
print $mpc1->("fasterthan")->($mpc2);
