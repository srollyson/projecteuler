#!/usr/bin/perl
use strict;
use warnings;

$/ = '';
my @logins = split( "\n", <DATA> );
my %login_seen;
@logins = sort { $a <=> $b } grep { !$login_seen{$_}++ } @logins;
my $password = shift @logins;
LOGIN_PROCESSED: until ( scalar(@logins) == 0 ) {

    # Remove logins that already match $password.
    foreach my $login (@logins) {
        my @digits = split( //, $login );
        if ( $password =~ m/\A\d*$digits[0]\d*$digits[1]\d*$digits[2]\d*\z/ ) {
            @logins = grep { $_ ne $login } @logins;
            next LOGIN_PROCESSED;
        }
    }

    # Add digits to the middle.
    foreach my $login (@logins) {
        my @digits = split( //, $login );
        if ( $password =~ m/\A(\d*)$digits[0](\d*)$digits[2](\d*)\z/ ) {
            $password = "$1$digits[0]$digits[1]$2$digits[2]$3";
            @logins = grep { $_ ne $login } @logins;
            next LOGIN_PROCESSED;
        }
    }

    # Add digits to the end.
    foreach my $login (@logins) {
        my @digits = split( //, $login );
        if ( $password =~ m/\A(\d*)$digits[0](\d*)$digits[1](\d*)\z/ ) {
            $password = "$1$digits[0]$2$digits[1]$3$digits[2]";
            @logins = grep { $_ ne $login } @logins;
            next LOGIN_PROCESSED;
        }
    }

    # Add digits to the beginning.
    foreach my $login (@logins) {
        my @digits = split( //, $login );
        if ( $password =~ m/\A(\d*)$digits[1](\d*)$digits[2](\d*)\z/ ) {
            $password = "$digits[0]$1$digits[1]$2$digits[2]$3";
            @logins = grep { $_ ne $login } @logins;
            next LOGIN_PROCESSED;
        }
    }
}
print "$password\n";

__DATA__
319
680
180
690
129
620
762
689
762
318
368
710
720
710
629
168
160
689
716
731
736
729
316
729
729
710
769
290
719
680
318
389
162
289
162
718
729
319
790
680
890
362
319
760
316
729
380
319
728
716
