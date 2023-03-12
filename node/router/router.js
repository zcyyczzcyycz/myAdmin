const userRouter = require('./users.js')
const testRouter = require('./test.js')
const historyRouter = require('./history.js')


// 向外暴露路由
module.exports = {
    userRouter,
    testRouter,
    historyRouter
}