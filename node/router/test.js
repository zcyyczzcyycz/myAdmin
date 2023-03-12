const express = require('express')
const router = express.Router()
const db = require('../mysql/mysql.js')

// 获取试卷信息
let getTest = "SELECT * FROM title WHERE type = ? and number = ?"


router.get('/getTest', (req, res) => {
    db.query(getTest, [req.query.type, req.query.number], (error, result) => {
        res.send({
            status: 200,
            data: result
        })
    })
})


module.exports = router