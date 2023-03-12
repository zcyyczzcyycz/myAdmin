const express = require('express')
const router = express.Router()
const db = require('../mysql/mysql.js')

// 获取试卷信息
let getHistory = "SELECT * FROM history WHERE class = ? ORDER BY id DESC LIMIT 0,10"

// 获取日期
let getDate = "SELECT * FROM history WHERE class = ? ORDER BY id DESC LIMIT 0,1"

// 添加历史记录
let addHistory = "insert into history (date,name,html,css,js,class) values (?,?,?,?,?,?)"

// 获取历史记录
router.get('/getHistory', (req, res) => {
    db.query(getHistory, [req.query.class], (error, result) => {
        res.send({
            status: 200,
            data: result
        })
    })
})


// 获取当前班级最近的任务日期
router.get('/getDate', (req, res) => {
    db.query(getDate, [req.query.class], (error, result) => {
        res.send({
            status: 200,
            data: result
        })
    })
})


// 追加历史记录
router.post('/addHistory', (req, res) => {
    db.query(addHistory, [req.body.date, req.body.name, req.body.html, req.body.css, req.body.js, req.body.class], (error, result) => {
        if (error) {
            res.send({
                status: 400
            })
        } else {
            res.send({
                status: 200
            })
        }
    })
})


module.exports = router