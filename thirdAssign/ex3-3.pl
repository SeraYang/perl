sub make_account{
    my ($balance,$pw) = ($_[0],$_[1]);
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
    
    my $wrong = sub{print "Incorrect password!!! \n";};

    sub{
        my ($x,$y) = ($_[0],$_[1]);
        # print $x,"\n";
        # print $pw,"\n";
        if($x eq $pw){
            if($y eq "withdraw"){ return $withdraw;}
            if($y eq "deposit"){ return $deposit;}
            else { print "Unknown request -- MAKE-ACCOUNT \n";}
        } else { return $wrong;}
    }
}

$first = make_account(100,"yangyifan");
print $first -> ("yangyifan","withdraw") -> (10),"\n";

