let baseDAO = require('./baseDAO.js')

let SQL_SELECTFROMDUAL = `select to_char(sysdate,'YYYY-MM-DD: hh24:mi:ss') as thedate from dual`;

class myDAO extends baseDAO{

    getFromDual(){
        this.doSQL(SQL_SELECTFROMDUAL,{}, (err,results)=>{
            if (err){
                console.log('there was an error');
                console.log(err);
                return;
            }
            console.log('success');
            console.log(results);
            return;
        });
    }
}

module.exports = myDAO;
