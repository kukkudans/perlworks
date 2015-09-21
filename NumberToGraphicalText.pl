use strict;
use warnings;
use Data::Dumper;
main();

sub main {
	my $TTTTT = "*****";
	my $FFFFT = "    *";
	my $FFFTF = "   * ";
	my $FFTFF = "  *  ";
	my $TFTFF = "* *  ";
	my $FTFFF = " *   ";
	my $FTTFF = " **  ";
	my $TFFFF = "*    ";
	my $TFFFT = "*   *";
	my @zero  = ( $TTTTT, $TFFFT, $TFFFT, $TFFFT, $TFFFT, $TFFFT, $TTTTT );
	my @One   = ( $FFTFF, $FTTFF, $FFTFF, $FFTFF, $FFTFF, $FFTFF, $TTTTT );
	my @two   = ( $TTTTT, $FFFFT, $FFFFT, $FFFTF, $FFTFF, $FTFFF, $TTTTT );
	my @three = ( $TTTTT, $FFFFT, $FFFFT, $TTTTT, $FFFFT, $FFFFT, $TTTTT );
	my @four  = ( $TFFFF, $TFFFF, $TFTFF, $TFTFF, $TTTTT, $FFTFF, $FFTFF );
	my @five  = ( $TTTTT, $TFFFF, $TFFFF, $TTTTT, $FFFFT, $FFFFT, $TTTTT );
	my @six   = ( $TTTTT, $TFFFF, $TFFFF, $TTTTT, $TFFFT, $TFFFT, $TTTTT );
	my @seven = ( $TTTTT, $FFFFT, $FFFFT, $FFFTF, $FTFFF, $TFFFF, $TFFFF );
	my @eight = ( $TTTTT, $TFFFT, $TFFFT, $TTTTT, $TFFFT, $TFFFT, $TTTTT );
	my @nine  = ( $TTTTT, $TFFFT, $TFFFT, $TTTTT, $FFFFT, $FFFFT, $TTTTT );
	my $sizeOfGraphicsPatternArray = @nine - 1;
	my %numberHash                 = (
		0 => \@zero,
		1 => \@One,
		2 => \@two,
		3 => \@three,
		4 => \@four,
		5 => \@five,
		6 => \@six,
		7 => \@seven,
		8 => \@eight,
		9 => \@nine
	);
	my %mappedNumbers = ();
	my $readUserInput = 1;
	my $number        = 0;

	while ( $readUserInput > 0 ) {
		print "\nPlease enter a valid Number\n";
		$number = <STDIN>;
		chomp $number;
		if ( $number =~ /^\d+$/ ) {
			$readUserInput = -1;
			print "\nYou entered: $number\n";
		}
		else {
			print "\nYou entered an invalid Number: $number, please try again\n";
		}

	}

	my @num_array = $number =~ /(\d)/g;
	my $counter = 0;

	for (@num_array) {
		$mappedNumbers{$counter} = $numberHash{$_};
		$counter++;

	}

	for my $index ( 0 .. $sizeOfGraphicsPatternArray ) {
		for my $pattern ( sort( keys(%mappedNumbers) ) ) {
			print "   $mappedNumbers{$pattern}[$index]";
		}
		print "\n";
	}

}
