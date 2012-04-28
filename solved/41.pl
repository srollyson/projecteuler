#!/usr/bin/env perl
use strict;
use warnings;

use Algorithm::Loops qw(NextPermuteNum);

my @orig = 1 .. 9;

my @pandigitals = ();
for my $n ( reverse 1 .. scalar @orig - 1 ) {
    my @nums = @orig[ 0 .. $n ];
    push @pandigitals, join '', @nums while NextPermuteNum(@nums);
}

@pandigitals = sort { $b <=> $a } @pandigitals;

for my $test (@pandigitals) {
    print "$test\n" and exit if is_prime($test);
}

sub is_prime {
    my $num = shift;
    for my $div ( 2 .. sqrt($num) ) {
        return 0 if $num % $div == 0;
    }
    return 1;
}
