Imports System
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports Owin
Imports MTFS.BL
Imports System.Web.UI.DataVisualization.Charting
Imports System.Drawing

Partial Public Class Graficos

    Inherits Page

#Region "VARIABLES"

    Private WithEvents vpo_KPIXAreas As oCls_Indicadores
    Private WithEvents vpo_Areas As oCls_Areas
    Private WithEvents vpo_Equipos As oCls_Equipos
    Dim vgd_fecha As Date = CDate(FormatDateTime(Date.Today, DateFormat.ShortDate) & " " & TimeOfDay.Hour.ToString & ":" & TimeOfDay.Minute.ToString) 'VARIABLE QUE MANEJA LA MODIFICACION DE LA CAJA


#End Region


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

        'TextBox2.Text = TextBox1.Text
        UpdatePanel1.Update
        pln_LlenarGrafico(DropDownListEquipos.Text)


    End Sub

    Private Sub pln_LlenarGrafico(ByVal pvi_IdEquipo As Integer)

        vpo_Equipos = New oCls_Equipos

        Dim vlo_DT_Parametros As DataTable
        Dim vlo_DT_Temperatura As DataTable

        Dim vli_valor_minimo As Integer
        Dim vli_valor_maximo As Integer

        vlo_DT_Parametros = vpo_Equipos.fgo_ObtenerParametrosEquipo(pvi_IdEquipo, vgd_fecha, vgd_fecha)

        vli_valor_minimo = vlo_DT_Parametros(0)("valor_min")
        vli_valor_maximo = vlo_DT_Parametros(0)("valor_max")

        vlo_DT_Temperatura = vpo_Equipos.fgo_ObtenerTemperaturaEquipo(pvi_IdEquipo, vgd_fecha, vgd_fecha)

        Dim vli_cantidad_registros As Integer = vlo_DT_Temperatura.Rows.Count - 1

        Dim datoX(vli_cantidad_registros) As Integer
        Dim datoY(vli_cantidad_registros) As Integer
        Dim legendaX(vli_cantidad_registros) As Date

        Dim datoXMAX(vli_cantidad_registros) As Integer
        Dim datoYMAX(vli_cantidad_registros) As Integer

        Dim datoXMIN(vli_cantidad_registros) As Integer
        Dim datoYMIN(vli_cantidad_registros) As Integer

        For p = 0 To vlo_DT_Temperatura.Rows.Count - 1

            datoY(p) = vlo_DT_Temperatura(p)("valor")
            datoX(p) = p
            legendaX(p) = CDate(vlo_DT_Temperatura(p)("fecha"))

            datoYMAX(p) = vli_valor_maximo
            datoXMAX(p) = p

            datoYMIN(p) = vli_valor_minimo
            datoXMIN(p) = p

            'Chart1.Series("Series1").Legend = vlo_DT_Temperatura(p)("fecha")

            'Chart1.Series("Series1").Label = vlo_DT_Temperatura(p)("fecha") 'MUESTRA INFORMACION EN LOS PUNTOS

            'Chart1.Series("Series1").AxisLabel = vlo_DT_Temperatura(p)("fecha")


            'Chart1.Series("Series1").AxisLabel = legendaX

            'Chart1.ChartAreas("Series1").AxisX.la
            'Chart1.Series("Series1").Points(p).AxisLabel = vlo_DT_Temperatura(p)("fecha")


        Next

        Chart1.ChartAreas(0).AxisY.StripLines.Add(New StripLine())
        Chart1.ChartAreas(0).AxisY.StripLines(0).BackColor = Color.FromArgb(80, 252, 180, 65)
        Chart1.ChartAreas(0).AxisY.StripLines(0).StripWidth = vli_valor_maximo - vli_valor_minimo
        Chart1.ChartAreas(0).AxisY.StripLines(0).Interval = 1000
        Chart1.ChartAreas(0).AxisY.StripLines(0).IntervalOffset = vli_valor_minimo


        'Chart1.Series("Series1").Points.DataBindXY(legendaX, datoY)
        'Chart1.Series("max").Points.DataBindXY(legendaX, datoYMAX)
        'Chart1.Series("min").Points.DataBindXY(legendaX, datoYMIN)

        Chart1.Series("Series1").Points.DataBindXY(datoX, datoY)
        Chart1.Series("max").Points.DataBindXY(datoX, datoYMAX)
        Chart1.Series("min").Points.DataBindXY(datoX, datoYMIN)


        '
        UpdatePanel2.Update()
    End Sub


    Private Sub Formulario_Load(sender As Object, e As EventArgs) Handles Me.Load


        If Not Me.IsPostBack Then

            mpn_LlenarControlDropEquipos()

        End If


    End Sub

    Private Sub mpn_LlenarControlDropEquipos()

        vpo_Equipos = New oCls_Equipos

        Dim vlo_DT_Equipos As DataTable

        'OBTENGO EL LISTADO DE EQUIPOS Y LO PASO AL DROPDOWNLIST
        vlo_DT_Equipos = vpo_Equipos.fgo_ObtenerListadoEquipoXCliente(1)

        DropDownListEquipos.DataSource = vlo_DT_Equipos
        DropDownListEquipos.DataBind()

    End Sub

    Private Sub mpn_LlenarKPIXAreas(ByVal pvi_IdArea As Integer, ByVal pvd_fechaInicio As Date, ByVal pvd_fechaTermino As Date)

        vpo_KPIXAreas = New oCls_Indicadores

        Dim vlo_DT_KPIAreas As DataTable

        'OBTENGO EL AREA Y LO PASO AL DROPDOWNLIST
        vlo_DT_KPIAreas = vpo_KPIXAreas.fgo_ObtenerKPIXArea(pvi_IdArea, pvd_fechaInicio, pvd_fechaTermino)

        oGvResumenArea.DataSource = vlo_DT_KPIAreas
        oGvResumenArea.DataBind()

        UpdatePanel1.Update()

    End Sub

    Private Sub grid1()

        Dim dt As New DataTable()

        dt.Columns.AddRange(New DataColumn(3) {New DataColumn("Id"), New DataColumn("Name"), New DataColumn("Country"), New DataColumn("Salary")})
        dt.Rows.Add(1, "John Hammond", "United States", 70000)
        dt.Rows.Add(2, "Mudassar Khan", "India", 40000)
        dt.Rows.Add(3, "Suzanne Mathews", "France", 30000)
        dt.Rows.Add(4, "Robert Schidner", "Russia", 50000)

        'GridView1.DataSource = dt
        'GridView1.DataBind()



        ''Attribute to show the Plus Minus Button.
        'GridView1.HeaderRow.Cells(0).Attributes("data-class") = "expand"

        ''Attribute to hide column in Phone.
        'GridView1.HeaderRow.Cells(2).Attributes("data-hide") = "phone"
        'GridView1.HeaderRow.Cells(3).Attributes("data-hide") = "phone"

        ''Adds THEAD and TBODY to GridView.
        'GridView1.HeaderRow.TableSection = TableRowSection.TableHeader
    End Sub

    Private Sub grid2()

        Dim oGridView = New GridView

        Dim oGridViewRow = New GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert)

        Dim oTableCell = New TableCell

        oTableCell.Text = ""

        oTableCell.ColumnSpan = 0

        oGridViewRow.Cells.Add(oTableCell)

        'agrego una columna sin nombre

        oTableCell.Text = ""

        oTableCell.ColumnSpan = 0

        oGridViewRow.Cells.Add(oTableCell)

        'agrego una columna llamada SE2

        oTableCell = New TableCell()

        oTableCell.Text = "SE 2"

        oTableCell.ColumnSpan = 1

        oGridViewRow.Cells.Add(oTableCell)

        'Agrego una columna Employee que esta combinada con otra columna ( 2 columnas)

        oTableCell = New TableCell()

        oTableCell.Text = "Employee"

        oTableCell.ColumnSpan = 1

        oGridViewRow.Cells.Add(oTableCell)

        'Agrego la cabecera creada a mi grilla  y listo.

        'oGridView.Controls(0).Controls.AddAt(0, oGridViewRow)
        'GridView2.Controls[0].Controls.AddAt(0, oGridViewRow)
        'GridView2.DataSource = oGridView
        'GridView2.DataBind()

    End Sub

    Protected Sub DropDownListAreas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownListEquipos.SelectedIndexChanged

        'mpn_LlenarKPIXAreas(DropDownListAreas.Text, Date.Today, DateAdd(DateInterval.Minute, -1, DateAdd(DateInterval.Day, 1, Date.Today)))

    End Sub

End Class

