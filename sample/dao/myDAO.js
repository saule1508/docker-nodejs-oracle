var oracledb = require('oracledb');

/*
* using the module revelation pattern
* as described in the very good book 
* ...
*/

MyDAO = (function (){
  "use strict";

  var SQL_JOBS="select owner,job_name,state from dba_scheduler_jobs where owner=:owner";
  var pool ;
  var doSQL = function(SQL,params,callback){
    pool.acquire(function(err,db){
      if (err){
        return callback(err,null);
      }
      db.execute(SQL,params,{outFormat:oracledb.OBJECT},function(err,results){
        pool.release(db);
        if (err) throw err;
        callback(err,results);
      });
    });
  }

  var setPool = function (p){
   pool = p;
  }

  /*
  * params : {'owner' :'...'}
  */
  var getJobs = function(params,callback){
   doSQL(SQL_JOBS,params,callback);
  }

  return {
    setPool : setPool,
    getJobs : getJobs
  }
}());
module.exports.MyDAO = MyDAO;
