<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddProductor.aspx.cs" Inherits="AddProductor" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="asp" Namespace="Microsoft.Web.UI.WebControls" Assembly="Microsoft.Web.UI.WebControls" %>
<%@ Register TagPrefix="uc1" TagName="left" Src="~/left.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Search" Src="~/Search.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>商品增加</title>
     <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 
    <!-- 可选的Bootstrap主题文件（一般不使用） -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>
 
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
 
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script language="javascript" type="text/javascript" src="Calendar.js"></script>
    <script type="text/javascript">

var oCalendarEn=new PopupCalendar("oCalendarEn");    //初始化控件时,请给出实例名称如:oCalendarEn
oCalendarEn.Init();


var oCalendarChs=new PopupCalendar("oCalendarChs");    //初始化控件时,请给出实例名称:oCalendarChs
oCalendarChs.weekDaySting=new Array("日","一","二","三","四","五","六");
oCalendarChs.monthSting=new Array("一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月");
oCalendarChs.oBtnTodayTitle="今天";
oCalendarChs.oBtnCancelTitle="取消";
oCalendarChs.Init();</script>


<script type="text/javascript">
var xmlHttp;

function createXMLHttpRequest() {
    if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    } 
    else if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    }
}
    
function refreshModelList() {
    var first = document.getElementById("firstKind").value;

    if(first == "") {
        clearModelsList();
        return;
    }
    
    var url = "ajaxServer.aspx?" 
        + createQueryString(first) + "&ts=" + new Date().getTime();
        
    createXMLHttpRequest();
    xmlHttp.onreadystatechange = handleStateChange;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
}

function createQueryString(first) {
    var queryString = "first=" +first;
    return queryString;
}
    
function handleStateChange() {
    if(xmlHttp.readyState == 4) {
        if(xmlHttp.status == 200) {
            updateModelsList();
        }
    }
}

function updateModelsList() {
    clearModelsList();
    debugger;
    var second = document.getElementById("secondKind");
    var results = xmlHttp.responseXML.getElementsByTagName("second");
    var option = null;
    for(var i = 0; i < results.length; i++) {
        option = document.createElement("option");
        option.appendChild(document.createTextNode(results[i].firstChild.nodeValue));
        second.appendChild(option);
    }
}

function clearModelsList() {
    var second = document.getElementById("secondKind");
    while(second.childNodes.length > 0) {
        second.removeChild(second.childNodes[0]);
    }
}
</script>


<link href="head_foot.css" rel="Stylesheet" type="text/css" />
<style type="text/css">



#content #body1 {
	width: 755px;
	padding: 0px 20px 0 5px;
}
}

#content #body1 #body1left {
	float: left;
	width: 150px;
	height: 550px;
	border: 1px solid #FF6600;
}





#content #body1 #body1left #body1left1 {
	height: 162px;
}
.title {
	height: 26px;
	line-height: 26px;
	font-weight: bold;
	font-size: 13px;

}
#content #body1 #body1middle {
	float: right;
	width: 550px;
	border: 1px solid #FF6600;
	line-height: 20px;
    height:550px;
    margin-top:-365px;
        margin-left: 200px;
    }

