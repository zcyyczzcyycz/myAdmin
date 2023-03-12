const express = require('express')
const router = express.Router()
const db = require('../mysql/mysql.js')
    // 接收文件
const multiparty = require('multiparty')
const fs = require('fs')
const path = require('path')
    // 读取文件
const xlsx = require('node-xlsx');

// sql语句
let add = "insert into test (name,age,sex,class,phone,job) values (?,?,?,?,?,?)"

let filter = "SELECT * FROM test where id = ? or name = ? or age = ? or sex = ? or phone = ? or job = ? or class = ?"

let update = "update test set name = ?, age = ?,sex = ?, phone = ?, job = ?, class = ? WHERE id = ?"

let del = " delete from test where id = ?"

let register = "update test set username = ?, password = ?, register = '已注册'  WHERE id = ? and name = ?"

let ifRegister = "SELECT * FROM test WHERE username = ?"

let ifRegister2 = "SELECT username FROM test WHERE id = ? and name = ?"

let ifDelete = "SELECT username FROM test WHERE id = ?"
    // 登录验证
let login = "SELECT username,password from test WHERE id = ?"
    // 获取个人信息
let userInfo = "SELECT * FROM test WHERE id = ?"
    // 自定义设置
let set = "update test set src = ?,background = ?,fontfamily = ?,theme = ?,color = ? WHERE id = ?"
    // 存入个人的html分数
let html = "update test set html = ? WHERE id = ?"
    // 存入个人的css分数
let css = "update test set css = ? WHERE id = ?"
    // 存入个人的js分数
let js = "update test set js = ? WHERE id = ?"
    // 重置分数
let resetScore = "update test set html = '未完成',css = '未完成',js = '未完成'"
    // 得到成绩表信息
let Scoretable = "SELECT id,name,html,css,js,job,class from test WHERE class = ? and job = '学生'"





// 获取用户列表
router.get('/getusers', (req, res) => {
    db.query('SELECT * FROM test', function(err, result) {
        if (err) {
            res.send({
                massage: '获取列表失败' + err,
                status: 404,
            })
        } else {
            res.send({
                massage: '获取列表成功',
                status: 200,
                data: result
            })
        }
    })
})

// 添加用户
router.post('/addusers', (req, res) => {
    db.query(add, [req.body.name, req.body.age, req.body.sex, req.body.class, req.body.phone, req.body.job], function(err, result) {
        if (err) {
            res.send({
                massage: '添加用户失败，参数不合法' + err,
                status: 400,
            })
        } else {
            res.send({
                massage: '添加数据成功',
                status: 201
            })
        }
    })
})


// 筛选用户
router.get('/filterusers', (req, res) => {
    if (req.query.model === 'vague') {
        // 模糊查询
        db.query(`SELECT * FROM test where id like '%${req.query.info}%'
        or name like '%${req.query.info}%'
        or age like '%${req.query.info}%'
        or sex like '%${req.query.info}%'
        or job like '%${req.query.info}%'
        or phone like '%${req.query.info}%'
        or class like '%${req.query.info}%'
       `, function(err, result) {
            if (err) {
                res.send({
                    massage: '查询失败' + err,
                    status: 400,
                })
            } else {
                res.send({
                    massage: '查询成功',
                    status: 200,
                    data: result
                })
            }
        })
    } else {
        // 精准查询
        db.query(filter, [req.query.info, req.query.info, req.query.info, req.query.info, req.query.info, req.query.info, req.query.info, ], function(err, result) {
            if (err) {
                res.send({
                    massage: '查询失败' + err,
                    status: 400,
                })
            } else {
                res.send({
                    massage: '查询成功',
                    status: 200,
                    data: result
                })
            }
        })
    }

})

// 修改
router.put('/updateusers', (req, res) => {
    db.query(update, [req.body.name, req.body.age, req.body.sex, req.body.phone, req.body.job, req.body.class, req.body.id], function(err, result) {
        if (err) {
            res.send({
                massage: '更新列表失败' + err,
                status: 400,
            })
        } else {
            res.send({
                massage: '更新列表成功',
                status: 201,
                data: result
            })
        }
    })
})

