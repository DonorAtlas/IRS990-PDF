<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS944Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS944"/>
	<xsl:template match="/">
		<xsl:if test="$Language='ENGLISH'">
			<xsl:call-template name="IRS944ENG"/>
		</xsl:if>
		<xsl:if test="$Language='SPANISH'">
			<xsl:call-template name="IRS944SP"/>
		</xsl:if>
	</xsl:template>	
	<xsl:template name="IRS944ENG">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 944"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS944Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass" style="width:187mm">
				<form name="IRS944" style="font-family:arial;">
					<xsl:call-template name="DocumentHeader"/>
					<!--  Begin Header-->
                    <div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/FinalPayrollInfoStatement"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/TransferOfBusinessStatement"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/GeneralDependencySmall"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/BinaryAttachment"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/IRS945A"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/IRS941ScheduleD"/>
						</xsl:call-template>
						<br/>
						<div class="styFNBox" style="width:43mm;height:10mm;border:0px;">Form
							<span class="styFormNumber" style="font-size:15pt;">944 for 2024: </span>
						</div>
						<div class="styFTBox" style="width:100mm;text-align:left;height:10mm;">
							<div class="styMainTitle" style="font-size:12pt;padding-top:1mm;">
								<!--2/2/24 AC: Per INC00794962, removed special character that is causing issue-->
								Employer's ANNUAL Federal Tax Return
							</div>
							<div class="styFST" style="height:4mm;">
								<span class="styAgency" style="font-weight:normal">Department of the Treasury — Internal Revenue Service</span>
							</div>
						</div>
						<div class="styTYBox" style="width:43.7mm;height:10mm;border:0px;">
							<div class="styOMB" style="height:10mm;font-size:7pt;text-align:right;border:0px;padding-top:6mm;padding-right:2mm;">OMB No. 1545-0029</div>
						</div>					
						<div class="styBB" style=" width:131mm;height:63mm;float:left;border:black solid 1px;padding-top:2mm;padding-left:1mm;padding-right:2mm;">
							<div style="width:128mm;padding-top:0mm;">
								<span style="float:left;padding-top:3mm;"><b>Employer identification number </b>(EIN)</span>
								<span class="styLNCtrNumBox" style="width:80mm;border-top-width:1px;padding-top:1mm;float:right;height:6.3mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										<xsl:with-param name="EINChanged">true</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<!-- 5/13/2015 AM: Adjusted Filer name height from 7mm to 12mm per Defect 43014 --> 
							<div style="width:128mm;padding-bottom:2mm;padding-top:2mm;">
								<span style="float:left;padding-top:4mm;"><b>Name</b><i> (not your trade name)</i></span>
								<span class="styLNCtrNumBox" style="width:95mm;border-top-width:1px;float:right;height:12mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
								</span>
							</div>
							<div style="width:128mm;padding-bottom:2mm;">
								<span style="float:left;padding-top:4mm;"><b>Trade name</b><i> (if any)</i></span>
								<span class="styLNCtrNumBox" style="width:104mm;border-top-width:1px;float:right;height:7mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine1Txt"/>
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</span>
							</div>
							<div style="width:128mm;padding-bottom:0mm;">
								<span style="width:20mm;height:15mm;float:left;padding-top:2mm;font-weight:bold;">Address</span>
								<span class="styLNCtrNumBox" style="width:108mm;height:6mm;float:right;border-top-width:1px;padding-top:1mm;padding-left:1mm;text-align:left;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template>&nbsp;
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:108mm;font-size:6pt;padding-left:1mm;">
									Number<span style="width:16mm"/>Street<span style="width:50mm;"/>Suite or room number
								</span>
								<span class="styLNCtrNumBox" style="width:66mm;border-top-width:1px;padding-top:1mm;height:7mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:13mm;border-top-width:1px;padding-top:1mm;height:7mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:24mm;border-top-width:1px;padding-top:1mm;height:7mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:128mm;font-size:6pt;padding-left:21mm;">
									<span style="width:66mm;">City</span>
									<span style="width:13mm;text-align:center;">State</span>
									<span style="width:24mm;text-align:center;">ZIP code</span>
								</span>
								<!-- 9/23/2015 AM: Per Defect 44870, adjusted foreign address fields heights from 6mm to 7mm. -->
								<span style="width:128mm;padding-left:20mm;">
								<span class="styLNCtrNumBox" style="width:52mm;height:7mm;border-top-width:1px;padding-top:1mm;text-align:left;padding-left:1mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:29mm;border-top-width:1px;padding-top:1mm;height:7mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:22mm;border-top-width:1px;padding-top:1mm;height:7mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
									</xsl:call-template>
								</span>
								</span>
								<span style="width:128mm;font-size:6pt;padding-left:20mm;">
									<span style="width:53mm;padding-left:1mm;">Foreign country name</span>
									<span style="width:29.5mm;text-align:center;">Foreign province/county</span>
									<span style="width:24mm;text-align:center;">Foreign postal code</span>
								</span>
							</div>
						</div>
						<div style="float:right;padding-right:2mm;">
							<div class="styBB" style="width:51mm;height:39mm;border-left-width:1px;border-right-width:1px;border-top-width:1px;padding-top:2mm;">
								<div class="styPartName" style="width:50.5mm;text-align:center;font-size:9pt;">Who Must File Form 944</div>
								<div style="width:48.5mm;float:none;clear:both;padding-left:2mm;font-size:8pt;line-height:130%;">
									You must file annual Form 944<br/>instead of filing quarterly Forms 941<br/><b>only if the IRS 
									notified you in<br/>writing.</b><br/>
									<div style="width:48.5mm;text-align:left;padding-left:2mm;"></div>Go to 
									<a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form944" title="Link to IRS.gov"><i>www.irs.gov/Form944</i> for instructions and the lastest information.</a>
								</div>
							</div>
						</div>
					</div>
					<div class="styLNDesc" style="width:187mm;font-size:9pt;">
						Read the separate instructions before you complete Form 944. Type or print within the boxes.
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;text-align:center;height:12mm;padding-top:4mm;font-size:9pt;">Part 1:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:12mm;padding-left:2mm;font-size:9pt;">Answer these questions for this year. 
							Employers in American Samoa, Guam, the Commonwealth of the Northern Mariana Islands, the U.S. Virgin Islands, and Puerto Rico can skip lines 1 and 2, 
							unless you have employees who are subject to U.S. income tax withholding.</div>
					</div>
					<div style="width:187mm;padding-left:0mm;padding-top:.5mm;padding-bottom:0px;">
						<!--Line 1-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">1</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									<span style="float:left;">Wages, tips, and other compensation </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>								
								</div>
							</span>
							<span style="float:right">
								<div class="styIRS944RightNumBox">1</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/WagesAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 2-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">2</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									<span style="float:left;">Federal income tax withheld from wages, tips, and other compensation </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>								
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS944RightNumBox">2</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 3-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;">3</div>
							<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
								If no wages, tips, and other compensation are subject to social security or Medicare tax
							</div>
							<div class="styIRS944RightNumBox" style="padding-top:0.5mm;">3</div>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/WagesNotSubjToSSMedcrTaxInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="WagesNotSubjectToSocialSecurityMedicareTax" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/WagesNotSubjToSSMedcrTaxInd"/>
										<xsl:with-param name="BackupName">944WagesNotSubjToSSMedcrTaxInd</xsl:with-param>
									</xsl:call-template>
								</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/WagesNotSubjToSSMedcrTaxInd"/>
										<xsl:with-param name="BackupName">944WagesNotSubjToSSMedcrTaxInd</xsl:with-param>
									</xsl:call-template>
									<span style="font-size:8pt;font-weight:bold">Check here and go to line 5.</span>
								</label>
							
						</div>
						<!--Line 4 Header-->
						<div style="width:187mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;">4</div>
							<div class="styLNDesc" style="width:136mm;padding-left:1mm;font-weight:bold;">
								Taxable social security and Medicare wages and tips:
							</div>
							<div class="styLNDesc" style="width:187mm;font-style:italic;">
								<span style="width:67.5mm;"/><span style="width:35mm;text-align:center;">Column 1</span>
								<span style="width:14mm;"/><span style="width:35mm;text-align:center;">Column 2</span>
							</div>
						</div>
						<!--Line 4a-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" style="width:9mm;"/>
							<div style="width:5.5mm;float:left;font-weight:bold;padding-top:2mm;">4a</div>
							<div class="styLNDesc" style="width:49mm;font-weight:bold;padding-top:2mm;">Taxable social security wages </div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityWageAndTaxGrp/SocialSecurityTaxCashWagesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2mm;">x 0.124 = </div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityWageAndTaxGrp/SocialSecurityTaxAmt"/>
								</xsl:call-template>
							</div>
<!--							<div class="styBB" style="width:39mm;height:41mm;float:right;border-left-width:1px;border-right-width:1px;border-top-width:1px;padding-left:1mm;padding-top:1mm;"> *Include taxable qualified sick and family leave wages paid in 2024 for leave taken after March 31, 2021, and before October 1, 2021, on line 4a. Use lines 4a(i) and 4a(ii) <b>only</b> for taxable qualified sick and family leave wages paid in 2024 for leave taken after March 31, 2020, and before April 1, 2021.
							</div>	-->
						</div>
						<!--Line 4a(i)-->
<!--						<div style="width:187mm;height:8mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" style="width:9mm;"/>
							<div style="width:5.5mm;float:left;font-weight:bold;padding-top:2mm;">4a</div>
							<div class="styLNDesc" style="width:49mm;font-weight:bold;padding-top:2mm;">(i) Qualified sick leave wages* </div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SSWageTaxQlfySickLeaveGrp/SocialSecurityQlfyPdSLWageAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2mm;">x 0.062 = </div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SSWageTaxQlfySickLeaveGrp/SocialSecurityQlfyPdSLTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>-->
						<!--Line 4a(ii)-->
