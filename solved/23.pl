#!/usr/bin/perl
use strict;
use warnings;

my $upper_limit = 28123;
my @abundant_numbers = grep { is_abundant($_) } ( 1 .. $upper_limit - 1 );
my %quick_lookup = ();
@quick_lookup{@abundant_numbers} = ();

my $sum = 0;
TEST: for my $test ( 1 .. $upper_limit ) {
    for my $abundant ( @abundant_numbers ) {
        if ( exists $quick_lookup{$test - $abundant} ) {
            next TEST;
        }
    }
    $sum += $test;
}
print $sum;
print "\n";

sub is_abundant {
    my $num = shift;
    my $sum = 1;
    for my $test ( 2 .. sqrt($num) ) {
        if ( $num % $test == 0 ) {
            $sum += $test;
            if ( $test != sqrt($num) ) {
                $sum += $num / $test;
            }
        }
    }
    return ( $sum > $num );
}
