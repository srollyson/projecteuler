#!/usr/bin/env perl
use strict;
use warnings;

# Ugly brute force with memoization, but it worked.

my $number_of_factors = 500;
my $biggest_so_far    = 0;

my $value = 1;
for ( my $term = 1 ; 1 ; $value += ++$term ) {
    my @factors = get_factors($value);
    if ( scalar @factors > $biggest_so_far ) {
        $biggest_so_far = scalar @factors;
        print "$value has $biggest_so_far factors.\n";
    }
    print "Final answer: $value\n" and exit
      if scalar @factors >= $number_of_factors;
}

my %memoized_factors = ();

sub get_factors {
    my $num = shift;
    return @{ $memoized_factors{$num} } if exists $memoized_factors{$num};
    my @factors = ( $num, 1 );
    my @candidates = reverse 2 .. ( sqrt $num );
    for my $guess (@candidates) {
        if ( $num % $guess == 0 ) {
            if ( defined $memoized_factors{$guess} ) {
                push @factors, @{ $memoized_factors{$guess} };
            } else {
                push @factors, get_factors($guess);
            }
            $guess = $num / $guess;
            if ( defined $memoized_factors{$guess} ) {
                push @factors, @{ $memoized_factors{$guess} };
            } else {
                push @factors, get_factors($guess);
            }
        }
    }
    my %uniques = ();
    @uniques{@factors} = ();
    $memoized_factors{$num} = [ sort { $a <=> $b } keys %uniques ];
    return @{ $memoized_factors{$num} };
}