<!--						<div style="width:187mm;height:8mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" style="width:9mm;"/>
							<div style="width:5.5mm;float:left;font-weight:bold;padding-top:2mm;">4a</div>
							<div class="styLNDesc" style="width:49mm;font-weight:bold;padding-top:2mm;">(ii) Qualified family leave wages* </div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SSWageTaxQlfyFamilyLeaveGrp/SocialSecurityQlfyPdFMLWageAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2mm;">x 0.062 = </div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SSWageTaxQlfyFamilyLeaveGrp/SocialSecurityQlfyPdFMLTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>-->
						<!--Line 4b-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" style="width:9mm;"/>
							<div style="width:5.5mm;float:left;font-weight:bold;padding-top:2mm;">4b</div>
							<div class="styLNDesc" style="width:49mm;font-weight:bold;padding-top:2mm;">Taxable social security tips </div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTipsAndTaxGrp/TaxableSocSecTipsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2mm;">x 0.124 = </div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTipsAndTaxGrp/TaxOnSocialSecurityTipsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 4c-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" style="width:9mm;"/>
							<div style="width:5.5mm;float:left;font-weight:bold;padding-top:2mm;">4c</div>
							<div class="styLNDesc" style="width:49mm;font-weight:bold;padding-top:2mm;">Taxable Medicare wages &amp; tips </div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MedicareWageTipsAndTaxGrp/TaxableMedicareWagesTipsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2mm;">x 0.029 = </div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MedicareWageTipsAndTaxGrp/TaxOnMedicareWagesTipsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 4d-->
						<div style="width:187mm;font-size:8pt;padding-bottom:2mm;">
							<div class="styLNLeftNumBoxSD" style="width:9mm;"/>
							<div style="width:5.5mm;float:left;font-weight:bold;">4d</div>
							<div class="styLNDesc" style="width:49mm;font-weight:bold;float:left;padding-top:0mm;">Taxable wages &amp; tips subject to<br/>
								Additional Medicare Tax<br/><span style="float:left;"> withholding </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">........</span>							
							</div>
							<div style="float:left;padding-top:4mm;">
								<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AddnlMedicareWageTipsAndTaxGrp/TxblWageTipsSubjAddnlMedcrAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2mm;">x 0.009 = </div>
								<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AddnlMedicareWageTipsAndTaxGrp/TaxOnWageTipsSubjAddnlMedcrAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Line 4e-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:.5mm;">
								<div class="styLNLeftNumBoxSD" style="width:9mm;"/>
								<div style="width:5.5mm;float:left;font-weight:bold;padding-top:2mm;">4e</div>
								<div class="styLNDesc" style="width:123mm;padding-top:0mm;padding-top:2mm;">
									<b>Total social security and Medicare taxes.</b> Add Column 2 from lines 4a, 4b, 4c, and 4d
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS944RightNumBox">4e</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalSSMdcrTaxAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 5-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">5</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;">
									<span style="float:left;"><b>Total taxes before adjustments</b>. Add lines 2 and 4e </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>								
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS944RightNumBox">5</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxBeforeAdjustmentAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 6-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">6</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;">
									<span style="float:left;"><b>Current year's adjustments</b> (see instructions) </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>								
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS944RightNumBox">6</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<!-- 12/23/2014 AM: Per KISAM IM01960276, choose statement added to properly display negative numbers and cents only -->
									<xsl:choose>
										<xsl:when test="starts-with($FormData/CurrentYearAdjustmentAmt,'-') or starts-with($FormData/CurrentYearAdjustmentAmt,'.')">
											<span style="color:darkblue;">
												<xsl:call-template name="PlaceCommas">
													<xsl:with-param name="MaxSize" select="15"/>
													<xsl:with-param name="MaxSizeWithSign" select="16"/>
													<xsl:with-param name="TargetNode" select="$FormData/CurrentYearAdjustmentAmt"/>
												</xsl:call-template>
											</span>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/CurrentYearAdjustmentAmt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</span>
						</div>
						<!--Line 7-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">7</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;">
									<span style="float:left;"><b>Total taxes after adjustments.</b> Combine lines 5 and 6 </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>								
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS944RightNumBox">7</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAfterAdjustmentAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--08/01/2017 TB:Added lines 8 & 9, deleted reserve, and old line 8 is now line 10. Also, Decreased Line 8 font size to 7.5pt in 
						order to fit pushpin-->
						<!--Line 8a-->
						<div style="width:187mm;height:8mm;font-size:7.5pt">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">8</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;">
									<span style="float:left;padding-right:1mm">
										<b>Qualified small business payroll tax credit for increasing research activities.</b> Attach Form 8974 </span>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/PayrollTaxCreditAmt"/>
										</xsl:call-template>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS944RightNumBox">8</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PayrollTaxCreditAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 8b-->
<!--						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:1mm">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">8b</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									Nonrefundable portion of credit for qualified sick and family leave wages for leave taken before 
									<span style="float:left;">April 1, 2021 </span>
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>								
								</div>
							</span>
							<span style="float:right;padding-top:.5mm;">
								<div class="styIRS944RightNumBox">8b</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NrfdblCrQlfySLFMLWagesAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>-->
						<!--Line 8c-->
<!--						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">8c</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									<span style="float:left;">Reserved for future use</span>
								--><!--<span style="float:left;">Nonrefundable portion of employee retention credit </span>--><!--
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>								
								</div>
							</span>
							<span style="float:right;padding-top:.5mm;">
								<div class="styIRS944RightNumBox">8c</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:.5mm;text-align:right;padding-right:1mm;background-color:lightgrey">
									--><!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NrfdblEmplRtntnCrCOVIDAmt"/>
									</xsl:call-template>--><!--
								</div>
							</span>
						</div>-->
						<!--Line 8d-->
<!--						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">8d</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									Nonrefundable portion of credit for qualified sick and family leave wages for leave taken after 
									<span style="float:left;">March 31, 2021, and before October 1, 2021 </span>
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>						
								</div>
							</span>
							<span style="float:right;padding-top:.5mm;">
								<div class="styIRS944RightNumBox">8d</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NrfdblCrQlfySLFMLWagesAftrAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>-->
					<!--Part 1 continued-->
<!--					<div class="styBB" style="width:187mm;">			
						<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;font-size:9pt;">Part 1:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;font-size:9pt;">
						Answer these questions for this year. (continued)</div>
					</div>-->
					<!--Line 8e-->
<!--						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">8e</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold">
									--><!--<span style="float:left;">Nonrefundable portion of COBRA premium assistance credit</span>--><!--
									<span style="float:left;">Reserved for future use </span>
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>								
								</div>
							</span>
							<span style="float:right;padding-top:1mm;">
								<div class="styIRS944RightNumBox">8e</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;background-color:lightgrey;">
									--><!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NrfdblCOBRAPremiumSubsidyAmt"/>
									</xsl:call-template>--><!--
								</div>
							</span>
						</div>-->
						<!--Line 8f-->
<!--						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">8f</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									--><!--<span style="float:left;"><b>Number of individuals provided COBRA premium assistance</b></span>--><!--
									<span style="float:left;">Reserved for future use </span>
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>								
								</div>
							</span>
							<span style="float:right;padding-top:1mm;">
								<div class="styIRS944RightNumBox">8f</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;background-color:lightgrey;">
									--><!--<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/COBRAPremiumSubsidyRcpntCnt"/>
									</xsl:call-template>--><!--
								</div>
							</span>
						</div>-->
						<!--Line 8g-->
<!--						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">8g</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;">
									<span style="float:left;"><b>Total nonrefundable credits.</b> Add lines 8a, 8b, 8c, and 8d </span>
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>								
								</div>
							</span>
							<span style="float:right;padding-top:1mm;">
								<div class="styIRS944RightNumBox">8g</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalNonrefundableCreditsAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>-->
						<!--Line 9-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">9</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;">
									<span style="float:left;"><b>Total taxes after adjustments and nonrefundable credits.</b> Subtract line 8 from line 7 </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>								
								</div>
							</span>
							<span style="float:right;padding-top:1mm;">
								<div class="styIRS944RightNumBox">9</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 10-->
						<div style="width:187mm;height:10mm;font-size:8pt;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">10</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									Total deposits for this year, including overpayment applied from a prior year and
									<span style="float:left;">overpayments applied from Form 944-X, 941-X, or 941-X (PR) </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>								
								</div>
							</span>
							<span style="float:right;padding-top:2mm;">
								<div class="styIRS944RightNumBox">10</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxDepositAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 10b-->
<!--						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">10b</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									--><!--<span style="float:left;">Deferred amount of the employer share of social security tax </span>--><!--
									<span style="float:left;">Reserved for future use </span>
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>								
								</div>
							</span>
							<span style="float:right;padding-top:1mm;">
								<div class="styIRS944RightNumBox">10b</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;background-color:lightgrey;">
									--><!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/DeferredPaymentEmplrShrSSTAmt"/>
									</xsl:call-template>--><!--
								</div>
							</span>
						</div>-->
						<!--Line 10c-->
<!--						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">10c</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									--><!--<span style="float:left;">Deferred amount of the employee share of social security tax </span>--><!--
									<span style="float:left;">Reserved for future use </span>
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>								
								</div>
							</span>
							<span style="float:right;padding-top:1mm;">
								<div class="styIRS944RightNumBox">10c</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;background-color:lightgrey">
									--><!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/DeferredPymtEmployeeShrSSTAmt"/>
									</xsl:call-template>--><!--
								</div>
							</span>
						</div>-->
						<!--Line 10d-->
<!--						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:.5mm">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">10d</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									Refundable portion of credit for qualified sick and family leave wages for leave taken before 
									<span style="float:left;">April 1, 2021 </span>
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>								
								</div>
							</span>
							<span style="float:right;padding-top:1mm;">
								<div class="styIRS944RightNumBox">10d</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RfdblCrQlfySLFMLWagesAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>-->
						<!--Line 10e-->
<!--						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">10e</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									<span style="float:left;">Reserved for future use </span>
									--><!--<span style="float:left;">Refundable portion of employee retention credit </span>--><!--
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>								
								</div>
							</span>
							<span style="float:right;padding-top:1mm;">
								<div class="styIRS944RightNumBox">10e</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;background-color:lightgrey">
									--><!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RfdblEmplRtntnCrCOVIDAmt"/>
									</xsl:call-template>--><!--
								</div>
							</span>
						</div>-->
						<!--Line 10f-->
<!--						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:.5mm">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">10f</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									Refundable portion of credit for qualified sick and family leave wages for leave taken after 
									<span style="float:left;">March 31, 2021, and before October 1, 2021 </span>
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>								
								</div>
							</span>
							<span style="float:right;padding-top:1mm;">
								<div class="styIRS944RightNumBox">10f</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RfdblCrQlfySLFMLWagesAftrAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>-->
						<!--Line 10g-->
<!--						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">10g</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									--><!--<span style="float:left;">Refundable portion of COBRA premium assistance credit </span>--><!--
									<span style="float:left;">Reserved for future use </span>
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>								
								</div>
							</span>
							<span style="float:right;padding-top:1mm;">
								<div class="styIRS944RightNumBox">10g</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;background-color:lightgrey;">
									--><!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RfdblCOBRAPremiumSubsidyAmt"/>
									</xsl:call-template>--><!--
								</div>
							</span>
						</div>-->
						<!--Line 10h-->
