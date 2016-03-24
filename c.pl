#!/usr/bin/perl
#
#
sub product{
    my ($n,$l) = ($_[0],$_[1]);
    ##print "\$n is $n \n";
    ##print "pop is @l \n";
    if (!$$l[0]){$n;}
    else {
        product($n*pop(@$l),@l);
    }
}

@l = [1,2,3,4,5];
print product(1,@l);
print "\n------------------\n";
print product(1,9);
