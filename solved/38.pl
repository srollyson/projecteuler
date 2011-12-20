#!/usr/bin/perl
use strict;
use warnings;

use Algorithm::Loops qw(NextPermuteNum);

my @nums = 1 .. 9;

my @pandigitals = ();
push @pandigitals, join '', @nums while NextPermuteNum(@nums);
@pandigitals = sort { $b <=> $a } @pandigitals;
for my $num (@pandigitals) {
    print "$num\n" and exit if has_property($num);
}

sub has_property {
    my $num = shift;
    my $test = substr( $num, 0, 1 );
  TEST:
    for ( my $length = 1 ; 2 * length($test) < length($num) ; $length++ )
    {
        my $trunker = $num;
        $test = substr( $num, 0, $length );
        for ( my $n = 1 ; 1 ; $n++ ) {
            my $result = $test * $n;
            return 1  if length($trunker) == 0;
            next TEST if $trunker !~ /\A$result/;
            $trunker = substr( $trunker, length $result );
        }
    }
    return 0;
}
