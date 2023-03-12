const mysql = require('mysql')

const db = mysql.createPool({
    host: '127.0.0.1',
    user: 'root',
    password: 'qqq123456',
    database: 'test2',
    port: 3300
})

// 测试连接是否成功
db.query('select 1', function(err, result) {
    if (err) {
        console.log('连接失败' + err);
    } else {
        console.log('连接成功' + result);
    }

})

module.exports = db