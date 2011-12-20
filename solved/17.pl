#!/usr/bin/perl
use strict;
use warnings;

use Lingua::EN::Numbers qw(num2en);

my $total_letters = 0;
for ( 1 .. 1000 ) {
    my $string = num2en($_);
    $string =~ s/[^a-z]//gi;
    $total_letters += length $string;
}
print $total_letters;
print "\n";
