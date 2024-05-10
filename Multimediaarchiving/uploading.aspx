<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uploading.aspx.cs" Inherits="Multimediaarchiving.uploading" %>

<!doctype html>
<html lang="en" dir="rtl">
  <head>
    <!-- Required meta tags -->
        <title>اضافة وثيقة</title>


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
                      title: 'تمت اضافة الوثيقة',
                      showConfirmButton: false,
                      timer: 2500
                  })
              }
          </script>
           <script>
               function alertme1() {

                   Swal.fire({
                       
                       title: 'المعلومات غير كــاملة',
                       text: 'يجب ادخال جميع الحقول',
                       showClass: {
                           popup: 'animate__animated animate__fadeInDown'
                       },
                       hideClass: {
                           popup: 'animate__animated animate__fadeOutUp'
                       }
                   })
               }
           </script>
           <script>
               function alertme2() {

                   Swal.fire({

                       title: 'قم بتحميل المف من فضلك',
                       text: 'يجب ادخال جميع الحقول',
                       showClass: {
                           popup: 'animate__animated animate__fadeInDown'
                       },
                       hideClass: {
                           popup: 'animate__animated animate__fadeOutUp'
                       }
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
              
              <h4 class="heading mb-4">اضافة وثيقة</h4>
              <p>من فضلك قم برفع الملف واكتب وصفا دقيقا ثم اختر كلمات مفتاحية مناسبة ,ثم انقر على زر الحفظرجاء انتظر حتى تظهر لك رسالة تأييد الحفظ , يختلف وقت التحميل حسب حجم الملف المرفق</p>

              <p>
                  <asp:Label ID="Lsent" runat="server" Text="Label" Visible="False"></asp:Label>
                  <asp:Label ID="Ldate" runat="server" Visible="False"></asp:Label>
                   <asp:Label ID="Luser" runat="server" Visible="False"></asp:Label>

                  <img src="Images/uploadbg.png" alt="Image" class="img-fluid"></p>

            </div>
            <div class="col-md-6">
              
              <form class="mb-5" method="post" id="contactForm" name="contactForm" runat="server">

                <div class="row">
                  <div class="col-md-12 form-group">
                      <%--<asp:TextBox  ID="txdescp"  runat="server" class="form-control" Height="100px" TextMode="MultiLine" Rows="3" placeholder="ادخل وصفا عاما عن الوثيقة" ></asp:TextBox>--%>
                      <asp:DropDownList ID="drtype" runat="server" class="form-control">
                          <asp:ListItem>اختر نوع الوثيقة</asp:ListItem>
                          <asp:ListItem>حكومية</asp:ListItem>
                          <asp:ListItem>شخصية</asp:ListItem>
                          <asp:ListItem>عسكرية</asp:ListItem>
                          <asp:ListItem></asp:ListItem>
                      </asp:DropDownList>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12 form-group">
                   <asp:FileUpload ID="Filebrows" runat="server" CssClass="form-control" />
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12 form-group">
                    <asp:TextBox ID="Txdescp" runat="server" class="form-control" Height="100px" TextMode="MultiLine" Rows="3" placeholder="ادخل وصفا عاما دقيقا ومختصرا عن الوثيقة"></asp:TextBox>
                  </div>
                </div>
                    <div class="row">
                  <div class="col-md-12 form-group">
                    <asp:TextBox ID="txkwords" runat="server" class="form-control" Height="80px" TextMode="MultiLine" Rows="3" placeholder="اضف على الاقل كلمتين مفتاحيتين , تدل على الوثيقة"></asp:TextBox>
                  </div>
                </div>

          <%--     <div class="loading" align="center">
            جاري التحميل<br />
            <br />
            <img src="images/loading.gif" alt="" />
        </div>--%>
                                  <div class="row">
                  <div class="col-12">
                    <asp:Button ID="Button1" runat="server" Text="الحفظ" class="btn btn-primary rounded-0 py-2 px-4" OnClick="Button1_Click"  />
                  <span class="submitting"></span>
                  </div>
                </div>
              </form>

             </div>
          </div>
        </div>
      </div>
    </div>

  </div>
    
    

 

  </body>
</html>
