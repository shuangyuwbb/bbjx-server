/**
 @author: wbb
 @date: 2021/3/12
 @Version: 1.0
 */
const mysql = require('mysql')
const pool = mysql.createPool({
    connectionLimit: 10,
    host: 'localhost',
    user: 'root',
    password: '123456',
    database: 'bbjx',
    multipleStatements: true,
    debug: true
})

let query = function (sql, arr=[], callback){
    pool.getConnection(function (err, connection){
        if (err) throw err
        connection.query(sql, arr, function (error, results, fileds){
            connection.release()
            if (error) throw err
            callback && callback(results)
        })
    })
}

module.exports = {
    query,
    pool
}
