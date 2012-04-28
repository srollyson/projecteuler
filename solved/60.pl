#!/usr/bin/env perl
use strict;
use warnings;

#--[Sieve engine.]--------------------------------------------------------------
my $max_stored_prime = 10_000;
my %is_prime_hash    = ();
@is_prime_hash{ ( 2 .. $max_stored_prime - 1 ) } =
  (1) x ( $max_stored_prime - 2 );
for my $num ( 2 .. sqrt $max_stored_prime ) {
    next if !$is_prime_hash{$num};
    for ( my $sieve = 2 * $num ; $sieve < $max_stored_prime ; $sieve += $num ) {
        $is_prime_hash{$sieve} = 0;
    }
}
my @primes = sort { $a <=> $b } grep { $is_prime_hash{$_} } keys %is_prime_hash;

sub is_prime {
    my ($num) = @_;
    return $is_prime_hash{$num} if exists $is_prime_hash{$num};
    my $limit = sqrt($num);
    for my $prime (@primes) {
        return 1 if $prime > $limit;
        return 0 if $num % $prime == 0;
    }
    return 1;
}

#--[Execution.]-----------------------------------------------------------------
use List::Util qw(sum);

# Two can't be used, don't even try.
my @concatenators =
  find_smallest_concatenator( 5, [ @primes[ 1 .. $#primes ] ] );
print sum @concatenators;

sub find_smallest_concatenator {
    my ( $set_size, $pool_ref, $set_ref ) = @_;
    my @pool_of_primes = @{$pool_ref};
    $set_ref = [] unless defined $set_ref;
    my @set_so_far  = @{$set_ref};
    my %used_primes = ();
    @used_primes{@set_so_far} = (1) x ( scalar @set_so_far );
    my @usable_primes = grep { !$used_primes{$_} } @pool_of_primes;
    if ( $set_size == 1 ) {
      CANDIDATE: for my $prime (@usable_primes) {
            for my $used_prime (@set_so_far) {
                next CANDIDATE unless is_concatenator( $prime, $used_prime );
            }
            return ( @set_so_far, $prime );
        }
        return ();
    }
    for my $used_prime (@set_so_far) {
        @pool_of_primes =
          grep { is_concatenator( $_, $used_prime ) } @pool_of_primes;
    }
    for (
        my $prime_index = 0 ;
        $prime_index < $#pool_of_primes ;
        $prime_index++
      )
    {
        my @smallest_set = find_smallest_concatenator(
            $set_size - 1,
            [ @pool_of_primes[ $prime_index + 1 .. $#pool_of_primes ] ],
            [ @set_so_far, $pool_of_primes[$prime_index] ]
        );
        return @smallest_set if scalar @smallest_set;
    }
    return ();
}

sub is_concatenator {
    my ( $a, $b ) = @_;
    return ( is_prime("$a$b") && is_prime("$b$a") );
}
