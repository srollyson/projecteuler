#!/usr/bin/perl
use strict;
use warnings;

my $max_number  = 1_000_000;
my $family_size = 8;
my %is_prime    = ();
@is_prime{ ( 2 .. $max_number - 1 ) } = (1) x ( $max_number - 2 );

# Sieve of Eratosthenes!
for my $num ( 2 .. sqrt $max_number ) {
    next if !$is_prime{$num};
    for ( my $sieve = 2 * $num ; $sieve < $max_number ; $sieve += $num ) {
        $is_prime{$sieve} = 0;
    }
}

my @primes = sort { $a <=> $b } grep { $is_prime{$_} } keys %is_prime;

for my $prime (@primes) {
    print "$prime\n" and exit if has_a_prime_family($prime);
}

sub has_a_prime_family {
    my ($num) = @_;
    my @max_family = ();
    for my $mask ( 1 .. 2**length($num) - 2 ) {
        my $str = $num;
        for my $digit ( 1 .. length($num) ) {
            my $bit = 2**( $digit - 1 );
            if ( $mask & $bit ) {
                $str =
                  substr( $str, 0, $digit - 1 ) . 'X' . substr( $str, $digit );
            }
        }
        my @family = ();
        for my $replacement_digit ( 0 .. 9 ) {
            my $test_prime = $str;
            $test_prime =~ s/X/$replacement_digit/g;
            next if $test_prime =~ /\A0/;
            push @family, $test_prime if $is_prime{$test_prime};
        }
        @max_family = @family if scalar @family > scalar @max_family;
    }
    return ( exists $max_family[0]
          && $max_family[0] == $num
          && scalar @max_family == $family_size );
}
