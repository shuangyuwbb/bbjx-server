var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  // res.redirect('/api');
  res.json({
    status: 0,
    msg: "success!"
  });
});

module.exports = router;
