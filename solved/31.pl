#!/usr/bin/perl
use strict;
use warnings;

my $denoms = [ 200, 100, 50, 20, 10, 5, 2, 1 ];

print calculate_totals( $denoms, 200 );
print "\n";

sub calculate_totals {
    my $list       = shift;
    my $money_left = shift;
    if ( scalar @$list == 1 ) {
        return ( $money_left && $money_left % $list->[0] ) ? 0 : 1;
    } else {
        my $count = 0;
        for ( 0 .. $money_left / $list->[0] ) {
            $count += calculate_totals(
                [ @{$list}[ 1 .. scalar @$list - 1 ] ],
                $money_left - $_ * $list->[0]
            );
        }
        return $count;
    }
}
