<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="A1CWebCS._Default" %>

<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>

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

    <br />


    <div class="row">

        <div class="col-sm-4">
            <asp:Label ID="Label6" runat="server" Text="Blood Sugar Readings" Font-Size="14pt"></asp:Label><br /><br />
 
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

            <asp:Label ID="Label7" runat="server" Text="A1C Value Entry" Font-Size="14pt"></asp:Label><br /><br />

            <asp:Table ID="Table1" runat="server">
                <asp:TableRow>
                    <asp:TableCell Width="120px">Estimated A1C:</asp:TableCell>
                    <asp:TableCell Width="60px">30 Day:</asp:TableCell>
                    <asp:TableCell Width="100px"> <asp:Label ID="lbl_30Day" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell Width="60px">60 Day:</asp:TableCell>
                    <asp:TableCell Width="100px"> <asp:Label ID="lbl_60Day" runat="server" Text=""></asp:Label></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Width="120px"></asp:TableCell>
                    <asp:TableCell Width="60px">90 Day:</asp:TableCell>
                    <asp:TableCell Width="100px"> <asp:Label ID="lbl_90Day" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell Width="60px">Overall::</asp:TableCell>
                    <asp:TableCell Width="100px"> <asp:Label ID="lbl_Overall" runat="server" Text=""></asp:Label></asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <br /><br />

            <asp:Table ID="Table2" runat="server">
                <asp:TableRow>
                    <asp:TableCell Width="120px" VerticalAlign="Top">
                        Entry Date:<br />

                        <eo:DatePicker ID="DatePicker1" runat="server" Width="120" PickerFormat="yyyy/MM/dd"></eo:DatePicker>

                    </asp:TableCell>

                    <asp:TableCell Width="10px"></asp:TableCell>

                    <asp:TableCell Width="120px" VerticalAlign="Top">
                        Entry Value:<br>
                        <asp:TextBox ID="TextBox1" runat="server" Width="70"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender runat="server" InputDirection="RightToLeft" Mask="999" MaskType="Number" TargetControlID="TextBox1"></ajaxToolkit:MaskedEditExtender>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

        </div>

    </div>

    <br /><br />

    <div class="row">
        <div class="col-sm-2"><asp:Button ID="btn_Add" runat="server" Text="Add" class="btn btn-primary" Width="100%" OnClick="btn_Add_Click" /></div>
        <div class="col-sm-2"><asp:Button ID="btn_Update" runat="server" Text="Update" class="btn btn-primary" Width="100%" OnClick="btn_Update_Click" /></div>
        <div class="col-sm-2"><asp:Button ID="btn_Delete" runat="server" Text="Delete" class="btn btn-primary" Width="100%" OnClick="btn_Delete_Click" /></div>
        <div class="col-sm-2"><asp:Button ID="btn_Clear" runat="server" Text="Clear" class="btn btn-primary" Width="100%" OnClick="btn_Clear_Click" /></div>
    </div>
    <br />
    <div class="row">
        <div class="col-sm-2"><asp:Button ID="btn_Export" runat="server" Text="Export" class="btn btn-primary" Width="100%" OnClick="btn_Export_Click" /></div>
        <div class="col-sm-2"><asp:Button ID="btn_About" runat="server" Text="About" class="btn btn-primary" Width="100%" OnClick="btn_About_Click" /></div>
    </div>

</asp:Content>
