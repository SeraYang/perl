sub doubles{
    my @X = @_;
    my @result;
    
    foreach my $x (@X){
        push(@result,$x);
        push(@result,$x);
    }
    @result;
}

my @x = (1,2,3,4,5);
my @y = ();
print "\@x is @x \n";
print "\@y is @y \n";
@x = doubles(@x);
@y = doubles(@y);
print "\@x is @x \n";
print "\@y is @y \n";
