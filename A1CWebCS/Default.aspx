<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="A1CWebCS._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">

        <div class="col-md-12">
             <asp:Image ID="Image2" runat="server"  ImageUrl="~/Content/A1Cheart.ico" ImageAlign="Left" Width="100" />
             <div style="font-family: 'Times New Roman', Times, serif; font-size: 36pt; font-style: italic; font-weight: bold;">
                 <asp:Label ID="Label2" runat="server"  Text="A1CWeb"></asp:Label>
             </div>
            <p class="lead">A free tool to assist you in managing your Blood Sugar levels.</p>
        </div>

    </div>

    <hr />
    <br />


    <div class="row">

        <div class="col-sm-4">
            Blood Sugar Readings<br />
 
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" Width="300px">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" />
                <asp:BoundField DataField="Reading_Date" HeaderText="Date" SortExpression="Reading_Date"  ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" />
                <asp:BoundField DataField="Reading_Value" HeaderText="Value" SortExpression="Reading_Value"  ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="Data Source=s13.winhost.com;Initial Catalog=DB_103045_a1cdb;Persist Security Info=True;User ID=DB_103045_a1cdb_user;Password=Patty02$"  providerName="System.Data.SqlClient" 
            SelectCommand="SELECT ID,  FORMAT([Reading_Date],'yyyy/MM/dd') as 'Reading_Date', Reading_Value FROM [tbl_A1C] Order By Reading_Date desc">
        </asp:SqlDataSource>
  
        </div>

        <div class="col-sm-8">
            .col-sm-8<br />
        </div>

    </div>

</asp:Content>
