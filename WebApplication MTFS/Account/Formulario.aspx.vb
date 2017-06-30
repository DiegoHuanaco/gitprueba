Imports System
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports Owin

Partial Public Class Formulario
    Inherits Page
    'Protected Sub CreateUser_Click(sender As Object, e As EventArgs)
    '    Dim userName As String = Email.Text
    '    Dim manager = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)()
    '    Dim signInManager = Context.GetOwinContext().Get(Of ApplicationSignInManager)()
    '    Dim user = New ApplicationUser() With {.UserName = userName, .Email = userName}
    '    Dim result = manager.Create(user, Password.Text)



    '    If result.Succeeded Then
    '        ' Para obtener más información sobre cómo habilitar la confirmación de cuentas y el restablecimiento de contraseña, visite http://go.microsoft.com/fwlink/?LinkID=320771
    '        ' Dim code = manager.GenerateEmailConfirmationToken(user.Id)
    '        ' Dim callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request)
    '        ' manager.SendEmail(user.Id, "Confirmar cuenta", "Para confirmar la cuenta, haga clic <a href=""" & callbackUrl & """>aquí</a>.")

    '        signInManager.SignIn(user, isPersistent:=False, rememberBrowser:=False)
    '        IdentityHelper.RedirectToReturnUrl(Request.QueryString("ReturnUrl"), Response)
    '    Else
    '        ErrorMessage.Text = result.Errors.FirstOrDefault()
    '    End If
    'End Sub

    Protected Sub Operacion_Click(sender As Object, e As EventArgs)

        TextBox2.Text = TextBox1.Text

    End Sub

    Private Sub Formulario_Load(sender As Object, e As EventArgs) Handles Me.Load


        'If Not Me.IsPostBack Then
        Dim dt As New DataTable()
            dt.Columns.AddRange(New DataColumn(3) {New DataColumn("Id"), New DataColumn("Name"), New DataColumn("Country"), New DataColumn("Salary")})
            dt.Rows.Add(1, "John Hammond", "United States", 70000)
            dt.Rows.Add(2, "Mudassar Khan", "India", 40000)
            dt.Rows.Add(3, "Suzanne Mathews", "France", 30000)
            dt.Rows.Add(4, "Robert Schidner", "Russia", 50000)
            GridView1.DataSource = dt
            GridView1.DataBind()

            'Attribute to show the Plus Minus Button.
            GridView1.HeaderRow.Cells(0).Attributes("data-class") = "expand"

            'Attribute to hide column in Phone.
            GridView1.HeaderRow.Cells(2).Attributes("data-hide") = "phone"
            GridView1.HeaderRow.Cells(3).Attributes("data-hide") = "phone"

            'Adds THEAD and TBODY to GridView.
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader
        'End If


    End Sub
End Class

