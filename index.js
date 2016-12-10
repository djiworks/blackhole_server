#!/usr/bin/env node

var express = require('express');
var https = require('https');
var http = require('http');
var fs = require('fs');
var pem = require('pem');
var app = express();

app.get('/', function(req, res){
  res.send('<html><body>Blackhole</body></html>');
});

pem.createCertificate({days:1, selfSigned:true}, function(err, keys){
  var options = {
    key: keys.serviceKey,
    cert: keys.certificate
  };

  http.createServer(app).listen(80);
  https.createServer(options, app).listen(443);
})