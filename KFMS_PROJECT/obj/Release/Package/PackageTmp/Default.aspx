<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KFMS_PROJECT._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="s flex flex-col items-center justify-center h-screen" >
            <div class="text-center mt-8">

                <a runat="server" href="~/src/login" class="btn btn-primary btn-lg " style="background:#38a6aa">Log In</a>
                <a runat="server" href="~/src/signup" class="btn btn-secondary btn-lg">Sign UP</a>

            </div>
        </div>
</asp:Content>
