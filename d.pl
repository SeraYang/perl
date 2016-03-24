#!/usr/bin/perl

my $x = 2;
{
    my $x = 10;
    print "\$x is $x\n";
}
 
print "x is $x\n";

my @l = (3,4,5);
@l = (2,@l);
 
print "@l\n";
print "$#l\n";
$i = @l; ####  $i is the length if @l
print "\$i is $i\n";

%id;
$id{"yang"} = 123;
$id{"yi"} = 456;
print keys($id);