<!--						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">10h</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;">
									<span style="float:left;"><b>Total deposits and refundable credits.</b> Add lines 10a, 10d, and 10f </span>
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>								
								</div>
							</span>
							<span style="float:right;padding-top:1mm;">
								<div class="styIRS944RightNumBox">10h</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentRefundableCrAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>-->
						<!--Line 10i-->
<!--						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">10i</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									<span style="float:left;">Reserved for future use</span>
									--><!--<span style="float:left;">Total advances received from filing Form(s) 7200 for the year </span>--><!--
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>								
								</div>
							</span>
							<span style="float:right;padding-top:1mm;">
								<div class="styIRS944RightNumBox">10i</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;background-color:lightgrey">
									--><!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotAdvncPymtEmplrCrReqQtrAmt"/>
									</xsl:call-template>--><!--
								</div>
							</span>
						</div>-->
						<!--Line 10j-->
<!--						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">10j</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									<span style="float:left;">Reserved for future use</span>
									--><!--<span style="float:left;"><b>Total deposits and refundable credits less advances.</b> Subtract line 10i from line 10h </span>--><!--
									--><!--Dotted Line--><!--
									<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>								
								</div>
							</span>
							<span style="float:right;padding-top:1mm;">
								<div class="styIRS944RightNumBox">10j</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;background-color:lightgrey">
									--><!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NetTotalPaymentRefundableCrAmt"/>
									</xsl:call-template>--><!--
								</div>
							</span>
						</div>-->
						<!--Line 11-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBox" style="width:8mm;padding-left:1.5mm">11</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;">
									<span style="float:left;"><b>Balance due.</b> If line 9 is more than line 10, enter the difference and see instructions </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>								
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS944RightNumBox">11</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 12-->
						<div style="width:187mm;height:8mm;">
							<div class="styLNLeftNumBox" style="width:8mm;font-size:8pt;padding-top:2mm;padding-left:1.5mm">12</div>
							<div class="styLNDesc" style="width:83mm;padding-left:1mm;padding-top:2mm;font-size:8pt;">
								<b>Overpayment.</b> If line 10 is more than line 9, enter the difference
							</div>
							<div class="styLNCtrNumBox" style="width:26mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-left:1mm;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/OverpaidAmt"/>
								</xsl:call-template>
							</div>
							<div style="padding-top:1.5mm;float:left;">
								<div class="styLNDesc" style="width:17mm;text-align:center;padding-top:1.5mm">Check one: </div>
								<span>		
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="ApplyToNextReturn" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
										<xsl:with-param name="BackupName">944ApplyOverpaymentNextReturnInd</xsl:with-param>
									</xsl:call-template>
								</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
										<xsl:with-param name="BackupName">944ApplyOverpaymentNextReturnInd</xsl:with-param>
									</xsl:call-template>
									<span style="font-size:7pt;padding-left:1mm;padding-right:1mm;">Apply to next return.</span>
								</label>
								
								<span>	
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="SendARefund" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
										<xsl:with-param name="BackupName">944RefundOverpaymentInd</xsl:with-param>
									</xsl:call-template>
								</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
										<xsl:with-param name="BackupName">944RefundOverpaymentInd</xsl:with-param>
									</xsl:call-template>
									<span style="font-size:7pt;padding-left:1mm;">Send a refund.</span>
								</label>
								
							</div>
						</div>
						<!-- Bullet Message -->
						<div class="styBB" style="width:187mm;font-size:8pt;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;"/>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									<!--<img src="{$ImagePath}/944_Bullet.gif" alt="Right pointing arrowhead image"/>-->
									You MUST complete both pages of Form 944 and SIGN it.
								</div>
							</span>
<!--							<span style="width:30mm;text-align:right;padding-bottom:0mm;float:right;">
								<img src="{$ImagePath}/944_Next.gif" alt="Next Page Arrow Image"/>
							</span>-->
						</div>					
					</div>
					<!-- Page boundary -->
					<div class="pageEnd" style="width:187mm;border-top-width:1px;">
						<span style="float:left;clear:none;font-weight:bold;font-size:8pt;">For Privacy Act and Paperwork Reduction Act Notice, see separate instructions</span>
						<span style="float:left;clear:none;margin-left:18mm;padding-top:0.5mm;">Cat. No. 39316N</span>
						<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:9pt;">944</span> (2024)</span>
					</div>
					<p style="page-break-before: always"/>
					<!--Begin Page 2-->
					<div style="width:187mm;">
						<!--Name Shown on return-->
						<div class="styBB" style="width:187mm;font-size:7pt;border-top-width:2px;">
							<div class="styFNBox" style="width:126mm; height:8.5mm;">
								<b>Name</b><i> (not your trade name)</i><br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
								<div style="line-height:100%; font-family:verdana;font-size:7pt"/>
							</div>
							<div style="padding-left:1mm;">
							<b>Employer identification number (EIN)</b><br/>
								<div style="text-align:left;padding-top:2.5mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!--Part 2-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">			
						<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;font-size:9pt;">Part 2:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;font-size:9pt;">
						Tell us about your deposit schedule and tax liability for this year.</div>
					</div>
					<!--Line 13-->
					<div style="width:187mm;padding-bottom:1mm;padding-top:1mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="width:8mm;">13</div>
						<div class="styLNDesc" style="width:20mm;height:13mm;padding-left:1mm;"><b>Check one:</b></div>
						<input type="checkbox" alt="AnnualDepositor" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/AnnualDepositorInd"/>
								<xsl:with-param name="BackupName">944AnnualDepositorInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label style="padding-left:3mm;width:155mm;vertical-align:top;">
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/AnnualDepositorInd"/>
								<xsl:with-param name="BackupName">944AnnualDepositorInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:150mm;padding-top:1mm"><b>Line 9 is less than $2,500. Go to Part 3.</b></span>
						</label>
						<br/><br/>
						<input type="checkbox" alt="MonthlyDepositor" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/MonthlyDepositorInd"/>
								<xsl:with-param name="BackupName">944MonthlyDepositorInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label style="padding-left:3mm;width:155mm;vertical-align:top;">
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/MonthlyDepositorInd"/>
								<xsl:with-param name="BackupName">944MonthlyDepositorInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:150mm;font-size:7pt;padding-top:1mm"><b>Line 9 is $2,500 or more. Enter your tax liability for each month. If you're a semiweekly schedule depositor or you became one because you accumulated $100,000 or more of liability on any day during a deposit period, you must complete Form 945-A instead of the boxes below.</b></span>
						</label>
					</div>
					<!--13a-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:8mm;float:left;"/>
						<div style="float:right;">
							<div style="width:40mm;float:left;">
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Jan.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13a</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='JANUARY']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13b-->			
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Feb.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13b</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='FEBRUARY']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13c-->			
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Mar.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13c</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='MARCH']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>	
							</div>
							<!--13d-->
							<div style="width:40mm;float:left;">
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Apr.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13d</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='APRIL']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13e-->
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">May</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13e</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='MAY']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13f-->
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Jun.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13f</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='JUNE']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>	
							</div>
							<!--13g-->
							<div style="width:40mm;float:left;">
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Jul.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13g</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='JULY']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13h-->
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Aug.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13h</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='AUGUST']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13i-->
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Sep.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13i</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='SEPTEMBER']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--13j-->
							<div style="width:40mm;float:left;">
								<div class="styLNDesc" style="width:40mm;padding-left:10mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Oct.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13j</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:right;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='OCTOBER']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13k-->
								<div class="styLNDesc" style="width:40mm;padding-left:10mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Nov.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13k</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:right;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='NOVEMBER']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13l-->
								<div class="styLNDesc" style="width:40mm;padding-left:10mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Dec.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13l</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:right;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='DECEMBER']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>	
							</div>
						</div>
					</div>
					<!--Total Liability for year-->
					<div style="width:187mm;font-size:8pt;padding-top:2mm;padding-bottom:2mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:28mm;"/>
							<div class="styLNDesc" style="width:105mm;padding-left:1mm;font-weight:bold;padding-top:2.4mm;">
								Total liability for year. Add lines 13a through 13l. Total must equal line 9.
							</div>
						</span>
						<span style="float:right;">
							<div class="styIRS944RightNumBox" style="width:10mm;padding-right:2mm;padding-top:2.4mm;">13m</div>
							<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLiabilityAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!-- Bullet Message -->
<!--					<div class="styBB" style="width:187mm;font-size:8pt;border-bottom-width:2px;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:8mm;"/>
							<div class="styLNDesc" style="width:130mm;padding-left:15mm;font-weight:bold;">
								<img src="{$ImagePath}/944_Bullet.gif" alt="Right pointing arrowhead image"/>
								You MUST complete all three pages of Form 944 and SIGN it.
							</div>
						</span>
						<span style="float:right;">
							<div style="width:30mm;text-align:right;padding-bottom:0mm;">
								<img src="{$ImagePath}/944_Next.gif" alt="Next Page Arrow Image"/>
							</div>
						</span>
					</div>-->
					<!--Page Footer-->
<!--					<div class="pageEnd" style="width:187mm;">
						<span style="float:left;clear:none;">Page <span class="styBoldText" style="font-size:9pt;">2</span></span>
						<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:9pt;">944</span> (2024)</span>
					</div>
					<p style="page-break-before: always"/>-->
					<!--Begin Page 3-->
<!--					<div style="width:187mm;">-->
						<!--Name Shown on return-->
<!--						<div class="styBB" style="width:187mm;font-size:7pt;border-top-width:2px;">
							<div class="styFNBox" style="width:126mm; height:8.5mm;">
								<b>Name</b><i> (not your trade name)</i><br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
								<div style="line-height:100%; font-family:verdana;font-size:7pt"/>
							</div>
							<b>Employer identification number (EIN)</b><br/>
							<div style="text-align:left;padding-top:2.5mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</div>-->
					<!--Part 3-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">	
						<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;font-size:9pt;">Part 3:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;font-size:9pt;">
							Tell us about your business. If any question does NOT apply to your business, leave it blank.</div>
					</div>
					<!--Line 14-->
					<div style="width:187mm;padding-bottom:2mm;padding-top:2mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="width:8mm;">14</div>
						<div class="styLNDesc" style="width:147mm;padding-left:1mm;font-weight:bold;">
							If your business has closed or you stopped paying wages
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
						</div>
						<span>
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
						</xsl:call-template>
						<input type="checkbox" alt="FutureFilingNotRequired" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
								<xsl:with-param name="BackupName">944FutureFilingNotRequiredInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
								<xsl:with-param name="BackupName">944FutureFilingNotRequiredInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:1mm;"/>Check here, and<br/><br/>
						</label>
						</span>
						<div class="styLNDesc" style="width:56mm;padding-left:9mm;padding-top:1mm;">
							enter the final date you paid wages
						</div>
						<div class="styLNCtrNumBox" style="width:31mm;border-top-width:1px;height:5mm;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FinalWagesPaidDt"/>
							</xsl:call-template>
						</div>
						<div style="padding-top:1mm;padding-left:1mm">; also attach a statement to your return. See instructions.</div>
					</div>
					<!--Line 15-->
