const express = require('express')
const { userRouter, testRouter, historyRouter } = require('./router/router.js')
const mysql = require('./mysql/mysql.js')
const cors = require('cors')

const app = express()

// 解析请求体内容
app.use(express.urlencoded({ extended: false }))
    // 解析json
app.use(express.json())

app.use(cors())



// 挂载user路由
app.use('/users', userRouter)

// 挂载test路由
app.use('/test', testRouter)

// 挂载history路由
app.use('/history', historyRouter)

// 开启服务器，端口号为8081
app.listen(9999, () => {
    console.log('服务器启动成功---http://192.168.43.121:9999');
})