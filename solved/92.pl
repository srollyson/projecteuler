#!/usr/bin/env perl
use strict;
use warnings;

my $ending_number_map = {
    1  => 1,
    89 => 89
};

my $num_of_89s = 0;
for ( my $num = 1 ; $num < 10_000_000 ; $num++ ) {
    if ( find_ending_number($num) == 89 ) {
        $num_of_89s++;
    }
}
print "$num_of_89s\n";

sub find_ending_number {
    my ($number) = @_;
    if ( exists $ending_number_map->{$number} ) {
        return $ending_number_map->{$number};
    }
    my @digits = split( //, $number );
    my $sum_of_squares = 0;
    foreach my $digit (@digits) {
        $sum_of_squares += $digit**2;
    }
    $ending_number_map->{$number} = find_ending_number($sum_of_squares);
    return $ending_number_map->{$number};
}
