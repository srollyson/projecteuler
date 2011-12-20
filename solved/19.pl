#!/usr/bin/perl
use strict;
use warnings;

use DateTime;

my $sundays_are_first = 0;
for my $year ( 1901 .. 2000 ) {
    for my $month ( 1 .. 12 ) {
        my $date = DateTime->new( year => $year, month => $month, day => 1 );
        $sundays_are_first++ if $date->day_of_week == 7;
    }
}

print $sundays_are_first;
print "\n";
