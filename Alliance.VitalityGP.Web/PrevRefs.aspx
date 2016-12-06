<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="PrevRefs.aspx.vb" Inherits="PrevRefs" %>
<%@ Register assembly="DevExpress.Web.v16.1, Version=16.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Xpo.v16.1, Version=16.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Xpo" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
 
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="Oid" Theme="Moderno">

<SettingsCommandButton>
<ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

<HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
</SettingsCommandButton>
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <Columns>
               <dx:GridViewDataHyperLinkColumn Caption="#" FieldName="Oid" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1" Width="30px">
                   <PropertiesHyperLinkEdit NavigateUrlFormatString="~/EditForm.aspx?id={0}" Text="view">
                   </PropertiesHyperLinkEdit>
                   <Settings AllowAutoFilter="False" />
               </dx:GridViewDataHyperLinkColumn>
          <dx:GridViewDataTextColumn FieldName="Oid" ReadOnly="True"  VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Source" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Surname" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DOB" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PostCode" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
           <%-- <dx:GridViewDataTextColumn FieldName="TertiaryReferral" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Insurer" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="InsurerAgent" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="Patient" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Client" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Claim" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="Opportunityid" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="ReferralDate" VisibleIndex="11">
            </dx:GridViewDataDateColumn>--%>
            <dx:GridViewDataTextColumn FieldName="AuthorisationNo" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MembershipNo" VisibleIndex="13">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PolicyNo" VisibleIndex="14">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="System" VisibleIndex="15">
            </dx:GridViewDataTextColumn>
           <%-- <dx:GridViewDataTextColumn FieldName="ReferralType" VisibleIndex="16">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ReferralCategory" VisibleIndex="17">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="F2FPractice" VisibleIndex="18">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="HospitalList" VisibleIndex="19">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NamedConsultant" VisibleIndex="20" >
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Excess" VisibleIndex="21">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ExcessRemaining" VisibleIndex="22">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="OutPatientFull" VisibleIndex="23">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn FieldName="OutPatientLimit" VisibleIndex="24">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="OutPatientLimitRemaining" VisibleIndex="25">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="StaffClaim" VisibleIndex="26">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataDateColumn FieldName="PolicyRenewalDate" VisibleIndex="27">
            </dx:GridViewDataDateColumn>--%>
            <dx:GridViewDataTextColumn FieldName="Symptom" VisibleIndex="28">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SymptomDetails" VisibleIndex="29">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Details" VisibleIndex="30">
            </dx:GridViewDataTextColumn>
           <%--  <dx:GridViewDataCheckColumn FieldName="NewProcess" VisibleIndex="31">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="Triaged" VisibleIndex="32">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="ComplexTriage" VisibleIndex="33">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="ConsultantTaffed" VisibleIndex="34">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="PatientTaffed" VisibleIndex="35">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataDateColumn FieldName="DatePatientTaffed" VisibleIndex="36">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataCheckColumn FieldName="isTaffed" ReadOnly="True" VisibleIndex="35">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="IsBooked" ReadOnly="True" VisibleIndex="36">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn FieldName="BookedBy" VisibleIndex="37">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="BookedDate" VisibleIndex="38">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="CCardAuthorised" VisibleIndex="39">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="CardFirstPayment" VisibleIndex="40">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Triageconsultant" VisibleIndex="41">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="HCAAvoided" VisibleIndex="42">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn FieldName="SpecialInstructions" VisibleIndex="43">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PCASource" VisibleIndex="44">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssignedTeam" VisibleIndex="45">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssignedUser" VisibleIndex="46">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SeenGP" VisibleIndex="47">
            </dx:GridViewDataTextColumn>
       <dx:GridViewDataTextColumn FieldName="ReferralLetter" VisibleIndex="48">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="RecommendedSpecialism" VisibleIndex="49">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Specialism" VisibleIndex="50">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Consultant" VisibleIndex="51">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Hospital" VisibleIndex="52">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="FirstConsultation" VisibleIndex="53">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Latitude" VisibleIndex="55">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Longitude" VisibleIndex="56">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Distance" VisibleIndex="57">
            </dx:GridViewDataTextColumn>
          <dx:GridViewDataTextColumn FieldName="TravelTime" VisibleIndex="58">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Failed" VisibleIndex="59">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn FieldName="PassBackType" VisibleIndex="60">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="PassBackDate" VisibleIndex="61">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="PassBackBy" VisibleIndex="62">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="DischargeDate" VisibleIndex="63">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="InvoicedValue" VisibleIndex="64" ReadOnly="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ConsultantValue" ReadOnly="True" VisibleIndex="65">
            </dx:GridViewDataTextColumn>
          <dx:GridViewDataTextColumn FieldName="Description" ReadOnly="True" VisibleIndex="66">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DPA" ReadOnly="True" VisibleIndex="67">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CreatedBy" VisibleIndex="68">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="CreatedAt" VisibleIndex="69">
            </dx:GridViewDataDateColumn>
         <dx:GridViewDataTextColumn FieldName="ModifiedBy" VisibleIndex="70">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="ModifiedAt" VisibleIndex="71">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="DeletedBy" VisibleIndex="72">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="DeletedAt" VisibleIndex="73">
            </dx:GridViewDataDateColumn>--%>
  
        </Columns>
        <Settings ShowFilterRow="True" />
    </dx:ASPxGridView>
    <dx:XpoDataSource ID="XpoDataSource1" runat="server" DefaultSorting="" TypeName="Alliance.Data.Referral" Criteria="">
    </dx:XpoDataSource>
   
</asp:Content>


