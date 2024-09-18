require ["include", "environment", "variables", "relational", "comparator-i;ascii-numeric", "spamtest", "imap4flags", "vnd.proton.expire","fileinto"];

# Stores Auto Emails
if address :matches :domain "from" ["gls-france.com", "mondialrelay.fr", "dhl.com", "pickup.fr", "chronopost.fr"]
{
    fileinto "Stores"; 
  	addflag "\\Seen";
    expire "day" "7";
	stop;
}

# Delivery
elsif header :comparator "i;unicode-casemap" :contains "subject" ["Livraison prévue aujourd'hui", "Livraison en cours", "Livraison prévue pour aujourd’hui", "a été expédiée", "Votre commande Amazon.fr de", "Votre facture Apple"] 
{
    fileinto "Stores";
    expire "day" "1";
	addflag "\\Seen";
	stop;
}
