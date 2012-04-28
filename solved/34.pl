#!/usr/bin/env perl
use strict;
use warnings;

use List::Util qw(sum);

my %factorials = ();
$factorials{$_} = factorial($_) for ( 0 .. 9 );
my @curious_numbers = ();
for my $num ( 3 .. 50_000 ) {
    push @curious_numbers, $num
      if $num == sum map { $factorials{$_} } split //, $num;
}
print sum @curious_numbers;
print "\n";

sub factorial {
    my $num = shift;
    my $res = 1;
    $res *= $_ for ( 2 .. $num );
    return $res;
}
