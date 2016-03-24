sub estimate_integral{
    my ($x1,$x2,$y1,$y2,$trials) = ($_[0],$_[1],$_[2],$_[3],$_[4]);

    my $max = sub {
        my $a = $_[0];
        my $b = $_[1];

        if($a > $b){$a;}
        else {$b;}
    };

    my $min = sub {
        my $a = $_[0];
        my $b = $_[1];

        if($a < $b){$a;}
        else {$b;}
        
    };

    my $check = sub {
        my $x = $_[0];
        my $y = $_[1];

        if((($x - 5) ** 2 + ($y - 7) ** 2) <= 9){1}
        else{0}
    };

    my $compute = sub {
        if($trials == 0) {print "No trials input!!!";}
        my $counter = $trials;
        my $pass = 0;
        my $xrange = ($max->($x1,$x2)) - ($min->($x1,$x2));
        my $yrange = ($max->($y1,$y2)) - ($min->($y1,$y2));
        while($counter > 0){
            my $x = ($min->($x1,$x2)) + rand($xrange);
            my $y = ($min->($y1,$y2)) + rand($yrange);
            if($check->($x,$y)){ $pass++;}
            $counter--;
            
        }
        my $ratio = $pass/$trials;
        my $radiusArea = $ratio * (($max->($x1,$x2))-($min->($x1,$x2))) *
                                  (($max->($y1,$y2))-($min->($y1,$y2)));
        return ($radiusArea/9.0);
    };

    &$compute();
}
# print 3/5,"\n";
# print 10 ** 2,"\n";
# print rand(10),"\n";
my $first = &estimate_integral(2,8,4,10,20000000);
print $first,"\n";
