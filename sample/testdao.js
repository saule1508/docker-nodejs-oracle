var oracledb = require('oracledb');
var generic_pool=require('generic-pool'),
 myDAO=require('./dao/myDAO')

var dbconfig = {
 'username' : 'scott',
 'password' : 'tiger',
 'url' : 'dockerhost:1521/orcl'
};

var pool = generic_pool.Pool({
 name: 'oracledb',
 max: 20,
 create: function(callback){
   oracledb.getConnection(dbconfig, function(err,connection){
    if ( err){
      console.log('did not get connection');
    }
    callback(err,connection);
   });
 },
 destroy: function(db){
  db.release(function(err){
    if (err){
        console.log(err);
    }
  });
 }
});

var myDAO = myDAO.MyDAO;

// inject the pool in the service 
// would be better to give it as a parameter to the constructor
// I still have to find how with the module reveal pattern
myDAO.setPool(pool);

MyDAO.getJobs({'owner':'SCOTT'},function(err,result){
 if (err){
  console.log('there was an error');
 } else {
  console.log(result);
 }
 process.exit();
});
