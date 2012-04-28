#!/usr/bin/env perl
use strict;
use warnings;

for my $c ( 1 .. 1000 ) {
    for my $b ( 1 .. $c ) {
        for my $a ( 1 .. $b ) {
            next unless $a + $b + $c == 1000;
            next unless $a**2 + $b**2 == $c**2;
            print $a*$b*$c;
            print "\n";
            exit;
        }
    }
}
