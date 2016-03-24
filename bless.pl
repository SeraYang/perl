# rudimentary support for a kind of oop in Perl
# This most important new "feature" here is "bless".

# The idea here is to again create a generic sports team "class"  that
# keeps track of wins and losses, and a subclass for hockey teams that
# can also tie.

package team;   # package is kind of like "class"

sub maketeam
{
    my ($wins,$losses) = @_;
    my $hash = 
    {
      wins => $wins,
      losses => $losses
    };
    bless $hash, "team";  # tags structure with a type (class) name
}                         # bless also returns pointer to struct for convenience

# now for the methods, the first parameter of these methods must always
# be the object structure (i.e., the hash table).

sub win
{
    my $this = shift;
    $this->{wins} += 1;
}

sub lose
{
    my $this = shift;
    $this->{losses} += 1;
}

sub wp  # winning percentage
{
    my $t = shift;  # don't have to call it "this", it's just a var
    $t->{wins} / (1.0 * $t->{wins} + $t->{losses});
}

# --------   now for a subclass ----------------

package hockeyteam;

@ISA = ("team");

# There's nothing deep going on here! "ISA" is just a package-global 
# variable that defines (as strings!) a list of other packages that it
# "inherits".

sub makehockeyteam
{
    my ($wins,$losses,$ties);  # hockey teams can tie

    # create superclass instance explicitly:
    my $hash = team->maketeam($wins,$losses);

    # add the sub-class specific stuff to the structure
    $hash->{ties} = $ties;

    # AND NOW FOR THE MIRACULOUS RELIGIOUS CONVERSION:
    bless $hash, "hockeyteam";  
    # The team is now born again as a hockeyteam.  Praise the lord!
    
} # subclass constructor


# subclass methods
sub tie
{
    my $this = shift;
    $this->{tie} += 1;
}

# We also need to "override" the super class'es wp method

sub wp  # winning percentage (a tie is half a win)
{
    my $t = shift;  
    print "calling the subclass method\n"; # just so you can see.
    ($t->{wins}+($t->{ties}/2.0)) / (1.0 * $t->{wins} + $t->{losses} + $t->{ties});
}

# now for an object of the subclass:

$rangers = makehockeyteam(0,0,0);
$rangers->lose();  # here, it has to use the ISA var to look up the method
$rangers->win();
$rangers->win();
$rangers->tie();
print $rangers->wp(), "\n"; # here, the "bless" tells it which wp to call

# A function call like $rangers->win() is really the same as
# win($rangers).  The only difference is that the C++ish form
# will use the "blessed" tag and the ISA variable to look up the 
# super class-package, if the method is not defined in the current
# package.


#---
# What's unsatisfactory about this approach to oop?  Well, the most
# obvious one is that there's no encapsulation: everything is public.
# We can get encapsulation using the function-closure method but 
# then inheritance becomes cumbersome.  Thus, we again see a need (or
# at least a reason) for languages such as C++ and Java.

# The other "problem" with this approach to oop is type safety.  There is
# nothing that prevents me from "blessing" a structure as anything I want.
# For example, I can bless a football team structure as a "hockeyteam".
# That, of course, still doesn't mean that a hockeyteam will have a
# quarterback!  C++ have the same problem with types (through type
# casting).  But the more recent oop languages (Java, C#, Eiffel) will
# prevent such mistakes from happening.  At this point, it is appropriate
# for us to begin considering these full-scale oop languages in depth.

