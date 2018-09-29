<%-- 
    Document   : userpage
    Created on : 11 Sep, 2018, 12:55:12 AM
    Author     : Ravi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.cyan-pink.min.css">
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script>
        $(document).ready(function(){     
                $(".mdl-progress").fadeOut(2500);  
               
        });
        </script>
        <style>
            #form_container{
                /*display: none;*/
            }
        </style>
    </head>
    <body>
         <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
          <div  class="mdl-progress mdl-js-progress mdl-progress__indeterminate"style="width:100%;"></div>
            
            <header class="mdl-layout__header">
            <div class="mdl-layout__header-row">
              <!-- Title -->
              <span class="mdl-layout-title">Website Logo</span>
              <!-- Add spacer, to align navigation to the right -->
              <div class="mdl-layout-spacer"></div>
              <!-- Navigation. We hide it in small screens. -->
              <nav class="mdl-navigation mdl-layout--large-screen-only">
                    <a class="mdl-navigation__link" href="">Home</a>
                    <a class="mdl-navigation__link" href="">Services</a>
                    <a class="mdl-navigation__link" href="">Contact</a>
                    <a class="mdl-navigation__link" href="">Help</a>
                    <!-- Expandable Textfield -->
                    <form action="#">
                      <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
                        <label class="mdl-button mdl-js-button mdl-button--icon" for="search">
                          <i class="material-icons">search</i>
                        </label>
                        <div class="mdl-textfield__expandable-holder">
                          <input class="mdl-textfield__input" type="text" id="search">
                          <label class="mdl-textfield__label" for="sample-expandable">Expandable Input</label>
                        </div>
                      </div>
                    </form>
              </nav>
            </div>
          </header>
            <div class="mdl-layout__drawer" id="drawer">
            <span class="mdl-layout-title">Title</span>
            <nav class="mdl-navigation">
                <a class="mdl-navigation__link" href="">Home</a>
                <a class="mdl-navigation__link" href="">Services</a>
                <a class="mdl-navigation__link" href="">Contact</a>
                <a class="mdl-navigation__link" href="">Help</a>
            </nav>
          </div> 
<!--          <main class="mdl-layout__content">
              <div class="page-content">
                  
                         <div class="container responsive">
        
                          </div>            
              </div>
          </main>-->


          <main class="mdl-layout__content mdl-color--grey-100" id="content">       
          

                <div class="mdl-grid demo-content">
                  <div class="mdl-grid" style="width: 100%;">
                      <div class="mdl-cell mdl-cell--12-col">
                          <div class="table-responsive container" id="table_container">
        
                          </div>   
                          
                      </div>           
                  </div>
               </div>    




            </main>
        </div>
       
      
        <script>
            $(document).ready(function(){
                $.ajax({
                   url:"UserServlet",
                   type:"POST",
                   data:{
                       act:"getAssignment"
                   },
                   success:function(data){
                       var data1 = JSON.parse(data);
                       console.log(data1);
                       var j=1;
                       a="";
                       var a = "<table class='table table-hover table-striped'><thead><tr><th>S.N.</th><th>Assignment Name</th><th>Assignment Desc</th><th>Deadline</th><th>Given By</th><th>Attachment</th><th>Submission</th></tr></thead><tbody>";
                       for(var i=0;i<data1.assignment_details.length;i++){
                           console.log(data1.assignment_details[i].file_path);
                           a+='<tr id="'+data1.assignment_details[i].assignment_id+" "+data1.assignment_details[i].subject_id+" "+data1.assignment_details[i].assignment_name+'"><td>'+(j)+'</td><td>'+data1.assignment_details[i].assignment_name+'</td><td>'+data1.assignment_details[i].assignment_desc+'</td><td>'+data1.assignment_details[i].e_date+'</td><td>'+data1.assignment_details[i].user_id+'</td><td><a class="btn btn-info btn-sm" href="DownloadServlet?path='+data1.assignment_details[i].file_path+'"><span class="glyphicon glyphicon-download-alt " ></span></a></td><td><div class="input-group col-xs-8">'+
                               '<input id="file1" type="file" class="form-control">'+
                               ' <span class="input-group-addon" onclick="submit_assignment(this)"><i class="glyphicon glyphicon-upload"></i></span>'+
                                '</div></td></tr>';
                        j++;
                        }
                       a+="</tbody></table>";
                       $(".container").html(a);
                   },
                   error:function(data){
                       
                   }
                });
            });
            
            
            
           
            
            function submit_assignment(ref){
                var a=$(ref).parent().parent().parent().attr("id");
                var assignment_id=a.split(" ")[0];
                var subject_id=a.split(" ")[1];
                var assignment_name=a.split(" ")[2];
              
                alert("Assignment id : "+ assignment_id +"  Subject id : "+subject_id +" Assignment Name : "+assignment_name);
                var formData = new FormData();
                formData.append("assignment_id",assignment_id);
                formData.append("subject_id",subject_id);
                formData.append("assignment_name",assignment_name);
                formData.append("file",$("#file1").prop("files")[0]);
                $.ajax({
                   url:"FileSubmitServlet",
                   type:"POST",
                   cache:false,
                   contentType: false,
                   processData: false,
                   data:formData,
                   success: function(data){
                       alert(data);
                       swal("Success!  Done", "", "success");
                       console.log(data);
                   },
                   error:function(data){
                       
                   }
               });
            }
            
             
        </script>
        
        
    </body>
</html>
