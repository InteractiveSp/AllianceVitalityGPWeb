<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="EditForm.aspx.vb" Inherits="EditForm" %>
<%@ Register Assembly="DevExpress.Xpo.v16.1, Version=16.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Xpo" TagPrefix="dx" %>


<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
  
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" DataSourceID="XpoDataSource1" ColCount="2" EnableTheming="True" Theme="Office2003Blue">
        <Items>
            <dx:LayoutGroup Caption="Patient Details" ColCount="4" ColSpan="2">
                <Items>
                    <dx:LayoutItem FieldName="Title">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                <dx:ASPxComboBox ID="cboTitle" runat="server" Enabled="False">
                                    <Items>
                                        <dx:ListEditItem Text="Miss." Value="Miss." />
                                        <dx:ListEditItem Text="Mrs." Value="Mrs." />
                                        <dx:ListEditItem Text="Mr." Value="Mr." />
                                        <dx:ListEditItem Text="Ms." Value="Ms." />
                                        <dx:ListEditItem Text="Professor" Value="Professor" />
                                        <dx:ListEditItem Text="Dr" Value="Dr" />
                                        <dx:ListEditItem Text="Prof" Value="Prof" />
                                        <dx:ListEditItem Text="Master" Value="Master" />
                                        <dx:ListEditItem Text="Rev" Value="Rev" />
                                        <dx:ListEditItem Text="Sir" Value="Sir" />
                                        <dx:ListEditItem Text="Lady" Value="Lady" />
                                        <dx:ListEditItem Text="Lord" Value="Lord" />
                                        <dx:ListEditItem Text="Dame" Value="Dame" />
                                        <dx:ListEditItem Text="Colonel" Value="Colonel" />
                                        <dx:ListEditItem Text="Captain" Value="Captain" />
                                    </Items>
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="Firstname">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                <dx:ASPxTextBox ID="txtFirstName" runat="server" Width="170px" Enabled="False">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="Lastname">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                <dx:ASPxTextBox ID="txtLastname" runat="server" Width="170px" Enabled="False">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="DOB">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server">
                                <dx:ASPxDateEdit ID="dtDOB" runat="server" Enabled="False">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                                                            
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                <dx:LayoutItem FieldName="Gender" Caption="Gender"><LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server">
                        <dx:ASPxComboBox ID="cboGender" runat="server" Enabled="False">
                            <Items>
                                <dx:ListEditItem Text="Not Known" Value="Unknow" />
                                <dx:ListEditItem Text="Male" Value="1" />
                                <dx:ListEditItem Text="Female" Value="2" />
                                <dx:ListEditItem Text="Not Specified" Value="9" />
                            </Items>
                            <ValidationSettings>
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>

                                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                   </dx:LayoutItem>
                   <dx:LayoutItem FieldName="PolicyNumber">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer6" runat="server">
                                <dx:ASPxTextBox ID="txtPolicyNumber" runat="server" Width="170px" Enabled="False">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Staff Referral" FieldName="StaffReferral">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxCheckBox ID="ASPxFormLayout1_E1" runat="server" CheckState="Unchecked" ReadOnly="true">
                                </dx:ASPxCheckBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>

            <dx:LayoutGroup Caption="Patient Address" ColCount="2">
                <Items>
                    <dx:LayoutItem FieldName="Address1" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer7" runat="server">
                                <dx:ASPxTextBox ID="txtAddress1" runat="server" Width="150px" MaxLength="50" Enabled="False">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="Address2" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer8" runat="server">
                                <dx:ASPxTextBox ID="txtAddress2" runat="server" Width="150px" MaxLength="50" Enabled="False">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="Address3" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer9" runat="server">
                                <dx:ASPxTextBox ID="txtAddress3" runat="server" Width="150px" MaxLength="50" Enabled="False">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="City" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer24" runat="server">
                                <dx:ASPxTextBox ID="txtCity" runat="server" Width="150px" MaxLength="40" Enabled="False">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                     <dx:LayoutItem FieldName="County" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer27" runat="server">
                                <dx:ASPxTextBox ID="txtCounty" runat="server" Width="150px" MaxLength="40" Enabled="False">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="PostalCode" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer25" runat="server">
                                <dx:ASPxTextBox ID="txtPostalCode" runat="server" Width="150px" MaxLength="40" Enabled="False">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>

                 
          
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Contact Preferences" ColCount="2">
                <Items>
                    <dx:LayoutItem Caption="Contact Name" ColSpan="2" FieldName="AltContact">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer11" runat="server">
                                <dx:ASPxTextBox ID="txtAltContact" runat="server" Width="300px" MaxLength="20" Enabled="False">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="Telephone">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer12" runat="server">
                                <dx:ASPxTextBox ID="txtTelephone" runat="server" Width="170px" MaxLength="20" Enabled="False">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="preferred call back time" FieldName="Callback">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer13" runat="server">
                                <dx:ASPxDateEdit ID="dtCallBack" runat="server" EditFormat="DateTime" ClientInstanceName="dtCallBack" Enabled="False">
                                    <TimeSectionProperties Visible="True">
                                    </TimeSectionProperties>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="LeaveMessage">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer14" runat="server">
                                <dx:ASPxCheckBox ID="chkLeaveMessage" runat="server" CheckState="Unchecked" Enabled="False" ReadOnly="true">
                                </dx:ASPxCheckBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="ConsentThirdParty">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer15" runat="server">
                                <dx:ASPxCheckBox ID="chkThirdParty" runat="server" CheckState="Unchecked" Enabled="False" ReadOnly="true">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxCheckBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Referral Details" ColCount="4" ColSpan="2">
                <Items>
                    <dx:LayoutItem FieldName="PresentingCondition" ColSpan="3">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer18" runat="server">
                                <dx:ASPxTextBox ID="txtPresentingCondition" runat="server" Width="410px" MaxLength="50" Enabled="False">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Self-Pay" FieldName="SelfPaying">
                        <LayoutItemNestedControlCollection>
                   
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer16" runat="server">
                                <dx:ASPxCheckBox ID="chkSelfPay" runat="server" CheckState="Unchecked" Enabled="False" ReadOnly="true">
                                </dx:ASPxCheckBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="Symptoms" ColSpan="4">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer17" runat="server">
                                <dx:ASPxMemo ID="txtSymptoms" runat="server" Height="71px" Width="410px" ReadOnly="True">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="OutpatientLimit" RowSpan="4" VerticalAlign="Top">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer19" runat="server">
                                <dx:ASPxSpinEdit ID="spinOutPatientLimit" runat="server" Number="0" Enabled="False">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="Excess" RowSpan="4" VerticalAlign="Top">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer20" runat="server">
                                <dx:ASPxSpinEdit ID="spinExcess" runat="server" Number="0" Enabled="False">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="GP Select" FieldName="GPSelect">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer21" runat="server">
                                <dx:ASPxComboBox ID="cboGPSelect" runat="server" ClientInstanceName="cboGPSelect" Enabled="False">
                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
