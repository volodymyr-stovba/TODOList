<%@ Page Title="Manage TODO Item" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageTODOItem.aspx.cs" Inherits="TODO_List.ManageTODOItem" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <h2><%: Title %>.</h2>

    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Manage TODO Item.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Description" CssClass="col-md-2 control-label">Description</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Description" CssClass="form-control" TextMode="MultiLine" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Description"
                                CssClass="text-danger" ErrorMessage="The description field is required." />
                        </div>
                    </div> 
                     <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="AddedAt" CssClass="col-md-2 control-label">AddedAt</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="AddedAt" CssClass="form-control" TextMode="Date" />                           
                        </div>
                    </div> 
                     <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="AddedBy" CssClass="col-md-2 control-label">AddedAt</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList id="AddedBy" CssClass="form-control"
                                AutoPostBack="True"                               
                                runat="server">
                            </asp:DropDownList>
                        </div>
                    </div> 
                     <div class="form-group form-check">
                        <asp:Label runat="server" AssociatedControlID="WasDone" CssClass="col-md-2 control-label">WasDone</asp:Label>
                        <div class="col-md-10">
                            <asp:CheckBox runat="server" ID="WasDone" CssClass="checkbox"/>
                        </div>
                    </div>
                     <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="WasDoneAt" CssClass="col-md-2 control-label">WasDoneAt</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="WasDoneAt" CssClass="form-control" TextMode="Date" />                           
                        </div>
                    </div> 
                     <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="DueDate" CssClass="col-md-2 control-label">DueDate</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="DueDate" CssClass="form-control" TextMode="Date" />                           
                        </div>
                    </div>               
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="Save_Click"
                                Text="Save" CssClass="btn btn-default" />
                        </div>
                    </div>
               </div> 
            </section>
        </div>
    </div> 
    
</asp:Content>

