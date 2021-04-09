
const express = require('express');
const path = require('path');

const logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
const expressJwt = require('express-jwt');
const cors = require('cors')


let index = require('./routes/index');
let order = require('./routes/wx/order');
let user = require('./routes/wx/user');
let address = require('./routes/wx/address');
let goods = require('./routes/wx/goods');
let cart = require('./routes/wx/cart');
// let userUpload = require('./routes/wx/upload');
let PCCT = require('./routes/wx/PCCT');
let collection = require('./routes/wx/collection');
const app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');
app.use(cors())

app.use(logger('dev'));
//使用中间件验证token合法性
app.use(expressJwt({ secret: 'secret' }).unless({
  path: ['/',
    '/goods/index/category',
    '/goods/index/hotGoods',
    '/goods/category/v1',
    '/goods/category/v2',
    '/goods/index/shopList',
    '/goods/list',
    '/goods/detail',
    '/cart/shopList',
    '/cart/list',
    '/cart',
    '/user/token',
    '/admin/register',
    '/admin/login'] //除了这些地址，其他的URL都需要验证
}));
app.use(bodyParser.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', index);

app.use('/address', address);
app.use('/user', user);
app.use('/goods', goods);
app.use('/cart', cart);
app.use('/order', order);
// app.use('/api/upload', userUpload);
app.use('/pcct', PCCT);
app.use('/collection', collection);

// 处理401错误
// app.use((err, req, res, next) =>{
//   if (err.name === 'UnauthorizedError') {
//     res.status(401).json({
//       status: false,
//       ...err,
//     });
//   }
// });
// catch 404 and forward to error handler
// app.use( (req, res, next)=> {
//   var err = new Error('Not Found');
//   err.status = 404;
//   next(err);
// });

// error handler
// app.use((err, req, res, next)=> {
//   // set locals, only providing error in development
//   res.locals.message = err.message;
//   res.locals.error = req.app.get('env') === 'development' ? err : {};
//
//   // render the error page
//   res.status(err.status || 500);
//   res.render('error');
// });

module.exports = app;


