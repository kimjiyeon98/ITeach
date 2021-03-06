<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<%
ArrayList<Fboard> flist = (ArrayList<Fboard>)request.getAttribute("flist");
PageInfo pi = (PageInfo)request.getAttribute("pi");
int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>!Teach</title>
<style>
	#listArea{border: 2px solid lightgray; border-collapse:collapse;}
	.ts{width: 100px; font-size: 15px;}
	.ts:hover{cursor: pointer;}
	.www{background: white; width: 100%; height: 40px;}
	#mmm{
		background: white; text-align: center;
		vertical-align: middle; width: 50%; height: 40px;
	}
	.tA{width: 100%; height: 190px; background: rgb(19, 116, 242); }
	#lA{text-align: center; vertical-align: middle; width: 50%; height: 100px;}
	#c1{font-size: 30px; color: white; font-weight: bold;}
	#c2{color: white; font-weight: bold;}
	#st{color: rgb(75, 148, 242); border-bottom: 4px solid rgb(75, 148, 242);}
	#search{width: 100%; height: 30px; margin-top: 50px;}
	#lbl1{font-size: 20px; font-weight: bold;}
	.ot{
		width: 1000px; height: 400px; border: 2px solid gray;
		margin-left: auto; margin-right: auto; margin-top: 80px; margin-bottom: 10px;
	}
	#searchtext{height: 30px;}
	#listArea{text-align: center;}
	.tableArea{width:1100px; height:480px; margin:auto;}
	.nt{background: rgb(75, 148, 242); color: #F2F2F2; border: 2px solid lightgray;}
	.nd{border: 2px solid lightgray;}
	#btnarea{margin-top: 10px;}
	#writeFboBtn{
		padding: 5px;
		font-size:16px;color:#fff;border:1px solid #0554f2;border-radius:2em;background:#0554f2; letter-spacing:-0.8px; font-weight:bold;
	}
	#searchBtn{
		background: skyblue;
		color: white; font-weight: bold; width: 80px; height: 30px;	
		padding: auto;
		font-size:16px;color:#fff;border:1px solid #0554f2;border-radius:2em;background:#0554f2; letter-spacing:-0.8px; font-weight:bold;
	}
	#writeFboBtn:hover, #searchBtn:hover{background:#fff;color:#0554f2;}
	.pagingArea button{border-radius: 5px; background: #D5D5D5; width: 25px; height: 25px; font-weight: bold;}
	button:hover{cursor: pointer;}
	#numBtn{background: rgb(75, 148, 242);}
	#choosen{background: skyblue;}
	select{font-weight: bold; width: 100px; height: 34px;}
</style>
</head>
<body>
	<%@ include file="../common/menuBar.jsp" %>
	
	<div class="www" align="center">

		<table id="mmm">
			<tr>
				<th class="ts" onclick="location.href='list.no'">????????????</th>
				<th class="ts" onclick="location.href='list.fbo'">?????????</th>
				<th class="ts" id="st" onclick="location.href='list.st'">???????????????</th>
			</tr>
		</table>
	</div>
	
	<div class="tA" align="center"><br><br>
		<table id="lA">
			<tr>
				<th id="c1">???????????????</th>
			</tr>
			<tr>
				<th id="c2">Home > ???????????? > ???????????????</th>
			</tr>
		</table>
	</div>
	
	<form action="<%= request.getContextPath()%>/list.st" method="get" >
	<div id="search" align="center">
		<select name="search">
			<option value="study_title" selected>??????</option>
			<option value="study_writer">?????????</option>
			<option value="study_region">??????</option>
		</select>
		<input type="text" id="searchtext" size="50" name="searchtext" placeholder="??????">
		<button id="searchBtn">??????</button>
	</div>
	</form>
	
<%--    <div class="ot" align="center">  --%>
		<br><br><br>
		<div class="tableArea">
			<table id="listArea">
				<tr>
					<th style="visibility:hidden;position:absolute;"></th>
					<th class="nt" width="80px" height="40px;">??????</th>
					<th class="nt" width="460px" height="40px;">??????</th>
					<th class="nt" width="150px" height="40px;">?????????</th>
					<th class="nt" width="200px" height="40px;">??????</th>
					<th class="nt" width="150px" height="40px;">?????????</th>
					<th class="nt" width="60px" height="40px;">?????????</th>
				</tr>
				<% if(flist.isEmpty()){ %>
					<tr>
						<td colspan="6">???????????? ???????????? ????????????.</td>
					</tr>
				<% } else { 
						for(Fboard fb : flist){ %>
						<tr>
							<td style="visibility:hidden;position:absolute;"><%= fb.getBoardNo() %></td>
							<td class="nd" height="40px;"><%= fb.getId() %></td>
							<td class="nd" height="40px;"><%= fb.getBoardTitle() %></td>
							<td class="nd" height="40px;"><%= fb.getMemNick() %></td> 
							<td class="nd" height="40px;"><%= fb.getRegion() %></td>
							<td class="nd" height="40px;"><%= fb.getCreateDate() %></td>
							<td class="nd" height="40px;"><%= fb.getBoardView() %></td>
						</tr>
				<% 		} 
				   } %>
			</table>
	<div id="btnarea" align="right">
		<% if(loginMember != null){ %>  
				<button onclick="location.href='<%= request.getContextPath() %>/writeBoardForm.st'" id="writeFboBtn">?????????</button>
		<% } %> 			
	</div>
			
	</div>
	<br><br><br><br>
	
		<!-- ????????? -->
		<div class="pagingArea" align="center">
			<!-- ??? ???????????? -->
			<button onclick="location.href='<%= request.getContextPath() %>/list.st?currentPage=1'">&lt;&lt;</button>
			<!-- ?????? ???????????? -->
			<button onclick="location.href='<%= request.getContextPath() %>/list.st?currentPage=<%= currentPage - 1 %>'" id="beforeBtn">&lt;</button>
			<script>
				if(<%= currentPage %> <= 1){
					var before = $('#beforeBtn');
					before.attr('disabled', true);
				}
			</script>
			<!-- ?????? ?????? -->
			<% 
			for(int p = startPage; p <= endPage; p++) {
				if(p == currentPage){
			%>
			<button id='choosen' disabled><%= p %></button>
			<% 		
				} else{
			%>
			<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.st?currentPage=<%= p %>'"><%= p %></button>
			<% 
				}
			}
			%>
			
			<!-- ?????? ???????????? -->
			<button onclick="location.href='<%= request.getContextPath() %>/list.st?currentPage=<%= currentPage + 1 %>'" id="afterBtn">&gt;</button>
			<script>
				if(<%= currentPage %> >= <%= maxPage %>){
					$('#afterBtn').attr('disabled', true);
				}
			</script>
			<!-- ??? ?????? -->
			<button onclick="location.href='<%= request.getContextPath() %>/list.st?currentPage=<%= maxPage %>'">&gt;&gt;</button>
		</div>
		<br><br><br>
<%-- </div> --%>
	
	<script>
			$(function(){
				$('#listArea td').on({'mouseenter':function(){
					$(this).parent().css({'background' : 'lightgray', 'cursor':'pointer'});					
				}, 'mouseout':function(){
					$(this).parent().css({'background': 'none'});
				}, 'click':function(){
				<% if(loginMember != null){%>
					var num = $(this).parent().children().eq(0).text();
					location.href='<%= request.getContextPath() %>/detail.st?stNo=' + num;
				<%} else if(loginMember == null){ %>
					alert("?????? ???????????? ????????? ????????? ???????????????.");
					location.href = '<%= request.getContextPath()%>/Login.me';
				<%} %>
				}});
			});
	</script>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>