require ["include", "environment", "variables", "relational", "comparator-i;ascii-numeric", "spamtest", "imap4flags", "vnd.proton.expire","fileinto"];

# Stores Auto Emails
if header :comparator "i;unicode-casemap" :contains "subject" ["Modification des conditions d'utilisation", "Legal Notice", "Mention Légale"] 
{
    expire "day" "1";
	addflag "\\Seen";
	stop;
}
