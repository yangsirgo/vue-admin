/**
 *  分页返回的数据映射，请根据你的后台返回的数据格式进行更改！
 *  如我的返回分页data格式为：
 *  {
 *    "code": 10000,
 *    "data": {
 *      content: [ {}, {}, {}, ... ],
 *      totalElements: 317
 *    },
 *    "message": xxx
 *  }
 *  则请求结果将会从：
 *  data['data']['totalElements']中寻找分页总数，
 *  data['data']['content']中寻找当前页内容。
 */

import mockdata from "@/views/message/Mock/mocktable.js";
import $ from "jquery";

var data_ = {
  data: 'data',
  page: { // 分页依赖
    total: 'total', // 返回的数据总量的key
    content: 'content' // 返回的表格数据
  }
}
function ajaxData(){
  $.ajax({
    url: 'http://api.cn',
    dataType: 'json'
  }).done(function(data, status, xhr) {
    //console.log(data); //{"name":"Mark Lee","age":4,"city":"辽阳市"}
    data_ = data;
  });
}
ajaxData();

export default data_;
