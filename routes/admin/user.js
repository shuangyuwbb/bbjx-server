const express = require('express');
const router = express.Router();
const crypto = require('crypto')
// JSON Web Token
const jwt = require("jsonwebtoken");
// 数据库
let db = require('../../config/mysql');

router.post('/login', (req, res) => {
    let {username, password} = req.body;
    // 生成token
    let md5 = crypto.createHash("md5");
    let newPas = md5.update(password).digest("hex");
    let token = jwt.sign({username}, 'secret', {expiresIn: '5h'});
    let sql = 'SELECT * FROM bbjx_user WHERE username = ? and password = ?';
    db.query(sql, [username, newPas], data => {
        if (data.length>0) {
            res.json({
                status: 0,
                msg: '登陆成功！',
                data:{
                    token
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
            msg: "success!",
            data: results
        });
    });
});

/**
 * 更新用户
 */
router.post("/update", (req, res) => {
    let {id, status, password} = req.body
    let sql = ''
    let current = 0
    if (password) {
        sql = `UPDATE bbjx_user SET password = ? WHERE id = ?`
        current = password
    } else {
        sql = `UPDATE bbjx_user SET status = ? WHERE id = ?`
        current = status
    }
    db.query(sql, [current, id], results => {
        res.json({
            status: 0,
            msg: "更新用户信息成功!",
            data: results
        });
    });
});

/**
 * 添加用户
 */
router.post("/add", (req, res) => {
    let {username, password} = req.body
    let md5 = crypto.createHash("md5");
    let newPas = md5.update(password).digest("hex");
    let role = 1
    let sql = `INSERT INTO bbjx_user (username, password, role) VALUES (?, ?, ?)`
    db.query(sql, [username, newPas, role], results => {
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
    db.query(sql, [username, role], results => {
        res.json({
            status: 0,
            msg: '',
            data: results
        });
    });
});
module.exports = router;
