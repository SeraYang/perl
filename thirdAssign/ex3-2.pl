sub make_monitored{
    my $f = $_[0];
    my $count = 0;

    sub{
        my $x = $_[0];
        if($x == "\'how-many-calls?"){ print $count,"\n";}
        if($x == "reset-count"){$count = 0;}
        else {
            $count++;
            return ($f -> ($x));
        }
    }
}

sub fun1{
    return $_[0] * $_[0];
}
# $function = \&fun1;
# $first = &make_monitored(sub{return $_[0]*$_[0];});
$first = &make_monitored(\&fun1);
$first->("\'how-many-calls?");
print $first->(10),"\n";
print $first->(20),"\n";
$first->("\'how-many-calls?");

