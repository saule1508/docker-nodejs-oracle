let oracledb = require('oracledb'),
    myDAO=require('./dao/myDAO'),
    dbconfig=require('./config/dbconfig.js');

oracledb.poolMax = 2;
oracledb.poolMin = 1;
oracledb.autoCommit = true;
oracledb.queueRequests = false;
oracledb.maxRows = 3600;

console.log('connecting to ' +dbconfig.connectString);
let getPool = (config)=>{
 return new Promise((resolve,reject)=>{
   oracledb.createPool(config, (err,Pool)=>{
     if (err){
       console.log(err);
       reject(err);
     } else {
       resolve(Pool);
     }
  })
 })
};

let myPool = getPool(dbconfig);

myPool.then((p)=>{
  let my = new myDAO(p);
  my.getFromDual();
})
.catch((error)=>{
  console.log('cannot get connection');
  console.log(error);
})