.details {
}
.detailName {
	float: left;
	width: 100px;
	display: block;
}
.newPro {
	list-style: none;
	margin: 20px 0 0 20px;
}
.details {
	height: 30px;
}
        .auto-style1 {
            width: 220px;
            height: 107px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
<%--        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>--%>
<div id="content">
	<div id="head">
		<ul>
		<li class="daohang"><a href="default.aspx" class="cssA">首页</a></li>		
		<li class="daohang"><a href="AddProductor.aspx" class="cssA">信息发布</a></li>
		<li class="daohang"><a href="aboutus.aspx" class="cssA">关于网站</a></li>
		<li class="daohang"><a href="register.aspx" class="cssA">注册</a></li>
		<li class="daohang"><a href="help.aspx" class="cssA">帮助</a></li>
		
	</ul>

	    <img alt="logo" class="auto-style1" src="images/logo.png" /></div>
		<div id="logo">

	</div>
	<div id="body1">
		<div id="body1left">
			<div id="body1left1">
				<div class="title"><img alt="pic" src="images/in_le_top_01.gif" width="150" height="26" /></div>
				<uc1:left ID ="left" runat="server" />
			</div>
			<div id="body1left2">
				<div class="title"><img alt="pic" src="images/in_le_top_02.gif" width="150" height="26" /></div>
				<uc1:Search ID="Search" runat="server" />
			</div>
		</div>
		<div id="body1middle">
            
			<div class="title" style="border-bottom:1px #ff6600 solid"><img alt="pic" src="images/fe_ce_top_02.gif" style=" display:block; float:left;" />发布新的产品</div>
			<ul class="newPro">
			<li><asp:Label ID="Label1" runat="server" Text="提示:登录后才能发布信息" ForeColor="Red"></asp:Label></li>
				<li class="details"><span class="detailName">*标题:</span><input type="text" id="txtTitle" runat="server" /></li>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(必要栏位)" ControlToValidate ="txtTitle" SetFocusOnError="false"></asp:RequiredFieldValidator>
				<li class="details"><span class="detailName">*邮件:</span><input type="text" id="txtEmail" runat="server" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="邮件格式错误!" ControlToValidate ="txtEmail" ValidationExpression="^[a-z0-9A-Z]{1,}@[a-z0-9A-Z]{1,}\.(com|net|org|edu|mil|cn|cc)$"></asp:RegularExpressionValidator>
				</li>
				<li class="details"><span class="detailName">*联系人名字:</span><input type="text" id="txtName" runat="server" />
				<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="(必要栏位)" ControlToValidate ="txtName"></asp:RequiredFieldValidator>
				</li>
				<li class="details"><span class="detailName">*电话:</span><input type="text" id="txtPhone"  runat="server"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="dynamic" ErrorMessage="(必要栏位)" ControlToValidate ="txtPhone"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" Display="dynamic" ErrorMessage="请输入数字,并且保证位数!" ControlToValidate ="txtPhone" MinimumValue="1000000" MaximumValue="99999999999" Type="double"></asp:RangeValidator>
				</li>
				<li class="details"><span class="detailName">*地址:</span><input type="text" id="txtAddress" runat="server" />
				<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="(必要栏位)" ControlToValidate ="txtAddress"></asp:RequiredFieldValidator>
				</li>
				<li class="details" style=" height:65px"><span class="detailName" >*数量:</span>
				  <textarea id="txtContent" runat="server" cols="20" name="S1" rows="1"></textarea>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="(必要栏位)" ControlToValidate ="txtContent"></asp:RequiredFieldValidator>
				</li>
				<li class="details"><span class="detailName">买卖:</span><select id="dropBuySell" runat="server" name="D1">
				  <option value="供">卖</option>
				  <option value="求">买</option>
				</select></li>
				<li class="details"><span class="detailName">*价格:</span><input type="text" id="txtPrice" runat="server"/>
			
				<asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="dynamic" runat="server" ErrorMessage="(必要栏位)" ControlToValidate ="txtPrice"></asp:RequiredFieldValidator>
				</li>
<%--				<li class="details">

				            <span class="detailName">所属类别:</span>一级分类&nbsp;                 

				            <asp:DropDownList
                                ID="fistKind" runat="server" OnSelectedIndexChanged="fistkind_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>
                                &nbsp;&nbsp;&nbsp;二级分类&nbsp;&nbsp;<select id="secondKind" runat="server"></select>
                   
                    
                    </li>--%>
                    
                    	<li class="details">

				            <span class="detailName">所属类别:</span>一级分类&nbsp;                 
                            <select id="firstKind" runat="server" onchange="refreshModelList()" name="D2">
                                <option></option>
                            </select>

                                &nbsp;&nbsp;&nbsp;二级分类&nbsp;&nbsp;<select id="secondKind" runat="server" name="D3"></select>
                   
                    
                    </li>
				<li class="details"><span class="detailName">图片:</span>
                <asp:FileUpload ID="FileUp" runat="server" />
				</li>
				<li class="details"><span class="detailName">有效期:</span><input type="text" id="txtTime" runat="server" readonly="readonly" onfocus="getDateString(this,oCalendarChs)"/></li>
                   <li class="details"><span class="detailName"></span>
        <asp:Button ID="btSave" runat="server" Text="保存" OnClick="btSave_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btBack" runat="server"
            Text="返回上页" OnClick="btBack_Click" CausesValidation="False" /></li>
			</ul>
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lbinforn" runat="server" ForeColor="Red"></asp:Label></div>
		
	</div>
	<div id="friendweb">
	    一<br />
	    <a href="http://jwxt.nit.net.cn/default2.aspx" target="_blank">浙江大学宁波理工教务系统</a>
	    <a href="http://xgxt.nit.net.cn/xgxt/" target="_blank">浙江大学宁波理工学工系统</a>
	</div>

	<div id="foot">
	    计算机152&nbsp;&copy;&nbsp;鲍宸&nbsp;徐一成
	</div>
</div>
    </form>
</body>
</html>
