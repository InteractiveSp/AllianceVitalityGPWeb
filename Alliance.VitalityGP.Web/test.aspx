<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="test.aspx.vb" Inherits="test" %>
<%@ Register assembly="DevExpress.Xpo.v16.1, Version=16.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Xpo" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
 <script type="text/javascript">
        function OnNameValidation(s, e) {
            var name = e.value;
            if(name == null)
                return;
            if(name.length < 2)
                e.isValid = false;
        }
        function OnAgeValidation(s, e) {
            var age = e.value;
            if(age == null || age == "")
                return;
            var digits = "0123456789";
            for(var i = 0; i < age.length; i++) {
                if(digits.indexOf(age.charAt(i)) == -1) {
                    e.isValid = false;
                    break;
                }
            }
            if(e.isValid && age.charAt(0) == '0') {
                age = age.replace(/^0+/, "");
                if(age.length == 0)
                    age = "0";
                e.value = age;
            }
            if(age < 18)
                e.isValid = false;
        }
        function OnArrivalDateValidation(s, e) {
            var selectedDate = s.date;
            if(selectedDate == null || selectedDate == false)
                return;
            var currentDate = new Date();
            if(currentDate.getFullYear() != selectedDate.getFullYear() || currentDate.getMonth() != selectedDate.getMonth())
                e.isValid = false;
        }


        function SetGenderDropdown() {
            var currentSelectedTitle = String;
            currentSelectedTitle = cboTitle.lastSuccessText

            if (currentSelectedTitle == 'Mr.' | currentSelectedTitle == 'Master' | currentSelectedTitle == 'Sir') {
                //Set to gender dropdown to Male
                cboGender.selectedIndex = 0;
                cboGender.SetSelectedIndex(0);
            }
            else if (currentSelectedTitle == 'Miss.' | currentSelectedTitle == 'Mrs.' | currentSelectedTitle == 'Ms.' | currentSelectedTitle == 'Lady' | currentSelectedTitle == 'Dame') {
                //Set to gender dropdown to Female
                cboGender.selectedIndex = 1;
                cboGender.SetSelectedIndex(1);
            }
            else {
                //Set to gender dropdown to nothing
                cboGender.selectedIndex = -1;
                cboGender.SetSelectedIndex(-1);

            }
        }

        function checkPhoneNumber() {
            var phoneRE = /^[0-9]$/;
            var phoneNo = txtTPhone.lastChangedValue;
            alert(txtTPhone.lastChangedValue)
            if (phoneNo.match(phoneRE)) {
                result.innerHTML = 'The phone number is <strong>valid!</strong>';
            }
            else {
                txtTPhone.Value = '';
                document.getElementById('txtTPhone').value = "";
            }
        }

        function Checkdropdownvalues(s, e) {
            //alert('using selectedindexchanged event ' + s.GetSelectedItem().value );
            //var es = document.getElementById("cboHospitalList");
           // alert(cboHospitalList.lastSuccessText + ' - ' + cboGPSelect.lastSuccessText)
            //if (cboHospitalList.lastSuccessText == '' && cboGPSelect.lastSuccessText == 'No') {
            //    alert('please select a value from the hospital list drop down box')
            //}
            //else 
            //{  
            //    alert('no')
            //}  
        }


    </script>

    <div id="clientContainer">
           <%--    <dx:ASPxTextBox runat="server" EnableClientSideAPI="True" Width="160px" ID="NameTextBox"
                        ClientInstanceName="Name" OnValidation="NameTextBox_Validation">
                        <ValidationSettings SetFocusOnError="True" ErrorText="Name must be at least two characters long">
                            <RequiredField IsRequired="True" ErrorText="Name is required" />
                        </ValidationSettings>
                        <ClientSideEvents Validation="OnNameValidation" />
                        <InvalidStyle BackColor="LightPink" />
                    </dx:ASPxTextBox>
                
                <dx:ASPxButton ID="btnSubmit" runat="server" Text="Submit" />--%>

      </div>
    <dx:ASPxTextBox runat="server" EnableClientSideAPI="True" Width="160px" ID="NameTextBox"
                        ClientInstanceName="Name" OnValidation="NameTextBox_Validation">
                        <ValidationSettings SetFocusOnError="True" ErrorText="Name must be at least two characters long">
                            <RequiredField IsRequired="True" ErrorText="Name is required" />
                        </ValidationSettings>
                        <ClientSideEvents Validation="OnNameValidation" />
                        <InvalidStyle BackColor="LightPink" />
     </dx:ASPxTextBox>
    
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2" EnableTheming="True" Theme="Office2003Blue" ClientInstanceName="ASPxFormLayout1">
              <Items>
            <dx:LayoutGroup Caption="Patient Details" ColCount="4" ColSpan="2">
             
                <Items>
                    <dx:LayoutItem FieldName="Title">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">   

                                <asp:TextBox ID="txttest" runat="server"></asp:TextBox>

                                 <dx:ASPxComboBox ID="cboTitle" runat="server" MaxLength="50" ClientInstanceName="cboTitle"  ClientSideEvents-SelectedIndexChanged="function(s, e) { SetGenderDropdown();}" >
