@a = (1,2,3,4);
foreach (@a) {print $_,"\n";}
$ptr = \@a;
print "$$ptr[1] \n";
print "$ptr->[0] \n";
print "reference array: @$ptr.\n";

my $fun;
$fun = sub {if($_[0] <1){print "1\n";} else{$fun->($_[0]-1);}};

$fun->(20);
