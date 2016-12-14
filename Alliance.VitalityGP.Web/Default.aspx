<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" EnableViewState="true" EnableSessionState="True" %>

<%@ Register assembly="DevExpress.Xpo.v16.1, Version=16.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Xpo" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <%--ClientSideEvents-LostFocus="function(s, e) { checkPhoneNumber();}">--%>
     <script type="text/javascript">
      
        function SetGenderDropdown()
        {
            var currentSelectedTitle = String;
            currentSelectedTitle = cboTitle.lastSuccessText

            if (currentSelectedTitle == 'Mr' | currentSelectedTitle == 'Master' | currentSelectedTitle == 'Sir')
            {
                //Set to gender dropdown to Male
                cboGender.selectedIndex = 0;
                cboGender.SetSelectedIndex(0);
            }
            else if (currentSelectedTitle == 'Miss' | currentSelectedTitle == 'Mrs' | currentSelectedTitle == 'Ms' | currentSelectedTitle == 'Lady' | currentSelectedTitle == 'Dame')
            {
                //Set to gender dropdown to Female
                cboGender.selectedIndex = 1;
                cboGender.SetSelectedIndex(1);
            }
            else
            {
                //Set to gender dropdown to nothing
                cboGender.selectedIndex = -1;
                cboGender.SetSelectedIndex(-1);
         
            }

            //remove validation
            //var validatorObject = cboGender;//document.getElementById('ASPxFormLayout1.cboGender');
            //validatorObject.isValid = false;
            //cboGender.isValid = false;
            //cboGender.SetErrorText('3ewdsf')
     
        }

        function checkPhoneNumber(s, e) {
            var phoneRE = /^[0-9]$/;
            var phoneNo = txtTPhone.lastChangedValue;
            //alert(txtTPhone.lastChangedValue)
            if (e.value != null)
            {
                if (phoneNo.match(phoneRE) && e.value.length < 10) 
                {
                    result.innerHTML = 'The phone number is <strong>valid!</strong>';
                }
                else
                {
                    txtTPhone.Value = '';
                    // document.getElementById('txtTPhone').value = "";
                }
            }
        }

        function Checkdropdownvalues(s, e)
        {
            //alert('using selectedindexchanged event ' + s.GetSelectedItem().value );
            //var es = document.getElementById("cboHospitalList");
           // alert(cboHospitalList.lastSuccessText + ' - ' + cboGPSelect.lastSuccessText)
            if (cboHospitalList.lastSuccessText == '' && cboGPSelect.lastSuccessText == 'No')
            {
                alert('please select a value from the hospital list drop down box')
            } 
            //else 
            //{  
            //    alert('no')
            //}  
        }

         //check for containing a letter and has more then 1 character
        function OnNameValidation(s, e) {
            var name = e.value;
          //  var matchedPosition = /[a-z]/i.test(name);
            if (name == null)
                return;
         
            //
            if (name.length < 2 || (name.match(/[a-z]/i) < 1))
                e.isValid = false;
        }

        //check for containing a letter and has more then 1 character
        function OnDOBValidation(s, e) {
            var name = e.value;
            //  var matchedPosition = /[a-z]/i.test(name);
            if (name == null)
                return;

            //
            if (name.length < 2 || (name.match(/[a-z]/i) < 1))
                e.isValid = false;
        }

        //function ShowLoginWindow() {
        //    pcLogin.Show();
        //}
        //function ShowCreateAccountWindow() {
        //    pcCreateAccount.Show();
        //    tbUsername.Focus();
        //}
    </script>

 <asp:Label ID="lblResult" runat="server" Text="" Font-Size="Large"></asp:Label>

    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2" EnableTheming="true"  ClientInstanceName="ASPxFormLayout1" >
