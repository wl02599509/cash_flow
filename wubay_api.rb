require 'uri'
require 'openssl'
require 'CGI'

params = {
  "TradeDesc": "促銷方案", 
  "PaymentType": "aio", 
  "MerchantTradeDate": "2013/03/12 15:30:23", 
  "MerchantTradeNo": "ecpay20220828020", 
  "MerchantID": 3002607, 
  "ReturnURL": "https://f25a-103-3-192-33.jp.ngrok.io/payment/returnpage",
  "ItemName": "Apple iphone 7 手機殼", 
  "TotalAmount": 1000, 
  "ChoosePayment": "ALL", 
  "IgnorePayment": "WebATM#ATM#CVS#BARCODE",
  "EncryptType": 1
}

# 1.由A到Z的順序並轉換為 qurey string
b = URI.encode_www_form(params.to_a.sort!)
#本機 ChoosePayment=ALL&EncryptType=1&ItemName=Apple+iphone+7+%E6%89%8B%E6%A9%9F%E6%AE%BC&MerchantID=2000132&MerchantTradeDate=2013%2F03%2F12+15%3A30%3A23&MerchantTradeNo=ecpay20130312153023&PaymentType=aio&ReturnURL=https%3A%2F%2Fwww.ecpay.com.tw%2Freceive.php&TotalAmount=1000&TradeDesc=%E4%BF%83%E9%8A%B7%E6%96%B9%E6%A1%88

# 2.前後加 Key 跟 IV
c = "HashKey=pwFHCqoQZGmho4w6&" + b + "&HashIV=EkRm7iFT261dpevs"
#本機 HashKey=5294y06JbISpM5x9&ChoosePayment=ALL&EncryptType=1&ItemName=Apple+iphone+7+%E6%89%8B%E6%A9%9F%E6%AE%BC&MerchantID=2000132&MerchantTradeDate=2013%2F03%2F12+15%3A30%3A23&MerchantTradeNo=ecpay20130312153023&PaymentType=aio&ReturnURL=https%3A%2F%2Fwww.ecpay.com.tw%2Freceive.php&TotalAmount=1000&TradeDesc=%E4%BF%83%E9%8A%B7%E6%96%B9%E6%A1%88&HashIV=v77hoKGq4kWxNNIS

# 找到問題： Apple iphone 7 的 + 在官網流程裡一直都是 + 沒有被換掉

# 進行 URL encode 並轉小寫
d = (CGI.escape c).downcase
d.gsub!(/%25/, '%').gsub!(/%2b/, '+')

#本機hashkey%3d5294y06jbispm5x9%26choosepayment%3dall%26encrypttype%3d1%26itemname%3dapple+iphone+7+%e6%89%8b%e6%a9%9f%e6%ae%bc%26merchantid%3d2000132%26merchanttradedate%3d2013%2f03%2f12+15%3a30%3a23%26merchanttradeno%3decpay20130312153023%26paymenttype%3daio%26returnurl%3dhttps%3a%2f%2fwww.ecpay.com.tw%2freceive.php%26totalamount%3d1000%26tradedesc%3d%e4%bf%83%e9%8a%b7%e6%96%b9%e6%a1%88%26hashiv%3dv77hokgq4kwxnnis


def sha256_encode(trade_info)
  encode_string = trade_info
  Digest::SHA256.hexdigest(encode_string).upcase
end

p sha256_encode(d)


# api_params = {
#   "MerchantID": 3002607,
#   "MerchantTradeNo": "50Wubay",
#   "MerchantTradeDate": "2013/03/12 15:30:23",
#   "PaymentType": "aio",
#   "TotalAmount": 100,
#   "TradeDesc": "test",
#   "ItemName": "wubay",
#   "RuturnURL": "https://f62a-61-220-182-115.jp.ngrok.io/payment/returnpage",
#   "ChoosePayment": "Credit",
#   "CheckMacValue": "E2B22F3564FF1C46F357F5FC87CA84A38340D042B690FA35F264ABDC000E145C", 
#   "EncryptType": 1,
# }






