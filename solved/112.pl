#!/usr/bin/env perl
use strict;
use warnings;
use v5.14;

use constant {
    NONE   => 0,
    UP     => 1,
    DOWN   => 2,
    BOUNCY => 3,
};

my $target_ratio = .99;
my $num          = 9;
my $bouncy_count = 0;
my @direction    = (); # Hash functions get expensive!

# Single digit numbers will be given no direction. We'll process numbers with 2
# or more digits in the following while loop.
push( @direction, NONE ) for 0..9;

while ( $bouncy_count / $num < $target_ratio ) {
    $num++;

    # For a number, $num, whose digits are ABCD: $left will contain ABC,
    # $last_left will contain C, and $right will contain D.
    my $left      = int( $num / 10 );
    my $last_left = $left % 10;
    my $right     = $num % 10;

    # Compare $last_left and $right to determine the direction of $num based on
    # the previous direction of $left.
    if ( $direction[$left] == NONE ) {
        if ( $last_left == $right ) {
            push @direction, NONE;
        } elsif ( $last_left < $right ) {
            push @direction, UP;
        } else {
            push @direction, DOWN;
        }
    } elsif ( $direction[$left] == UP ) {
        if ( $last_left <= $right ) {
            push @direction, UP;
        } else {
            push @direction, BOUNCY;
        }
    } elsif ( $direction[$left] == DOWN ) {
        if ( $last_left >= $right ) {
            push @direction, DOWN;
        } else {
            push @direction, BOUNCY;
        }
    } else {
        push @direction, BOUNCY;
    }

    # Did we deem $num to be bouncy? If so increment $bouncy_count. This will
    # break us out of the while loop once we reach the target ratio of bouncy
    # numbers.
    if ( $direction[$num] == BOUNCY ) {
        $bouncy_count++;
    }
}

say $num;