<%-- <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="800"  />--%>
       
      <Items>       
            <dx:LayoutGroup Caption="Patient Details"  ColCount="4" ColSpan="2" >
                <Items>
                    <dx:LayoutItem FieldName="Title">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">   
                                 <dx:ASPxComboBox ID="cboTitle" CssClass="cssDropDownMinValue"  runat="server" MaxLength="50" ClientInstanceName="cboTitle"  ClientSideEvents-SelectedIndexChanged="function(s, e) { SetGenderDropdown();}" >
                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { SetGenderDropdown();}"></ClientSideEvents>
                                    <ValidationSettings Display="Dynamic">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                    <InvalidStyle BackColor="LightPink" />
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="Firstname">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                <dx:ASPxTextBox ID="txtFirstName" runat="server" Width="170px" MaxLength="20" OnValidation="NameTextBox_Validation">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip"  ErrorText="Name must be at least two characters long, with only letters">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                    <ClientSideEvents Validation="OnNameValidation" />
                                    <InvalidStyle BackColor="LightPink" />
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="Lastname" >
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                <dx:ASPxTextBox ID="txtLastname" runat="server" Width="170px" MaxLength="20" OnValidation="NameTextBox_Validation">
                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" Display="Dynamic"  ErrorText="Name must be at least two characters long, with only letters">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                    <ClientSideEvents Validation="OnNameValidation" />
                                    <InvalidStyle BackColor="LightPink" />
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="DOB">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server">
                                <dx:ASPxDateEdit ID="dtDOB" runat="server" CssClass="cssDropDownMinValue" AllowNull="False" OnValidation="DOBTextBox_Validation">
                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" Display="Dynamic"  ErrorText="The DOB must be in the past">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                    <InvalidStyle BackColor="LightPink" />
                                </dx:ASPxDateEdit>
                                                            
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                <dx:LayoutItem FieldName="Gender" Caption="Gender"><LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server">
                        <dx:ASPxComboBox ID="cboGender" runat="server" CssClass="cssDropDownMinValue"  ClientInstanceName="cboGender">
                            <Items>
                                <dx:ListEditItem Text="Male" Value="M" />
                                <dx:ListEditItem Text="Female" Value="F" />
                            </Items>
                            <ValidationSettings Display="Dynamic">
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                            <InvalidStyle BackColor="LightPink" />
                        </dx:ASPxComboBox>

                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                    <dx:LayoutItem FieldName="PolicyNumber">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer6" runat="server">
                                <dx:ASPxTextBox ID="txtPolicyNumber" runat="server" Width="170px" MaxLength="10">
                                       <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorText="Please enter a number" SetFocusOnError="True">
                                           <RegularExpression ValidationExpression="[-+]?[0-9]*\.?[0-9]*" ErrorText="Please enter a number" />
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                      <InvalidStyle BackColor="LightPink" />
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

            <dx:LayoutGroup Caption="Patient Address">
                <Items>
                    <dx:LayoutItem FieldName="Address1" >
                        <LayoutItemNestedControlCollection >
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer7" runat="server" >
                                <dx:ASPxTextBox ID="txtAddress1" runat="server"  MaxLength="40" ToolTip="You can enter a postcode for an automatic address look up" >
                                    <ValidationSettings Display="Dynamic">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                    <InvalidStyle BackColor="LightPink" />
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="Address2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer8" runat="server">
                                <dx:ASPxTextBox ID="txtAddress2" runat="server" MaxLength="40">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="Address3" >
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer9" runat="server">
                                <dx:ASPxTextBox ID="txtAddress3" runat="server"  MaxLength="40" >
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                     <dx:LayoutItem FieldName="City" >
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer26" runat="server">
                                <dx:ASPxTextBox ID="txtCity" runat="server" MaxLength="40" >
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                     <dx:LayoutItem FieldName="County">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer27" runat="server">
                                <dx:ASPxTextBox ID="txtCounty" runat="server"  MaxLength="40" >
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>

                    <dx:LayoutItem FieldName="Postcode" >
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer10" runat="server">
                                <dx:ASPxTextBox ID="txtPostcode" runat="server"  Width="100"  MaxLength="10" >
                                    <ValidationSettings Display="Dynamic">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                      <InvalidStyle BackColor="LightPink" />
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                </Items>
            </dx:LayoutGroup>
           
            <dx:LayoutGroup Caption="Contact Preferences" ColCount="2" ColSpan="1">
                <Items>
                    <dx:LayoutItem FieldName="Contact Title">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer30" runat="server">   
                                 <dx:ASPxComboBox ID="cboContactTitle" CssClass="cssDropDownMinValue" runat="server" MaxLength="20" ClientInstanceName="cboContactTitle" >
                                    <ValidationSettings Display="Dynamic">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                       <InvalidStyle BackColor="LightPink" />
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Contact Firstname" ColSpan="1" >
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer11" runat="server">
                                <dx:ASPxTextBox ID="txtContactFirstname" runat="server"  MaxLength="40" MaskSettings-IncludeLiterals="None" >
                                    <MaskSettings IncludeLiterals="None"></MaskSettings>
                                    <ValidationSettings Display="Dynamic"  ErrorDisplayMode="ImageWithTooltip"  ErrorText="Contact name must be at least two characters long, with only letters">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                    <ClientSideEvents Validation="OnNameValidation" />
                                    <InvalidStyle BackColor="LightPink" />
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>

                    <dx:LayoutItem Caption="Contact Lastname" ColSpan="1" >
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer29" runat="server">
                                <dx:ASPxTextBox ID="txtContactLastname" runat="server" Width="170px" MaxLength="40" MaskSettings-IncludeLiterals="None" >
                                    <MaskSettings IncludeLiterals="None"></MaskSettings>
                                    <ValidationSettings Display="Dynamic"  ErrorDisplayMode="ImageWithTooltip"  ErrorText="Contact name must be at least two characters long, with only letters">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                    <ClientSideEvents Validation="OnNameValidation" />
                                    <InvalidStyle BackColor="LightPink" />
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>

                    <dx:LayoutItem FieldName="Telephone" ColSpan="1">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer12" runat="server">
                                <dx:ASPxTextBox ID="txtTPhone" runat="server" Width="170px" MaxLength="15" ClientInstanceName="txtTPhone" OnValidation="PhoneTextBox_Validation"> 
                                       <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorText="Please enter a valid phone number, with no spaces or non numeric characters" SetFocusOnError="True">
                                           <RegularExpression ValidationExpression="[-+]?[0-9]*\.?[0-9]*" ErrorText="Please enter a valid phone number, with no spaces or non numeric characters" />
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                    <ClientSideEvents Validation="checkPhoneNumber" />
                                    <InvalidStyle BackColor="LightPink" />
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Preferred Call Back Time" FieldName="Callback" ColSpan="1">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer13" runat="server">
                                <dx:ASPxDateEdit ID="dtCallBack" runat="server" EditFormat="DateTime" ClientInstanceName="dtCallBack"  >
                                    <TimeSectionProperties Visible="True">
                                    </TimeSectionProperties>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="LeaveMessage" ColSpan="1">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer14" runat="server">
                                <dx:ASPxCheckBox ID="chkLeaveMessage" runat="server" CheckState="Unchecked">
                                </dx:ASPxCheckBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="ConsentThirdParty" ColSpan="1">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer15" runat="server">
                                <dx:ASPxCheckBox ID="chkThirdParty" runat="server" CheckState="Unchecked" >
                                    <ValidationSettings Display="Dynamic">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                      <InvalidStyle BackColor="LightPink" />
                                </dx:ASPxCheckBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            
            <dx:LayoutGroup Caption="Referral Details" ColCount="2"  ColSpan="2">
                <Items>
                    <dx:LayoutItem FieldName="PresentingCondition"  ColSpan="1" >
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer18" runat="server">
                                <dx:ASPxTextBox ID="txtPresentingCondition" runat="server" Width="350px"  >
                                    <ValidationSettings Display="Dynamic">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                    <InvalidStyle BackColor="LightPink" />
                                </dx:ASPxTextBox>
                              
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>

               

                    <dx:LayoutItem FieldName="OutpatientLimit"  ColSpan="1">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer19" runat="server">
                                <dx:ASPxSpinEdit ID="spinOutPatientLimit" runat="server" Number="0" MaxLength="10">
                              </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>

                    <dx:LayoutItem FieldName="Symptoms" ColSpan="1">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer17" runat="server">
                                <dx:ASPxMemo ID="txtSymptoms" runat="server" Height="71px" Width="350px" OnValidation="SymptomsTextBox_Validation">
                                    <ValidationSettings Display="Dynamic">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                    <InvalidStyle BackColor="LightPink" />
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>

                    <dx:LayoutItem FieldName="Excess" ColSpan="1">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer20" runat="server">
                                <dx:ASPxSpinEdit ID="spinExcess" runat="server" Number="0" MaxLength="10">
                                </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>

                    <dx:LayoutItem Caption="GP Select" FieldName="GPSelect" ColSpan="1">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer21" runat="server">
                                <dx:ASPxComboBox ID="cboGPSelect" runat="server" CssClass="cssDropDownMinValue"  ClientInstanceName="cboGPSelect">
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
                                    <InvalidStyle BackColor="LightPink" />
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>

                    <dx:LayoutItem FieldName="HospitalList" Caption="Hospital List" Name="HospitalList" ColSpan="1">
                         <LayoutItemNestedControlCollection>
                                 <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer22" runat="server">
                                <dx:ASPxComboBox ID="cboHospitalList" runat="server"  ClientInstanceName="cboHospitalList" OnValidation="HospitalListBox_Validation" CssClass="cssDropDownMinValue">
                                    <Items>
                                        <dx:ListEditItem Text="Local" Value="Local" />
                                        <dx:ListEditItem Text="Countrywide" Value="Country Wide" />
                                        <dx:ListEditItem Text="Premier" Value="Premier Plus" />
                                        <dx:ListEditItem Text="To Be Confirmed" Value="TBC" />
                                    </Items>
                                 <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip"  ErrorText="You must select an option from the drop down box if GP Select = No" >
                                    </ValidationSettings>
                                    <InvalidStyle BackColor="LightPink" />
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                              </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>

                    
                     <dx:LayoutItem Caption="Self-Pay" FieldName="SelfPaying"  ColSpan="1">
                        <LayoutItemNestedControlCollection>
                   
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer16" runat="server">
                                <dx:ASPxCheckBox ID="chkSelfPay" runat="server" CheckState="Unchecked">
                                </dx:ASPxCheckBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>

        </Items>
      

    </dx:ASPxFormLayout>

     <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" ColCount="2" EnableTheming="true"  ClientInstanceName="ASPxFormLayout2" >
          
        <Items>
            <dx:LayoutGroup Caption="Actions" ColCount="3"> <%--ColCount="3" ColSpan="1">--%>
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
                                <dx:ASPxButton ID="btnSave"  runat="server" Text="Send Referral">
                                </dx:ASPxButton> 
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
<%--                    <dx:LayoutItem Caption="" Name="lblSave">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer28" runat="server" >

                          <dx:ASPxLabel ID="lblSaveStatus" runat="server" AssociatedControlID="btnSave" Font-Size="Large"></dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>--%>
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
//ASPxClientEdit.ClearEditorsInContainerById('formContainer');

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

