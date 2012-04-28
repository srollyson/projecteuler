#!/usr/bin/env perl
use strict;
use warnings;

my $max     = 0;
my $max_num = 0;
for my $num ( 1 .. 999 ) {
    my $solutions = num_of_solutions($num);
    if ( $solutions > $max ) {
        $max     = $solutions;
        $max_num = $num;
    }
}
print "$max_num\n";

sub num_of_solutions {
    my $num       = shift;
    my $solutions = 0;
    for my $a ( 1 .. $num / 2 ) {
        for my $b ( 1 .. $a ) {
            my $perimeter = $a + $b + sqrt( $a**2 + $b**2 );
            $solutions++ if $num == $perimeter;
        }
    }
    return $solutions;
}
