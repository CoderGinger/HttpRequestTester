<%@ Page Async="true" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HttpRequestApplication.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Http Request Tester</title>
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <script src="Scripts/jquery-3.3.1.min.js"></script>
</head>
<body>
    <h1>HttpClient Tester</h1>
    <form runat="server">
        <div class="form-group p-2">
            <div class="row">
                <div class="col-md-6">
                    <strong>URL to Test</strong>
                    <asp:TextBox runat="server" ID="TextBoxUrl" class="form-control" placeholder="Fully Qualified URL">
                    </asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="TextBoxUrl"
                        ValidationExpression="^http(s)?://([\w-]+.)+[\w-]+(/[\w- ./?%&=])?$"
                        ErrorMessage="Use full URL to include http(s)">
                    </asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="row pt-2">
                <div class="col-md-3">
                    <strong>TLS Protocol:</strong>
                    <asp:DropDownList runat="server" class="form-control dropdown" ID="DropDownTls">
                        <asp:ListItem Text="Select TLS Version" Selected="True" Value="0"></asp:ListItem>
                        <asp:ListItem Text="TLS 1.0" Value="1"></asp:ListItem>
                        <asp:ListItem Text="TLS 1.1" Value="2"></asp:ListItem>
                        <asp:ListItem Text="TLS 1.2" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="DropDownTls"
                        InitialValue="0"
                        ErrorMessage="Required">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <strong>Bypass Certificate Errors:</strong>
                    <asp:CheckBox runat="server" ID="CheckBoxBypassCertificateErrors" CssClass="custom-checkbox" />
                </div>
            </div>
            <div runat="server" id="DivResponse" visible="false" class="row pt-2">
                <div class="col-md-10">
                    <strong>Response:</strong><br />
                    <span runat="server" id="SpanResponse"></span>
                </div>
            </div>
        </div>
        <div class="pl-2">
            <asp:Button runat="server" ID="ButtonTestUrl" OnClick="ButtonTestUrl_Click"
                class="btn btn-primary" Text="Test URL"></asp:Button>
        </div>
    </form>
</body>
</html>
