<%-- 
    Document   : index
    Created on : 13 Sep, 2018, 1:19:12 PM
    Author     : ravi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Website</title>
        <meta charset="UTF-8">
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

    </head>
    <body>
                <!-- Always shows a header, even in smaller screens. -->
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
          <main class="mdl-layout__content">
              <div class="page-content">
                                    
              </div>
          </main>
        </div>
    </body>
</html>
