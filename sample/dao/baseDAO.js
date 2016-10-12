let  oracledb = require('oracledb');

class baseDAO  {
 
  constructor(pool){
      if (pool){
          this.pool = pool;
      }
  }

  setPool(pool){
    this.pool = pool;
  }

  doSQL(SQL,params,callback){
    this.pool.getConnection((err,db)=>{
      if (err){
        return callback(err,null);
      }
      db.execute(SQL,params,{outFormat:oracledb.OBJECT},(err,results)=>{
        db.release((err)=>{
         if (err) console.log(err);
        });
        if (err) console.log(err);
        callback(err,results);
      });
    });
  }

}

module.exports=baseDAO;
