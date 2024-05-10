<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Multimediaarchiving.Login" %>

<!DOCTYPE html>
<html lang="en" dir="rtl">
<head>
	<title>تسجيل الدخول</title>

    <link href="Css/loginpage.css" rel="stylesheet" />
	  <script src="Scripts/sweetalert.js" type="text/javascript"></script>
          <script>
              function alertme() {

                  Swal.fire({
                      icon: 'error',
                      title: 'المدخلات غيرصحيحة',
                      showConfirmButton: false,
                      timer: 2500
                  })
              }
          </script>
	<script>
        function alertme1() {

            Swal.fire({
                icon: 'error',
                title: 'ادخل اسم المستخدم من فضلك',
                showConfirmButton: false,
                timer: 2500
            })
        }
    </script>
	<script>
        function alertme2() {

            Swal.fire({
                icon: 'error',
                title: 'ادخل كلمة المرور من فضلك',
                showConfirmButton: false,
                timer: 2500
            })
        }
    </script>
<!--===============================================================================================-->
</head>

<body style="background-color: #666666;">
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" runat="server">
					<span class="login100-form-title p-b-43">
						تسجيل الدخول
					</span>
					
					
					<div class="wrap-input100 validate-input" >
						<asp:TextBox ID="Txuser" CssClass="input100" runat="server"></asp:TextBox>
						<span class="focus-input100"></span>
						<span class="label-input100">اسم المستخدم</span>
					</div>
					
					
					<div class="wrap-input100 validate-input">
						<asp:TextBox ID="Txpass" CssClass="input100" TextMode="Password" runat="server"></asp:TextBox>
						<span class="focus-input100"></span>
						<span class="label-input100">كلمة المرور</span>
					</div>

					<div class="flex-sb-m w-full p-t-3 p-b-32">
						<div class="contact100-form-checkbox">
							
							
						</div>

						<div>
						
						</div>
					</div>
			

					<div class="container-login100-form-btn">
							<asp:Button ID="Button1" CssClass="login100-form-btn" runat="server" Text="ابدأ" OnClick="Button1_Click" />
							
					</div>
					
					<div class="text-center p-t-46 p-b-20">
					
					</div>

					<div class="login100-form-social flex-c-m">
						<a href="#" class="login100-form-social-item flex-c-m bg1 m-r-5">
							<i class="fa fa-facebook-f" aria-hidden="true"></i>
						</a>

						<a href="#" class="login100-form-social-item flex-c-m bg2 m-r-5">
							<i class="fa fa-twitter" aria-hidden="true"></i>
						</a>
					</div>
				</form>

				<div class="login100-more" style="background-image: url('Images/Loginimage.png');">
				</div>
			</div>
		</div>
	</div>
	
	

	


</body>
	</html>