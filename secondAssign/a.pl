$a = 1;
print $a,"\n";
%b;

$b{"yang"} = 1;
$b{"yifan"} = 2;
print $b{"yang"}, "\n";
$x = 1; $y = 2;
print "\$x is ",$x,"\n";
print "\$y is ",$y,"\n";
($x,$y) = ($y,$x);
print "\$x is ",$x,"\n";
print "\$y is ",$y,"\n";

sub fib1{
    my $n = $_[0];
    if($n<2){1} else {fib1($n-1) + fib1($n-2)}
}

sub fib2{
    my($n,$a,$b) = @_; #localize all arguments
    if($n<2) {$b} else {fib2($n-1,$b,$a+$b)}
}

print "\n12: the 100th fibonacci number is ",fib2(100,1,1),".\n";
# print fib1(100);

sub fib3
{ 
    my $n = shift; # alternative to my $n = $_[0];
    my ($a,$b) = (1,1); # initial values for $a and $b
    while ($n>1)
    { 
        ($a,$b) = ($b,$a+$b); 
        $n--; 
    }
    $b # the ; is optional for the last line inside {}'s
}

print &fib3(19),"\n";

my $x = \%b;
print "15: \$x points to ", %$x, "\n";

sub indexof
{
    my ($x,@L) = @_; # returns position of x inside L
    my $i = 0;
    while (($i <= $#L) && ($x != $L[$i])) {$i++;}
    if ($i<=$#L) {$i} else {-1} # return ‐1 if $x not found in list.
}

print indexof(3,(4,3,6,8,7)),"\n"; # will return 1, the index of the "3" inside the list.