<!--					<div style="width:187mm;height:8mm;font-size:8pt;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">15</div>
							<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
								Qualified health plan expenses allocable to qualified sick leave wages for leave taken before 
								<span style="float:left;">April 1, 2021 </span>
								--><!--Dotted Line--><!--
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>								
							</div>
						</span>
						<span style="float:right;padding-top:1mm;">
							<div class="styIRS944RightNumBox">15</div>
							<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QHPExpnssSSQlfyPdSLWageAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>-->
					<!--Line 16-->
<!--					<div style="width:187mm;height:8mm;font-size:8pt;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">16</div>
							<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
								Qualified health plan expenses allocable to qualified family leave wages for leave taken before 
								<span style="float:left;">April 1, 2021 </span>
								--><!--Dotted Line--><!--
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>								
							</div>
						</span>
						<span style="float:right;padding-top:1mm;">
							<div class="styIRS944RightNumBox">16</div>
							<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QHPExpnssSSQlfyPdFMLWageAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>-->
					<!--Line 17-->
<!--					<div style="width:187mm;height:8mm;font-size:8pt;">
						<span style="float:left;padding-top:2mm">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">17</div>
							<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
								<span style="float:left;">Reserved for future use</span>
								--><!--<span style="float:left;">Qualified wages for the employee retention credit </span>--><!--
								--><!--Dotted Line--><!--
								<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>								
							</div>
						</span>
						<span style="float:right;padding-top:1mm;">
							<div class="styIRS944RightNumBox">17</div>
							<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;background-color:lightgrey">
								--><!--<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyWgsPdRtnEmplCOVIDAmt"/>
								</xsl:call-template>--><!--
							</div>
						</span>
					</div>	-->
					<!--Line 18-->
<!--					<div style="width:187mm;height:8mm;font-size:8pt;">
						<span style="float:left;padding-top:2mm">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">18</div>
							<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
								<span style="float:left;">Reserved for future use</span>
								--><!--<span style="float:left;">Qualified health plan expenses allocable to wages reported on line 17 </span>--><!--
								--><!--Dotted Line--><!--
								<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>								
							</div>
						</span>
						<span style="float:right;padding-top:1mm;">
							<div class="styIRS944RightNumBox">18</div>
							<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;background-color:lightgrey">
								--><!--<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QHPExpnssWgsPdRtnEmplCOVIDAmt"/>
								</xsl:call-template>--><!--
							</div>
						</span>
					</div>-->
					<!--Line 19-->
<!--					<div style="width:187mm;height:8mm;font-size:8pt;">
						<span style="float:left;padding-top:2mm">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">19</div>
							<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
								<span style="float:left;">Qualified sick leave wages for leave taken after March 31, 2021, and before October 1, 2021 </span>
								--><!--Dotted Line--><!--
								<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>								
							</div>
						</span>
						<span style="float:right;padding-top:1mm;">
							<div class="styIRS944RightNumBox">19</div>
							<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QlfySLWgsAftrAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>-->
					<!--Line 20-->
<!--					<div style="width:187mm;height:8mm;font-size:8pt;">
						<span style="float:left;padding-top:2mm">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">20</div>
							<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
								<span style="float:left;">Qualified health plan expenses allocable to qualified sick leave wages reported on line 19 </span>
								--><!--Dotted Line--><!--
								<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>								
							</div>
						</span>
						<span style="float:right;padding-top:1mm;">
							<div class="styIRS944RightNumBox">20</div>
							<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QHPExpnssQlfySLWgsAftrAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>-->
					<!--Line 21-->
<!--					<div style="width:187mm;height:8mm;font-size:8pt;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">21</div>
							<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
								Amounts under certain collectively bargained agreements allocable to qualified sick leave 
								<span style="float:left;">wages reported on line 19 </span>
								--><!--Dotted Line--><!--
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>								
							</div>
						</span>
						<span style="float:right;padding-top:1mm;">
							<div class="styIRS944RightNumBox">21</div>
							<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CrtnBrgnAgrmtQlfySLWgsAftrAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>-->
					<!--Line 22-->
<!--					<div style="width:187mm;height:8mm;font-size:8pt;">
						<span style="float:left;padding-top:2mm">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">22</div>
							<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
								<span style="float:left;">Qualified family leave wages for leave taken after March 31, 2021, and before October 1, 2021 </span>
								--><!--Dotted Line--><!--
								--><!--<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>		--><!--						
							</div>
						</span>
						<span style="float:right;padding-top:1mm;">
							<div class="styIRS944RightNumBox">22</div>
							<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyFMLWgsAftrAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>-->
					<!--Line 23-->
<!--					<div style="width:187mm;height:8mm;font-size:8pt;">
						<span style="float:left;padding-top:2mm">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">23</div>
							<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
								<span style="float:left;">Qualified health plan expenses allocable to qualified family leave wages reported on line 22 </span>
								--><!--Dotted Line--><!--
								<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>								
							</div>
						</span>
						<span style="float:right;padding-top:1mm;">
							<div class="styIRS944RightNumBox">23</div>
							<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QHPExpnssQlfyFMLWgsAftrAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>-->
					<!--Line 24-->
<!--					<div style="width:187mm;height:8mm;font-size:8pt;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">24</div>
							<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
								Amounts under certain collectively bargained agreements allocable to qualified family leave  
								<span style="float:left;">wages reported on line 22 </span>
								--><!--Dotted Line--><!--
								<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>								
							</div>
						</span>
						<span style="float:right;padding-top:1mm;">
							<div class="styIRS944RightNumBox">24</div>
							<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CrtnBrgnAgrmtQlfyFMLWgsAftrAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>-->
					<!--Line 25-->
<!--					<div style="width:187mm;height:8mm;font-size:8pt;">
						<span style="float:left;padding-top:2mm;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">25</div>
							<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
								<span style="float:left;">Reserved for future use</span>
								--><!--If you're eligible for the employee retention credit in the third quarter solely because your business is a recovery startup business, enter the total of any amounts included on lines 8c   
								<span style="float:left;">and 10e for the third quarter </span>--><!--
								--><!--Dotted Line--><!--
								<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>								
							</div>
						</span>
						<span style="float:right;padding-top:1mm;">
							<div class="styIRS944RightNumBox">25</div>
							<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;background-color:lightgrey">
								--><!--<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EligEmplRtntnCrRcvryStUp3rdAmt"/>
								</xsl:call-template>--><!--
							</div>
						</span>
					</div>-->
					<!--Line 26-->
