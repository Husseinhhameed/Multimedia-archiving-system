<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logs.aspx.cs" Inherits="Multimediaarchiving.logs" %>

<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Id" EnableTheming="True" Font-Names="Almarai" RightToLeft="True" Theme="iOS" Width="100%">
                <Settings ShowFilterRow="True" ShowFilterRowMenu="True" ShowGroupPanel="True" ShowGroupedColumns="True" ShowGroupFooter="VisibleAlways"></Settings>

                <SettingsBehavior MergeGroupsMode="Always"></SettingsBehavior>

                <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />

                <SettingsPopup>
                    <FilterControl AutoUpdatePosition="False"></FilterControl>
                </SettingsPopup>

                <SettingsSearchPanel Visible="True"></SettingsSearchPanel>
                <StylesPopup>
                    <HeaderFilter>
                        <Header BackColor="#c2d3ed">
                        </Header>
                    </HeaderFilter>
                </StylesPopup>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0">
                        <EditFormSettings Visible="False"></EditFormSettings>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="dtype" VisibleIndex="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="docdescrp" VisibleIndex="2"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="dockeword" VisibleIndex="3"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="entryname" VisibleIndex="4"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="entrydate" VisibleIndex="5"></dx:GridViewDataDateColumn>
                </Columns>
                <Styles>
                    <GroupPanel BackColor="#c2d3ed"></GroupPanel>

                    <FilterCell BackColor="Aqua">
                        <Border BorderColor="#660066" BorderStyle="Inset" />
                    </FilterCell>
                    <HeaderFilterItem BackColor="#000066" ForeColor="#CCFFFF">
                    </HeaderFilterItem>
                </Styles>
            </dx:ASPxGridView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Mycon %>' ProviderName='<%$ ConnectionStrings:Mycon.ProviderName %>' SelectCommand="SELECT [Id], [dtype], [docdescrp], [dockeword], [entryname], [entrydate] FROM [uploaded]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
