
const mysql=require('mysql');
const express=require('express');
const bodyparser=require('body-parser');
var cors=require('cors')
var app=express();
app.use(bodyparser.json());
app.use(cors())


var mysqlConn=mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"password",
    database:"lms",
    multipleStatements:true
});
mysqlConn.connect((err)=> {
    if(!err)
    console.log('Connection Established Successfully');
    else
    console.log('Connection Failed!'+ JSON.stringify(err,undefined,2));
    });

    const port=process.env.PORT || 8080;
    app.listen(port,() => console.log('Listening on port 8080'));


 app.get('/lmsl',(req,res)=>{
    mysqlConn.query('select * from user_details', (err,results,fields) => {
        
        if(!err){
            res.send(results);
       }else
        console.log(err);
    })
});


//register
app.post('/lmsl',(req,res)=>{
    let newlms=req.body;
    var sql="set @user_id=?; set @username= ?;set @email = ?;set @contact = ?;set @pwd = ?;set @address= ?;set @pincode= ?; call lms_db(@user_id,@username,@email,@contact,@pwd,@address,@pincode);";
    mysqlConn.query(sql,[newlms.user_id,newlms.username,newlms.email,newlms.contact,newlms.pwd,newlms.address,newlms.pincode],(err,results,fields)=>{
        if(!err)
        results.forEach(element => {
            if(element.constructor==Array)
            res.send('New user_id: '+element[0].user_id);
        });
        else
        console.log(err);
    })
});


//order
app.post('/lmso',(req,res)=>{
    let orders=req.body;
    var sql1="set @user_id=?;set @pdate=?;set @ddate=?;set @tWear=?;set @bWear=?;set @saree=?;set @wcloth=?;set @other=?;set @service=?; set @descr=?; call lms_order(@user_id,@pdate,@ddate,@tWear,@bWear,@saree,@wcloth,@other,@service,@descr);";
    mysqlConn.query(sql1,[orders.user_id,orders.pdate,orders.ddate,orders.tWear,orders.bWear,orders.saree,orders.wcloth,orders.other,orders.service,orders.descr],(err,results,fields)=>{
        if(!err)
        res.send("Request Accepted!");
        else
        console.log(err);
    })
});

//get id
app.get('/lmss',(req,res)=>{
    mysqlConn.query('select last_value(user_id)over()uid from user_details',(err,results,fields)=>{
        if(!err){
            res.send(results);
        }else
        console.log(err);
    } )
})


//user update
app.put('/lmsl',(req,res)=>{
    let upd=req.body;
    var sql2="set @user_id=?;set @username= ?;set @email = ?;set @contact = ?;set @pwd = ?;set @address= ?;set @pincode= ?; call lms_db(@user_id,@username,@email,@contact,@pwd,@address,@pincode);";
    mysqlConn.query(sql2,[upd.user_id,upd.username,upd.email,upd.contact,upd.pwd,upd.address,upd.pincode],(err,results,fields)=>{
        if(!err)
        res.send("Details Updated Successfully");
        else
        console.log(err);
    })
})

