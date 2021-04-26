const express = require('express');
const router = express.Router();
const crypto = require('crypto')
// JSON Web Token
const jwt = require("jsonwebtoken");
// 数据库
let db = require('../../config/mysql');
const multer = require('multer');
const upload = multer();
//图片处理
const sharp = require('sharp');
//uuid
const uuidv1 = require('uuid/v1');

router.post('/login', (req, res) => {
    let {username, password} = req.body;
    let md5 = crypto.createHash("md5");
    let newPas = md5.update(password).digest("hex");
    let token = jwt.sign({username}, 'secret', {expiresIn: '5h'});
    let sql = 'SELECT * FROM bbjx_user WHERE username = ? and password = ?';
    db.query(sql, [username, newPas], data => {
        if (data.length>0) {
            res.json({
                status: 0,
                msg: '登录成功！',
                data:{
                    token,
                    username: data[0].username,
                    avatar: data[0].avatar
                }
            })
        } else {
            res.json({
                status: 1,
                msg: '用户或密码错误！',
            })
        }
    })
})

/**
 * 获取用户
 */
router.get("/list", (req, res) => {
    let {role} = req.query
    let sql = `SELECT id, username, openid, email, phone, role, status FROM bbjx_user WHERE role = ?`
    db.query(sql, [role], (results) => {
        res.json({
            status: 0,
            msg: '',
            data: results
        });
    });
});

/**
 * 更新用户
 */
router.post("/update", (req, res) => {
    let {id, status, password, avatar} = req.body
    console.log(id, status, password, avatar)
    if (password !== undefined) {
        let md5 = crypto.createHash("md5");
        let newPas = md5.update(password).digest("hex");
        let sql = `UPDATE bbjx_user SET password = ?, avatar=? WHERE id = ?`
        db.query(sql, [newPas, avatar, id], results => {
            res.json({
                status: 0,
                msg: "更新用户信息成功!",
                data: results
            });
        });
    } else {
        let sql = `UPDATE bbjx_user SET status = ? WHERE id = ?`
        db.query(sql, [status, id], results => {
            res.json({
                status: 0,
                msg: "更新用户状态成功!",
                data: results
            });
        });
    }
})

/**
 * 添加用户
 */
router.post("/add", (req, res) => {
    let {username, password, avatar} = req.body
    let md5 = crypto.createHash("md5");
    let newPas = md5.update(password).digest("hex");
    let role = 1
    let sql = `INSERT INTO bbjx_user (username, password, role, avatar) VALUES (?, ?, ?, ?)`
    db.query(sql, [username, newPas, role, avatar], results => {
        res.json({
            status: 0,
            msg: '新增用户成功！',
            data: results
        });
    });
});

/**
 * 搜索用户
 */
router.post("/search", (req, res) => {
    let {username, role} = req.body
    let sql = `SELECT id, username, email, phone, role, status FROM bbjx_user WHERE username = ? AND role = ?`
    db.query(sql, [username, role], data => {
        res.json({
            status: 0,
            msg: '',
            data
        });
    });
});

/**
 * 上传用户头像
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
    var fileFolder = "/images/avatar/";
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
module.exports = router;
