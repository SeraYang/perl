sub thereexists{
    my ($f,@X) = @_;
    my $ruler = 0;
    foreach my $x (@X){
        if(($f)->($x)){$ruler = 1;}
    }
    $ruler;
}

print thereexists(sub{$_[0]>0},(-1,-2,1)),"\n";

# sub forall
# {
#     my ($f,@A) = @_; # first argument is the function, second is the array
#     my $answer = 1; # default answer is true
#     foreach my $x (@A) # read: "for each element x in array A ..."
#     { if (!($f->($x))) {$answer = 0;} }
#     $answer;
# }
# print forall( sub{$_[0]>0}, (3,5,-2,1,0,4) ), 
# ": is false because not all numbers in the list are positive\n";
