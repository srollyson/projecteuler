#!/usr/bin/env perl
use strict;
use warnings;

#--[Execution.]-----------------------------------------------------------------
my @sequences = ();
NUMBER: for my $num ( 1000 .. 9999 ) {
    if ( is_prime($num) ) {
        my $new_sequence = [$num];
        push @sequences, $new_sequence;
        next NUMBER unless scalar @sequences > 2;
      SEQUENCE:
        for my $sequence ( reverse @sequences[ 0 .. scalar @sequences - 2 ] ) {
            my $new_sequence = [$num];
            my $prev_num     = $sequence->[-1];
            if ( is_permutation( $num, $sequence->[-1] ) ) {
                my $diff = $num - $prev_num;
                for ( my $index = 0 ;
                    $index < scalar @$sequence - 1 ; $index++ )
                {
                    next SEQUENCE
                      unless (
                        $sequence->[ $index + 1 ] - $sequence->[$index] ==
                        $diff );
                }
                unshift @$new_sequence, @$sequence;
                push @sequences, $new_sequence if scalar @$new_sequence > 1;
            }
        }
    }
}
for my $sequence ( reverse @sequences ) {
    if ( scalar @$sequence > 2 ) {
        my $string = join( '', @$sequence );
        print "$string\n" unless $string eq '148748178147';
    }
}

#--[Subroutines.]---------------------------------------------------------------
sub is_permutation {
    my ( $num1, $num2 ) = @_;
    my %num1_digits = ();
    $num1_digits{$_} = 0 for ( 0 .. 9 );
    $num1_digits{$_}++ for ( split //, $num1 );
    my %num2_digits = ();
    $num2_digits{$_} = 0 for ( 0 .. 9 );
    $num2_digits{$_}++ for ( split //, $num2 );
    for my $digit ( keys %num1_digits ) {
        return 0 if $num1_digits{$digit} != $num2_digits{$digit};
    }
    return 1;
}

sub is_prime {
    my ($num) = @_;
    return 0 if $num < 2;
    for my $div ( 2 .. sqrt $num ) {
        return 0 if $num % $div == 0;
    }
    return 1;
}
