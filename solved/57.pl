#!/usr/bin/perl
use strict;
use warnings;

use bigint;

my $max_depth = 1_000;
print expand_o_matic( 1, 1, 0 ) . "\n";

sub expand_o_matic {
    my $numerator     = shift;
    my $denominator   = shift;
    my $depth         = shift;
    my $prev_num      = shift || 1;
    my $prev_den      = shift || 0;
    my $next_prev_num = $numerator;
    my $next_prev_den = $denominator;
    return 0 unless $max_depth > $depth;
    $numerator *= 2;
    $numerator += $prev_num;
    $denominator *= 2;
    $denominator += $prev_den;
    my $return = ( ( length $numerator > length $denominator ) ? 1 : 0 );
    no warnings; # Big recursion allowed!
    $return += expand_o_matic(
        $numerator,     $denominator, $depth + 1,
        $next_prev_num, $next_prev_den
    );
    use warnings;
    return $return;
}
