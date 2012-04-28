#!/usr/bin/env perl
use strict;
use warnings;

use Math::BigInt;

print scalar grep { is_lychrel($_) } ( 1 .. 9_999 );
print "\n";

sub is_lychrel {
    my $num = shift;
    $num = Math::BigInt->new($num);
    for my $iter ( 1 .. 50 ) {
        $num->badd( scalar reverse $num );
        return 0 if $num eq scalar reverse $num;
    }
    return 1;
}
