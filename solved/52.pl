#!/usr/bin/env perl
use strict;
use warnings;

CONTENDER: for ( my $num = 1 ; 1 ; $num++ ) {
    my %digits = ();
    $digits{$_}++ for split //, $num;
    for my $mult ( 2 .. 6 ) {
        $mult *= $num;
        my %test = ();
        $test{$_}++ for split //, $mult;
        next CONTENDER
          if join( '', sort { $a <=> $b } keys %digits ) ne
              join( '', sort { $a <=> $b } keys %test );
        for my $digit ( keys %test ) {
            next CONTENDER if $test{$digit} != $digits{$digit};
        }
    }
    print "$num\n" and exit;
}
