#!/usr/bin/perl
use strict;
use warnings;

my $t = 285;
my $p = 165;
my $h = 143;

$t++;
$p++;
$h++;
while ( calc_t($t) != calc_p($p) || calc_t($t) != calc_h($h) ) {
    $t++ and next if ( calc_t($t) < calc_p($p) || calc_t($t) < calc_h($h) );
    $p++ and next if calc_p($t) < calc_h($p) || calc_p($p) < calc_t($t);
    $h++;
}
print calc_t($t);
print "\n";

sub calc_t {
    my $num = shift;
    return ( $num * ( $num + 1 ) ) / 2;
}

sub calc_p {
    my $num = shift;
    return ( $num * ( 3 * $num - 1 ) ) / 2;
}

sub calc_h {
    my $num = shift;
    return $num * ( 2 * $num - 1 );
}
