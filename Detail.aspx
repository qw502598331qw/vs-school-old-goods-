<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="Detail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="uc1" TagName="Search" Src="Search.ascx" %>
<%@ Register TagPrefix="uc1" TagName="left" Src="left.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SendInfo" Src="sendInfo.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>商品详细信息</title>
     <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 
    <!-- 可选的Bootstrap主题文件（一般不使用） -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>
 
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
 
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script language="javascript">
		function openwin(id) 
		{ 
           var window_width = 540;
           var window_height = 530;
           var window_top = (screen.height-window_height)/2;
           var window_left = (screen.width-window_width)/2;
           newWindow=window.open("detailpic.aspx?idp="+id+"","","height="+window_height+",width="+window_width+",left="+window_left+",top="+window_top+",resizable=yes,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no");
           newWindow.focus();
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
	height: 500px;
	border: 1px solid #FF6600;
}
#content #body1 #body1right {
	float: right;
	height: 500px;
	width: 150px;
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
	width: 590px;
	border: 1px solid #FF6600;
    position :relative;
            top: -324px;
            left: 65px;
        }


#content #body1 #body1middle .proName {
	font-family: "黑体";
	line-height: 40px;
	font-size: 16px;
	color: #666666;
}
.backimage {
	background-image: url(images/title.gif);
}
</style>
</head>
<body>
    <form id="form1" runat="server">
<div id="content">
	<div id="head">
		<ul>
		<li class="daohang"><a href="default.aspx" class="cssA">首页</a></li>		
		<li class="daohang"><a href="AddProductor.aspx" class="cssA">信息发布</a></li>
		<li class="daohang"><a href="aboutus.aspx" class="cssA">关于网站</a></li>
		<li class="daohang"><a href="register.aspx" class="cssA">注册</a></li>
		<li class="daohang"><a href="help.aspx" class="cssA">帮助</a></li>
		
	</ul>

	</div>
		<div id="logo">
	
	</div>
	<div id="body1">
		<div id="body1left">
			<div id="body1left1">
				<div class="title"><img src="images/in_le_top_01.gif" width="150" height="26" /></div>
				<uc1:left ID="left" runat="server" />
			</div>
			<div id="body1left2">
				<div class="title"><img src="images/in_le_top_02.gif" width="150" height="26" /></div>
				<uc1:Search id="Search" runat="server" />
			</div>
		</div>
		<div id="body1middle">
			<div class="title" style="border-bottom:1px #ff6600 solid"><img src="images/fe_ce_top_02.gif" style=" display:block; float:left; " />信息内容</div>
			<span class="proName">商品名称</span>			
			<div class="title backimage" >商品简介</div>
            <asp:DataList ID="MarketDetailDl" runat="server" Width="590px" Height="200px" RepeatColumns ="1" HorizontalAlign="center" ShowHeader="false">
            <ItemStyle BackColor ="lightcyan" />
            <ItemTemplate>
                商品图片<br /><img src='<%# Checked(DataBinder.Eval(Container.DataItem,"PicPath").ToString ()) %>' height="120" width="120" onclick ="openwin(<%# DataBinder.Eval(Container.DataItem,"goodsid") %>)" title ="单击放大" style =" cursor :hand;float:left; margin-right:30px" />
                <input  id="BigPic" type="button" onclick =openwin(<%# DataBinder.Eval(Container.DataItem,"goodsid") %>)  value="单击放大" style =" position :absolute; left :55px; top:265px; border-style:none; width:100px "  />
                主题:<%# DataBinder .Eval (Container.DataItem ,"GoodsTitle") %><br />价格(元):<%# DataBinder .Eval (Container.DataItem ,"Price") %><br />交易地点:<%# DataBinder .Eval (Container.DataItem ,"Address") %><br />交易方式:<%# DataBinder .Eval (Container.DataItem ,"BuySell") %><br />姓名:<%# DataBinder .Eval (Container.DataItem ,"ContractMan") %><br />联系电话:<%# DataBinder .Eval (Container.DataItem ,"Phone") %><br />总数量: <%# DataBinder .Eval (Container.DataItem ,"Content") %><br />现有数量: <%# DataBinder .Eval (Container.DataItem ,"Con") %>
               
                </ItemTemplate>
            </asp:DataList>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="购买" EnableTheming="True" EnableViewState="False" />
            <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="default.aspx">返回首页</a>
            <uc1:SendInfo ID="SendInfo" runat="server" />
            <br /><br /><br /><br />
            <div style=" text-align :center">
            <asp:GridView ID="liuyanDl" runat="server" Width="590px" HorizontalAlign="center" AutoGenerateColumns ="false">
            <AlternatingRowStyle ForeColor ="black" BackColor="gray" />
            <Columns>
                <asp:BoundField HeaderText ="留言人名称" DataField ="UserName"/>
                <asp:BoundField HeaderText ="联系方式" DataField ="Phone" />
                <asp:BoundField HeaderText ="留言内容" DataField ="TitleContent" />
                <asp:BoundField HeaderText ="留言时间" DataField ="SendTime" />　
            </Columns>
            </asp:GridView><br /><br /><br />
            </div>
            </div>
            
		
	</div>
	
</div>
    </form>
</body>
</html>
