<%@ Page Title="" Language="C#" MasterPageFile="~/Employee.Master" AutoEventWireup="true" CodeBehind="myEnrollmentRequests.aspx.cs" Inherits="KFMS_PROJECT.src.myEnrollmentRequests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card">
                    <div class="card-header bg-light text-center">
                        <h3>My Enrollment Requests  -  طلبات الالتحاق الخاصة بي   </h3>
                    </div>
                    <div class="card-body">
                        <asp:GridView ID="GridViewRequests" runat="server" AutoGenerateColumns="False" OnRowCommand="GridViewRequests_RowCommand" CssClass="gridview">
                            <Columns>
                                <asp:BoundField DataField="RequestID" HeaderText="Request ID" DataFormatString="{0:D6}" />
                                <asp:BoundField DataField="Name" HeaderText="Name" />
                                <asp:BoundField DataField="ApprovalStatus" HeaderText="Status" />


                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="ShowLink" runat="server" Text="Show - عرض " NavigateUrl='<%# Eval("RequestID", "viewEnrollmentRequest.aspx?requestID={0}") %>' CssClass="btn btn-success" Style="background: #bea983" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#38a6aa" ForeColor="White" />
                            <RowStyle BackColor="#F2F2F2" />
                            <AlternatingRowStyle BackColor="#FFFFFF" />
                            <FooterStyle BackColor="#4CAF50" ForeColor="White" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonContent" runat="server">
</asp:Content>
