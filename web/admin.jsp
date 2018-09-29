
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : index
    Created on : 13 Sep, 2018, 1:18:25 PM
    Author     : ravi
--%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Admin</title>
    
    <!--Add to homescreen for Chrome on Android--> 
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="images/android-desktop.png">

     <!--Add to homescreen for Safari on iOS--> 
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Material Design Lite">
    <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">

     <!--Tile icon for Win8 (144x144 + tile color)--> 
    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
    <meta name="msapplication-TileColor" content="#3372DF">

    <link rel="shortcut icon" href="images/favicon.png">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.cyan-light_blue.min.css">
    <link href="Admin/Assets/css/smartalert.css" rel="stylesheet" type="text/css"/>
    <link href="Admin/Assets/css/styles.css" rel="stylesheet" type="text/css"/>
   <!--  <link rel="stylesheet" href="material.min.css">
  -->   
  <script src="Admin/Assets/js/jquery.js" type="text/javascript"></script>
  <script src="Admin/Assets/js/smartalert.js" type="text/javascript"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
    <style>
    #view-source {
      position: fixed;
      display: block;
      right: 0;
      bottom: 0;
      margin-right: 40px;
      margin-bottom: 40px;
      z-index: 900;
    }
    a:hover{
        text-decoration: none;
        cursor: pointer;
    }
    a:active{
        text-decoration: none;
    }
    
    .glyphicon{
        font-weight: 50px !important;
        width: 30px !important;
        font-size: 15px !important; 
    }  
    
    </style>
        
  </head>
  <body>
      
    
    <div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
        <div  class="mdl-progress mdl-js-progress mdl-progress__indeterminate" style="width:100%;"></div>
 
        <header class="demo-header mdl-layout__header mdl-color--#49bdd4-100 mdl-color-text--grey-600">
        <div class="mdl-layout__header-row">
          <span class="mdl-layout-title" id="header_title">Home</span>
          <div class="mdl-layout-spacer"></div>
          <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
            <label class="mdl-button mdl-js-button mdl-button--icon" for="search">
              <i class="material-icons">search</i>
            </label>
            <div class="mdl-textfield__expandable-holder">
              <input class="mdl-textfield__input" type="text" id="search">
              <label class="mdl-textfield__label" for="search">Enter your query...</label>
            </div>
          </div>
          <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="hdrbtn">
            <i class="material-icons">more_vert</i>
          </button>
          <ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="hdrbtn">
            <li class="mdl-menu__item">About</li>
            <li class="mdl-menu__item">Contact</li>
            <li class="mdl-menu__item">Legal information</li>
          </ul>
        </div>
      </header>

      <div class="demo-drawer mdl-layout__drawer mdl-color--blue-grey-900 mdl-color-text--blue-grey-50">
        <header class="demo-drawer-header">
          <img src="./Admin/Assets/images/user.png" class="demo-avatar">
          <div class="demo-avatar-dropdown">
            <span>hello@example.com</span>
            <div class="mdl-layout-spacer"></div>
            <button id="accbtn" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
              <i class="material-icons" role="presentation">arrow_drop_down</i>
              <span class="visuallyhidden">Accounts</span>
            </button>
            <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="accbtn">
              <li class="mdl-menu__item">hello@example.com</li>
              <li class="mdl-menu__item">info@example.com</li>
              <li class="mdl-menu__item"><i class="material-icons">add</i>Add another account...</li>
            </ul>
          </div>
        </header>
        <nav class="demo-navigation mdl-navigation mdl-color--blue-grey-800">
          <a class="mdl-navigation__link" id="home"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">home</i>Home</a>
          <a class="mdl-navigation__link" id="user"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">face</i>User</a>
          <a class="mdl-navigation__link" id="admin"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">inbox</i>Admin</a>
           <a class="mdl-navigation__link" id="role"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">flag</i>Role</a>
          <a class="mdl-navigation__link" id="trash"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">delete</i>Trash</a>
           <a class="mdl-navigation__link" id="assignment"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">report</i>Assignment</a>
          <a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">forum</i>Report</a>

  <!--         <a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">local_offer</i>Promos</a>
          <a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">shopping_cart</i>Purchases</a>
          <a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">people</i>Social</a>-->

          <div class="mdl-layout-spacer"></div>
           <a class="mdl-navigation__link" id="logout"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">logout</i>Logout</a> 
          <a class="mdl-navigation__link" id="help"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">help_outline</i><span class="visuallyhidden">Help</span>Help</a>
        </nav>
      </div>
      <main class="mdl-layout__content mdl-color--grey-100" id="content">
         
          
          
          <div class="mdl-grid demo-content">
            <div class="mdl-grid" style="width: 100%;">
                <div class="mdl-cell mdl-cell--12-col">
                   <table class = "mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp" style="width: 100%">

                         <tbody   id="rowdata">

                         </tbody>
                  </table>
                </div>           
            </div>
         </div>    
          
           
      </main>
    </div>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script>
       
       function edit(a,type){  
            var userid=$(a).parent().parent().attr("id");
           var username=$(a).parent().parent().attr("username");
           var roleid=$(a).parent().parent().attr("roleid");
           var status=$(a).parent().parent().attr("status");
          
           alert( userid+" "+username+" "+roleid+" "+status);
             
                var form='<br/><br/><div>'+
                        '<input type="hidden" id="userid" value="'+userid+'"/>'+
                        ' <div class="form-group ">'+
                             '<div class="form-group col-xs-4 col-xs-offset-1">'+
                               '<label for="assignment_name">User Name</label>'+
                               '<input class="form-control" type="text"  id="user_name" placeholder="user name" value="'+username+'"/>'+
                             '</div>'+
                          '</div>'+   
                           ' <div class="form-group ">'+
                             '<div class="form-group col-xs-4 col-xs-offset-1">'+
                               '<label for="assignment_name">User Password</label>'+
                               '<input class="form-control" disabled type="text"  id="user_name" placeholder="user name" value="*******"/>'+
                             '</div>'+
                          '</div>'+   
                          ' <div class="form-group ">'+
                             '<div class=" form-group col-xs-4 col-xs-offset-1">'+
                               '<label for="role_id">Role Id</label>'+
                               '<select id="role_id" name="role_id" class="form-control">'+
                               '<option value=1>Admin</option>'+
                               '<option value=3>User</option></select>'+                               
                             '</div>'+
                           '</div>'+
                       
                          ' <div class="form-group ">'+
                             '<div class=" form-group col-xs-4 col-xs-offset-1">'+
                               '<label for="status">Status</label>'+
                               '<select id="status" name="status" class="form-control">'+
                               '<option value=1>Active</option>'+
                               '<option value=0>Deactive</option></select>'+                               
                             '</div>'+
                           '</div>'+  
                         ' <div class="form-group ">'+
                          '    <div class="form-group col-xs-2 col-xs-offset-3">'+
                           '       <input type="button" class="btn btn-warning form-control" value="Back" id="user" onclick="clickUser('+type+');"/>'+
                            ' </div>'+
                              '    <div class="form-group col-xs-2 col-xs-offset-1">'+
                           '       <input type="button" class="btn btn-success form-control" value="Save Changes" onclick="update_user()"/>'+
                            ' </div>'+
                         '</div>'+
                     '</div>';
             
                     
                $("#rowdata").html("").append(form);
             
            }
       
       function update_user(){
          var username= $("#user_name").val();
          var roleid= $("#role_id").val();
          var status= $("#status").val();
          var userid=$("#userid").val();
          alert(userid+" "+username+" "+roleid+" "+status);
           
           $.ajax({
                    url: "decoServlet",
                    type: "POST",
                    data: {
                        act: "updateuser",
                        userid: userid,
                        username : username,
                        roleid : roleid,
                        status : status
                    },
                    dataType: "JSON",
                    success: function (data) {
                        alert(data);
                    }
           
            });
        }
        
       function clickUser(type){
          
        if(type==1){
            $("#user").click();
        }else if(type==2){
            $("#admin").click();
        }else if(type==3){
           $("#trash").click(); 
        }   
        
           
       }
       function trash(a,u){  
           var userid=$(a).parent().parent().attr("id");
           var id=parseInt(u);
           var action="";
           if(id===1){
                action="trashAdmin";
            }else{
                action="trashUsers";
            }
           alert( $(a).parent().parent().attr("id")+"  "+action);
                       $.ajax({
                                url: "decoServlet",
                                type: "POST",
                                data: {
                                    act: "trash",
                                    type: action,
                                    userid:userid
                                },
                                dataType: "JSON",
                                success: function (data) {                                    
                                   $("#rowdata").html("");
                                   swal("Success!  Done", "", "success");
                                    $("#rowdata").html('<tr>'+                           
                                         '<td class = "mdl-data-table__cell--non-numeric">User Id</td>'+
                                         '<td>User Name</td>'+
                                         '<td>Role Id</td>'+
                                         '<td>Status</td>'+
                                         '<td>'+
                                         '<button role="'+ data.user_list[0].roleid+'"status="'+data.user_list[0].status +'" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">'+
                                           ' <i class="material-icons">add</i>  </button></td></tr>');

                                   for (var i = 0; i < data.user_list.length; i++)
                                    {
                                        $("#rowdata").append(' <tr id="'+data.user_list[i].userid+'">'+
                                          '<td class = "mdl-data-table__cell--non-numeric">'+ data.user_list[i].userid+'</td>'+
                                         '<td>'+data.user_list[i].username+'</td>'+
                                         '<td>'+data.user_list[i].roleid+'</td>'+
                                         '<td>'+data.user_list[i].status+'</td>'+
                                         '<td>'+
                                    ' <a class="edit" onclick="edit(this)"><span class="glyphicon glyphicon-edit" class="edit"></span></a>'+
                                    ' <a class="trash" onclick="trash(this,'+u+')"><span class="glyphicon glyphicon-trash"></span></a>'        
                                         + '</td>'+
                                         '</tr>');
                                    }

                                },
                                error:function(){
                                    alert("error");
                                }

                                }); 
                            
                          
                     
           
       }
       
       
       function addUser(a){
          var userid=$(a).parent().parent().attr("id");
           alert(userid);
           $.ajax({
                url: "decoServlet",
                type: "POST",
                data: {
                     act: "addUser",
                     userid:userid
                },
                dataType: "JSON",
                success: function (data) {                                    
                   $("#rowdata").html("");
                   swal("Success! Done", "", "success");
                    $("#rowdata").html('<tr>'+                           
                         '<td class = "mdl-data-table__cell--non-numeric">User Id</td>'+
                         '<td>User Name</td>'+
                         '<td>Role Id</td>'+
                         '<td>Status</td>'+
                         '<td>'+
                         '<button role="'+ data.remaining_users[0].roleid+'"status="'+data.remaining_users[0].status +'" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">'+
                           ' <i class="material-icons">add</i>  </button></td></tr>');

                   for (var i = 0; i < data.remaining_users.length; i++)
                    {
                        $("#rowdata").append(' <tr id="'+data.remaining_users[i].userid+'">'+
                          '<td class = "mdl-data-table__cell--non-numeric">'+ data.remaining_users[i].userid+'</td>'+
                         '<td>'+data.remaining_users[i].username+'</td>'+
                         '<td>'+data.remaining_users[i].roleid+'</td>'+
                         '<td>'+data.remaining_users[i].status+'</td>'+
                         '<td>'+
                    ' <a class="edit" onclick="edit(this)"><span class="glyphicon glyphicon-edit" class="edit"></span></a>'+
                    '  <a class="trash" onclick="addUser(this)"><span class="glyphicon glyphicon-bookmark"></span></a>'        
                         + '</td>'+
                         '</tr>');
                    }

                },
                error:function(){
                    alert("error");
                }

                }); 
                      
           
       }
       
   
            
            function newuser(a,type){
                var roleid=$(a).attr("role");
                var status=$(a).attr("status");
                alert(roleid+" "+status+" "+type);
                
                var form='<br/><br/><div>'+
                      
                        ' <div class="form-group ">'+
                             '<div class="form-group col-xs-4 col-xs-offset-1">'+
                               '<label for="assignment_name">User Name</label>'+
                               '<input class="form-control" type="text"  id="newuser_name" placeholder="user name" />'+
                             '</div>'+
                          '</div>'+   
                           ' <div class="form-group ">'+
                             '<div class="form-group col-xs-4 col-xs-offset-1">'+
                               '<label for="assignment_name">User Password</label>'+
                               '<input class="form-control" type="password"  id="newuser_password" placeholder="user name"  />'+
                             '</div>'+
                          '</div>'+   
                          ' <div class="form-group ">'+
                             '<div class=" form-group col-xs-4 col-xs-offset-1">'+
                               '<label for="role_id">Role Id</label>'+
                               '<select id="newrole_id" name="role_id" class="form-control">'+
                               '<option value=1>Admin</option>'+
                               '<option value=3>User</option></select>'+                               
                             '</div>'+
                           '</div>'+
                       
                          ' <div class="form-group ">'+
                             '<div class=" form-group col-xs-4 col-xs-offset-1">'+
                               '<label for="status">Status</label>'+
                               '<select id="newstatus" name="status" class="form-control">'+
                               '<option value=1>Active</option>'+
                               '<option value=0>Deactive</option></select>'+                               
                             '</div>'+
                           '</div>'+  
                         ' <div class="form-group ">'+
                          '    <div class="form-group col-xs-2 col-xs-offset-3">'+
                           '       <input type="button" class="btn btn-warning form-control" value="Back" id="user" onclick="clickUser('+type+');"/>'+
                            ' </div>'+
                              '    <div class="form-group col-xs-2 col-xs-offset-1">'+
                           '       <input type="button" class="btn btn-success form-control" value="Add User" onclick="addNewUser()"/>'+
                            ' </div>'+
                         '</div>'+
                     '</div>';
             
                     
                $("#rowdata").html("").append(form);
             
             
            }
            
            function addNewUser(){
                var username= $("#newuser_name").val();
                var roleid= $("#newrole_id").val();
                var status= $("#newstatus").val();
                var userpassword=$("#newuser_password").val();
                alert(username+" "+userpassword+" "+roleid+" "+status);

                 $.ajax({
                          url: "decoServlet",
                          type: "POST",
                          data: {
                              act: "addNewUser",
                              username : username,
                              userpassword : userpassword,
                              roleid : roleid,
                              status : status
                          },
                          dataType: "JSON",
                          success: function (data) {
                              console.log(data);
                              alert(data.status.status);
                              if(data.status.status == "inserted"){
                                   swal("Success! Done", "", "success");
                              }else{
                                   swal("Error! Done", "", "warning");
                              }
                          }

                  });
              }
            
          
 $(document).ready(function(){
     
      $(".mdl-progress").fadeOut(3000);  
             $("#logout").click(function(){
                swal({
                    title: "Are you sure?",
                    text: "",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: "btn-danger",
                    confirmButtonText: "Yes, Logout!",
                    cancelButtonText: "No, Cancel!",
                    closeOnConfirm: false,
                    closeOnCancel: false
                    },
                    function(isConfirm) {
                        if (isConfirm) {
                          swal("", "", "success");
                          window.location="index.html";
                        } else {
                          swal("", "", "error");
                        }
                    });
                        
             });
             
             
             $("#home").click(function(){
                 window.location.reload();
//                 $(".mdl-progress").fadeIn().fadeOut(3000); 
//                 $("#content").html("");
//                 $.ajax({
//                    url: "",
//                    success: function(data){
//                        $(".mdl-progress").fadeOut(3000); 
//                        $("#header_title").text("Home");
//                        $("#content").html(data);   
//                        
//                    },
//                    error:function(){
//                      alert("error");
//                    }
//                }); 
                        
             });
             
             $("#user").click(function(){
                 $("#header_title").html("User");
                 
//              alert("User"); 
                $.ajax({
                    url: "decoServlet",
                    type: "POST",
                    data: {
                        act: "getUsers"
                    },
                    dataType: "JSON",
                    success: function (data) {
                        alert(data.user_list.length);
                       $("#rowdata").html("");
                        $("#rowdata").html('<tr>'+                           
                             '<td class = "mdl-data-table__cell--non-numeric">User Id</td>'+
                             '<td>User Name</td>'+
                             '<td>Role Id</td>'+
                             '<td>Status</td>'+
                             '<td>'+
                             '<button  onclick="newuser(this,1)" role="'+ 3+'"status="'+1+'" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">'+
                               ' <i class="material-icons">add</i>  </button></td></tr>');
                        
                       for (var i = 0; i < data.user_list.length; i++)
                        {
                            $("#rowdata").append(' <tr id="'+data.user_list[i].userid+'" username="'+data.user_list[i].username+'" roleid="'+data.user_list[i].roleid+'" status="'+data.user_list[i].status+'">'+
                              '<td class = "mdl-data-table__cell--non-numeric">'+ data.user_list[i].userid+'</td>'+
                             '<td>'+data.user_list[i].username+'</td>'+
                             '<td>'+data.user_list[i].roleid+'</td>'+
                             '<td>'+data.user_list[i].status+'</td>'+
                             '<td>'+
                        ' <a class="edit" onclick="edit(this,1)"><span class="glyphicon glyphicon-edit" class="edit"></span></a>'+
                        ' <a class="trash" onclick="trash(this,3)"><span class="glyphicon glyphicon-trash"></span></a>'        
                             + '</td>'+
                             '</tr>');
                        }
                        
                    },
                    error:function(){
                        alert("error");
                    }
                    
                    });
                     
                        
                        
             });
             
            $("#admin").click(function(){
//              alert("admin");
                 $("#header_title").html("Admin");
                 $.ajax({
                    url: "decoServlet",
                    type: "POST",
                    data: {
                        act: "getAdmins"
                    },
                    dataType: "JSON",
                    success: function (data) {
                        $("#rowdata").html("");
                        $("#rowdata").html('<tr>'+                           
                             '<td class = "mdl-data-table__cell--non-numeric">User Id</td>'+
                             '<td>User Name</td>'+
                             '<td>Role Id</td>'+
                             '<td>Status</td>'+
                             '<td>'+
                             '<button  onclick="newuser(this,2)" role="'+ 1+'"status="'+1+'" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">'+
                               ' <i class="material-icons">add</i>  </button></td></tr>');
                        for (var i = 0; i < data.admin_list.length; i++)
                        {
                           
                          $("#rowdata").append('<tr id="'+data.admin_list[i].userid+'" username="'+data.admin_list[i].username+'" roleid="'+data.admin_list[i].roleid+'" status="'+data.admin_list[i].status+'">'+
                                    '<td class = "mdl-data-table__cell--non-numeric">'+ data.admin_list[i].userid+'</td>'+
                                    '<td>'+ data.admin_list[i].username+'</td>'+
                                    '<td>'+ data.admin_list[i].roleid+'</td>'+
                                    '<td>'+ data.admin_list[i].status+'</td>'+
                                    '<td>'+
                        ' <a class="edit" onclick="edit(this,2)"><span class="glyphicon glyphicon-edit" class="edit"></span></a>'+
                        ' <a class="trash" onclick="trash(this,1)"><span class="glyphicon glyphicon-trash"></span></a>'        
                             + '</td>'+
                             '</tr>');
                        }
                        
                    },
                    error:function(){
                        alert("error");
                    }
                    
                    });
            });
            
            $("#role").click(function(){
                  $("#header_title").html("Define Role");
//               alert("Treshed");
                 $.ajax({
                    url: "decoServlet",
                    type: "POST",
                    data: {
                        act: "getAllUsers"
                    },
                    dataType: "JSON",
                    success: function (data) {
                        $("#rowdata").html("");
                        $("#rowdata").html('<tr>'+                           
                             '<td class = "mdl-data-table__cell--non-numeric">User Id</td>'+
                             '<td>User Name</td>'+
                             '<td>Status</td>'+
                             '<td>Role Id</td>'+
                             '</tr>');
                         for (var i = 0; i < data.admin_list.length; i++)
                        {
                            var y="'selected'";
                            var n="";
//                         alert(data.trash_list[i].username);  
                          $("#rowdata").append('<tr   id="'+data.admin_list[i].userid+'">"'+
                                    '<td class = "mdl-data-table__cell--non-numeric">'+ data.admin_list[i].userid+'</td>'+
                                    '<td>'+ data.admin_list[i].username+'</td>'+
                                    '<td>'+ data.admin_list[i].status+'</td>'+
                                    '<td>'+                                    
                                        '<select class="form-control"><option >Admin</option><option >User</option>"'+
                                             + '</select></td></tr>');
                        }
                        
                    },
                    error:function(){
                        alert("error");
                    }
                    
                    });

            });
     
            $("#trash").click(function(){
                  $("#header_title").html("Trash");
//               alert("Treshed");
                 $.ajax({
                    url: "decoServlet",
                    type: "POST",
                    data: {
                        act: "getTrashs"
                    },
                    dataType: "JSON",
                    success: function (data) {
                        $("#rowdata").html("");
                        $("#rowdata").html('<tr>'+                           
                             '<td class = "mdl-data-table__cell--non-numeric">User Id</td>'+
                             '<td>User Name</td>'+
                             '<td>Role Id</td>'+
                             '<td>Status</td>'+
                             '<td>'+
                             '<button role="'+ data.trash_list[0].roleid+'"status="'+data.trash_list[0].status +'" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">'+
                               ' <i class="material-icons">add</i>  </button></td></tr>');
                         for (var i = 0; i < data.trash_list.length; i++)
                        {
//                         alert(data.trash_list[i].username);  
                          $("#rowdata").append('<tr  id="'+data.trash_list[i].userid+'" username="'+data.trash_list[i].username+'" roleid="'+data.trash_list[i].roleid+'" status="'+data.trash_list[i].status+'">"'+
                                    '<td class = "mdl-data-table__cell--non-numeric">'+ data.trash_list[i].userid+'</td>'+
                                    '<td>'+ data.trash_list[i].username+'</td>'+
                                    '<td>'+ data.trash_list[i].roleid+'</td>'+
                                    '<td>'+ data.trash_list[i].status+'</td>'+
                                    '<td>'+
                        ' <a class="edit" onclick="edit(this,3)"><span class="glyphicon glyphicon-edit" class="edit"></span></a>'+
                        ' <a class="trash" onclick="addUser(this)"><span class="glyphicon glyphicon-bookmark"></span></a>'        
                             + '</td>'+
                             '</tr>');
                        }
                        
                    },
                    error:function(){
                        alert("error");
                    }
                    
                    });

            });
            
            $("#assignment").click(function(){
                
                  $("#header_title").html("Assignment");
               alert("assignment");
               $("#content").html("");
                $.ajax({
                    url: "assignment.html",
                    success: function(data){
                        $(".mdl-progress").fadeOut(3000);  
                        $("#content").html(data);
                        $("#content").fadeIn(2000);
                    },
                    error:function(){
                      alert("error");
                    }
                });
             });
            
            $("#help").click(function(){
                  $("#header_title").html("Help");
               $(".mdl-progress").fadeIn().fadeOut(3000); 
               $("#content").html("");
//               $.ajax({
//                  url: "home.jsp",
//                  success: function(data){
//                      $(".mdl-progress").fadeOut(3000);  
//                      $("#content").html(data);                       
//                  },
//                  error:function(){
//                    alert("error");
//                  }
//              }); 

            });
            
           
            
            function edit(){
                alert(item);
            }
                         
            
               $("#edit").click(function(){
                   alert("this");
               });         
            
        
    });
                     

        $(document).ready(function(){  
           $("#form_container").hide().show(5000);
           $.ajax({
            url: "model",
            success: function(data){
                $(".mdl-progress").fadeOut(3000);  
                $("#content").html(data);
                $("#content").fadeIn(2000);
            },
            error:function(){
//              alert("error");
            }
          }); 
          
});      



      </script>
    <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
  </body>
</html>
