sub makecounter{
    my $x = 0;

    my $add = sub{
        $x = $x + 1;
        print "\$x is ",$x,"\n";
    };  # the ";" is necessary.

    sub
    {
        my $method = $_[0]; 
        if(!($method)){ 
            print "yes \n";
            return &$add;
        }
        else { die "error";}
    }
}

my $first = &makecounter;
print &$first;
&$first;
&$first;
my $second = &makecounter;
&$second;

## 1. If the "my" in front of subroutine "$add" was changed to "local",
## the subroutine which "makecounter" returns can NOT find the "$add";
## 
## 2. If the "my" in front of variable "$x" was changed to "local",
## the "$x" will be like "static". Any of instances will share the
## same $x.
