#!/usr/bin/perl

####
#extract contigs from metadata
#this script is developed by Ravi P. More
#This script takes input list of sequence names (input.txt) and search in fasta formated sequences metadata (metadata.fasta) and gives output (output.txt)
#USAGE: perl extract_contigs_from_metadata.pl
#Requirement: Bio::SeqIO module is required
#Mendetory: keep extract_contigs_from_metadata.pl, input.txt, metadata.fasta files in same folder to run


####
use Bio::SeqIO;
open FILE1, "input.txt" or die;
my %hash;
while (my $line=<FILE1>) {
   chomp($line);
  # (my $word1,my $word2) = split /:/, $line;
   $hash{$line} = '';
}

my $file = "metadata.fasta";
open(my $outfile, ">", "output.txt");     #my $file="aac.geneseq";


    my $in = Bio::SeqIO->new(-format => 'fasta',
                         -file   => $file);
    my $count=1;

    while ( my $seq = $in->next_seq)
    {
    #print "$count\n";
    $count++;
    my $head = $seq->display_id();
    my $str = $seq->seq;   # get the sequence as a string

       print {$outfile} ">$head\n$str\n" if (exists($hash{$head}));
    #   print ">$head\n"if (exists($hash{$head}));

}