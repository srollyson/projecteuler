#!/usr/bin/env perl
use strict;
use warnings;
my %primes = ();
$primes{1} = 1;
my $max_combo = 0;
my $max_a     = 0;
my $max_b     = 0;
for ( my $a = -999 ; $a < 1000 ; $a++ ) {
    for ( my $b = -999 ; $b < 1000 ; $b++ ) {
        my $prime_combo = 0;
        my $val         = $b;
        for ( $prime_combo = 0 ; $val > 0 && is_prime($val); $prime_combo++ ) {
            $val = $prime_combo**2 + $a*$prime_combo + $b;
        }
        $prime_combo-=2;
        if ( $prime_combo > $max_combo ) {
            $max_combo = $prime_combo;
            $max_a     = $a;
            $max_b     = $b;
        }
    }
}
print "n^2 + ${max_a}n + $max_b produces primes until n=$max_combo f(n)=";
print "" . ($max_combo**2 + $max_a*$max_combo + $max_b) . ".\n";
print "Solution is a=$max_a, b=$max_b. a * b = " . ($max_a * $max_b) . ".\n";

sub is_prime {
    my $num = shift;
    return 0 if $num < 1;
    return $primes{$num} if exists $primes{$num};
    for ( 2 .. sqrt ($num) ) {
        if ( $num % $_ == 0 ) {
            $primes{$num} = 0;
            return 0;
        }
    }
    $primes{$num} = 1;
    return 1;
}