<!--					<div style="width:187mm;height:8mm;font-size:8pt;">
						<span style="float:left;padding-top:2mm;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">26</div>
							<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
								<span style="float:left;">Reserved for future use</span>
								--><!--If you're eligible for the employee retention credit in the fourth quarter solely because your business is a recovery startup business, enter the total of any amounts included on lines 8c   
								<span style="float:left;">and 10e for the fourth quarter </span>--><!--
								--><!--Dotted Line--><!--
								<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>								
							</div>
						</span>
						<span style="float:right;padding-top:1mm;">
							<div class="styIRS944RightNumBox">26</div>
							<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;background-color:lightgrey">
								--><!--<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EligEmplRtntnCrRcvryStUp4thAmt"/>
								</xsl:call-template>--><!--
							</div>
						</span>
					</div>-->
					<!--Part 4-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;font-size:9pt;">Part 4:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;font-size:9pt;">
							May we speak with your third-party designee?</div>
					</div>
					<div class="styLNDesc" style="width:187mm;height:auto;padding-left:9mm;padding-right:6mm;font-size:8pt;">
						<b>Do you want to allow an employee, a paid tax preparer, or another person to discuss this return with the IRS?</b> 
						See the instructions for details.
					</div>
					<div style="width:187mm;float:none;clear:both;padding-bottom:2mm;font-size:8pt;">
						<div style="width:21mm;padding-top:.7mm;padding-left:8mm;float:left;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="DiscussWithThirdPartyYes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
										<xsl:with-param name="BackupName">944DiscussWithThirdPartyYesInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						<label>
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
								<xsl:with-param name="BackupName">944DiscussWithThirdPartyYesInd</xsl:with-param>
							</xsl:call-template>Yes.
						</label>
						<br/><br/><br/><br/><br/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="DiscussWithThirdPartyNo" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
									<xsl:with-param name="BackupName">944DiscussWithThirdPartyNoInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
								<xsl:with-param name="BackupName">944DiscussWithThirdPartyNoInd</xsl:with-param>
							</xsl:call-template>No.
						</label>
					</div>
						<div style="width:166mm;float:right;font-size:8pt;">
							<div style="width:166mm;height:6mm;">
								<div class="styLNDesc" style="width:50mm;height:6mm;float:left;padding-top:2mm;">Designee's name and phone number </div>
								<div class="styLNCtrNumBox" style="width:54mm;height:6mm;border-top-width:1px;float:left;padding-top:1mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeNm"/>
									</xsl:call-template>
								</div>
								<span class="styLNCtrNumBox" style="width:10mm;border:none"/>
								<div class="styLNCtrNumBox" style="width:52mm;border-top-width:1px;height:6mm;padding-top:1mm;word-wrap:break-word;">
									<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum">
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:166mm;padding-top:5mm;">
								<div class="styLNDesc" style="width:105mm;padding-top:2mm;">
									Select a 5-digit personal identification number (PIN) to use when talking to IRS.
								</div>
								<div style="float:left;">
									<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;float:left;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePIN"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--Part 5-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;font-size:9pt;">Part 5:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;font-size:9pt;">Sign Here.
							You MUST complete both pages of Form 944 and SIGN it.</div>
					</div>
					<div class="styLNDesc" style="width:187mm;height:10mm;padding-left:2mm;padding-right:2mm;font-size:7pt;padding-top:2mm;">
						Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and 
						statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other 
						than taxpayer) is based on all information of which preparer has any knowledge.
					</div>
					<div style="width:187mm;float:none;clear:both;">
						<div style="width:33mm;padding-top:3mm;padding-right:2mm;font-weight:bold;font-size:10pt;float:left;text-align:right;">Sign your <br/>name here </div>
						<div class="styLNCtrNumBox" style="width:75mm;height:14mm;border-top-width:1px;float:left;word-wrap:break-word;padding-top:1mm;text-align:left;padding-left:1mm;padding-right:1mm;">
							<xsl:if test="$RtnHdrData/ReportingAgentPINGrp/PIN">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/PIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div style="width:78mm;float:left;font-size:8pt;padding-left:10mm;padding-top:0mm;padding-right:3mm;">
							<div style="width:15mm;height:8mm;float:left;padding-top:0mm;">Print your name here</div>
							<div style="height:9mm;float:right;">
								<div class="styLNCtrNumBox" style="width:50mm;border-top-width:1px;height:8mm;float:right;text-align:left;padding-left:1mm;">
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PersonNm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PersonNm"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerNm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerNm"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:15mm;float:left;padding-top:0mm;">Print your title here</div>
							<div style="float:right;">
								<div class="styLNCtrNumBox" style="width:50mm;border-top-width:1px;height:8mm;padding-top:1mm;float:right;text-align:left;padding-left:1mm;">
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PractitionerPINGrp/Title">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/Title"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;padding-bottom:2mm;padding-top:1mm;padding-right:3mm;float:none;clear:both;">
						<div class="styLNDesc" style="width:33mm;text-align:right;padding-right:2mm;font-size:8pt;padding-top:2mm;">Date </div>
						<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;padding-top:1mm;">
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/SignatureDt">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/SignatureDt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:7mm;padding-top:1mm;float:right;word-wrap:break-word;">
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/DaytimePhoneNum">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/DaytimePhoneNum"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/DaytimeForeignPhoneNum">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/DaytimeForeignPhoneNum"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNDesc" style="width:28.6mm;font-size:8pt;padding-top:2mm;float:right;">Best daytime phone </div>
					</div>
					<!--Paid Preparer Section-->
					<div style="width:187mm;padding-bottom:4mm;">
						<div class="styLNDesc" style="width:46mm;font-size:9pt;font-weight:bold;float:left;padding-left:2mm;">Paid Preparer Use Only </div>
						<div class="styLNDesc" style="width:52mm;float:right;font-size:9pt;">Check if you're self-employed
							<span style="width:2px;"/><span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="SelfEmployed" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
						<xsl:with-param name="BackupName">944SelfEmployedInd</xsl:with-param>
					</xsl:call-template>
				</input>
				</span>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
						<xsl:with-param name="BackupName">944SelfEmployedInd</xsl:with-param>
					</xsl:call-template>
							</label>
						</div>
					</div>
					<!--Preparer Name and PTIN-->
					<div style="width:187mm;padding-bottom:2mm;padding-right:3mm;font-size:8pt;">
						<div class="styLNDesc" style="width:32mm;height:6mm;padding-left:2mm;padding-right:1mm;padding-top:1mm;">Preparer's name </div>
						<div class="styLNCtrNumBox" style="width:90mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:left;padding-left:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:20mm;height:6mm;padding-top:1mm;padding-left:8mm;">PTIN </div>
						<div class="styLNCtrNumBox" style="width:41mm;border-top-width:1px;height:6mm;padding-top:1mm;float:right;">
							<xsl:choose>
								<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PTIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!--Preparer Signature and Date-->
					<div style="width:187mm;padding-bottom:2mm;font-size:8pt;">
						<div class="styLNDesc" style="width:32mm;height:6mm;padding-top:1mm;padding-left:2mm;padding-right:1mm;">Preparer's signature </div>
						<div class="styLNCtrNumBox" style="width:90mm;border-top-width:1px;height:6mm;word-wrap:break-word;padding-top:1mm;text-align:left;padding-right:1mm;padding-left:1mm;">
						</div>
						<div class="styLNDesc" style="width:21.1mm;height:6mm;padding-top:1mm;padding-left:8mm;">Date </div>
						<div class="styLNCtrNumBox" style="width:25mm;border-top-width:1px;height:6mm;padding-top:1mm;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SignatureDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 5/13/2015 AM: Adjusted Firm name height from 8mm to 14mm per Defect 43014 --> 
					<!--Preparer Business Name and EIN-->
					<div style="width:187mm;font-size:8pt;padding-bottom:2mm;padding-right:3mm;">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;padding-top:0mm;">Firm's name (or yours if self-employed) </div>
						<div class="styLNCtrNumBox" style="width:90mm;height:14mm;border-top-width:1px;text-align:left;padding-left:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1Txt"/>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:20mm;height:6mm;padding-top:1mm;padding-left:8mm;">EIN </div>
						<div class="styLNCtrNumBox" style="width:41mm;height:6mm;border-top-width:1px;padding-top:1mm;float:right;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!--Preparer Address and Phone Number-->
					<div style="width:187mm;padding-bottom:2mm;padding-right:3mm;font-size:8pt;">
						<div class="styLNDesc" style="width:32mm;height:6mm;padding-top:2mm;padding-left:2mm;padding-right:1mm;">Address </div>
						<div class="styLNCtrNumBox" style="width:90mm;height:8mm;border-top-width:1px;text-align:left;padding-left:1mm;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine1Txt"/>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine1Txt"/>
								</xsl:call-template><br/>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNDesc" style="width:20mm;height:6mm;padding-top:2mm;padding-left:8mm;">Phone </div>
						<div class="styLNCtrNumBox" style="width:41mm;height:8mm;border-top-width:1px;padding-top:1mm;float:right;word-wrap:break-word;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!--Preparer Foreign Address/Phone Number vs. US Address/Phone Number-->
					<div class="styBB" style="width:187mm;padding-bottom:4mm;border-bottom-width:2px;font-size:8pt;padding-right:3mm;">
						<xsl:choose>
							<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<div class="styLNDesc" style="width:32mm;height:6mm;padding-top:2mm;padding-left:2mm;padding-right:1mm;">City </div>
								<div class="styLNCtrNumBox" style="width:40mm;border-top-width:1px;height:8mm;padding-top:1mm;text-align:left;padding-left:1mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CityNm"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:12mm;height:6mm;padding-top:2mm;text-align:center;">Prov./St. </div>
								<div class="styLNCtrNumBox" style="width:16mm;border-top-width:1px;height:8mm;padding-top:1mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ProvinceOrStateNm"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:12mm;height:6mm;padding-top:2mm;text-align:center;">Country </div>
								<div class="styLNCtrNumBox" style="width:10mm;border-top-width:1px;height:8mm;padding-top:2mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CountryCd"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:20mm;height:6mm;padding-top:2mm;padding-left:8mm;">P. Code </div>
								<div class="styLNCtrNumBox" style="width:41mm;border-top-width:1px;height:8mm;padding-top:1mm;float:right;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ForeignPostalCd"/>
									</xsl:call-template>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNDesc" style="width:32mm;height:6mm;padding-top:2mm;padding-left:2mm;padding-right:1mm;">City </div>
								<div class="styLNCtrNumBox" style="width:65mm;border-top-width:1px;height:8mm;padding-top:1mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/CityNm"/>
									</xsl:call-template>						
								</div>
								<div class="styLNDesc" style="width:15mm;height:6mm;padding-top:2mm;padding-left:5mm;">State </div>
								<div class="styLNCtrNumBox" style="width:10mm;border-top-width:1px;height:8mm;padding-top:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/StateAbbreviationCd"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:20mm;height:6mm;padding-top:2mm;padding-left:8mm;">ZIP code </div>
								<div class="styLNCtrNumBox" style="width:41mm;border-top-width:1px;height:8mm;padding-top:1mm;float:right;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/ZIPCd"/>
									</xsl:call-template>				
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>		
					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm;">
						<span style="float:left;clear:none;">Page <span class="styBoldText" style="font-size:9pt;">2</span></span>
						<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:9pt;">944</span> (2024)</span>
					</div>
					<!--END Page Footer-->
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>		
	<xsl:template name="IRS944SP">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 944"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS944Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass" style="width:187mm">
				<form name="IRS944" style="font-family:arial;">
					<xsl:call-template name="DocumentHeader"/>
					<!--  Begin Header-->
                    <div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/FinalPayrollInfoStatement"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/TransferOfBusinessStatement"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/GeneralDependencySmall"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/BinaryAttachment"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/IRS945A"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/IRS941ScheduleD"/>
						</xsl:call-template>
						<br/>
						<div class="styFNBox" style="width:53mm;height:10mm;border:0px;">Formulario
							<span class="styFormNumber" style="font-size:15pt;">944 para 2024: </span>
						</div>
						<div class="styFTBox" style="width:133mm;text-align:left;height:10mm;">
							<div class="styMainTitle" style="font-size:12pt;padding-top:1mm;">
								<!--2/2/24 AC: Per INC00794962, removed special character that is causing issue-->
								Declaración del Impuesto Federal ANUAL del Empleador
							</div>
							<div class="styFST" style="height:4mm;">
								<span class="styAgency" style="font-weight:normal">Department of the Treasury — Internal Revenue Service</span>
							</div>
							<div class="styTYBox" style="width:25.7mm;height:4mm;border:0px;float:right">
								<div class="styOMB" style="height:4mm;font-size:7pt;text-align:right;border:0px;padding-right:2mm;">OMB No. 1545-0029</div>
							</div>		
						</div>
						<div class="styBB" style=" width:131mm;height:63mm;float:left;border:black solid 1px;padding-top:2mm;padding-left:1mm;padding-right:2mm;">
							<div style="width:128mm;padding-top:0mm;">
								<span style="float:left;padding-top:3mm;"><b>Número de identificación del empleador </b>(EIN)</span>
								<span class="styLNCtrNumBox" style="width:70mm;border-top-width:1px;padding-top:1mm;float:right;height:6.3mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										<xsl:with-param name="EINChanged">true</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div style="width:128mm;padding-bottom:2mm;padding-top:2mm;">
								<span style="float:left;padding-top:4mm;font-size:6pt;"><b>Nombre</b><i> (el nombre legal del negocio, no el nombre comercial)</i></span>
								<span class="styLNCtrNumBox" style="width:67mm;border-top-width:1px;float:right;height:12mm;text-align:left;padding-left:1mm;font-size:6pt">
									<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
								</span>
							</div>
							<div style="width:128mm;padding-bottom:2mm;">
								<span style="float:left;padding-top:4mm;"><b>Nombre comercial</b><i> (si existe)</i></span>
								<span class="styLNCtrNumBox" style="width:94mm;border-top-width:1px;float:right;height:7mm;text-align:left;padding-left:1mm;font-size:6pt">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine1Txt"/>
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</span>
							</div>
							<div style="width:128mm;padding-bottom:0mm;">
								<span style="width:20mm;height:15mm;float:left;padding-top:2mm;font-weight:bold;">Dirección</span>
								<span class="styLNCtrNumBox" style="width:108mm;height:6mm;float:right;border-top-width:1px;padding-top:1mm;padding-left:1mm;text-align:left;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template>&nbsp;
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:108mm;font-size:6pt;padding-left:1mm;">
									Número<span style="width:16mm"/>Calle<span style="width:40mm;"/>Número de oficina o de habitación
								</span>
								<span class="styLNCtrNumBox" style="width:66mm;border-top-width:1px;padding-top:1mm;height:7mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:13mm;border-top-width:1px;padding-top:1mm;height:7mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:24mm;border-top-width:1px;padding-top:1mm;height:7mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:128mm;font-size:6pt;padding-left:21mm;">
									<span style="width:66mm;">Ciudad</span>
									<span style="width:15mm;text-align:center;">Estado</span>
									<span style="width:26mm;text-align:center;">Código postal <i>(ZIP)</i></span>
								</span>
								<!-- 9/23/2015 AM: Per Defect 44870, adjusted foreign address fields heights from 6mm to 7mm. -->
								<span style="width:128mm;padding-left:20mm;">
								<span class="styLNCtrNumBox" style="width:42mm;height:7mm;border-top-width:1px;padding-top:1mm;text-align:left;padding-left:1mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:1mm;height:7mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:27mm;border-top-width:1px;padding-top:1mm;height:7mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
									</xsl:call-template>
								</span>
								</span>
								<span style="width:128mm;font-size:6pt;padding-left:20mm;">
									<span style="width:44mm;padding-left:1mm;">Nombre del país extranjero</span>
									<span style="width:35mm;text-align:center;">Provincia/condado extranjero</span>
									<span style="width:29mm;text-align:center;">Código postal extranjero</span>
								</span>
							</div>
						</div>
						<div style="float:right;padding-right:2mm;">
							<div class="styBB" style="width:51mm;height:39mm;border-left-width:1px;border-right-width:1px;border-top-width:1px;padding-top:2mm;">
								<div class="styPartName" style="width:48mm;text-align:center;font-size:9pt;">Quién tiene que presentar el Formulario 944</div>
								<div style="width:48.5mm;float:none;clear:both;padding-left:2mm;font-size:8pt;line-height:130%;">
									Usted tiene que presentar el Formulario 944 anual en vez de presentar el Formulario 941 trimestral <b>sólo si el <i>IRS</i> se lo notificó por escrito.</b><br/>
									<div style="width:48.5mm;text-align:left;padding-left:2mm;"></div>Visite
									<a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form944SP" title="Link to IRS.gov"><i>www.irs.gov/Form944SP</i> para obtener las instrucciones y la información más reciente.</a>
								</div>
							</div>
						</div>
					</div>
					<div class="styLNDesc" style="width:187mm;font-size:8pt;">
						Lea las instrucciones por separado antes de completar el Formulario 944. Escriba a máquina o en letra de molde dentro de los encasillados.
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;text-align:center;height:12mm;padding-top:4mm;font-size:9pt;">Parte 1:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:12mm;padding-left:2mm;font-size:8pt;">Conteste las preguntas a continuación para el año actual. Los empleadores en la Samoa Estadounidense, Guam, la 
						Comunidad de las Islas Marianas del Norte, las Islas Vírgenes de los EE. UU. y Puerto Rico pueden omitir las líneas 1 y 2, 
						a menos que tengan empleados que estén sujetos a la retención del impuesto sobre el ingreso de los Estados Unidos.</div>
					</div>
					<div style="width:187mm;padding-left:0mm;padding-top:.5mm;padding-bottom:0px;">
						<!--Line 1-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">1</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									<span style="float:left;">Salarios, propinas y otras remuneraciones </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>								
								</div>
							</span>
							<span style="float:right">
								<div class="styIRS944RightNumBox">1</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/WagesAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 2-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">2</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									<span style="float:left;">Impuesto federal sobre el ingreso retenido de salarios, propinas y otras remuneraciones</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>								
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS944RightNumBox">2</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 3-->
						<div style="width:187mm;height:10mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;">3</div>
							<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
								Si los salarios, propinas y otras remuneraciones no están sujetos a los impuestos del 
								Seguro <span style="float:left;">Social o del Medicare </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>	
							</div>
							<span style="padding-top:2mm;">
								<div class="styIRS944RightNumBox" style="padding-top:1mm;">3</div>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/WagesNotSubjToSSMedcrTaxInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="WagesNotSubjectToSocialSecurityMedicareTax" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/WagesNotSubjToSSMedcrTaxInd"/>
											<xsl:with-param name="BackupName">944WagesNotSubjToSSMedcrTaxInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/WagesNotSubjToSSMedcrTaxInd"/>
										<xsl:with-param name="BackupName">944WagesNotSubjToSSMedcrTaxInd</xsl:with-param>
									</xsl:call-template>
									<span style="font-size:7pt;font-weight:bold">Marque aquí y pase a la línea 5.</span>
								</label>
							</span>
						</div>
						<!--Line 4 Header-->
						<div style="width:187mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;">4</div>
							<div class="styLNDesc" style="width:136mm;padding-left:1mm;font-weight:bold;">
								Salarios y propinas sujetos a los impuestos del Seguro Social y del Medicare:
							</div>
							<div class="styLNDesc" style="width:187mm;font-style:italic;">
								<span style="width:65.5mm;"/><span style="width:35mm;text-align:center;">Columna 1</span>
								<span style="width:14mm;"/><span style="width:35mm;text-align:center;">Columna 2</span>
							</div>
						</div>
						<!--Line 4a-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" style="width:9mm;"/>
							<div style="width:5.5mm;float:left;font-weight:bold;padding-top:0.5mm;">4a</div>
							<div class="styLNDesc" style="width:49mm;font-weight:bold;">Salarios sujetos al impuesto del Seguro Social</div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityWageAndTaxGrp/SocialSecurityTaxCashWagesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2mm;">x 0.124 = </div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityWageAndTaxGrp/SocialSecurityTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 4b-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" style="width:9mm;"/>
							<div style="width:5.5mm;float:left;font-weight:bold;padding-top:0.5mm;">4b</div>
							<div class="styLNDesc" style="width:49mm;font-weight:bold;">Propinas sujetas al impuesto del Seguro Social</div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTipsAndTaxGrp/TaxableSocSecTipsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2mm;">x 0.124 = </div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTipsAndTaxGrp/TaxOnSocialSecurityTipsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 4c-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" style="width:9mm;"/>
							<div style="width:5.5mm;float:left;font-weight:bold;padding-top:0.5mm;">4c</div>
							<div class="styLNDesc" style="width:49mm;font-weight:bold;">Salarios y propinas sujetos al impuesto del Medicare</div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MedicareWageTipsAndTaxGrp/TaxableMedicareWagesTipsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2mm;">x 0.029 = </div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MedicareWageTipsAndTaxGrp/TaxOnMedicareWagesTipsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 4d-->
						<div style="width:187mm;font-size:8pt;padding-bottom:2mm;">
							<div class="styLNLeftNumBoxSD" style="width:9mm;"/>
							<div style="width:5.5mm;float:left;font-weight:bold;">4d</div>
							<div class="styLNDesc" style="width:49mm;font-weight:bold;float:left;padding-top:0mm;">Salarios y propinas sujetos a la retención del Impuesto Adicional del Medicare							
							</div>
							<div style="float:left;padding-top:4mm;">
								<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AddnlMedicareWageTipsAndTaxGrp/TxblWageTipsSubjAddnlMedcrAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2mm;">x 0.009 = </div>
								<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AddnlMedicareWageTipsAndTaxGrp/TaxOnWageTipsSubjAddnlMedcrAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Line 4e-->
						<div style="width:187mm;height:10mm;font-size:8pt;">
							<span style="float:left;padding-top:.5mm;">
								<div class="styLNLeftNumBoxSD" style="width:9mm;"/>
								<div style="width:5.5mm;float:left;font-weight:bold;padding-top:2mm;">4e</div>
								<div class="styLNDesc" style="width:123mm;padding-top:0mm;padding-top:2mm;">
									<b>Total de los impuestos del Seguro Social y del Medicare.</b> Sume la Columna 2 de las líneas 4a, <span style="float:left;">4b, 4c, y 4d </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>
								</div>
							</span>
							<span style="float:right;padding-top:2mm;">
								<div class="styIRS944RightNumBox">4e</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalSSMdcrTaxAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 5-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">5</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;">
									<span style="float:left;"><b>Total de impuestos antes de los ajustes. </b>Sume las líneas <b>2</b> y <b>4e</b> </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>								
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS944RightNumBox">5</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxBeforeAdjustmentAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 6-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">6</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;">
									<span style="float:left;"><b>Ajustes del año actual </b>(vea las instrucciones)</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>								
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS944RightNumBox">6</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<!-- 12/23/2014 AM: Per KISAM IM01960276, choose statement added to properly display negative numbers and cents only -->
									<xsl:choose>
										<xsl:when test="starts-with($FormData/CurrentYearAdjustmentAmt,'-') or starts-with($FormData/CurrentYearAdjustmentAmt,'.')">
											<span style="color:darkblue;">
												<xsl:call-template name="PlaceCommas">
													<xsl:with-param name="MaxSize" select="15"/>
													<xsl:with-param name="MaxSizeWithSign" select="16"/>
													<xsl:with-param name="TargetNode" select="$FormData/CurrentYearAdjustmentAmt"/>
												</xsl:call-template>
											</span>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/CurrentYearAdjustmentAmt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</span>
						</div>
						<!--Line 7-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">7</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;">
									<span style="float:left;"><b>Total de los impuestos después de los ajustes.</b> Combine las líneas <b>5</b> y <b>6</b></span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>								
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS944RightNumBox">7</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAfterAdjustmentAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--08/01/2017 TB:Added lines 8 & 9, deleted reserve, and old line 8 is now line 10. Also, Decreased Line 8 font size to 7.5pt in 
						order to fit pushpin-->
						<!--Line 8-->
						<div style="width:187mm;height:9mm;font-size:8pt">
							<span style="float:left;padding-top:1mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">8</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;">
									<span style="float:left;padding-right:1mm">
										<b>Crédito tributario sobre la nómina de pequeños negocios calificados por aumentar las  </b></span>
									<span style="float:left;"><b>actividades investigativas. </b>Adjunte el Formulario 8974 
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/PayrollTaxCreditAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>	
								</div>
							</span>
							<span style="float:right;padding-top:1mm;">
								<div class="styIRS944RightNumBox">8</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PayrollTaxCreditAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 9-->
						<div style="width:187mm;height:9mm;font-size:8pt;">
							<span style="float:left;padding-top:1mm">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">9</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;">
									<span style="float:left;"><b>Total de impuestos después de los ajustes y créditos no reembolsables. </b>Reste la línea <b>8</b> de la </span>
									<span style="float:left;">línea <b>7</b></span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>								
								</div>
							</span>
							<span style="float:right;padding-top:1mm;">
								<div class="styIRS944RightNumBox">9</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 10-->
						<div style="width:187mm;height:10mm;font-size:8pt;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:1.5mm">10</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									Total de depósitos para este año, incluyendo todo exceso pagado y aplicado de un año anterior
									<span style="float:left;">y cantidad pagada en exceso aplicada del Formulario 944-X, 941-X o 941-X (PR) </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>								
								</div>
							</span>
							<span style="float:right;padding-top:1mm;">
								<div class="styIRS944RightNumBox">10</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxDepositAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 11-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBox" style="width:8mm;padding-left:1.5mm">11</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;">
									<span style="float:left;"><b>Saldo adeudado.</b> Si la línea <b>9</b> es mayor que la línea <b>10</b>, anote la diferencia y vea las instrucciones</span>
									<!--Dotted Line-->
									<!--<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>-->								
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS944RightNumBox">11</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 12-->
						<div style="width:187mm;height:8mm;">
							<div class="styLNLeftNumBox" style="width:8mm;font-size:8pt;padding-left:1.5mm">12</div>
							<div class="styLNDesc" style="width:83mm;padding-left:1mm;font-size:8pt;">
								<b>Cantidad pagada en exceso.</b> Si la línea <b>10</b> es mayor que la 
								<span style="float:left;">línea <b>9</b>, anote la diferencia</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
							</div>
							<div class="styLNCtrNumBox" style="width:26mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-left:1mm;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/OverpaidAmt"/>
								</xsl:call-template>
							</div>
							<div style="padding-top:1.5mm;float:left;">
								<div class="styLNDesc" style="width:17mm;text-align:center;padding-top:1.5mm">Marque uno:</div>
								<span>		
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="ApplyToNextReturn" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
										<xsl:with-param name="BackupName">944ApplyOverpaymentNextReturnInd</xsl:with-param>
									</xsl:call-template>
								</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
										<xsl:with-param name="BackupName">944ApplyOverpaymentNextReturnInd</xsl:with-param>
									</xsl:call-template>
									<span style="font-size:7pt;padding-left:1mm;padding-right:1mm;">Aplíquese a la próxima declaración.</span>
								</label>
								<br/>
								<span style="padding-left:17mm;">	
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="SendARefund" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
										<xsl:with-param name="BackupName">944RefundOverpaymentInd</xsl:with-param>
									</xsl:call-template>
								</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
										<xsl:with-param name="BackupName">944RefundOverpaymentInd</xsl:with-param>
									</xsl:call-template>
									<span style="font-size:7pt;padding-left:1mm;">Envíe un reembolso.</span>
								</label>
								
							</div>
						</div>
						<!-- Bullet Message -->
						<div class="styBB" style="width:187mm;font-size:8pt;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;"/>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;padding-top:1mm;margin-bottom:1mm;">
									<!--<img src="{$ImagePath}/944_Bullet.gif" alt="Right pointing arrowhead image"/>-->
									TIENE que completar ambas páginas del Formulario 944 y FIRMARLO.
								</div>
							</span>