//alert('using selectedindexchanged event ' +s.GetSelectedItem().value );

if (s.GetSelectedItem().value == &quot;Yes&quot;) {
   &nbsp;//disable HospitalList combo
    CboHospitalList.SetEnabled(false);
    //effectively hide selection model will decide
    CboHospitalList.SetValue(null);
 } else {  
    //enable HospitalList combo
   CboHospitalList.SetEnabled(true);
}

}" />
                                    <Items>
                                        <dx:ListEditItem Text="Yes" Value="Yes" />
                                        <dx:ListEditItem Text="No" Value="No" />
                                    </Items>
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="HospitalList" Caption="Hospital List" Name="HospitalList">
                         <LayoutItemNestedControlCollection>
                                 <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer22" runat="server">
                                <dx:ASPxComboBox ID="cboHospitalList" runat="server" ClientInstanceName="CboHospitalList" Enabled="False">
                                    <Items>
                                        <dx:ListEditItem Text="Local" Value="Local" />
                                        <dx:ListEditItem Text="Countrywide" Value="Countrywide" />
                                        <dx:ListEditItem Text="Premier" Value="Premier" />
                                    </Items>
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                              </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="actions" ColCount="3" ColSpan="2">
                <Items>
                    <dx:LayoutItem Caption="" Name="btnCancel">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer23" runat="server">
                                <dx:ASPxButton ID="btnCancel" runat="server" Text="Cancel" CausesValidation="False">
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
                
                   
           
                
            </dx:LayoutGroup>
            <dx:LayoutItem ClientVisible="False" FieldName="Oid">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer26" runat="server">
                        <dx:ASPxSpinEdit ID="spinOid" runat="server" Number="0">
                        </dx:ASPxSpinEdit>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>

    </dx:ASPxFormLayout>


 
              


<%-- DXCOMMENT: Configure your datasource for ASPxDataView --%><dx:XpoDataSource ID="XpoDataSource1"  TypeName="Alliance.Data.Referral" runat="server" Criteria="[Oid] = ?">
        <CriteriaParameters>
            <asp:QueryStringParameter Name="newparameter" QueryStringField="id" />
        </CriteriaParameters>
    </dx:XpoDataSource>
     


</asp:Content>





