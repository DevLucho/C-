﻿<%@ Page Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="agregarEnteDeSalud.aspx.cs" Inherits="Vista.agregarEnteDeSalud" %>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="css/registro.css"/>
<link rel="stylesheet" href="css/dashPersona.css"/>
     <div class="container-login" style="margin-top:129px">

  <div class="form">
  
    
          <h1 style="margin:10px 15px 0px 0px">Crear Ente de Salud</h1>

    <div class="tab-content" style="margin-top:100px;">
      <div id="signup">
        
            <div class="field-wrap">
              <asp:Label ID="NitId" runat="server" for="nit"></asp:Label>
              <asp:TextBox placeholder="Nit" type="number" runat="server" name="nit" ID="TextNit" required autocomplete="off"></asp:TextBox> 
            </div>
            <asp:Label runat="server" ID="lblBienvenido"></asp:Label>
           
              <div class="field-wrap">
              <asp:label ID="RazonSocialId" runat="server" for="razonSocial"></asp:label>
              <asp:TextBox placeholder="Razon Social" name="paterno" runat="server" ID="TextRazonS" type="text" required autocomplete="off"></asp:TextBox>
            
          </div> 

           <div class="field-wrap">
            <asp:label runat="server" for="representante"></asp:label>
            <asp:TextBox runat="server" placeholder="Representante" name="representante" ID="TextRepresentante" type="text" required autocomplete="off"></asp:TextBox>
          </div>

          <div class="field-wrap">
            <label for="correo"></label>
            <asp:TextBox placeholder="Correo" runat="server" name="correo" id="TextCorreo" type="email" required autocomplete="off"></asp:TextBox>
          </div>

  
           <div class="top-row">
              <div class="field-wrap">
              <label for="telefono"></label>
              <asp:TextBox placeholder="telefono" runat="server" name="telefono" id="TextTelefono" type="number" required autocomplete="off"></asp:TextBox>
            </div> 

            <div class="field-wrap">
              <label for="sitioWeb"></label>
              <asp:TextBox placeholder="Sitio Web" runat="server" name="sitioWeb" id="textSitioW" type="text" required autocomplete="off" ></asp:TextBox>
            </div> 
          </div>

          <div class="top-row">
              <div class="field-wrap">
                <label for="Ciudad"></label>
                <asp:DropDownList class="lista" style="font-size: 22px;
  display: block;
  width: 100%;
  height: 100%;
  padding: 5px 10px;
  background: none;
  background-image: none;
  border: 1px solid #a0b3b0;
  color: #000000;
  border-radius: 0;
  -webkit-transition: border-color 0.25s ease, box-shadow 0.25s ease;
  transition: border-color 0.25s ease, box-shadow 0.25s ease;" ID="DropDownList" runat="server"></asp:DropDownList>
              </div> 

            <div class="field-wrap">
                <label for="Capacidad"></label>
                <asp:TextBox placeholder="Capacidad" runat="server" name="capacidad" id="TextCapacidad" type="number" required autocomplete="off"></asp:TextBox>
          </div>
          </div>
          
           <asp:Button runat="server" class="button button-block" name="registro" ID="btnRegistrarEnte" text="Registrarme" OnClick="btnRegistrarEnte_Click"/> 
        
        <br/>
        <a class="pepe" href="login.aspx">Volver</a>
  
      </div>

      <div id="login">
  
        
  
      </div>
  
    </div><!-- tab-content -->
  
  </div> <!-- /form --> 
         </div>
</asp:Content>