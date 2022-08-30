require 'uri'
require 'openssl'
require 'CGI'

a = {
  "MerchantID": 3002607, 
  "TradeDesc": "專案贊助交易", 
  "PaymentType": "aio", 
  "MerchantTradeDate": "2022/08/30 11:29:16", 
  "MerchantTradeNo": "310nhi", 
  "ReturnURL": "https://29e3-103-3-192-33.jp.ngrok.io/transactions/return_url",
  "ItemName": "test",
  "TotalAmount": 1000, 
  "ChoosePayment": "ALL", 
  "IgnorePayment": "WebATM#ATM#CVS#BARCODE",
  "EncryptType": 1
}

b = URI.encode_www_form(a.to_a.sort!)
c = "HashKey=pwFHCqoQZGmho4w6&" + b + "&HashIV=EkRm7iFT261dpevs"
d = (CGI.escape c).downcase.gsub!(/%25/, '%').gsub!(/%2b/, '+')
e =  Digest::SHA256.hexdigest(d).upcase

p c
ClientBackURL=https%3A%2F%2F29e3-103-3-192-33.jp.ngrok.io&
ReturnURL=https%3A%2F%2F29e3-103-3-192-33.jp.ngrok.io%2Ftransactions%2Freturn_url


ReturnURL=https%3A%2F%2F29e3-103-3-192-33.jp.ngrok.io%2Ftransactions%2Freturn_url

p d
clientbackurl%3dhttps%3a%2f%2f29e3-103-3-192-33.jp.ngrok.io
%26
returnurl%3dhttps%3a%2f%2f29e3-103-3-192-33.jp.ngrok.io%2ftransactions%2freturn_url


returnurl%3dhttps%3a%2f%2f29e3-103-3-192-33.jp.ngrok.io%2ftransactions%2freturn_url