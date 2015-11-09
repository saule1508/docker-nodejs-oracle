var oracledb = require('oracledb'),
    myDAO=require('./dao/myDAO'),
    dbconfig=require('./config/dbconfig.js');


oracledb.createPool(
 dbconfig,
 function(err, Pool){
   if (err){
     console.log(err);
     exit;
   }


  // inject the pool in the service 
  // would be better to give it as a parameter to the constructor
  // I still have to find how with the module reveal pattern
  myDAO.setPool(Pool);

  MyDAO.getJobs({'owner':'SCOTT'},function(err,result){
   if (err){
    console.log(err);
   } else {
    console.log(result);
   }
   Pool.terminate(function(err){
     process.exit();
   });
  });
 }
);
