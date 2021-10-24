
echo -ne "user@domain.com" | base64
echo -ne "pass" | base64


openssl s_client -connect smtp.office365.com:587 -crlf -starttls smtp

ehlo domain.com

auth login

user_base64

pass_base64

mail from: user@domain.com
rcpt to: rcpt@mail.com

DATA

subject: test

Salam aleykum,
.
