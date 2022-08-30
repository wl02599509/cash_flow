require 'uri'
require 'openssl'
require 'CGI'

params = {
  "TradeDesc": "專案贊助交易", 
  "PaymentType": "aio", 
  "MerchantTradeDate": "2022/08/30 11:29:16", 
  "MerchantTradeNo": "310nhi", 
  "MerchantID": 3002607, 
  "ReturnURL": "https://f25a-103-3-192-33.jp.ngrok.io/payment/returnpage", 
  "ItemName": "test", 
  "TotalAmount": 33666, 
  "ChoosePayment": "ALL", 
  "IgnorePayment": "WebATM#ATM#CVS#BARCODE", 
  "EncryptType": 1, 
}


# "CheckMacValue": "65F9B9A19331C4A1BF84B5648B7C52B8D36909476567C02959493FE449A06EE0"


# 1.由A到Z的順序並轉換為 qurey string
b = URI.encode_www_form(params.to_a.sort!)
#本機 ChoosePayment=ALL&EncryptType=1&ItemName=Apple+iphone+7+%E6%89%8B%E6%A9%9F%E6%AE%BC&MerchantID=2000132&MerchantTradeDate=2013%2F03%2F12+15%3A30%3A23&MerchantTradeNo=ecpay20130312153023&PaymentType=aio&ReturnURL=https%3A%2F%2Fwww.ecpay.com.tw%2Freceive.php&TotalAmount=1000&TradeDesc=%E4%BF%83%E9%8A%B7%E6%96%B9%E6%A1%88


# 2.前後加 Key 跟 IV
c = "HashKey=pwFHCqoQZGmho4w6&" + b + "&HashIV=EkRm7iFT261dpevs"
#本機 HashKey=5294y06JbISpM5x9&ChoosePayment=ALL&EncryptType=1&ItemName=Apple+iphone+7+%E6%89%8B%E6%A9%9F%E6%AE%BC&MerchantID=2000132&MerchantTradeDate=2013%2F03%2F12+15%3A30%3A23&MerchantTradeNo=ecpay20130312153023&PaymentType=aio&ReturnURL=https%3A%2F%2Fwww.ecpay.com.tw%2Freceive.php&TotalAmount=1000&TradeDesc=%E4%BF%83%E9%8A%B7%E6%96%B9%E6%A1%88&HashIV=v77hoKGq4kWxNNIS

# 找到問題： Apple iphone 7 的 + 在官網流程裡一直都是 + 沒有被換掉

# 3.進行 URL encode 並轉小寫
d = (CGI.escape c).downcase.gsub!(/%25/, '%').gsub!(/%2b/, '+')

#本機hashkey%3d5294y06jbispm5x9%26choosepayment%3dall%26encrypttype%3d1%26itemname%3dapple+iphone+7+%e6%89%8b%e6%a9%9f%e6%ae%bc%26merchantid%3d2000132%26merchanttradedate%3d2013%2f03%2f12+15%3a30%3a23%26merchanttradeno%3decpay20130312153023%26paymenttype%3daio%26returnurl%3dhttps%3a%2f%2fwww.ecpay.com.tw%2freceive.php%26totalamount%3d1000%26tradedesc%3d%e4%bf%83%e9%8a%b7%e6%96%b9%e6%a1%88%26hashiv%3dv77hokgq4kwxnnis

e =  Digest::SHA256.hexdigest(d).upcase

# {
#   "TradeDesc": "促銷方案", 
#   "PaymentType": "aio", 
#   "MerchantTradeDate": "2013/03/12 15:30:23", 
#   "MerchantTradeNo": "ecpay202253458020", 
#   "MerchantID": 3002607, 
#   "ReturnURL": "https://f25a-103-3-192-33.jp.ngrok.io/payment/returnpage",
#   "ItemName": "Apple iphone 7 手機殼", 
#   "TotalAmount": 1000, 
#   "ChoosePayment": "ALL", 
#   "IgnorePayment": "WebATM#ATM#CVS#BARCODE",
#   "CheckMacValue": "BA561843DF0D5DD84E4A196B2F7C8D3645027EABB06D22366CF2DA4034D0244C",
#   "EncryptType": 1
# }








# b
# ChoosePayment=ALL&ClientBackURL=https%3A%2F%2F5133-103-3-192-33.jp.ngrok.io%2Ftransactions%2Freturn_url&EncryptType=1&IgnorePayment=WebATM%23ATM%23CVS%23BARCODE&ItemName=test&MerchantID=3002607&MerchantTradeDate=2022%2F08%2F30+11%3A29%3A16&MerchantTradeNo=310nhi&PaymentType=aio&ReturnURL=https%3A%2F%2Ff25a-103-3-192-33.jp.ngrok.io%2Fpayment%2Freturnpage&TotalAmount=33666&TradeDesc=%E5%B0%88%E6%A1%88%E8%B4%8A%E5%8A%A9%E4%BA%A4%E6%98%93
p c
# c
# ClientBackURL=https%3A%2F%2F5133-103-3-192-33.jp.ngrok.io%2Ftransactions%2Freturn_url&ReturnURL=https%3A%2F%2Ff25a-103-3-192-33.jp.ngrok.io%2Fpayment%2Freturnpage&TotalAmount=33666

"ReturnURL=https%3A%2F%2Ff25a-103-3-192-33.jp.ngrok.io%2Fpayment%2Freturnpage&TotalAmount=33666"


# d
# hashkey%3dpwfhcqoqzgmho4w6%26choosepayment%3dall%26clientbackurl%3dhttps%3a%2f%2f5133-103-3-192-33.jp.ngrok.io%2ftransactions%2freturn_url%26encrypttype%3d1%26ignorepayment%3dwebatm%23atm%23cvs%23barcode%26itemname%3dtest%26merchantid%3d3002607%26merchanttradedate%3d2022%2f08%2f30+11%3a29%3a16%26merchanttradeno%3d310nhi%26paymenttype%3daio%26returnurl%3dhttps%3a%2f%2ff25a-103-3-192-33.jp.ngrok.io%2fpayment%2freturnpage%26totalamount%3d33666%26tradedesc%3d%e5%b0%88%e6%a1%88%e8%b4%8a%e5%8a%a9%e4%ba%a4%e6%98%93%26hashiv%3dekrm7ift261dpevs