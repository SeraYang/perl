sub make_accumulator{
    my $ini = $_[0];
    my $add = sub{$ini += $_[0];print $ini,"\n";}; # Again, ";" is necessary.

    sub{
        my $x = $_[0];
        $add -> ($x);
    }
}

$first = &make_accumulator(100);
$first -> (10);
&$first(10);

