#!/usr/bin/perl
use strict;
use warnings;

my $longest_chain        = 0;
my $longest_chain_number = 0;

for my $val ( 1 .. 1_000_000 - 1 ) {
    my $number   = $val;
    my $sequence = 0;
    while ( $number > 1 ) {
        if ( $number % 2 ) {
            $number = 3 * $number + 1;
        } else {
            $number = $number / 2;
        }
        $sequence++;
    }
    if ( $sequence > $longest_chain ) {
        $longest_chain        = $sequence;
        $longest_chain_number = $val;
        print "$longest_chain_number has a $longest_chain-chain.\n";
    }
}

print "The longest chain was $longest_chain_number";
print " with a $longest_chain-chain.";
print "\n";

__END__

# The code below is a farce. The growth of the memoized hash and the overhead
# of calling sequence() made this solution sub-optimal when a simple loop would
# do. KISS!

my %memoized_sequences   = ();
my $longest_chain        = 0;
my $longest_chain_number = 0;
for my $val ( 1 .. 1_000_000 - 1 ) {
    my $chain_length = scalar sequence($val);
    print "Looking at $val.\n" if $val % 10_000 == 0;
    if ( $chain_length > $longest_chain ) {
        $longest_chain        = $chain_length;
        $longest_chain_number = $val;
        print "Longest so far: $longest_chain_number";
        print " with a $longest_chain-chain.\n";
        print "Hash size is " . scalar keys(%memoized_sequences) . ".\n";
    }
}
print "Final solution: $longest_chain_number";
print " with a $longest_chain-chain.";

sub sequence {
    my @chain = @_;
    return @{ $memoized_sequences{ $chain[-1] } }
      if exists $memoized_sequences{ $chain[-1] };
    return 1 if ( $chain[-1] == 1 );
    my $next_value = 1;
    if ( $chain[-1] % 2 ) {
        $next_value = 3 * $chain[-1] + 1;
    } else {
        $next_value = $chain[-1] / 2;
    }
    return @{ $memoized_sequences{$next_value} }
      if exists $memoized_sequences{$next_value};
    no warnings;    # Deep recursion is OK!
    my $return = [ @chain, sequence($next_value) ];
    use warnings;
    $memoized_sequences{$next_value} = $return;
    return @$return;
}
