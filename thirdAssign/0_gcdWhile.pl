sub gcdWhile{
    my ($a,$b) = @_;
    while($b!=0){
        ($a,$b) = ($b,$a%$b);        
    }
    $a;
}
print gcdWhile(10,20),"\n";
