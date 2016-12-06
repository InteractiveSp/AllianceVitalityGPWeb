<%@ Page Language="VB" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="DefaultOLD.aspx.vb" Inherits="_DefaultOld" %>


<%@ Register assembly="DevExpress.Xpo.v16.1, Version=16.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Xpo" tagprefix="dx" %>


<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <%-- DXCOMMENT: Configure ASPxGridView control --%>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="XpoDataSource1" ClientInstanceName="ASPxGridView1"
    Width="100%" KeyFieldName="OID"  OnBeforeGetCallbackResult="ASPxGridView1_BeforeGetCallbackResult">
        <%-- DXCOMMENT: Configure ASPxGridView's columns in accordance with datasource fields --%>
        <SettingsPager PageSize="20" >
            <AllButton Visible="True">
            </AllButton>
            <FirstPageButton Visible="True">
            </FirstPageButton>
            <LastPageButton Visible="True">
            </LastPageButton>
        </SettingsPager>
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Settings ShowFilterRow="True" />
        <SettingsDataSecurity AllowDelete="False" />
        <SettingsPopup>
            <EditForm Modal="False" HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter" />
        </SettingsPopup>
        <SettingsSearchPanel Visible="True" />
        <EditFormLayoutProperties ColCount="6" AlignItemCaptionsInAllGroups="True">
            <Items>
                <dx:GridViewColumnLayoutItem ColSpan="6" ColumnName="TriageNotes">
                </dx:GridViewColumnLayoutItem>
                <dx:EmptyLayoutItem ColSpan="6">
                </dx:EmptyLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="Title" ColSpan="2">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="FirstName" RequiredMarkDisplayMode="Required" ColSpan="2">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem Caption="Surname" ColumnName="SurName" RequiredMarkDisplayMode="Required" ColSpan="2">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="Gender" RequiredMarkDisplayMode="Required" ColSpan="2">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="DOB" RequiredMarkDisplayMode="Required" ColSpan="2">
                </dx:GridViewColumnLayoutItem>
                <dx:EmptyLayoutItem ColSpan="2">
                </dx:EmptyLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="Addr1" ColSpan="6">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="Addr2" ColSpan="6">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="City" ColSpan="6">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="County" ColSpan="4">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="PostCode" RequiredMarkDisplayMode="Required" ColSpan="2">
                </dx:GridViewColumnLayoutItem>
                <dx:EmptyLayoutItem ColSpan="6">
                </dx:EmptyLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="Email" ColSpan="6">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="WorkPhone" ColSpan="3">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="MobilePhone" ColSpan="3" RequiredMarkDisplayMode="Required">
                </dx:GridViewColumnLayoutItem>
                <dx:EditModeCommandLayoutItem ColSpan="6" HorizontalAlign="Right">
                </dx:EditModeCommandLayoutItem>
            </Items>
        </EditFormLayoutProperties>
        <Columns>
            <dx:GridViewCommandColumn ShowNewButtonInHeader="True" ShowEditButton="true" VisibleIndex="0" ButtonType="Button" Width="25" />
            <dx:GridViewDataTextColumn FieldName="OID" Caption="Claim" VisibleIndex="1" ReadOnly="True" Width="15">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="ClaimDate" VisibleIndex="7" Width="75" ReadOnly="True">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="PostCode" VisibleIndex="10">
                <PropertiesTextEdit MaxLength="10">
                    <ValidationSettings>
                        <RequiredField ErrorText="First Name is a required field" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FullName" VisibleIndex="8">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn  FieldName="DOB" VisibleIndex="15"  Width="35">
                <PropertiesDateEdit>
                    <ValidationSettings>
                        <RequiredField ErrorText="Date of Birth is a required field" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="FirstName" Visible="False" VisibleIndex="17">
                <EditFormSettings Visible="True" />
                <PropertiesTextEdit maxlength="50">
                    <ValidationSettings>
                        <RequiredField ErrorText="First Name is a required field" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SurName" VisibleIndex="18" Visible="False">
                <EditFormSettings Visible="True" />
                <PropertiesTextEdit maxlength="50">
                    <ValidationSettings>
                        <RequiredField ErrorText="Surname is a required field" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Title" Visible="False" VisibleIndex="16">
                <EditFormSettings Visible="True" />
                <PropertiesTextEdit maxlength="10">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Addr1" Visible="False" VisibleIndex="19">
                <EditFormSettings Visible="True" />
                <PropertiesTextEdit maxlength="50">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Addr2" Visible="False" VisibleIndex="20">
                <EditFormSettings Visible="True" />
                <PropertiesTextEdit maxlength="50">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="City" Visible="False" VisibleIndex="21">
                <EditFormSettings Visible="True" />
                <PropertiesTextEdit maxlength="50">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="County" Visible="False" VisibleIndex="22">
                <EditFormSettings Visible="True" />
                <PropertiesTextEdit maxlength="50">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Email" Visible="False" VisibleIndex="23">
                <EditFormSettings Visible="True" />
                <PropertiesTextEdit maxlength="120">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="WorkPhone" Visible="False" VisibleIndex="24">
                <EditFormSettings Visible="True" />
                <PropertiesTextEdit maxlength="20">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MobilePhone" Visible="False" VisibleIndex="25">
                <EditFormSettings Visible="True" />
                <PropertiesTextEdit maxlength="50">
                    <ValidationSettings>
                        <RequiredField ErrorText="Mobile is a required field" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Symptom" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="26">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataMemoColumn FieldName="TriageNotes" Name="TriageNotes" VisibleIndex="27" Visible="False">
                <EditFormSettings />
                <PropertiesMemoEdit Rows="8">
                    <ValidationSettings>
                        <RequiredField ErrorText="Please enter some notes to enable us to triage this claim" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesMemoEdit>
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Gender" Visible="False" VisibleIndex="14"  >
                <EditFormSettings Visible="True" />
                <PropertiesComboBox>
                    <Items>
                        <dx:ListEditItem Text="Male" Value="M" />
                        <dx:ListEditItem Text="Female" Value="F" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
        <Paddings Padding="0px" />
        <Border BorderWidth="0px" />
        <BorderBottom BorderWidth="1px" />
    </dx:ASPxGridView>
    <dx:XpoDataSource ID="XpoDataSource1" runat="server" ServerMode="True" TypeName="Alliance.Data.vw_Claim" DefaultSorting="OID DESC" Criteria="">
    </dx:XpoDataSource>


<%-- DXCOMMENT: Configure your datasource for ASPxGridView --%>


</asp:Content>