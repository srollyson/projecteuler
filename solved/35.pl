#!/usr/bin/perl
use strict;
use warnings;

my %primes    = ();
my %circulars = ();
NUMBER: for my $num ( 2 .. 1_000_000 ) {
    my @digits = split //, $num;
    do {
        my $tester = join '', @digits;
        $tester =~ s/\A0*//;
        next NUMBER if ( !is_prime($tester) );
    } while ( next_loop( \@digits, $num ) );
    do {
        my $tester = join '', @digits;
        $tester =~ s/\A0*//;
        $circulars{$tester} = 1;
    } while ( next_loop( \@digits, $num ) );
}

print scalar keys %circulars;
print "\n";

sub next_loop {
    my $vals = shift;
    my $orig = shift;
    push @$vals, shift @$vals;
    if ( ( join '', @$vals ) == $orig ) {
        return 0;
    } else {
        return 1;
    }
}

sub is_prime {
    my $num = shift;
    return 0 if $num < 1;
    return $primes{$num} if exists $primes{$num};
    for ( 2 .. sqrt($num) ) {
        if ( $num % $_ == 0 ) {
            $primes{$num} = 0;
            return 0;
        }
    }
    $primes{$num} = 1;
    return 1;
}
