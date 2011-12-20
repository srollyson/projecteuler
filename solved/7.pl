#!/usr/bin/perl
use strict;
use warnings;

my $counter = 0;
for ( my $candidate = 2; 1; $candidate++ ) {
    $counter++ if is_prime($candidate);
    print "$candidate\n" and exit if $counter == 10_001;
}

sub is_prime {
    my $num = shift;
    for ( 2 .. sqrt $num ) {
        return 0 if $num % $_ == 0;
    }
    return 1;
}