<ClientSideEvents SelectedIndexChanged="function(s, e) { SetGenderDropdown();}"></ClientSideEvents>
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
                                <dx:ASPxTextBox ID="txtFirstName" runat="server" Width="170px" MaxLength="20" EnableViewState="true" ViewStateMode="Enabled">
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
                                <dx:ASPxTextBox ID="txtLastname" runat="server" Width="170px" MaxLength="20" EnableViewState="true">
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
                                <dx:ASPxDateEdit ID="dtDOB" runat="server" AllowNull="False">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                                                            
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                <dx:LayoutItem FieldName="Gender" Caption="Gender"><LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server">
                        <dx:ASPxComboBox ID="cboGender" runat="server" ClientInstanceName="cboGender">
                            <Items>
                                <dx:ListEditItem Text="Male" Value="M" />
                                <dx:ListEditItem Text="Female" Value="F" />
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
                                <dx:ASPxTextBox ID="txtPolicyNumber" runat="server" Width="170px" MaxLength="10">
                                       <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Please enter a number" SetFocusOnError="True">
                                           <RegularExpression ValidationExpression="[-+]?[0-9]*\.?[0-9]*" ErrorText="Please enter a number" />
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Staff Claim" FieldName="StaffClaim">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxCheckBox ID="chkStaffClaim" runat="server" CheckState="Unchecked">
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
                                <dx:ASPxTextBox ID="txtAddress1" runat="server" Width="150px" MaxLength="40">
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
                                <dx:ASPxTextBox ID="txtAddress2" runat="server" Width="150px" MaxLength="40">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="Address3" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer9" runat="server">
                                <dx:ASPxTextBox ID="txtAddress3" runat="server" Width="150px" MaxLength="40">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                     <dx:LayoutItem FieldName="City" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer26" runat="server">
                                <dx:ASPxTextBox ID="txtCity" runat="server" Width="150px" MaxLength="40">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                     <dx:LayoutItem FieldName="County" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer27" runat="server">
                                <dx:ASPxTextBox ID="txtCounty" runat="server" Width="150px" MaxLength="40">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>

                    <dx:LayoutItem FieldName="Postcode">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer10" runat="server">
                                <dx:ASPxTextBox ID="txtPostcode" runat="server" Width="80px" MaxLength="10">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Contact Preferences" ColCount="2">
                <Items>
                    <dx:LayoutItem Caption="Contact Name" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer11" runat="server">
                                <dx:ASPxTextBox ID="txtAltContact" runat="server" Width="300px" MaxLength="40" MaskSettings-IncludeLiterals="None">
