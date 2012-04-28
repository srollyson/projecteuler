#!/usr/bin/env perl
use strict;
use warnings;

use List::Util qw(max);

my @candidates = ();
for my $outer_num ( reverse 1 .. 999 ) {
    for my $inner_num ( reverse $outer_num .. 999 ) {
        my $product = $outer_num * $inner_num;
        if ( $product eq scalar reverse $product ) {
            push (@candidates, $product);
        }
    }
}
print max @candidates;
print "\n";