// 删除
router.delete('/deleteusers', (req, res) => {
    // 单体删除
    if (typeof req.body.id == 'number') {
        // 判断是否注册
        db.query(ifDelete, [req.body.id], function(err, result) {
            let dataString = JSON.stringify(result);
            let data = JSON.parse(dataString);
            if (data.length > 0 && data[0].username) {
                //  不允许删除
                res.send({
                    massage: '用户已注册',
                    status: 202
                })
            } else {
                db.query(del, [req.body.id], function(err, result) {
                    res.send({
                        massage: '用户删除成功',
                        status: 201
                    })
                })
            }

        })
    }
    // 批量删除
    else {
        new Promise((a, b) => {
            let myStatus = 201
            req.body.id.forEach((item) => {
                db.query(ifDelete, [item], function(err, result) {
                    let dataString = JSON.stringify(result);
                    let data = JSON.parse(dataString);
                    if (data.length > 0 && data[0].username) {
                        myStatus = 202
                        return
                    } else {
                        db.query(del, [item])
                    }
                })
            })
            setTimeout((params) => {
                a(myStatus)
            }, 500)

        }).then((val) => {
            res.send({
                massage: '用户删除成功',
                status: val
            })
        })
    }
})


// 导入
router.post('/import', (req, res) => {
    let form = new multiparty.Form();
    form.parse(req, function(err, fields, files) {
        // 获取到文件路径
        let filePath = files.file[0].path
            // 读取文件
        let tableData = xlsx.parse(filePath);
        let fileconTent = tableData[0].data
            // 添加
        if (fileconTent[0].length === 6) {
            fileconTent.forEach((item, index) => {
                if (index !== 0) {
                    let [myname, myage, mysex, myclass, myphone, myjob] = item
                    myphone = myphone + ''
                    db.query(add, [myname, myage, mysex, myclass, myphone, myjob], (err, result) => {
                        if (err) {
                            res.send({
                                massage: '文件上传失败',
                                status: 400,
                            })
                        }
                    })
                }
            })
        } else {
            // 修改
            fileconTent.forEach((item, index) => {
                if (index !== 0) {
                    let [myid, myname, myage, mysex, myclass, myphone, myjob] = item
                    db.query(update, [myname, myage, mysex, myphone, myjob, myclass, myid], (err, result) => {
                        if (err) {
                            res.send({
                                massage: '导入文件失败',
                                status: 400,
                            })
                        }
                    })
                }
            })
        }
    });
    res.send({
        massage: '导入文件成功',
        status: 200,
    })
})


// 注册
router.put('/registerusers', (req, res) => {
    //    验证用户名存不存在
    db.query(ifRegister, [req.body.userName], function(err, result) {
        if (result.length) {
            res.send({
                massage: '用户名已被占用',
                status: 202
            })
        } else {
            //    检查名单存不存在该用户
            db.query(ifRegister2, [req.body.id, req.body.name], function(err, result) {
                var dataString = JSON.stringify(result);
                var data = JSON.parse(dataString);
                if (data[0]) {
                    //   如果存在
                    // 验证名单中该人员有没有注册过
                    if (data[0].username) {
                        res.send({
                            massage: '该用户已注册过',
                            status: 204
                        })
                    } else {
                        // 如果存在且没注册过
                        //  注册
                        db.query(register, [req.body.userName, req.body.password, req.body.id, req.body.name], function(err, result) {
                            if (result.affectedRows) {
                                // 返回注册信息
                                db.query('SELECT username,password FROM test where id = ?', [req.body.id], function(err, result) {
                                    let dataString2 = JSON.stringify(result);
                                    let data2 = JSON.parse(dataString2);
                                    res.send({
                                        massage: '注册成功',
                                        status: 201,
                                        data: data2
                                    })
                                })

                            }
                        })
                    }
                } else {
                    // 如果不存在该用户
                    res.send({
                        massage: '名单不存在该用户',
                        status: 304
                    })
                }
            })
        }

    })
})


// 登录
router.get('/login', (req, res) => {
    try {
        db.query(login, [req.query.id], function(err, result) {
            res.send({
                massage: '请求成功',
                status: 200,
                data: result
            })
        })
    } catch (error) {
        res.send({
            massage: '请求失败' + error,
            status: 404,
        })
    }
})


