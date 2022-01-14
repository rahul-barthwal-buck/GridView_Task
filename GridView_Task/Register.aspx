<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GridView_Task.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link href="style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <h1 class="display-3 d-flex justify-content-center">Register</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-6 col-sm-4">
                    <div class="d-flex justify-content-center">
                           <asp:Table runat="server" CssClass="table table-borderless RegisterTable">
                            <asp:TableRow>
                               <asp:TableCell>
                                   <asp:Label ID="lblUserName" runat="server" Text="User Name"></asp:Label>
                               </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox ID="txtUserName" runat="server" placeholder="Enter UserName"></asp:TextBox>&nbsp;
                                     <asp:RequiredFieldValidator ID="rvfUserName" runat="server" ValidationGroup="Register" ErrorMessage="User Name is required, cannot be blank" Text="*" ControlToValidate="txtUserName" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="regexUserName" runat="server" ValidationGroup="Register" ErrorMessage="User Name Should Contain Characters and Numbers only or should be greater than 3 and less than or equal 20 Characters" Text="*" ControlToValidate="txtUserName" ValidationExpression="(?!^[0-9]*$)^([0-9a-zA-Z]{3,20})$" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RegularExpressionValidator>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell><asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox ID="txtEmail" ClientIDMode="Static" runat="server" placeholder="Enter Email"></asp:TextBox>&nbsp;
                                     <asp:RequiredFieldValidator ID="reqEmailValidator" runat="server" ValidationGroup="Register" ErrorMessage="Email is required, can't be blank" ControlToValidate="txtEmail" ForeColor="Red" Text="*" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ErrorMessage="Email is not valid or Should be less than or equal to 38 Characters" ValidationGroup="Register" ValidationExpression="^[a-zA-Z]{1}[a-zA-Z0-9.]{1,20}[@]{1}[a-zA-Z]{2,10}[.]{1}[a-zA-Z]{2,5}$" ControlToValidate="txtEmail" ForeColor="Red" Text="*" SetFocusOnError="true" Display="Dynamic"></asp:RegularExpressionValidator>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                 <asp:TableCell>
                                   <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                               </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter Password"></asp:TextBox>&nbsp;
                                     <asp:RequiredFieldValidator ID="rvfPassword" runat="server" ValidationGroup="Register" ErrorMessage="Password is required, cannot be blank" Text="*" ControlToValidate="txtPassword" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="regexPassword" runat="server" ValidationGroup="Register" ControlToValidate="txtPassword"  ErrorMessage="Password should be minimum of 8 and maximum of 16 characters long and should contain at least one number, atleast one lowercase letter , atleast one uppercase letter" Text="*" Display="Dynamic" ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,16})$" ForeColor="Red" SetFocusOnError="true"></asp:RegularExpressionValidator>
                                </asp:TableCell>
                            </asp:TableRow>
                             <asp:TableRow>
                                 <asp:TableCell>
                                   <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
                               </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Enter New Password"></asp:TextBox>&nbsp;
                                     <asp:RequiredFieldValidator ID="rvfVerifyPassword" runat="server" ValidationGroup="Register" ErrorMessage=" Veify Password is required, cannot be blank" Text="*" ControlToValidate="txtConfirmPassword" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="regexVerifyPassword" runat="server" ValidationGroup="Register" ControlToValidate="txtConfirmPassword"  ErrorMessage=" Confirm Password should be minimum of 8 and maximum of 16 characters long and should contain at least one number, atleast one lowercase letter , atleast one uppercase letter" Text="*" Display="Dynamic" ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,16})$" ForeColor="Red" SetFocusOnError="true"></asp:RegularExpressionValidator>
                                     <asp:CompareValidator ID="passwordCompareValidator" runat="server" ErrorMessage="Confirm Password does not match" ValidationGroup="Register" ControlToValidate="txtPassword" ControlToCompare="txtConfirmPassword" ForeColor="Red" Text="*" SetFocusOnError="true" Display="Dynamic"></asp:CompareValidator>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="2">
                                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-success" ValidationGroup="Register" OnClick="btnRegister_Click" />&nbsp;
                                    <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-primary" OnClick="btnReset_Click" />&nbsp;
                                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-secondary" OnClick="btnLogin_Click" />&nbsp;
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="d-flex justify-content-center">
                        <asp:ValidationSummary ID="vsRegister" runat="server"  ValidationGroup="Register" ForeColor="Red" CssClass="alert alert-danger RegisterValidation" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="d-flex justify-content-center">
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
