#!/usr/bin/env perl
use strict;
use warnings;

#--[Sieve engine.]--------------------------------------------------------------
my $max_number = 100_000;
my %is_prime   = ();
@is_prime{ ( 2 .. $max_number - 1 ) } = (1) x ( $max_number - 2 );
for my $num ( 2 .. sqrt $max_number ) {
    next if !$is_prime{$num};
    for ( my $sieve = 2 * $num ; $sieve < $max_number ; $sieve += $num ) {
        $is_prime{$sieve} = 0;
    }
}
my @primes = sort { $a <=> $b } grep { $is_prime{$_} } keys %is_prime;

sub is_prime {
    my ($num) = @_;
    return $is_prime{$num} if exists $is_prime{$num};
    my $limit = sqrt($num);
    for my $prime (@primes) {
        return 1 if $prime > $limit;
        return 0 if $num % $prime == 0;
    }
    return 1;
}

#--[Execution.]-----------------------------------------------------------------
my $primes_along_diagonal = 0;
my $total                 = 1;

my $side_length = 1;
while ( $side_length += 2 ) {
    my $val = 1;
    for my $corner ( 0 .. 3 ) {
        $val = $side_length**2 - ( $corner * ( $side_length - 1 ) );
        if ( is_prime($val) ) {
            $primes_along_diagonal++;
        }
        $total++;
    }
    print "$side_length\n" and exit
      if $primes_along_diagonal / $total < 0.1;
}