<!--							<span style="width:30mm;text-align:right;padding-bottom:0mm;float:right;">
								<img src="{$ImagePath}/944_Next.gif" alt="Next Page Arrow Image"/>
							</span>-->
						</div>					
					</div>
					<!-- Page boundary -->
					<div class="pageEnd" style="width:187mm;border-top-width:1px;">
						<span style="float:left;clear:none;font-weight:bold;font-size:8pt;">Para el Aviso sobre la Ley de Confidencialidad de Información y la Ley de <br/>Reducción de Trámites, vea las instrucciones por separado.</span>
						<span style="float:left;clear:none;margin-left:18mm;padding-top:0.5mm;">Cat. No. 48261B</span>
						<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:9pt;">944 (sp)</span> (2024)</span>
					</div>
					<p style="page-break-before: always"/>
					<!--Begin Page 2-->
					<div style="width:187mm;">
						<!--Name Shown on return-->
						<div class="styBB" style="width:187mm;font-size:7pt;border-top-width:2px;">
							<div class="styFNBox" style="width:126mm; height:8.5mm;">
								<b>Nombre</b><i> (el nombre legal del negocio, no el nombre comercial))</i><br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
								<div style="line-height:100%; font-family:verdana;font-size:7pt"/>
							</div>
							<div style="padding-left:1mm">
								<b>Número de identificación del empleador <i>(EIN)</i></b><br/>
								<div style="text-align:left;padding-top:2.5mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!--Part 2-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">			
						<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;font-size:9pt;">Parte 2:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;font-size:9pt;">
						Infórmenos sobre su itinerario de depósitos y obligación tributaria para el año actual.</div>
					</div>
					<!--Line 13-->
					<div style="width:187mm;padding-bottom:1mm;padding-top:1mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="width:8mm;">13</div>
						<div class="styLNDesc" style="width:20mm;height:13mm;padding-left:1mm;"><b>Marque uno:</b></div>
						<input type="checkbox" alt="AnnualDepositor" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/AnnualDepositorInd"/>
								<xsl:with-param name="BackupName">944AnnualDepositorInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label style="padding-left:3mm;width:155mm;vertical-align:top;">
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/AnnualDepositorInd"/>
								<xsl:with-param name="BackupName">944AnnualDepositorInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:150mm;padding-top:1mm"><b>La línea 9 es menos de $2,500. Pase a la Parte 3.</b></span>
						</label>
						<br/><br/>
						<input type="checkbox" alt="MonthlyDepositor" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/MonthlyDepositorInd"/>
								<xsl:with-param name="BackupName">944MonthlyDepositorInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label style="padding-left:3mm;width:155mm;vertical-align:top;">
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/MonthlyDepositorInd"/>
								<xsl:with-param name="BackupName">944MonthlyDepositorInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:150mm;font-size:7pt;padding-top:0.5mm"><b>La línea 9 es $2,500 o más. Anote su obligación tributaria para cada mes. Si es depositante de itinerario bisemanal o se convirtió en uno porque acumuló $100,000 o más en obligación tributaria en cualquier día durante el período de depósito, tiene que completar el Formulario 945-A en vez de completar los encasillados a continuación.</b></span>
						</label>
					</div>
					<!--13a-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:8mm;float:left;"/>
						<div style="float:right;">
							<div style="width:40mm;float:left;">
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Ene.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13a</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='JANUARY']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13b-->			
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Feb.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13b</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='FEBRUARY']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13c-->			
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Mar.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13c</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='MARCH']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>	
							</div>
							<!--13d-->
							<div style="width:40mm;float:left;">
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Abr.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13d</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='APRIL']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13e-->
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Mayo</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13e</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='MAY']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13f-->
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Jun.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13f</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='JUNE']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>	
							</div>
							<!--13g-->
							<div style="width:40mm;float:left;">
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Jul.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13g</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='JULY']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13h-->
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Ago.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13h</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='AUGUST']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13i-->
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Sep.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13i</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='SEPTEMBER']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--13j-->
							<div style="width:40mm;float:left;">
								<div class="styLNDesc" style="width:40mm;padding-left:10mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Oct.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13j</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:right;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='OCTOBER']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13k-->
								<div class="styLNDesc" style="width:40mm;padding-left:10mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Nov.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13k</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:right;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='NOVEMBER']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13l-->
								<div class="styLNDesc" style="width:40mm;padding-left:10mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Dic.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13l</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:right;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='DECEMBER']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>	
							</div>
						</div>
					</div>
					<!--Total Liability for year-->
					<div style="width:187mm;font-size:8pt;padding-top:2mm;padding-bottom:2mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:28mm;"/>
							<div class="styLNDesc" style="width:105mm;padding-left:1mm;font-weight:bold;padding-top:1mm;">
								Obligación tributaria total para el año. Sume las líneas 13a a 13l. El total tiene <span style="float:left;">que ser igual a la línea 9</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
							</div>
						</span>
						<span style="float:right;">
							<div class="styIRS944RightNumBox" style="width:10mm;padding-right:2mm;padding-top:2.4mm;">13m</div>
							<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLiabilityAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Part 3-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">	
						<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;font-size:9pt;">Parte 3:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;font-size:9pt;">
							Infórmenos sobre su negocio. Si la pregunta 14 NO corresponde a su negocio, déjela en blanco.</div>
					</div>
					<!--Line 14-->
					<div style="width:187mm;padding-bottom:2mm;padding-top:2mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="width:8mm;">14</div>
						<div class="styLNDesc" style="width:147mm;padding-left:1mm;font-weight:bold;">
							Si su negocio ha dejado de operar o si usted ha dejado de pagar salarios 
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
						</div>
						<span>
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
						</xsl:call-template>
						<input type="checkbox" alt="FutureFilingNotRequired" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
								<xsl:with-param name="BackupName">944FutureFilingNotRequiredInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
								<xsl:with-param name="BackupName">944FutureFilingNotRequiredInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:1mm;"/>Marque aquí y<br/><br/>
						</label>
						</span>
						<div class="styLNDesc" style="width:66mm;padding-left:9mm;padding-top:1mm;">
							anote la última fecha en la que pagó salarios
						</div>
						<div class="styLNCtrNumBox" style="width:31mm;border-top-width:1px;height:5mm;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FinalWagesPaidDt"/>
							</xsl:call-template>
						</div>
						<div style="padding-top:1mm;padding-left:1mm;width:90mm;">; también adjunte una declaración escrita a su declaración. Vea las </div>
						<div style="width:187mm;float:left;padding-top:1mm;padding-left:9mm;">instrucciones.</div>
					</div>
					<!--Part 4-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;font-size:9pt;">Parte 4:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;font-size:9pt;">
							¿Podemos comunicarnos con su tercero autorizado?</div>
					</div>
					<div class="styLNDesc" style="width:187mm;height:auto;padding-left:9mm;padding-right:6mm;font-size:8pt;">
						<b>¿Desea permitir que un empleado, preparador de impuestos remunerado u otra persona hable sobre esta declaración con el <i>IRS</i>?</b> 
						Vea las instrucciones para más detalles.
					</div>
					<div style="width:187mm;float:none;clear:both;padding-bottom:2mm;font-size:8pt;">
						<div style="width:21mm;padding-top:.7mm;padding-left:8mm;float:left;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="DiscussWithThirdPartyYes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
										<xsl:with-param name="BackupName">944DiscussWithThirdPartyYesInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						<label>
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
								<xsl:with-param name="BackupName">944DiscussWithThirdPartyYesInd</xsl:with-param>
							</xsl:call-template>Sí.
						</label>
						<br/><br/><br/><br/><br/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="DiscussWithThirdPartyNo" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
									<xsl:with-param name="BackupName">944DiscussWithThirdPartyNoInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
								<xsl:with-param name="BackupName">944DiscussWithThirdPartyNoInd</xsl:with-param>
							</xsl:call-template>No.
						</label>
					</div>
						<div style="width:166mm;float:right;font-size:8pt;">
							<div style="width:166mm;height:6mm;padding-top:1mm;">
								<div class="styLNDesc" style="width:50mm;height:6mm;float:left;">Nombre y núm. de teléfono del tercero designado</div>
								<div class="styLNCtrNumBox" style="width:54mm;height:6mm;border-top-width:1px;float:left;padding-top:1mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeNm"/>
									</xsl:call-template>
								</div>
								<span class="styLNCtrNumBox" style="width:10mm;border:none"/>
								<div class="styLNCtrNumBox" style="width:52mm;border-top-width:1px;height:6mm;padding-top:1mm;word-wrap:break-word;">
									<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum">
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:166mm;padding-top:5mm;">
								<div class="styLNDesc" style="width:105mm;padding-top:1mm;">
									Seleccione un número de identificación personal <i>(PIN)</i> de 5 dígitos que usará al hablar con el IRS.
								</div>
								<div style="float:left;">
									<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;float:left;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePIN"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--Part 5-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;font-size:9pt;">Parte 5:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;font-size:9pt;">Firme aquí. TIENE que completar ambas páginas del Formulario 944 y FIRMARLO.</div>
					</div>
					<div class="styLNDesc" style="width:187mm;height:13mm;padding-left:6mm;padding-right:2mm;font-size:8pt;padding-top:2mm;">
						Bajo pena de perjurio, declaro que he examinado esta declaración, incluyendo los anexos e informes adjuntos, y que, a mi leal saber y entender, es verídica, correcta y completa. La declaración del preparador (que no sea el contribuyente) está basada en toda información de la cual el preparador tenga conocimiento.
					</div>
					<div style="width:187mm;float:none;clear:both;">
						<div style="width:33mm;padding-top:3mm;padding-left:6mm;font-weight:bold;font-size:10pt;float:left;text-align:left;">Firme su <br/>nombre aquí </div>
						<div class="styLNCtrNumBox" style="width:75mm;height:14mm;border-top-width:1px;float:left;word-wrap:break-word;padding-top:1mm;text-align:left;padding-left:1mm;padding-right:1mm;">
							<xsl:if test="$RtnHdrData/ReportingAgentPINGrp/PIN">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/PIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div style="width:78mm;float:left;font-size:7pt;padding-left:2mm;padding-top:0mm;padding-right:3mm;">
							<div style="width:22mm;height:8mm;float:left;padding-top:0mm;">Escriba su nombre en letra de molde aquí</div>
							<div style="height:9mm;float:right;">
								<div class="styLNCtrNumBox" style="width:50mm;border-top-width:1px;height:8mm;float:right;text-align:left;padding-left:1mm;">
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PersonNm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PersonNm"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerNm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerNm"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:22mm;float:left;padding-top:2mm;">Escriba su cargo en letra de molde aquí</div>
							<div style="float:right;">
								<div class="styLNCtrNumBox" style="width:50mm;border-top-width:1px;height:8mm;padding-top:1mm;float:right;text-align:left;padding-left:1mm;">
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PractitionerPINGrp/Title">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/Title"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;padding-bottom:2mm;padding-top:1mm;padding-right:4mm;float:none;clear:both;">
						<div class="styLNDesc" style="width:33mm;text-align:right;padding-right:4mm;font-size:8pt;padding-top:2mm;">Fecha </div>
						<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;padding-top:1mm;">
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/SignatureDt">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/SignatureDt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:7mm;padding-top:1mm;float:right;word-wrap:break-word;">
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/DaytimePhoneNum">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/DaytimePhoneNum"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/DaytimeForeignPhoneNum">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/DaytimeForeignPhoneNum"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNDesc" style="width:35mm;font-size:7pt;padding-top:1mm;float:right;">Mejor núm. de teléfono donde llamarlo durante el día</div>
					</div>
					<!--Paid Preparer Section-->
					<div style="width:187mm;padding-bottom:4mm;">
						<div class="styLNDesc" style="width:96mm;font-size:9pt;font-weight:bold;float:left;padding-left:2mm;">Para Uso Exclusivo del Preparador Remunerado </div>
						<div class="styLNDesc" style="width:67mm;float:right;font-size:9pt;">Marque si usted trabaja por cuenta propia
							<span style="width:2px;"/><span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="SelfEmployed" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
						<xsl:with-param name="BackupName">944SelfEmployedInd</xsl:with-param>
					</xsl:call-template>
				</input>
				</span>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
						<xsl:with-param name="BackupName">944SelfEmployedInd</xsl:with-param>
					</xsl:call-template>
							</label>
						</div>
					</div>
					<!--Preparer Name and PTIN-->
					<div style="width:187mm;padding-bottom:2mm;padding-right:3mm;font-size:8pt;">
						<div class="styLNDesc" style="width:32mm;height:6mm;padding-left:2mm;padding-right:1mm;padding-top:1mm;">Nombre del preparador</div>
						<div class="styLNCtrNumBox" style="width:90mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:left;padding-left:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:20mm;height:6mm;padding-top:1mm;padding-left:5mm;font-style:italic">PTIN </div>
						<div class="styLNCtrNumBox" style="width:41mm;border-top-width:1px;height:6mm;padding-top:1mm;float:right;">
							<xsl:choose>
								<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PTIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!--Preparer Signature and Date-->
					<div style="width:187mm;padding-bottom:2mm;font-size:8pt;">
						<div class="styLNDesc" style="width:32mm;height:6mm;padding-top:1mm;padding-left:2mm;padding-right:1mm;">Firma del preparador</div>
						<div class="styLNCtrNumBox" style="width:90mm;border-top-width:1px;height:6mm;word-wrap:break-word;padding-top:1mm;text-align:left;padding-right:1mm;padding-left:1mm;">
						</div>
						<div class="styLNDesc" style="width:21.1mm;height:6mm;padding-top:1mm;padding-left:5mm;">Fecha </div>
						<div class="styLNCtrNumBox" style="width:25mm;border-top-width:1px;height:6mm;padding-top:1mm;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SignatureDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 5/13/2015 AM: Adjusted Firm name height from 8mm to 14mm per Defect 43014 --> 
					<!--Preparer Business Name and EIN-->
					<div style="width:187mm;font-size:8pt;padding-bottom:2mm;padding-right:3mm;">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;padding-top:0mm;">Nombre de la empresa (o el suyo, si trabaja por cuenta propia)</div>
						<div class="styLNCtrNumBox" style="width:90mm;height:14mm;border-top-width:1px;text-align:left;padding-left:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1Txt"/>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:20mm;height:6mm;padding-top:1mm;padding-left:5mm;font-style:italic">EIN </div>
						<div class="styLNCtrNumBox" style="width:41mm;height:6mm;border-top-width:1px;padding-top:1mm;float:right;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!--Preparer Address and Phone Number-->
					<div style="width:187mm;padding-bottom:2mm;padding-right:3mm;font-size:8pt;">
						<div class="styLNDesc" style="width:32mm;height:6mm;padding-top:4mm;padding-left:2mm;padding-right:1mm;">Dirección </div>
						<div class="styLNCtrNumBox" style="width:90mm;height:8mm;border-top-width:1px;text-align:left;padding-left:1mm;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine1Txt"/>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine1Txt"/>
								</xsl:call-template><br/>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNDesc" style="width:20mm;height:6mm;padding-top:4mm;padding-left:5mm;">Teléfono </div>
						<div class="styLNCtrNumBox" style="width:41mm;height:8mm;border-top-width:1px;padding-top:1mm;float:right;word-wrap:break-word;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!--Preparer Foreign Address/Phone Number vs. US Address/Phone Number-->
					<div class="styBB" style="width:187mm;padding-bottom:4mm;border-bottom-width:2px;font-size:8pt;padding-right:3mm;">
						<xsl:choose>
							<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<div class="styLNDesc" style="width:32mm;height:6mm;padding-top:4mm;padding-left:2mm;padding-right:1mm;">Ciudad </div>
								<div class="styLNCtrNumBox" style="width:40mm;border-top-width:1px;height:8mm;padding-top:1mm;text-align:left;padding-left:1mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CityNm"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:12mm;height:6mm;padding-top:4mm;text-align:center;">Prov/con </div>
								<div class="styLNCtrNumBox" style="width:16mm;border-top-width:1px;height:8mm;padding-top:4mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ProvinceOrStateNm"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:12mm;height:6mm;padding-top:4mm;text-align:center;">País </div>
								<div class="styLNCtrNumBox" style="width:10mm;border-top-width:1px;height:8mm;padding-top:4mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CountryCd"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:20mm;height:6mm;padding-top:4mm;padding-left:5mm;">P. Código </div>
								<div class="styLNCtrNumBox" style="width:41mm;border-top-width:1px;height:8mm;padding-top:1mm;float:right;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ForeignPostalCd"/>
									</xsl:call-template>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNDesc" style="width:32mm;height:6mm;padding-top:4mm;padding-left:2mm;padding-right:1mm;">Ciudad </div>
								<div class="styLNCtrNumBox" style="width:65mm;border-top-width:1px;height:8mm;padding-top:1mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/CityNm"/>
									</xsl:call-template>						
								</div>
								<div class="styLNDesc" style="width:15mm;height:6mm;padding-top:4mm;padding-left:5mm;">Estado </div>
								<div class="styLNCtrNumBox" style="width:10mm;border-top-width:1px;height:8mm;padding-top:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/StateAbbreviationCd"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:20mm;height:6mm;padding-top:1mm;padding-left:5mm;">Código
postal <i>(ZIP)</i> </div>
								<div class="styLNCtrNumBox" style="width:41mm;border-top-width:1px;height:8mm;padding-top:1mm;float:right;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/ZIPCd"/>
									</xsl:call-template>				
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>					
					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm;">
						<span style="float:left;clear:none;">Página <span class="styBoldText" style="font-size:9pt;">2</span></span>
						<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:9pt;">944 (sp)</span> (2024)</span>
					</div>
					<!--END Page Footer-->	
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
