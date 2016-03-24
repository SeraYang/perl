sub howmany{
    my ($f,@X) = @_;
    my $ruler = 0;
    foreach my $x (@X){
        if($f->($x)){$ruler++;}
    }
    $ruler;
}

print howmany(sub{$_[0] > 4},(3,6,2,8,2)),"\n";
