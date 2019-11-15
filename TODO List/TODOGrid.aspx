<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TODOGrid.aspx.cs" Inherits="TODO_List.TODOGrid" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView ID="TODOGridView"
        AutoGenerateColumns="False"
        EmptyDataText="No data available."
        AllowPaging="True"
        AllowSorting="true"
        PageSize = "5" 
        runat="server" DataKeyNames="Id"
        OnPageIndexChanging="TODOGridView_PageIndexChanging"
        OnSorting="TODOGridView_Sorting"
        onrowdatabound="TODOGridView_RowDataBound">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="TODOItemID" InsertVisible="False" ReadOnly="True" SortExpression="TODOItemID" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"/>
            <asp:HyperLinkField HeaderText="Details" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="TODOItemDetails.aspx?Id={0}" Text="View Details" />
            <asp:BoundField DataField="AddedAt" HeaderText="AddedAt" SortExpression="AddedAt"/>
            <asp:BoundField DataField="AddedBy" HeaderText="AddedBy" SortExpression="AddedBy"/>
            <asp:BoundField DataField="WasDone" HeaderText="WasDone" SortExpression="WasDone"/>
            <asp:BoundField DataField="WasDoneAt" HeaderText="WasDoneAt"/>
            <asp:BoundField DataField="DueDate" HeaderText="DueDate"/>
            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:LinkButton id="EditButton" runat="server" CssClass="btn btn-primary" PostBackUrl="~/ManageTODOItem.aspx" >Edit</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
   <asp:LinkButton id="AddNewitem" runat="server" CssClass="btn btn-primary" PostBackUrl="~/ManageTODOItem.aspx" >Add New Item</asp:LinkButton>
</asp:Content>

