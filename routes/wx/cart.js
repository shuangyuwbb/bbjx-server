/**
 @author: wbb
 @date: 2021/3/13
 @Version: 1.0
 */
const express = require('express');
const router = express.Router();
// 数据库
let db = require('../../config/mysql');

/**
 * @api {post} /api/cart 添加商品至购物车
 * @apiName AddCart
 * @apiGroup Cart
 * @apiPermission user
 *
 * @apiParam {Number} id 商品id;
 * @apiParam {Number} num 商品数量,不能超过库存;
 *
 * @apiSampleRequest /api/cart
 */
router.post('/', (req, res)=> {
    let { id, num, openid } = req.body;
    // 检查购物车是否已经有此商品
    let sql = `SELECT * FROM bbjx_cart WHERE product_id = ?`;
    db.query(sql, [id], results => {
        // 没有此商品,插入新纪录
        sql =
            `INSERT INTO bbjx_cart ( openid , product_id , count , create_time )
			VALUES ( '${openid}' , ${id} , ${num} ,CURRENT_TIMESTAMP())`;
        // 已有此商品，增加数量
        if (results.length > 0) {
            sql =
                `UPDATE bbjx_cart SET count = count + ${num} WHERE product_id = ${id} AND openid = '${openid}'`;
        }
        db.query(sql, function (results) {
            //成功
            res.json({
                status: 0,
                msg: "success!"
            });
        });
    });
});

/**
 * @api {get} /api/cart/list 获取购物车列表
 * @apiName CartList
 * @apiGroup Cart
 * @apiPermission user
 *
 * @apiSampleRequest /api/cart/list
 */
router.get('/list', (req, res)=> {
    let { openid } = req.query;
    let sql =
        `SELECT bbjx_cart.id, bbjx_cart.product_id, bbjx_product.main_image AS img, bbjx_product.name, bbjx_product.price, bbjx_product.title, bbjx_product.stock, bbjx_cart.count
		FROM bbjx_cart JOIN bbjx_product 
		WHERE bbjx_cart.openid = ? AND bbjx_cart.product_id = bbjx_product.id`;
    db.query(sql, [openid], results => {
        //成功
        res.json({
            status: 0,
            msg: "success!",
            data: results
        });
    });
});

/**
 * @api {delete} /api/cart/:id 购物车删除商品
 * @apiName DeleteCart
 * @apiGroup Cart
 * @apiPermission user
 *
 * @apiParam {Number} id 购物车条目id;
 *
 * @apiSampleRequest /api/cart
 */
router.delete('/:id', (req, res)=> {
    let { id } = req.params;
    let sql = `DELETE FROM cart WHERE id = ?`;
    db.query(sql, [id], () => {
        //成功
        res.json({
            status: 0,
            msg: "success!",
        });
    });
});

/**
 * @api {put} /api/cart/increase 购物车增加商品数量
 * @apiDescription 增加商品数量，后台查询库存，注意提示库存不足
 * @apiName IncreaseCart
 * @apiGroup Cart
 * @apiPermission user
 *
 * @apiParam {Number} id 购物车条目id;
 * @apiParam {Number} gid 商品id;
 * @apiParam {Number{1-库存MAX}} num 商品数量;
 *
 * @apiSampleRequest /api/cart/increase
 */
router.put('/increase', (req, res)=> {
    let { id, gid, num } = req.body;
    // 检查库存
    let sql = `SELECT count FROM bbjx_cart WHERE id = ?;
	SELECT stock FROM bbjx_product WHERE id = ?`;
    db.query(sql, [id, gid], results =>{
        let isEmpty = results[1][0].stock - results[0][0].count - num >= 0 ? false : true;
        if (isEmpty) {
            res.json({
                status: 1,
                msg: "库存不足!"
            });
            return;
        }
        let sql = `UPDATE cart SET count = count + ? WHERE id = ?`;
        db.query(sql, [num, id], function (results) {
            //成功
            res.json({
                status: 0,
                msg: "success!",
            });
        });
    });

});

/**
 * @api {put} /api/cart/decrease 购物车减少商品数量
 * @apiDescription 减少商品数量，前台注意约束num，商品数量>=1
 * @apiName DecreaseCart
 * @apiGroup Cart
 * @apiPermission user
 *
 * @apiParam {Number} id 购物车条目id;
 * @apiParam {Number{1-库存MAX}} num 商品数量;
 *
 * @apiSampleRequest /api/cart/decrease
 */
router.put('/decrease', (req, res)=> {
    let { id, num } = req.body;
    let sql = `UPDATE cart SET goods_num = goods_num - ? WHERE id = ?`;
    db.query(sql, [num, id], function (results) {
        //成功
        res.json({
            status: 0,
            msg: "success!",
        });
    });
});

/**
 * 如果用户未登录获取购物车页面商品
 */
router.get("/shopList", (req, res) =>{
    let sql = `SELECT id, subtitle, subsidize, price, discount_price, main_image FROM bbjx_product WHERE hot > 1 ORDER BY hot DESC `
    db.query(sql, [],  (results)=> {
        res.json({
            status: 0,
            msg: "success!",
            data: results
        });
    });
});


module.exports = router;