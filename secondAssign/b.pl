my @l = (1,2,3,4,5,6);
my @p = 1;
my $x = join ",",@p;
print "\$x is ",$x,"\n";
print "@l \n";
push(@l,4);
print "@l \n";
# print pop(@l)," \n";
print $l[0],"\n";

# my $i=$l;
# if($i) {print "\$i is NOT empty \n";}
# else {print "\$i is empty \n";}
# print "\$i is ",$i,"\n";
# print "\$#l is ",$#l,"\n";

for(my $i = $#l; $i>=0;$i--){
    print $l[$i], " ";    
}
print "\n";

my %myhash;

$id{"yang"} = "1name";
$id{"yifan"} = "2name";
$id{"school"} = "Hofstra University";
$id{"who"} = "me";
$id{"larry"} = 123456;
$id{"mary"} = 654321;

print keys(%id),"\n";
# print join(", ", @l), "\n";
foreach $x (keys(%id)) {
    print "\$x is ",$x,". Value is ", $id{$x},"\n";
}
