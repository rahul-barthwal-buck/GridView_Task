<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="GridView_Task.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GridView Task</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link href="style.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
       <div class="container">
        <h1 class="display-3">Product Details</h1>
        <h3 class="h4">Search</h3>
        <asp:TextBox ID="txtSearch" runat="server" placeholder="Search Product" TextMode="Search"></asp:TextBox>
        <asp:Button CssClass="btn btn-info" ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" ToolTip="Click here to search the record" />
        <br />
        <br />
        <asp:Table runat="server" CssClass="table table-borderless InsertUpdate">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblName" runat="server" Text="Product Name"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                     <asp:TextBox ID="txtProductName" runat="server" placeholder="Enter the Product Name"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rvfProductName" runat="server" ValidationGroup="InsertUpdate" ErrorMessage="Product Name is required, cannot be blank" Text="*" ControlToValidate="txtProductName" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="regexProductName" runat="server" ValidationGroup="InsertUpdate" ErrorMessage="Product Name Should Contain Characters and Numbers only or should be greater than 3 and less than or equal 30 Characters" Text="*" ControlToValidate="txtProductName" ValidationExpression="(?!^[0-9]*$)^([0-9a-zA-Z\s]{3,30})$" ForeColor="Red" SetFocusOnError="true"></asp:RegularExpressionValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                     <asp:Label ID="lblQuantityPerUnit" runat="server" Text="Quantity Per Unit"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                      <asp:TextBox ID="txtQuantityPerUnit" runat="server" placeholder="Enter Quantity Per Unit"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rvfQuantityPerUnit" runat="server" ValidationGroup="InsertUpdate" ErrorMessage="Quantity Per Unit is required, cannot be blank" Text="*" ControlToValidate="txtQuantityPerUnit" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="regexQuantityPerUnit" runat="server" ValidationGroup="InsertUpdate" ErrorMessage="Quantity Should be numbers or should be less than or equal to 9 length of numbers" Text="*" ControlToValidate="txtQuantityPerUnit" ValidationExpression="(?!^[0]*$)^([0-9]{0,9})$" ForeColor="Red" SetFocusOnError="true"></asp:RegularExpressionValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                     <asp:Label ID="lblUnitPrice" runat="server" Text="Unit Price"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                     <asp:TextBox ID="txtUnitPrice" runat="server" placeholder="Enter Unit Price"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rvfUnitPrice" runat="server" ValidationGroup="InsertUpdate" ErrorMessage="Unit Price is required, cannot be blank" Text="*" ControlToValidate="txtUnitPrice" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="regexUnitPrice" runat="server" ValidationGroup="InsertUpdate" ErrorMessage="Unit Price should be decimal or should maximum 2 decimal place or should be less than or equal to 12 digits total" Text="*" ControlToValidate="txtUnitPrice" ValidationExpression="(?!^[0]*$)^([0-9\.]{2,12})$*" ForeColor="Red" SetFocusOnError="true"></asp:RegularExpressionValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblUnitsInStock" runat="server" Text="Units In Stock"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                      <asp:TextBox ID="txtUnitsInStock" runat="server" placeholder="Enter Units In Stock"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rvfUnitsInStock" runat="server" ValidationGroup="InsertUpdate" ErrorMessage="Units In Stock is required, cannot be blank" Text="*" ControlToValidate="txtUnitsInStock" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="regexUnitsInStock" runat="server" ValidationGroup="InsertUpdate" ErrorMessage="Units In Stock be numbers or should be less than or equal to 9 length of numbers" Text="*" ControlToValidate="txtUnitsInStock" ValidationExpression="(?!^[0]*$)^([0-9]{0,9})$" ForeColor="Red" SetFocusOnError="true"></asp:RegularExpressionValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                    <asp:Button CssClass="btn btn-success" ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" ValidationGroup="InsertUpdate" ToolTip="Click here to Insert the record" />
                    <asp:Button CssClass="btn btn-success" ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" ValidationGroup="InsertUpdate" ToolTip="Click here to Update the record" />
                    &nbsp;&nbsp;
                    <asp:Button CssClass="btn btn-primary" ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" ToolTip="Click here to reset changes" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:ValidationSummary CssClass="alert alert-danger" ID="ValidationSummary1" runat="server" ValidationGroup="InsertUpdate" ForeColor="Red" />
        <asp:Label ID="lblMessage" ForeColor="Red" runat="server"></asp:Label>
        <br />
        <asp:GridView CssClass="table table-hover table-bordered table-light" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="5" CellSpacing="5"
            PageSize="5" OnRowEditing="grid_EditRow"  OnRowDeleting="grid_DeleteRow" OnPageIndexChanging="grid_PageIndexChanging" OnSorting="grid_Sorting"> <%--OnRowCancelingEdit="grid_EditCancelRow"--%>
            <Columns>
                <asp:TemplateField HeaderText="Product Id" HeaderStyle-CssClass="hiddenId" ItemStyle-CssClass="hiddenId">
                    <ItemTemplate>
                        <asp:Label ID="lblProductId" runat="server" Text='<%# Eval("Product_Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product Name" SortExpression="Name">
                    <ItemTemplate>
                        <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity Per Unit" SortExpression="Quantity_Per_Unit">
                    <ItemTemplate>
                        <asp:Label ID="lblQuantityPerUnit" runat="server" Text='<%# Eval("Quantity_Per_Unit") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Unit Price" SortExpression="Unit_Price">
                    <ItemTemplate>
                        <asp:Label ID="lblUnitPrice" runat="server" Text='<%# Eval("Unit_Price") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Units In Stock" SortExpression="Units_In_Stock">
                    <ItemTemplate>
                        <asp:Label ID="lblUnitsInStock" runat="server" Text='<%# Eval("Units_In_Stock") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Update">
                    <ItemTemplate>
                        <asp:LinkButton CssClass="btn btn-success" ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" ToolTip="Click here to edit this record"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton CssClass="btn btn-danger" ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" ToolTip="Click here to delete this record" OnClientClick="return confirm('Once deleted cannot be returned. Are you sure to delete?');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
       </div>
    </form>
</body>
</html>
