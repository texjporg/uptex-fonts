#!/usr/bin/perl

use 5.026;
use warnings;

my ($line, $seq, $cmp, $cid, %svs_list, @svs, $i);

while ($line=<>) {

    next if ($line=~/^%/);
    chomp $line;

    ($seq, $cmp, $cid) = split "\t", $line;

    @_ = split ' ', $seq;
    my ($base,$svs) = (@_);

    push @svs, $seq;
    $svs_list{"$seq"} = "$base-$svs($cmp) ".chr(hex($base))."/".chr(hex($base)).chr(hex($svs)).chr(hex($cmp));

}

#@svs = sort(@svs);

$i=0;
foreach $seq (@svs) {

    print $svs_list{"$seq"};
    if ($i % 3 == 2){ say '\par'; }
    else            { say ' '; }
    $i++;

}
