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
  
    // key = "l2Nvw3YlqoEk6G4HqRKDAYpHKZWxN4LM"
    // iv = "gXYC1Fpliev4dtLw"
    // mid = "MS33690061"
    

  }

  API(){

    // const tradeInfo = { MerchantID: "mid", TimeStamp: Date.now(), Version: 2.0, RespondType: 'JSON', MerchantOrderNo: "test0315001" + Date.now(), Amt:30, CREDIT: 1, NotifyURL: 'https://webhook.site/6a182a2c-371f-4267-a433-727d50522e29', LoginType: 0, InstFlag: 0, ItemDesc: 'test' }
      
    Rails.ajax({
      url: '/payment/ttt',
      type: 'post',
      data: data,
      success: (response) => {
          console.log(response);
      },
      error: () => {
          console("error");
      }
    }); 


    // 下面不用管

    // const tradeInfo = {
    //   MerchantID: "mid",
    //   TimeStamp: Date.now(),
    //   Version: 2.0,
    //   RespondType: 'JSON',
    //   MerchantOrderNo: "test0315001" + Date.now(),
    //   Amt:30,
    //   CREDIT: 1,
    //   NotifyURL: 'https://webhook.site/6a182a2c-371f-4267-a433-727d50522e29',
    //   LoginType: 0,
    //   InstFlag: 0,
    //   ItemDesc: 'test',
    //   }

    // Rails.ajax({
    //   url: '/payment/ttt',
    //   type: 'POST',
    //   data: {
    //     MerchantID: "mid",
    //     TimeStamp: Date.now(),
    //     Version: 2.0,
    //     RespondType: 'JSON',
    //     MerchantOrderNo: "test0315001" + Date.now(),
    //     Amt:30,
    //     CREDIT: 1,
    //     NotifyURL: 'https://webhook.site/6a182a2c-371f-4267-a433-727d50522e29',
    //     LoginType: 0,
    //     InstFlag: 0,
    //     ItemDesc: 'test',
    //     },
    //   success: (resp) => {
    //     console.log(resp)
    //   },
    //   error: (err) => {
    //     console.log(err)
    //   }
    // })

  }
}
