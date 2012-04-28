#!/usr/bin/env perl
use strict;
use warnings;

use List::Util qw(sum);
print sum grep {double_palindromic($_)} 0 .. 1_000_000 - 1;
print "\n";

sub double_palindromic {
    my ($num) = @_;
    my $bin = sprintf("%b", $num);
    return ( ($num == reverse $num) && ($bin == reverse $bin) );
}
