sub gcdRec{
    my ($a,$b) = @_;
    if($b==0){$a} else {gcdRec($b,$a%$b);}
}
print gcdRec(10,2),"\n";
