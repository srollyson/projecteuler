#!/usr/bin/env perl
use strict;
use warnings;

use List::Util qw(sum);
my @nums = grep { $_ % 3 == 0 || $_ % 5 == 0 } 1 .. 999;
print sum(@nums);
print "\n";
