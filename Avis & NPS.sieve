require ["include", "environment", "variables", "relational", "comparator-i;ascii-numeric", "spamtest", "imap4flags", "vnd.proton.expire","fileinto"];

if address :matches :domain "from" ["feedback.avis-verifies.com"]
{
    fileinto "trash";
    expire "day" "1";
	addflag "\\Seen";
	stop;
}

else if header :comparator "i;unicode-casemap" :contains "subject" ["votre avis nous intéresse","avoir votre avis","Que pensez-vous de","Votre avis sur","donner votre avis","Votre avis en","Qu'en pensez-vous","Suite à votre visite","Enquête de satisfaction","Partagez-nous votre expérience","Suite à votre achat","Êtes-vous satisfait","Qu'avez-vous pensé","comment s'est passé","Etes-vous satisfait","Recommanderiez","Recommend","Advice","Leave a review"] 
{
    fileinto "trash";
    expire "day" "1";
	addflag "\\Seen";
	stop;
}
