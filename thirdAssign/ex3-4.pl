sub make_account{
    my ($balance,$pw) = ($_[0],$_[1]);
    my $wrongtime = 0;
    my $withdraw = sub{
        my $val = $_[0];
        if($val>$balance){ print "Insufficient funds \n";}
        else {
            $balance -= $val;
        }
    };
    my $deposit = sub{
        $balance += $_[0];
    };
    
    my $wrong = sub{
        if($wrongtime < 7){
            $wrongtime++;
            print "Incorrect password!!! \n";
        }else{print "call 911!!!! \n";}
    
    };

    sub{
        my ($x,$y) = ($_[0],$_[1]);
        # print $x,"\n";
        # print $pw,"\n";
        if($x eq $pw){
            $wrongtime = 0;
            if($y eq "withdraw"){ return $withdraw;}
            if($y eq "deposit"){ return $deposit;}
            else { print "Unknown request -- MAKE-ACCOUNT \n";}
        } else { return $wrong;}
    }
}

$first = &make_account(100,"yangyifan");
$first -> ("yagyifan","withdraw") -> (10),"\n";
$first -> ("yagyifan","withdraw") -> (10),"\n";
$first -> ("yagyifan","withdraw") -> (10),"\n";
$first -> ("yagyifan","withdraw") -> (10),"\n";
$first -> ("yagyifan","withdraw") -> (10),"\n";
$first -> ("yagyifan","withdraw") -> (10),"\n";
$first -> ("yagyifan","withdraw") -> (10),"\n";
$first -> ("yagyifan","withdraw") -> (10),"\n";
$first -> ("yagyifan","withdraw") -> (10),"\n";

