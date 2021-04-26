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
 * 获取首页今日必抢三个商品
 */
router.get("/index/hotGoods", (req, res) =>{
    let sql = `SELECT id, name,subtitle, price, discount_price,main_image FROM bbjx_product WHERE stock >0 ORDER BY stock LIMIT 3`
    db.query(sql, [],  (results)=> {
        //成功
        res.json({
            status: 0,
            msg: "success!",
            data: results
        });
    });
});

/**
 * 获取首页商品
 */
router.get("/index/shopList", (req, res) =>{
    let sql = `SELECT id, name, title, subtitle, price, discount_price, comment, tip, main_image FROM bbjx_product WHERE hot > 1 ORDER BY hot DESC`
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
    db.query(sql, [],  (results)=> {
        //成功
        res.json({
            status: 0,
            msg: "success!",
            data: results
        });
    });
});

/**
 * 获取一级分类id查询二级分类
 */
router.get("/category/v2", (req, res) =>{
    let { id } = req.query
    let sql = `SELECT id, name FROM bbjx_category WHERE parent_id = ?`
    let sql1 = `SELECT id, category_id, title, main_image FROM bbjx_product WHERE category_id in (?)`

    db.query(sql, [id],  results=>{
        let arrId = []
        let data = []
        results.forEach(item=>{
            arrId.push(item.id)
        })
        db.query(sql1, [arrId], result=>{
            results.forEach(v=>{
                let obj = {}
                let list = []
                obj.category_id = v.id
                obj.title = v.name
                result.forEach(item=>{
                    if(item.category_id === v.id){
                        list.push(item)
                    }
                })
                obj.list=list
                data.push(obj)
            })
            res.json({
                status: 0,
                msg: "success!",
                data: data
            });
        })
    });
});

/**
 * 获取商品列表
 */
router.get("/list", (req, res) =>{
    let { id } = req.query
    let sql = `SELECT id, subtitle, price, discount_price, main_image FROM bbjx_product WHERE category_id=? and hot > 1 ORDER BY hot DESC`
    db.query(sql, [id],  (results)=> {
        res.json({
            status: 0,
            msg: "success!",
            data: results
        });
    });
});

module.exports = router;

