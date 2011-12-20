#!/usr/bin/perl
use strict;
use warnings;

use List::Util qw(sum);
my @list = ( 1, 2 );
push( @list, $list[$#list] + $list[ $#list - 1 ] )
  while $list[$#list] < 4_000_000;
pop @list;
print sum( grep { $_ % 2 == 0 } @list ) . "\n";
