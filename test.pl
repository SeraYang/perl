#!/usr/bin/perl

#@a = (1,2,3,4,5);
#print "@a\n";
#@b = (11,12,13,14);
#@c = (21,22,23);
#@a = (@a,10);
#print "@a\n";
#@a = (11,@a);
#print "@a\n";
#@a = push(@a,0);
## @a = push(0,@a); # this way is illegal;
#@a = (@b,@c);
#print "@a\n";
## print "(@b,@c)\n";
## foreach my $x (@a) {print $a[$x]," ";} # not effect
#($x,$y) = (10,20);
#print $x," ",$y,"\n";
#($x,$y) = ($y,$x);
#print $x," ",$y,"\n";
#($car,$cdr) = (1,2,3,4,5);
#print $car,"\n";
#print $cdr,"\n";
#$ptr = \@a;
#print "\$ptr is ",$ptr,"\n";
#@$ptr = (1,2);
#print "\$\$ptr is @$ptr \n";
#print "@a\n";

#print @ARGV,"\n"; # @ARGV is key word.


# Regular expression
#$string = "I love you!! \n";
#$string =~ m/(.+)/;
#$http = "<abc> cde >";
#$http =~ m/(.+)>(.+)>/;
#print $1,"\n";
#print $2;

####### dynamic or static ######
#$x = 3;
#sub f {$x + 1};
#
#local $x = 10;
#
#print $x,"\n";
#print f 3,"\n";
#@l =(1,2,3,4,5); 
#$w = \@l;
#print $w -> [0];
#print @$w;
#print $$w[0];
#sub f{
#    local $x = 1;
#    {
#        local $x = 10;
#        print $x."\n";
#    }
#    print $x;
#}
#f();
#$array{"yang"}{"yi"}[0] = 0;
#print $array{"yang"}{"yi"}[0];
$line = "yang yi fan";
@result = split(" ",$line);
$r1 = split(" ",$line);
print $result[0],' ';
print $result[1],' ';
print $result[2],' ';
print $result[3],' ';
print "\n";
print $r1;
