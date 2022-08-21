// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {

  connect() {
    console.log(123)
  }
  api(){
    const tradeInfo = { MerchantID: "TWD987086921", 
                        TimeStamp: Date.now(), 
                        Version: 2.0, 
                        RespondType: 'JSON', 
                        MerchantOrderNo: "test0315001" + Date.now(), 
                        Amt:30, 
                        CREDIT: 1, 
                        NotifyURL: 'https://webhook.site/6a182a2c-371f-4267-a433-727d50522e29', LoginType: 0, 
                        InstFlag: 0, 
                        ItemDesc: 'test' }
    const MerchantOrderNo = 'test0315001' + Date.now()

    Rails.ajax({
      url: '/payment/info',
      type: 'post',
      data: JSON.stringify(tradeInfo),
      success: (response) => {
        console.log(response);
      },
      error: (err) => {
        console.log(err);
      }
    });
  }
}
