/**
 @author: wbb
 @date: 2021/3/13
 @Version: 1.0
 */
const express = require('express');
const router = express.Router();
//文件传输
const multer = require('multer');
const upload = multer();
//图片处理
const sharp = require('sharp');
//uuid
const uuidv1 = require('uuid/v1');
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
    let sql = `SELECT * FROM bbjx_category WHERE parent_id = ?`
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
    let {category_id, subtitle, title, name, price, discount_price, main_image, hot, stock} = req.body
    let sql = `INSERT INTO bbjx_product (category_id, subtitle, title, name, price, discount_price, main_image, hot, stock) VALUES (?,?,?,?,?,?,?,?,?)`
    db.query(sql, [category_id, subtitle, title, name, price, discount_price, main_image, hot, stock],  data=> {
        res.json({
            status: 0,
            msg: "添加商品成功!",
            data
        });
    });
});

/**
 * 获取商品列表
 */
router.post("/update", (req, res) =>{
    let {id, subtitle, name, discount_price, main_image, hot} = req.body
    let sql = `UPDATE bbjx_product subtitle =?, name=?, discount_price=?, main_image=?, hot=? WHERE id=?`
    db.query(sql, [subtitle, name, discount_price, main_image, hot, id],  data=> {
        res.json({
            status: 0,
            msg: "添加商品成功!",
            data
        });
    });
});


router.post("/updateStatus", (req, res) =>{
    let {id, status} = req.body
    let sql = `UPDATE bbjx_product status=? WHERE id=?`
    db.query(sql, [status, id],  data=> {
        res.json({
            status: 0,
            msg: "更新成功!",
            data
        });
    });
});

/**
 * @api {post} /api/upload/goods 上传商品主图
 * @apiDescription 上传图片会自动检测图片质量，压缩图片，体积<2M，尺寸（300~1500），存储至goods文件夹
 * @apiName uploadGoods
 * @apiGroup admin Upload Image
 * @apiPermission admin
 *
 * @apiParam {File} file File文件对象;
 *
 * @apiSampleRequest /api/upload/goods
 *
 * @apiSuccess {String} lgImg 返回720宽度图片地址.
 * @apiSuccess {String} mdImg 返回360宽度图片地址.
 */
router.post("/upload", upload.single('file'), async (req, res) =>{
    //文件类型
    let { mimetype, size } = req.file;
    //判断是否为图片
    var reg = /^image\/\w+$/;
    var flag = reg.test(mimetype);
    if (!flag) {
        res.status(400).json({
            status: false,
            msg: "格式错误，请选择一张图片!"
        });
        return;
    }
    //判断图片体积是否小于2M
    if (size >= 2 * 1024 * 1024) {
        res.status(400).json({
            status: false,
            msg: "图片体积太大，请压缩图片!"
        });
        return;
    }
    // 获取图片信息
    let { width, format } = await sharp(req.file.buffer).metadata();
    // 判读图片尺寸
    if (width < 300 || width > 1500) {
        res.status(400).json({
            status: false,
            msg: "图片尺寸300-1500，请重新处理!"
        });
        return;
    }
    // 生成文件名
    var filename = uuidv1();
    // 储存文件夹
    var fileFolder = "/images/goods/";
    //处理图片
    try {
        await sharp(req.file.buffer)
            .resize(720)
            .toFile("public" + fileFolder + filename + '_720.' + format);
        await sharp(req.file.buffer)
            .resize(360)
            .toFile("public" + fileFolder + filename + '_360.' + format);
        //返回储存结果
        res.json({
            status: 0,
            msg: "图片上传处理成功!",
            lgImg:process.env.server + fileFolder + filename + '_720.' + format,
            mdImg:process.env.server + fileFolder + filename + '_360.' + format,
        });
    } catch (error) {
        res.json({
            status: false,
            msg: error,
        });
    }
});

