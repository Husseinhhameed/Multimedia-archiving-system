<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="repos.aspx.cs" Inherits="Multimediaarchiving.repos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>البحث في الارشيف</title>
  
   <link href="Css/searchmain.css" rel="stylesheet" />
    <script src="Scripts/sweetalert.js" type="text/javascript"></script>
          <script>
              function alertme() {

                  Swal.fire({
                      icon: 'error',
                      title: 'اختر معايير البحث من فضلك',
                      showConfirmButton: false,
                      timer: 2500
                  })
              }
          </script>
       <script>
           function alertme1() {

               Swal.fire({
                   icon: 'error',
                   title: 'لم يتم العثور على نتائج',
                   showConfirmButton: false,
                   timer: 2500
               })
           }
       </script>
  </head>
  <body>
    <div class="s013">
      <form runat="server">
        <fieldset>
          <legend>ادخل التاريخ و نوع الوثيقة والموظف المدخل</legend>
<%--            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
        </fieldset>
        <div class="inner-form" dir="rtl">
          <div class="left">
            <div class="input-wrap first">
              <div class="input-field first">
                <label>من تاريخ</label>
                <asp:TextBox ID="TextBox1" runat="server" type="Date"></asp:TextBox>
              </div>
            </div>
               <div class="input-wrap first">
              <div class="input-field first">
                <label>الى تاريخ</label>
                <asp:TextBox ID="TextBox2" runat="server" type="Date"></asp:TextBox>
              </div>
            </div>
            <div class="input-wrap second">
              <div class="input-field second">
                <label>الصنف</label>
                <div class="input-select">
                 <%-- <select data-trigger="" name="choices-single-defaul">
                    <option placeholder="">1 adult</option>
                    <option>2 adults</option>
                    <option>3 adults</option>
                    <option>4 adults</option>
                  </select>--%>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="drp" AutoPostBack="True" DataSourceID="SqlDataSourcetypesreport" DataTextField="typo" DataValueField="typo" AppendDataBoundItems="True">
                     <asp:ListItem Value="0" Text="جميع الاصناف"></asp:ListItem>

                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourcetypesreport" ConnectionString='<%$ ConnectionStrings:Mycon %>' ProviderName='<%$ ConnectionStrings:Mycon.ProviderName %>' SelectCommand="SELECT [typo] FROM [typ]"></asp:SqlDataSource>
                </div>
              </div>
            </div>

              <div class="input-wrap second">
              <div class="input-field second">
                <label>المدخل</label>
                <div class="input-select">
                 <%-- <select data-trigger="" name="choices-single-defaul">
                    <option placeholder="">1 adult</option>
                    <option>2 adults</option>
                    <option>3 adults</option>
                    <option>4 adults</option>
                  </select>--%>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="drp" AutoPostBack="True" DataSourceID="SqlDataSourcetemamembersreport" DataTextField="usrnm" DataValueField="usrnm" AppendDataBoundItems="True">
                     <asp:ListItem Value="0" Text="جميع الموظفين"></asp:ListItem>

                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourcetemamembersreport" ConnectionString='<%$ ConnectionStrings:Mycon %>' ProviderName='<%$ ConnectionStrings:Mycon.ProviderName %>' SelectCommand="SELECT [usrnm] FROM [usrnms]"></asp:SqlDataSource>
                </div>
              </div>
            </div>
          </div>
            <asp:Button ID="Button1" class="btn1" runat="server" Text="ابحث" OnClick="Button1_Click"  />
        </div>
          <asp:GridView ID="GridView1" runat="server" CssClass="grd" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True" AllowSorting="True" OnRowDataBound="GridView1_RowDataBound">
            
              <HeaderStyle CssClass="header" />
              <PagerStyle CssClass="pager" />
              <RowStyle CssClass="rows" />
          </asp:GridView>
                   <center><asp:Label ID="Label1" runat="server" Text="" style="color:red; margin-top:20px; font-size: 20px; "></asp:Label></center>

      </form>
    </div>
    <script src="Scripts/searchchoices.js"></script>
    <script>
        const choices = new Choices('[data-trigger]',
            {
                searchEnabled: false,
                itemSelectText: '',
            });

    </script>
  </body>
</html>