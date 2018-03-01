/**
 * Created by Goldencis on 2018/2/27.
 */

import Mock from 'mockjs';
var Random = Mock.Random;
const data = Mock.mock({
    "code": 10000,
    "data": {
        'content|10': [{
            account:()=>Random.ip(),
            name: ()=>Random.cname(),
            id: ()=>Random.cname(),
            mobile:Random.tld(),
            auditStatus:()=>Random.date(),
            text:Random.csentence(),
            isActive:"@boolean",
            address: ()=>Random.county(true)
        }],
        totalElements: 317
      },
    "message": "success"
 });



export default {
    data
}
