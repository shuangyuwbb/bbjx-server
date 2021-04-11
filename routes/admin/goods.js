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
 * @api {get} /api/goods/detail 获取商品详情
 * @apiName GoodsDetail
 * @apiGroup Goods
 * @apiPermission user
 *
 * @apiParam {Number} id 商品id;
 *
 * @apiSampleRequest /api/goods/detail
 */
router.get("/detail", (req, res) =>{
    let { id } = req.query;
    // let { openid } = req.user;
    let sql = `SELECT id, name, title,  price, main_image, discount_price, comment FROM bbjx_product WHERE id = ?`
    db.query(sql, [id], (results)=> {
        res.json({
            status: 0,
            msg: "success!",
            data: results[0]
        });
    });
});

/**
 * 获取首页顶部t分类
 */
router.get("/index/category", (req, res) =>{
    let sql = `SELECT id, name, img FROM bbjx_category WHERE parent_id != 0 LIMIT 4`
    db.query(sql, [],  (results)=> {
        res.json({
            status: 0,
            msg: "success!",
            data: results
        });
    });
});

/**
 * 获取分类页面一级父类
 */
router.get("/category/v1", (req, res) =>{
    let sql = `SELECT id, name FROM bbjx_category WHERE parent_id = 0`
    db.query(sql, [],  data=> {
        //成功
        res.json({
            status: 0,
            msg: "success!",
            data
        });
    });
});

/**
 * 获取一级分类id查询二级分类
 */
router.get("/category/v2", (req, res) =>{
    let { id } = req.query
    let sql = `SELECT id, name FROM bbjx_category WHERE parent_id = ?`
    db.query(sql, [id],  data=>{
        res.json({
            status: 0,
            msg: "success!",
            data
        });
    });
});

/**
 * 根据二级分类查找商品
 */
router.get("/lists", (req, res) =>{
    let { id } = req.query
    let sql = `SELECT id, subtitle, category_id, price, discount_price, title, main_image FROM bbjx_product WHERE category_id in (?)`
    db.query(sql, [id],  data=>{
            res.json({
                status: 0,
                msg: "success!",
                data
            });
    });
});

/**
 * 获取商品列表
 */
router.post("/add", (req, res) =>{
    let {id, subtitle, title, name, price, discount_price, main_image, hot} = req.body
    let sql = `INSERT INTO FROM bbjx_product (category_id subtitle, title, name, price, discount_price, main_image, hot) VALUES (?,?,?,?,?,?,?,?)`
    db.query(sql, [id, subtitle, title, name, price, discount_price, main_image, hot],  data=> {
        res.json({
            status: 0,
            msg: "添加商品成功!",
            data
        });
    });
});
module.exports = router;


[
    {
        category_id: 0,
        data:{

        }
    }
]

