#!/usr/bin/perl
use strict;
use warnings;

my $count = 1;
for ( my $num = 3; $num <= 1001; $num += 2 ) {
    $count += 4 * $num**2 - 6 * ($num - 1);
}
print $count;
print "\n";
