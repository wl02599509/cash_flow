require 'uri'
require 'openssl'

a = "hashkey%3d5294y06jbispm5x9%26choosepayment%3dall%26encrypttype%3d1%26itemname%3dapple+iphone+7+%e6%89%8b%e6%a9%9f%e6%ae%bc%26merchantid%3d2000132%26merchanttradedate%3d2013%2f03%2f12+15%3a30%3a23%26merchanttradeno%3decpay20130312153023%26paymenttype%3daio%26returnurl%3dhttps%3a%2f%2fwww.ecpay.com.tw%2freceive.php%26totalamount%3d1000%26tradedesc%3d%e4%bf%83%e9%8a%b7%e6%96%b9%e6%a1%88%26hashiv%3dv77hokgq4kwxnnis"

def sha256_encode(trade_info)
  Digest::SHA256.hexdigest(trade_info).upcase
end

p sha256_encode(a)
