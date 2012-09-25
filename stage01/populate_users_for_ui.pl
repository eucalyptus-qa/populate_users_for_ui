#!/usr/bin/perl
use strict;

my $ui_user_list = "../share/ui-test-dir/ui-test-user-info.txt";

if( @ARGV > 0 ){
	my $ui_user_list = shift @ARGV;
};


print "\n";
print "Populating Accounts and Users for UI\n";
print "\n";
print "[UI USER LIST]\t$ui_user_list\n";
print "\n";

my $listbuf = `cat $ui_user_list`;

print "##############################################################\n";
print "$listbuf\n";
print "##############################################################\n";

my @userlistarray = split("\n", $listbuf);
my $num_user = @userlistarray;

if( $num_user < 1 ) {
	print "[TEST_REPORT] FAILED : NUM of USERS in the List $ui_user_list < 1\n";
	exit(1);
};

### REMOVED SINCE NO NEED TO CREATE DEFAULT USER IN THIS TEST	092412 
#print "\n";
#print "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
#print "Create Default Account and User\n";
#print "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
#print "\n";

#system("perl ./create_account_and_user.pl");

foreach my $line (@userlistarray){

	if( $line =~ /^(\S+)\s+(\S+)\s+(\S+)/ ){

		my $account = $1;
		my $user = $2;
		my $password = $3;
		print "\n";
		print "\n";
		print "\n";
		print "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
		print "Create [ Account \'$account\', User \'$user\', Password '$password'\n";
		print "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
		print "\n";
		print "\n";
		system("perl ./create_account_and_user_for_ui.pl $account $user $password");
		print "\n";
	};
};

exit(0);

1;


