#!/usr/bin/perl
#
sub f
{
    my $x = 0;
    sub{
        $x += 2;
        $x

    }
}

my $fptr = f();
my $yang = f();
print $fptr->();
print $fptr->();
print $fptr->();
print $fptr->();
print $yang->();
f -> ();
print "----------------\n";

sub g
{
    my $x = 10;
    $x += 1;
    $x
}
print g(),"   ";
print g(),"   ";
print g(),"   ";
print g(),"   ";
print g(),"   ";
my $a = g();
print $a;
print $a;
print $a;