router.post("/category/ads", upload.single('file'), async (req, res) =>{
    //文件类型
    let { mimetype, size } = req.file;
    //判断是否为图片
    var reg = /^image\/\w+$/;
    var flag = reg.test(mimetype);
    if (!flag) {
        res.status(400).json({
            status: false,
            msg: "格式错误，请选择一张图片!"
        });
        return;
    }
    //判断图片体积是否小于2M
    if (size >= 2 * 1024 * 1024) {
        res.status(400).json({
            status: false,
            msg: "图片体积太大，请压缩图片!"
        });
        return;
    }
    // 获取图片信息
    let { width, format } = await sharp(req.file.buffer).metadata();
    // 判读图片尺寸
    if (width < 300 || width > 1500) {
        res.status(400).json({
            status: false,
            msg: "图片尺寸300-1500，请重新处理!"
        });
        return;
    }
    // 生成文件名
    var filename = uuidv1();
    // 储存文件夹
    var fileFolder = "/images/ads/";
    //处理图片
    try {
        await sharp(req.file.buffer)
            .resize(720)
            .toFile("public" + fileFolder + filename + '_720.' + format);
        await sharp(req.file.buffer)
            .resize(360)
            .toFile("public" + fileFolder + filename + '_360.' + format);
        //返回储存结果
        res.json({
            status: 0,
            msg: "图片上传处理成功!",
            lgImg:process.env.server + fileFolder + filename + '_720.' + format,
            mdImg:process.env.server + fileFolder + filename + '_360.' + format,
        });
    } catch (error) {
        res.json({
            status: false,
            msg: error,
        });
    }
});

router.post("/category/upload", upload.single('file'), async (req, res) =>{
    //文件类型
    let { mimetype, size } = req.file;
    //判断是否为图片
    var reg = /^image\/\w+$/;
    var flag = reg.test(mimetype);
    if (!flag) {
        res.status(400).json({
            status: false,
            msg: "格式错误，请选择一张图片!"
        });
        return;
    }
    //判断图片体积是否小于2M
    if (size >= 2 * 1024 * 1024) {
        res.status(400).json({
            status: false,
            msg: "图片体积太大，请压缩图片!"
        });
        return;
    }
    // 获取图片信息
    let { width, format } = await sharp(req.file.buffer).metadata();
    // 判读图片尺寸
    if (width < 300 || width > 1500) {
        res.status(400).json({
            status: false,
            msg: "图片尺寸300-1500，请重新处理!"
        });
        return;
    }
    // 生成文件名
    var filename = uuidv1();
    // 储存文件夹
    var fileFolder = "/images/category/";
    //处理图片
    try {
        await sharp(req.file.buffer)
            .resize(720)
            .toFile("public" + fileFolder + filename + '_720.' + format);
        await sharp(req.file.buffer)
            .resize(360)
            .toFile("public" + fileFolder + filename + '_360.' + format);
        //返回储存结果
        res.json({
            status: 0,
            msg: "图片上传处理成功!",
            lgImg:process.env.server + fileFolder + filename + '_720.' + format,
            mdImg:process.env.server + fileFolder + filename + '_360.' + format,
        });
    } catch (error) {
        res.json({
            status: false,
            msg: error,
        });
    }
});

/**
 * 添加分类
 */
router.post("/category", (req, res) =>{
    let {parent_id, name, img} = req.body
    let sql = `INSERT INTO bbjx_category (parent_id, name, img) VALUES (?, ?, ?)`
    db.query(sql, [parent_id, name, img],  data=> {
        res.json({
            status: 0,
            msg: "success!",
            data
        });
    });
});

/**
 * 更新分类
 */
router.post("/category/update", (req, res) =>{
    let {id, name, img, ads} = req.body
    let sql = `UPDATE bbjx_category SET name= ?,img=?, ads=? WHERE id = ? `
    db.query(sql, [name, img, ads, id],  data=> {
        res.json({
            status: 0,
            msg: "success!",
            data
        });
    });
});

/**
 * 删除分类
 */
router.delete("/category", (req, res) =>{
    let {parent_id, name, img} = req.body
    let sql = `INSERT INTO bbjx_category (parent_id, name, img) VALUES (?, ?, ?)`
    db.query(sql, [parent_id, name, img],  data=> {
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
router.get("/category", (req, res) =>{
    let { id } = req.query
    let sql = `SELECT * FROM bbjx_category WHERE parent_id = ?`
    db.query(sql, [id],  data=>{
        res.json({
            status: 0,
            msg: "success!",
            data
        });
    });
});
module.exports = router;


