#!/usr/bin/env perl
#--[Documentation.]-------------------------------------------------------------
#   Author: Stephen Rollyson, srollyson@cpan.org.
# Filename: 97.pl.
#  Purpose: Solves problem 97 of Project Euler:
#           http://projecteuler.net/problem=97
#--[Modules.]-------------------------------------------------------------------
# Core.
use strict;
use warnings;

#--[Execution.]-----------------------------------------------------------------
my $coefficient  = 28_433;
my $power_of_two = 7_830_457;
my $modulus      = 10 ** 10;
my $result       = 1;

for ( 1 .. $power_of_two ) {
    $result *= 2;
    $result %= $modulus;
}

$result *= $coefficient;
$result += 1;
$result %= $modulus;

print "$result\n";