<MaskSettings IncludeLiterals="None"></MaskSettings>

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
                                <dx:ASPxTextBox ID="txtTPhone" runat="server" Width="170px" MaxLength="15" ClientInstanceName="txtTPhone"> 
                                       <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Please enter a valid phone number, with no spaces or non numeric characters" SetFocusOnError="True">
                                           <RegularExpression ValidationExpression="[-+]?[0-9]*\.?[0-9]*" ErrorText="Please enter a valid phone number, with no spaces or non numeric characters" />
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="preferred call back time" FieldName="Callback">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer13" runat="server">
                                <dx:ASPxDateEdit ID="dtCallBack" runat="server" EditFormat="DateTime" ClientInstanceName="dtCallBack">
                                    <TimeSectionProperties Visible="True">
                                    </TimeSectionProperties>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="LeaveMessage">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer14" runat="server">
                                <dx:ASPxCheckBox ID="chkLeaveMessage" runat="server" CheckState="Unchecked">
                                </dx:ASPxCheckBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="ConsentThirdParty">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer15" runat="server">
                                <dx:ASPxCheckBox ID="chkThirdParty" runat="server" CheckState="Unchecked">
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
                                <dx:ASPxTextBox ID="txtPresentingCondition" runat="server" Width="410px" MaxLength="30">
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
                                <dx:ASPxCheckBox ID="chkSelfPay" runat="server" CheckState="Unchecked">
                                </dx:ASPxCheckBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="Symptoms" ColSpan="4">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer17" runat="server">
                                <dx:ASPxMemo ID="txtSymptoms" runat="server" Height="71px" Width="410px">
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
                                <dx:ASPxSpinEdit ID="spinOutPatientLimit" runat="server" Number="0" MaxLength="10">
                              </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="Excess" RowSpan="4" VerticalAlign="Top">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer20" runat="server">
                                <dx:ASPxSpinEdit ID="spinExcess" runat="server" Number="0" MaxLength="10">
                                </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="GP Select" FieldName="GPSelect">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer21" runat="server">
                                <dx:ASPxComboBox ID="cboGPSelect" runat="server" ClientInstanceName="cboGPSelect">
                                    <ClientSideEvents SelectedIndexChanged="function(s, e) 
                    {
                        //alert('using selectedindexchanged event ' +s.GetSelectedItem().value );
                        if (s.GetSelectedItem().value == &quot;Yes&quot;) 
                        {
                            &nbsp;//disable HospitalList combo
                            cboHospitalList.SetEnabled(false);
                            //effectively hide selection model will decide
                            cboHospitalList.SetValue(null);
                        } 
                        else 
                        {  
                            //enable HospitalList combo
                             cboHospitalList.SetEnabled(true);       
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
                                <dx:ASPxComboBox ID="cboHospitalList" runat="server" ClientInstanceName="cboHospitalList" >
                                    <Items>
                                        <dx:ListEditItem Text="Local" Value="Local" />
                                        <dx:ListEditItem Text="Countrywide" Value="Country Wide" />
                                        <dx:ListEditItem Text="Premier" Value="Premier Plus" />
                                        <dx:ListEditItem Text="To Be Confirmed" Value="TBC" />
                                    </Items>
                            
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                              </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>

            <dx:LayoutGroup Caption="actions" ColCount="4" ColSpan="2">
                <Items>
                    <dx:LayoutItem Caption="" Name="btnClear">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer23" runat="server">
                                <dx:ASPxButton ID="btnClear" runat="server" AutoPostBack="False" Text="Clear">
                                    <ClientSideEvents Click="function(s, e) {
//clear the form
ASPxClientEdit.ClearEditorsInContainerById('formContainer');

//get  default min preferred callback which is +2hours after ref
Date.prototype.addHours= function(h){
    this.setHours(this.getHours()+h);
    return this;
}

//set the Callback Date to preferred min
dtCallBack.SetDate(new Date().addHours(2));


}" />
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="" Name="btnCancel">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer24" runat="server">
                                <dx:ASPxButton ID="btnCancel" runat="server" CausesValidation="False" Text="Cancel">
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="" Name="btnSave">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer25" runat="server">
                                <dx:ASPxButton ID="btnSave" ClientSideEvents-Click="function(s, e) { Checkdropdownvalues(); return false;}"   runat="server" Text="Send Referral">
<ClientSideEvents Click="function(s, e) { Checkdropdownvalues(); return false;}"></ClientSideEvents>
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
                
                   
           
                
            </dx:LayoutGroup>
                  <dx:LayoutItem ClientVisible="False" FieldName="Oid" RowSpan="4">
                      <LayoutItemNestedControlCollection>
                          <dx:LayoutItemNestedControlContainer runat="server">
                              <dx:ASPxSpinEdit ID="spinOid" runat="server" Number="0">
                              </dx:ASPxSpinEdit>
                          </dx:LayoutItemNestedControlContainer>
                      </LayoutItemNestedControlCollection>
                  </dx:LayoutItem>
        </Items>

    <ClientSideEvents Init="function(s, e) {

//clear the form
ASPxClientEdit.ClearEditorsInContainerById('formContainer');

//get our preferred callback which is +2hours after ref
Date.prototype.addHours= function(h){
    this.setHours(this.getHours()+h);
    return this;
}

//set the Callback Date controlin client
dtCallBack.SetDate(new Date().addHours(2));

}" />
    </dx:ASPxFormLayout>

 
     <dx:XpoDataSource ID="XpoDataSource2" runat="server" DefaultSorting="" TypeName="VitalityGP.vitop">
    </dx:XpoDataSource>
  

</asp:Content>