// 读取x轴坐标
router.get('/readXaxis', (req, res) => {
    let date = new Date()
    date = date.toLocaleDateString()
    fs.readFile(path.join(__dirname, '../xAxis.txt'), 'utf-8', (err, result) => {
        let arr = result.split(',')
        if (arr[arr.length - 1] == date) {
            // 还在同一天
        } else {
            // 不在同一天
            arr.shift()
            arr.push(date)
        }
        let str = arr.join(',')
        fs.writeFile(path.join(__dirname, '../xAxis.txt'), str, () => {})
        res.send({
            status: 200,
            data: arr
        })
    })

})

// 读取x轴坐标系的值
router.get('/readXdata', (req, res) => {
    let date = new Date()
    date = date.toLocaleDateString()
    fs.readFile(path.join(__dirname, '../xAxis.txt'), 'utf-8', (err, result) => {
        fs.readFile(path.join(__dirname, '../xData.txt'), 'utf-8', (err, result2) => {
            let arrDate = result.split(',')
            let arrData = result2.split(',')
            if (arrDate[arrDate.length - 1] == date) {
                // 还在同一天
                let num = (+arrData[arrData.length - 1])
                num += 1
                arrData[arrData.length - 1] = num + ''
            } else {
                // 不在同一天
                arrData.shift()
                arrData.push('0')
            }
            let str = arrData.join(',')
            fs.writeFile(path.join(__dirname, '../xData.txt'), str, () => {})
            res.send({
                status: 200,
                data: arrData
            })
        })
    })
})

// 获取个人信息
router.get('/getuserInfo', (req, res) => {
    db.query(userInfo, [req.query.id], function(err, result) {
        res.send({
            massage: '获取用户信息成功',
            status: 200,
            data: result
        })
    })
})


// 保存用户头像
router.put('/setting', (req, res) => {
    db.query(set, [req.body.avatar, req.body.loginBg, req.body.fontFamily, req.body.themeColor, req.body.fontColor, req.body.id], function(err, result) {
        if (err) {
            res.send({
                massage: '操作失败',
                status: 400
            })
        } else {
            res.send({
                massage: '获取用户信息成功',
                status: 200
            })
        }
    })
})


// 保存保存用户得分
router.put('/score', (req, res) => {
    switch (req.body.type) {
        case 'html':
            db.query(html, [req.body.score, req.body.id], function(err, result) {
                res.send({
                    massage: '添加分数成功',
                    status: 201
                })
            })
            break;
        case 'css':
            db.query(css, [req.body.score, req.body.id], function(err, result) {
                res.send({
                    massage: '添加分数成功',
                    status: 201
                })
            })
            break;
        case 'js':
            db.query(js, [req.body.score, req.body.id], function(err, result) {
                res.send({
                    massage: '添加分数成功',
                    status: 201
                })
            })
            break;
        default:
            break;
    }
})


// 新的一天 重置所有分数
router.get('/resetScore', (req, res) => {
    db.query(resetScore, function(err, result) {
        res.send({
            massage: '分数初始化成功',
            status: 200,
        })
    })
})

// 得到具体班级所有学生的成绩信息
router.get('/getScore', (req, res) => {
    db.query(Scoretable, [req.query.class], function(err, result) {
        res.send({
            massage: '获取列表成功',
            status: 200,
            data: result
        })
    })
})

// 获取访问量
router.get('/getVisited', (req, res) => {
    fs.readFile(path.join(__dirname, '../visited.txt'), 'utf-8', (a, b) => {
        res.send({
            massage: '获取访问量成功',
            status: 200,
            data: b
        })
    })
})

// 修改访问量
router.put('/setVisited', (req, res) => {
    fs.readFile(path.join(__dirname, '../visited.txt'), 'utf-8', (a, b) => {
        let num = +b + 1
        fs.writeFile(path.join(__dirname, '../visited.txt'), String(num), () => {
            res.send({
                massage: '修改访问量成功',
                status: 201,
            })
        })
    })
})




// 向外暴露路由
module.exports = router