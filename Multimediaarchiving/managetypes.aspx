<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="managetypes.aspx.cs" Inherits="Multimediaarchiving.managetypes" %>

<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!doctype html>
<html lang="en" dir="rtl">
  <head>
    <!-- Required meta tags -->
        <title>ادارة اصناف الوثائق</title>


    <link rel="stylesheet" href="fonts/icomoon/style.css">


    <!-- Bootstrap CSS -->
      <link href="Css/bootstrap.min.css" rel="stylesheet" />
    <!-- Style -->
      <link href="Css/uploadingpage.css" rel="stylesheet" />
      <link href="Css/loginpage.css" rel="stylesheet" />
	  <script src="Scripts/sweetalert.js" type="text/javascript"></script>
          <script>
              function alertme() {

                  Swal.fire({
                      icon: 'success',
                      title: 'تمت اضافة صنف جديد',
                      showConfirmButton: false,
                      timer: 2500
                  })
              }
          </script>
      <script>
          function alertme1() {

              Swal.fire({
                  icon: 'error',
                  title: 'حقل الصنف فارغ ',
                  showConfirmButton: false,
                  timer: 2500
              })
          }
      </script>
      <script type="text/javascript" src="Scripts/JavaScriptmin.js"></script>
    <script type="text/javascript">
        function ShowProgress() {
            setTimeout(function () {
                var modal = $('<div />');
                modal.addClass("modal");
                $('body').append(modal);
                var loading = $(".loading");
                loading.show();
                var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
                var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
                loading.css({ top: top, left: left });
            }, 1000);
        }
        $('form').live("submit", function () {
            ShowProgress();
        });
    </script>
  </head>
  <body>
  

  <div class="content">
    
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-10">
          

          <div class="row justify-content-center">
            <div class="col-md-6">
              
              <h4 class="heading mb-4">ادارة اصناف الوثائق</h4>
              <p>يمكنك اضافة اصناف جديدة , او اجراء التعديل على الاصناف السابقة او تحديثها , في حال حذف او تحديث صنف معين ,ستبقى تظهر بالتقارير السابقة على هيئتها الاولى</p>

              <p>
                  <asp:Label ID="Lsent" runat="server" Text="Label" Visible="False"></asp:Label>
                  <asp:Label ID="Ldate" runat="server" Visible="False"></asp:Label>
                   <asp:Label ID="Luser" runat="server" Visible="False"></asp:Label>

                  <img src="Images/managtypes.png" alt="Image" class="img-fluid"></p>

            </div>
            <div class="col-md-6">
              
              <form class="mb-5" method="post" id="contactForm" name="contactForm" runat="server">

                  <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1rrr" KeyFieldName="Id" Theme="iOS" Font-Names="Almarai" Width="100%">
                      <SettingsEditing Mode="PopupEditForm"></SettingsEditing>

                      <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

                      <SettingsSearchPanel Visible="True"></SettingsSearchPanel>
                      <Columns>
                          <dx:GridViewCommandColumn VisibleIndex="0" ShowNewButtonInHeader="True" ShowDeleteButton="True"></dx:GridViewCommandColumn>
                          <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1" Caption="التسلسل">
                              <EditFormSettings Visible="False"></EditFormSettings>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="typo" VisibleIndex="2" Caption="الصنف"></dx:GridViewDataTextColumn>
                      </Columns>
                  </dx:ASPxGridView>

                  <%--<div class="row">
                  <div class="col-md-12 form-group">
                    <asp:TextBox ID="TXname" runat="server" class="form-control" Height="100px"  placeholder="اضف صــنفا جديدا"></asp:TextBox>
                  </div>
                </div>
                
                  <div class="row">
                  <div class="col-12">
                    <asp:Button ID="Button1" runat="server" Text="اضـــافة" class="btn btn-primary rounded-0 py-2 px-4" OnClick="Button1_Click"  />
                  <span class="submitting"></span>
                      
          
                  </div>
                </div>
                  <div class="divgrid">
                      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourcetyp" CssClass="grd" PagerStyle-CssClass="pager"
                          HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True" >

                          <Columns>
                              <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                              <asp:BoundField DataField="Id" HeaderText="التسلسل" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                              <asp:BoundField DataField="typo" HeaderText="التصنيف" SortExpression="typo"></asp:BoundField>
                              
                          </Columns>

                          <HeaderStyle CssClass="header"></HeaderStyle>

                          <PagerStyle CssClass="pager"></PagerStyle>

                          <RowStyle CssClass="rows"></RowStyle>
                      </asp:GridView>


                      <asp:SqlDataSource runat="server" ID="SqlDataSourcetyp" ConnectionString='<%$ ConnectionStrings:Mycon %>' DeleteCommand="DELETE FROM [typ] WHERE [Id] = @Id" InsertCommand="INSERT INTO [typ] ([typo]) VALUES (@typo)" ProviderName='<%$ ConnectionStrings:Mycon.ProviderName %>' SelectCommand="SELECT * FROM [typ]" UpdateCommand="UPDATE [typ] SET [typo] = @typo WHERE [Id] = @Id">
                          <DeleteParameters>
                              <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                          </DeleteParameters>
                          <InsertParameters>
                              <asp:Parameter Name="typo" Type="String"></asp:Parameter>
                          </InsertParameters>
                          <UpdateParameters>
                              <asp:Parameter Name="typo" Type="String"></asp:Parameter>
                              <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                          </UpdateParameters>
                      </asp:SqlDataSource>
                  </div>--%>
                  <asp:SqlDataSource runat="server" ID="SqlDataSource1rrr" ConnectionString='<%$ ConnectionStrings:Mycon %>' DeleteCommand="DELETE FROM [typ] WHERE [Id] = @Id" InsertCommand="INSERT INTO [typ] ([typo]) VALUES (@typo)" ProviderName='<%$ ConnectionStrings:Mycon.ProviderName %>' SelectCommand="SELECT * FROM [typ]" UpdateCommand="UPDATE [typ] SET [typo] = @typo WHERE [Id] = @Id">
                      <DeleteParameters>
                          <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                      </DeleteParameters>
                      <InsertParameters>
                          <asp:Parameter Name="typo" Type="String"></asp:Parameter>
                      </InsertParameters>
                      <UpdateParameters>
                          <asp:Parameter Name="typo" Type="String"></asp:Parameter>
                          <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                      </UpdateParameters>
                  </asp:SqlDataSource>
              </form>

             </div>
          </div>
        </div>
      </div>
    </div>

  </div>
    
    

 

  </body>
</html>

