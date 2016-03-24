sub gcdRec{
    my ($a,$b) = @_;
    if($b==0){$a} else {gcdRec($b,$a%$b);}
}

sub gcdWhile{
    my ($a,$b) = @_;
    while($b!=0){
        ($a,$b) = ($b,$a%$b);        
    }
    $a;
}

print gcdRec(10,2),"\n";

print gcdWhile(10,20),"\n";
