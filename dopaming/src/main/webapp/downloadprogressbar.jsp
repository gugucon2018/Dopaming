<%@page import="javafx.stage.Stage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트 페이지</title>
    <style>
      #main {
        transition: all .5s;
      }
      #main.ic-transitioning {
        opacity: 0;
      }
    </style>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js" data-semver="2.1.1" data-require="jquery@*"></script>
  <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js" data-semver="3.1.1" data-require="bootstrap@3.1.1"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-mockjax/1.5.3/jquery.mockjax.min.js"></script>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/3.0.2/js/bootstrap-switch.js"></script>

  <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" data-semver="3.1.1" data-require="bootstrap-css@3.1.1" />
  <link href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/3.0.2/css/bootstrap2/bootstrap-switch.css" rel="stylesheet" />
	<script src="./resources/js/intercooler-1.2.2.js"></script>
 
</head>
<body>
<h1>다운로드 테스트 페이지 입니다.</h1>
    <div id="main" ic-src="/job/status">
      <!-- This post to /job causes the outer div to refresh due to intercooler's dependencies system -->
      <button class="btn btn-primary" ic-post-to="/job">Start Job</button>
    </div>
</body>
    <script>

    //========================================================================
    // Mock Server-Side HTTP End Point
    //========================================================================
    $.mockjax({
      url: '/job',
      response: function (settings) {
    	console.log("ddd");
        jobManager.start();
      }
    });

    $.mockjax({
      url: '/job/status',
      response: function (settings) {
        var job = jobManager.currentProcess();
        this.responseText = jobStatusTemplate(job);
      }
    });

    $.mockjax({
      url: '/job/status/percent_complete',
      response: function () {
        var job = jobManager.currentProcess();
        this.responseText = job.percentComplete + "%";
        if (job.complete) {
          this.headers = { "X-IC-Refresh": "/job/status" }; // if the job is complete, refresh the entire job status UI
        }
      }});

    //========================================================================
    // Mock Server-Side Templates
    //========================================================================
    function jobStatusTemplate(process) {
      if(process.complete) {
        return 'Job Complete!';
      } else {
        return 'Job Running:' +
          '  <div class="progress progress-striped active">' +
          '   <div class="progress-bar" ic-style-src="width:/job/status/percent_complete" ic-poll="1s" style="width:0%"></div>' +
          '  </div>';
      }
    }

    //========================================================================
    // Mock Process Manager
    //========================================================================
    var jobManager = (function(){
      var currentProcess = null;
      return {
        start : function() {
          currentProcess = {
            complete : false,
            percentComplete : 0
          }
        },
        currentProcess : function() {
          currentProcess.percentComplete += Math.min(100, Math.floor(33 * Math.random()));  // simulate progress
          currentProcess.complete = currentProcess.percentComplete >= 100;
          return currentProcess;
        }
      }
    })();
    </script>
</html>