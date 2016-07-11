<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions" 
	xmlns:lexs="http://usdoj.gov/leisp/lexs/3.1" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:j="http://niem.gov/niem/domains/jxdm/4.0" 
	xmlns:nc="http://niem.gov/niem/niem-core/2.0" 
	xmlns:lexslib="http://usdoj.gov/leisp/lexs/library/3.1" 
	xmlns:s="http://niem.gov/niem/structures/2.0" 
	xmlns:inc-ext="http://ojbc.org/IEPD/Extensions/IncidentReportStructuredPayload/1.0"
	xmlns:lexsdigest="http://usdoj.gov/leisp/lexs/digest/3.1" 
	xmlns:ndexia="http://fbi.gov/cjis/N-DEx/IncidentArrest/2.1"
	xmlns:lexspd="http://usdoj.gov/leisp/lexs/publishdiscover/3.1">

	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	
	<xsl:variable name="driversLicenseState" select="'AA', 'AB', 'AD', 'AE', 'AF', 'AG', 'AH', 'AI', 'AJ', 'AK', 'AL', 'AM', 'AN', 'AO', 'AP', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AV', 'AX', 'AZ', 'BA', 'BB', 'BC', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BK', 'BL', 'BM', 'BN', 'BO', 'BP', 'BQ', 'BR', 'BS', 'BT', 'BU', 'BV', 'BW', 'BX', 'BY', 'BZ', 'CA', 'CB', 'CC', 'CD', 'CE', 'CF', 'CG', 'CH', 'CI', 'CJ', 'CL', 'CM', 'CO', 'CP', 'CQ', 'CR', 'CS', 'CT', 'CU', 'CV', 'CW', 'CY', 'CZ', 'DA', 'DB', 'DC', 'DD', 'DE', 'DF', 'DG', 'DH', 'DI', 'DJ', 'DK', 'DL', 'DM', 'DN', 'DO', 'DP', 'DR', 'DS', 'DT', 'DV', 'DW', 'EE', 'EK', 'EL', 'EN', 'EO', 'ER', 'ES', 'ET', 'EU', 'EY', 'EZ', 'FA', 'FC', 'FD', 'FG', 'FJ', 'FL', 'FN', 'FO', 'FP', 'FR', 'FS', 'FX', 'GA', 'GB', 'GC', 'GD', 'GE', 'GF', 'GG', 'GI', 'GJ', 'GK', 'GM', 'GN', 'GO', 'GP', 'GR', 'GS', 'GT', 'GU', 'GY', 'GZ', 'HD', 'HE', 'HI', 'HK', 'HL', 'HN', 'HO', 'HR', 'HS', 'HT', 'HU', 'IA', 'IB', 'IC', 'ID', 'IE', 'II', 'IL', 'IM', 'IN', 'IO', 'IQ', 'IR', 'IS', 'IT', 'IU', 'IW', 'IX', 'IY', 'JA', 'JE', 'JI', 'JL', 'JM', 'JN', 'JO', 'JR', 'JU', 'KB', 'KC', 'KE', 'KH', 'KI', 'KK', 'KN', 'KO', 'KP', 'KS', 'KT', 'KU', 'KW', 'KY', 'KZ', 'LA', 'LB', 'LC', 'LD', 'LE', 'LF', 'LH', 'LI', 'LL', 'LN', 'LO', 'LP', 'LS', 'LT', 'LU', 'LX', 'LY', 'MA', 'MB', 'MC', 'MD', 'ME', 'MF', 'MG', 'MH', 'MI', 'MJ', 'MK', 'ML', 'MM', 'MN', 'MO', 'MP', 'MQ', 'MR', 'MS', 'MT', 'MU', 'MV', 'MW', 'MX', 'MY', 'MZ', 'NA', 'NB', 'NC', 'ND', 'NE', 'NF', 'NG', 'NH', 'NI', 'NJ', 'NK', 'NL', 'NM', 'NN', 'NO', 'NP', 'NQ', 'NR', 'NS', 'NT', 'NU', 'NV', 'NW', 'NX', 'NY', 'NZ', 'OA', 'OC', 'OF', 'OG', 'OH', 'OI', 'OK', 'OM', 'ON', 'OO', 'OR', 'OS', 'OT', 'PA', 'PB', 'PC', 'PD', 'PE', 'PF', 'PG', 'PI', 'PK', 'PL', 'PM', 'PN', 'PO', 'PQ', 'PR', 'PS', 'PT', 'PU', 'PV', 'PW', 'QA', 'QR', 'QU', 'RA', 'RB', 'RC', 'RE', 'RF', 'RG', 'RH', 'RI', 'RL', 'RR', 'RS', 'RU', 'RV', 'RW', 'RY', 'SA', 'SB', 'SC', 'SD', 'SE', 'SF', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN', 'SO', 'SP', 'SQ', 'SR', 'SS', 'SU', 'SV', 'SW', 'SY', 'SZ', 'TA', 'TB', 'TC', 'TD', 'TE', 'TF', 'TG', 'TH', 'TJ', 'TK', 'TL', 'TM', 'TN', 'TO', 'TP', 'TR', 'TS', 'TT', 'TU', 'TV', 'TW', 'TX', 'TY', 'TZ', 'UC', 'UG', 'UK', 'UM', 'UR', 'US', 'UT', 'UV', 'UY', 'UZ', 'VA', 'VB', 'VC', 'VI', 'VL', 'VT', 'VV', 'VY', 'VZ', 'WA', 'WB', 'WD', 'WE', 'WF', 'WI', 'WK', 'WL', 'WN', 'WS', 'WT', 'WV', 'WY', 'XX', 'YG', 'YO', 'YT', 'YU', 'YY', 'ZA', 'ZB', 'ZC', 'ZD', 'ZI', 'ZM', 'ZO', 'ZR'"/>
	
	<!--The location of the LEXS/N-DEx configuration file-->
	<xsl:variable name="ConfiguredAgencyORI">
		<xsl:value-of select="/IncidentReport/AgencyORI"/>
	</xsl:variable>
 	<xsl:variable name="document" select="document(concat('classpath:',static-base-uri(),'etc/', $ConfiguredAgencyORI, '_config.xml'))"/>
	<!-- <xsl:variable name="document" select="document(Maine_metadata.xml)"/> -->
	<!--Values are defined in the configuration file-->
	<xsl:variable name="timeUnit">
		<xsl:value-of select="$document//StaticVariables/TimeUnit"/>
	</xsl:variable>
	<xsl:variable name="incidentCategory">
		<xsl:value-of select="$document//StaticVariables/IncidentActivityCategory"/>
	</xsl:variable>
	<xsl:variable name="arrestCategory">
		<xsl:value-of select="$document//StaticVariables/ArrestActivityCategory"/>
	</xsl:variable>
	<xsl:variable name="stateCode">
		<xsl:value-of select="$document//StaticVariables/StateCode"/>
	</xsl:variable>
	<xsl:variable name="stateName">
		<xsl:value-of select="$document//StaticVariables/StateName"/>
	</xsl:variable>
	<xsl:variable name="issuingAgency">
		<xsl:value-of select="$document//StaticVariables/IssuingAgency"/>
	</xsl:variable>
	<xsl:variable name="agencyCategory">
		<xsl:value-of select="$document//StaticVariables/AgencyCategory"/>
	</xsl:variable>
	<xsl:variable name="formRevisionDate">
		<xsl:value-of select="$document//StaticVariables/FormRevisionDate"/>
	</xsl:variable>
	<xsl:variable name="heightUnit">
		<xsl:value-of select="$document//StaticVariables/HeightMeasureUnit"/>
	</xsl:variable>
	<xsl:variable name="weightUnit">
		<xsl:value-of select="$document//StaticVariables/WeightMeasureUnit"/>
	</xsl:variable>
	<!--Root-->
	<xsl:template match="/IncidentReport">
		<xsl:variable name="LEACaseNumber" select="./Incident/LEACaseNumber"/>
		<lexspd:doPublish >
			<lexs:PublishMessageContainer>
				<lexs:PublishMessage>
					<!-- Copy PDMessageMetadata from external config file -->
					<xsl:call-template name="PDMessageMetadata"/>
					<!-- Copy DataSubmitterMetadata from external config file -->
					<xsl:copy-of select="$document/MaineNDExConfiguration/lexs:DataSubmitterMetadata"/>
					<lexs:DataItemPackage>
						<lexs:PackageMetadata>
							<lexs:DataItemID>
								<xsl:value-of select="$LEACaseNumber"/>
							</lexs:DataItemID>
							<xsl:copy-of select="$document/MaineNDExConfiguration/lexs:PackageMetadata/lexs:DataItemContact"/>
							<xsl:if test="$document != ''">
								<lexs:DataItemDate>
										<xsl:value-of  select="format-date(current-date(), '[Y0001]-[M01]-[D01]')"/>
								</lexs:DataItemDate>
							</xsl:if>
							<lexs:DataItemReferenceID>
								<xsl:value-of select="$LEACaseNumber"/>
							</lexs:DataItemReferenceID>
							<xsl:copy-of select="$document/MaineNDExConfiguration/lexs:PackageMetadata/lexs:DataItemPublishInstruction"/>
							<xsl:copy-of select="$document/MaineNDExConfiguration/lexs:PackageMetadata/lexs:DataItemStatus"/>
							<xsl:copy-of select="$document/MaineNDExConfiguration/lexs:PackageMetadata/lexs:DataOwnerMetadata"/>
							<lexs:DisseminationCriteriaValue>
								<xsl:copy-of select="$document/MaineNDExConfiguration/lexs:PackageMetadata/lexs:DisseminationCriteriaValue/lexs:DisseminationCriteriaDomainText"/>
								<xsl:choose>
									<xsl:when test="child::DisseminationCriteria[.!='']">
										<lexs:DisseminationCriteriaText>
											<xsl:value-of select="child::DisseminationCriteria"/>
										</lexs:DisseminationCriteriaText>
									</xsl:when>
									<xsl:otherwise>
										<xsl:copy-of select="$document/MaineNDExConfiguration/lexs:PackageMetadata/lexs:DisseminationCriteriaValue/lexs:DisseminationCriteriaText"/>
									</xsl:otherwise>
								</xsl:choose>
							</lexs:DisseminationCriteriaValue>
							<xsl:copy-of select="$document/MaineNDExConfiguration/lexs:PackageMetadata/lexs:DataItemCategory"/>
						</lexs:PackageMetadata>
						<!--LEXS Digest-->
						<lexs:Digest>
							<xsl:apply-templates select="./Incident" mode="DigestActivity"/>
							<xsl:apply-templates select="//SubjectOffense" mode="DigestActivity"/>
							<xsl:apply-templates select="//VictimOffense" mode="DigestActivity"/>
							<xsl:apply-templates select="//Offense" mode="DigestActivity"/>
							<xsl:apply-templates select="./Incident/Subject/Arrest" mode="DigestArrest"/>
							<xsl:apply-templates select="./Person[@id =//*/@ref]" mode="DigestPerson"/>
							<xsl:apply-templates select="./IssuingOfficer" mode="DigestPerson"/>
							<xsl:apply-templates select="./Organization" mode="DigestOrganization"/>
							<xsl:apply-templates select="./Court" mode="DigestOrganization"/>
							<xsl:apply-templates select="./IssuingOfficer" mode="IssuingAgency"/>
							<xsl:apply-templates select="//PhoneNumber" mode="EntityTelephoneNumber"/>
							<xsl:apply-templates select="//EmailAddress" mode="EntityEmail"/>
							<xsl:apply-templates select="./Address[@id =//*/@ref]" mode="EntityLocation"/>
							<xsl:apply-templates select="./Incident/Vehicle"/>
							<xsl:apply-templates select="//Evidence" mode="DigestEntityTangibleItem"/>
							<lexsdigest:Associations>
								<!--ActivityEnforcementOfficialAssociation -->
								<xsl:apply-templates select="//IssuingOfficer" mode="ActivityEnforcementOfficialAssociation"/>
								<!--ArrestOffenseAssociation -->
								<xsl:apply-templates select="//SubjectOffense" mode="ArrestOffenseAssociation"/>
								<!--ArrestOfficerAssociation-->
								<xsl:apply-templates select="//Arrest" mode="ArrestOfficerAssociation"/>
								<!--ArrestSubjectAssociation-->
								<xsl:apply-templates select="//Arrest" mode="ArrestSubjectAssocation"/>
								<!--EntityOrganizaionEmailAssociation-->
								<xsl:apply-templates select="./Organization/ContactInformation/EmailAddress" mode="EntityOrganizationAssociation"/>
								<!--EntityOrganizaionEmailAssociation-->
								<xsl:apply-templates select="//Person/ContactInformation/EmailAddress" mode="EntityPersonAssociation"/>
								<!--EntityOrganizationTelephoneAssociation-->
								<xsl:apply-templates select="./Organization/ContactInformation/PhoneNumber" mode="EntityOrganizationAssociation"/>
								<!--EntityPersonTelephoneAssociation-->
								<xsl:apply-templates select="//Person/ContactInformation/PhoneNumber" mode="EntityPersonAssociation"/>
								<!--IncidentEvidenceAssociation-->
								<xsl:apply-templates select="//Evidence" mode="IncidentEvidenceAssociation"/>
								<!-- IncidentInvolvedItemAssociation -->
								<xsl:apply-templates select="//IncidentReport/Incident/Vehicle" mode="IncidentInvolvedItemAssociation"/>
								<!--IncidentLocationAssociation-->
								<xsl:apply-templates select="./Incident/AddressReference" mode="IncidentLocationAssociation"/>
								<!-- IncidentOffenseAssociation -->
								<xsl:apply-templates select="//SubjectOffense" mode="IncidentOffenseAssociation"/>
								<xsl:apply-templates select="//VictimOffense" mode="IncidentOffenseAssociation"/>
								<xsl:apply-templates select="//Offense" mode="IncidentOffenseAssociation"/>
								<!--IncidentSubjectPersonAssociation-->
								<xsl:apply-templates select="//Subject" mode="IncidentSubjectPersonAssociation"/>
								<!--IncidentVictimPerson and Organization Association-->
								<xsl:apply-templates select="//Victim[RoleOfOrganizationReference]" mode="IncidentVictimOrganization"/>
								<xsl:apply-templates select="//Victim[RoleOfPersonReference]" mode="IncidentVictimPerson"/>
								<!--IncidentWitnessAssociation-->
								<xsl:apply-templates select="//Witness[RoleOfPersonReference]" mode="IncidentWitness"/>
								<!-- OffenseLocationAssociation -->
								<xsl:apply-templates select="/IncidentReport/Incident/Subject/SubjectOffense[AddressReference/@ref =  /IncidentReport/Address/@id]" mode="OffenseLocationAssociation"/>
								<!-- OffenseSubjectPersonAssociation -->
								<xsl:apply-templates select="//Subject[RoleOfPersonReference]" mode="OffenseSubjectPersonAssociation"/>
								<!--OffenseVictimOrganizationAssociation-->
								<xsl:apply-templates select="//Victim[RoleOfOrganizationReference]" mode="OffenseVictimOrganizationAssociation"/>
								<!--OffenseVictimPersonAssociation-->
								<xsl:apply-templates select="//Victim[RoleOfPersonReference]" mode="OffenseVictimPersonAssociation"/>
								<!--PersonContactAssociation-->
								<xsl:apply-templates select="./Person/ContactInformation" mode="PersonContactAssociation"/>
								<!--SubjectVictimAssociation must start with Victim-->
								<xsl:apply-templates select="//Victim" mode="SubjectVictimAssociation"/>
								<!--ActivityPrimaryOrganizationAssociation-->
								<xsl:apply-templates select="//Subject" mode="ActivityPrimaryOrganizationAssociation"/>
								<!--LocationOrganizationAssociation-->
								<xsl:apply-templates select="//Organization[ContactInformation/AddressReference]" mode="LocationOrganizationAssociation"/>
								<xsl:apply-templates select="//Court[AddressReference]" mode="LocationOrganizationAssociation"/>
								<!--PersonAssignedUnitAssociation-->
								<xsl:apply-templates select="./IssuingOfficer" mode="AssignedUnit"/>
								<!--ResidenceAssociation -->
								<xsl:apply-templates select="./Person/ContactInformation/AddressReference" mode="PersonAddress"/>
							</lexsdigest:Associations>
						</lexs:Digest>
						<!--N-DEx Structured Payload-->
						<lexs:StructuredPayload>
							<xsl:copy-of select="$document/MaineNDExConfiguration/N-DExStructuredPayload/lexs:StructuredPayloadMetadata"/>
							<ndexia:IncidentReport>
								<xsl:apply-templates select="//Incident/IncidentStatus" mode="NDExIncident"/>
								<xsl:apply-templates select="./Person" mode="NDExPerson"/>
								<xsl:apply-templates select="./IssuingOfficer/AgencyORI"/>
								<xsl:apply-templates select="//Victim" mode="NDExVictim"/>
								<xsl:apply-templates select="//Address/LocationCommonName"/>
								<xsl:apply-templates select="./Incident/Subject/Arrest" mode="NDExArrest"/>
								<xsl:apply-templates select="//SubjectOffense" mode="NDExOffense"/>
								<xsl:apply-templates select="//VictimOffense" mode="NDExOffense"/>
								<xsl:apply-templates select="//Offense" mode="NDExOffense"/>
								<xsl:apply-templates select="/IncidentReport/Incident/Evidence" mode="ndexiaEvidence"/>
								<xsl:apply-templates select="./Organization" mode="NDExOrganization"/>
							</ndexia:IncidentReport>
						</lexs:StructuredPayload>
						<!--OJBC Structured Payload-->
						<lexs:StructuredPayload>
							<xsl:copy-of select="$document/MaineNDExConfiguration/MaineStructuredPayload/lexs:StructuredPayloadMetadata"/>
							<inc-ext:IncidentReport>
								<xsl:apply-templates select="ReportableToDistrictAttorney"/>
								<inc-ext:FormRevisionDate>
									<xsl:value-of select="$formRevisionDate"/>
								</inc-ext:FormRevisionDate>
								<inc-ext:Incident>
									<xsl:apply-templates select="//SubjectOffense" mode="MaineCharge"/>
									<xsl:apply-templates select="//Evidence" mode="MaineEvidence"/>
									<xsl:apply-templates select="//IncidentCase"/>
									<xsl:apply-templates select="./IssuingOfficer/OfficerSignature"/>
								</inc-ext:Incident>
								<xsl:apply-templates select="//OperatorLicense/AddressFromLicenseReference[@ref]"/>
								<xsl:apply-templates select="//SubjectOffense/AddressReference[@ref]" mode="ChargeLocation"/>
								<xsl:apply-templates select="./Incident/Subject" mode="MaineIncidentSubject"/>
								<xsl:apply-templates select="//Address/GeoCode"/>
								<xsl:apply-templates select="//Arrest/ArraignmentDate"/>
								<xsl:apply-templates select="//Victim[VictimNarrative]" mode="narrative"/>
							</inc-ext:IncidentReport>
						</lexs:StructuredPayload>
					</lexs:DataItemPackage>
				</lexs:PublishMessage>
			</lexs:PublishMessageContainer>
		</lexspd:doPublish>
	</xsl:template>
	
	<xsl:template match="Organization" mode="NDExOrganization">
		<xsl:variable name="name" select="OrganizationName"/>
		<xsl:variable name="lcName" select="lower-case($name)"/>
		<xsl:if test="$lcName = 'state of maine'">
			<ndexia:Organization>
				<ndexia:OrganizationCategoryNDExCode>Society</ndexia:OrganizationCategoryNDExCode>
				<ndexia:OrganizationAugmentation>
                	<lexslib:SameAsDigestReference>
                		<xsl:attribute name="lexslib:ref" select="generate-id()"/>
                	</lexslib:SameAsDigestReference>
                </ndexia:OrganizationAugmentation>
			</ndexia:Organization>
		</xsl:if>
	</xsl:template>
	<xsl:template match="Vehicle" mode="IncidentInvolvedItemAssociation">
		<lexsdigest:IncidentInvolvedItemAssociation>
			<nc:ActivityReference>
				<xsl:attribute name="s:ref" select="generate-id(..)"/>			
			</nc:ActivityReference>
			<nc:ItemReference>
				<xsl:attribute name="s:ref" select="generate-id()"/>
			</nc:ItemReference>
		</lexsdigest:IncidentInvolvedItemAssociation>
	</xsl:template>
	
	<xsl:template match="Evidence" mode="ndexiaEvidence">
		<xsl:variable name="id" select="generate-id()"/>
		<ndexia:TangibleItem>
			<xsl:attribute name="s:id" select="concat('evidence',$id)"/>
			<ndexia:TangibleItemAugmentation>
				<lexslib:SameAsDigestReference>
					<xsl:attribute name="lexslib:ref" select="$id"/>
				</lexslib:SameAsDigestReference>
			</ndexia:TangibleItemAugmentation>
		</ndexia:TangibleItem>
		<ndexia:Evidence>
			<nc:RoleOfItemReference>
				<xsl:attribute name="s:ref" select="concat('evidence',$id)"/>
			</nc:RoleOfItemReference>
		</ndexia:Evidence>
	</xsl:template>
	<xsl:template match="/IncidentReport/Incident/Subject/SubjectOffense" mode="OffenseLocationAssociation">
		<xsl:variable name="offenseID" select="generate-id()"/>
		<xsl:variable name="addressRef" select="AddressReference/@ref"/>
		<xsl:variable name="locationID" select="generate-id(/IncidentReport/Address[@id=$addressRef])"/>
		<lexsdigest:OffenseLocationAssociation>
			<nc:ActivityReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="$offenseID"/></xsl:attribute>
			</nc:ActivityReference>
			<nc:LocationReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="$locationID"/></xsl:attribute>
			</nc:LocationReference>
		</lexsdigest:OffenseLocationAssociation>
	</xsl:template>
	<xsl:template match="SubjectOffense" mode="IncidentOffenseAssociation">
		<lexsdigest:IncidentOffenseAssociation>
			<nc:ActivityReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(../..)"/></xsl:attribute>
			</nc:ActivityReference>
			<nc:ActivityReference><xsl:attribute name="s:ref"><xsl:value-of select="generate-id()"/></xsl:attribute></nc:ActivityReference>
		</lexsdigest:IncidentOffenseAssociation>
	</xsl:template>
	<xsl:template match="VictimOffense" mode="IncidentOffenseAssociation">
		<lexsdigest:IncidentOffenseAssociation>
			<nc:ActivityReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(../..)"/></xsl:attribute>
			</nc:ActivityReference>
			<nc:ActivityReference><xsl:attribute name="s:ref"><xsl:value-of select="generate-id()"/></xsl:attribute></nc:ActivityReference>
		</lexsdigest:IncidentOffenseAssociation>
	</xsl:template>
	<xsl:template match="Offense" mode="IncidentOffenseAssociation">
		<lexsdigest:IncidentOffenseAssociation>
			<nc:ActivityReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(..)"/></xsl:attribute>
			</nc:ActivityReference>
			<nc:ActivityReference><xsl:attribute name="s:ref"><xsl:value-of select="generate-id()"/></xsl:attribute></nc:ActivityReference>
		</lexsdigest:IncidentOffenseAssociation>
	</xsl:template>
	<xsl:template match="AddressReference" mode="ChargeLocation">
		<xsl:variable name="id" select="@ref"/>
		<inc-ext:ChargeLocationAssociation>
			<j:ChargeReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(..)"/></xsl:attribute>
			</j:ChargeReference>
			<nc:LocationReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(//Address[@id=$id])"/></xsl:attribute>
			</nc:LocationReference>
		</inc-ext:ChargeLocationAssociation>
	</xsl:template>
	<xsl:template match="Victim" mode="narrative">
		<xsl:variable name="id" select="RoleOfPersonReference/@ref"/>
		<xsl:variable name="person" select="//Person[@id=$id]"/>
		<inc-ext:Victim>
			<inc-ext:VictimNarrativeText>
				<xsl:value-of select="VictimNarrative"/>
			</inc-ext:VictimNarrativeText>
			<lexslib:SameAsDigestReference>
				<xsl:attribute name="lexslib:ref"><xsl:value-of select="generate-id($person)"/></xsl:attribute>
			</lexslib:SameAsDigestReference>
		</inc-ext:Victim>
	</xsl:template>
	<xsl:template match="ArraignmentDate">
		<inc-ext:Arrest>
			<j:ArrestArraignmentDate>
				<nc:Date>
					<xsl:value-of select="."/>
				</nc:Date>
			</j:ArrestArraignmentDate>
			<lexslib:SameAsDigestReference>
				<xsl:attribute name="lexslib:ref"><xsl:value-of select="generate-id(..)"/></xsl:attribute>
			</lexslib:SameAsDigestReference>
		</inc-ext:Arrest>
	</xsl:template>
	<xsl:template match="Subject" mode="ActivityPrimaryOrganizationAssociation">
		<xsl:if test="Arrest and IncidentJurisdictionCourtReference">
			<xsl:variable name="court" select="IncidentJurisdictionCourtReference/@ref"/>
			<nc:ActivityPrimaryOrganizationAssociation>
				<nc:ActivityReference>
					<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(Arrest)"/></xsl:attribute>
				</nc:ActivityReference>
				<nc:OrganizationReference>
					<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(//Court[@id=$court])"/></xsl:attribute>
				</nc:OrganizationReference>
			</nc:ActivityPrimaryOrganizationAssociation>
		</xsl:if>
	</xsl:template>
	<xsl:template match="Arrest" mode="ArrestSubjectAssocation">
		<xsl:variable name="person" select="../RoleOfPersonReference/@ref"/>
		<lexsdigest:ArrestSubjectAssociation>
			<nc:ActivityReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
			</nc:ActivityReference>
			<nc:PersonReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(//Person[@id=$person])"/></xsl:attribute>
			</nc:PersonReference>
		</lexsdigest:ArrestSubjectAssociation>
	</xsl:template>
	<xsl:template match="LEACourtCode">
		<lexsdigest:Metadata>
			<nc:SourceIDText>
				<xsl:value-of select="."/>
			</nc:SourceIDText>
		</lexsdigest:Metadata>
	</xsl:template>
	<xsl:template match="Court" mode="DigestOrganization">
		<lexsdigest:EntityOrganization>
			<xsl:apply-templates select="LEACourtCode"/>
			<nc:Organization>
				<xsl:call-template name="AssignID"/>
				<nc:OrganizationCategoryText>
					<xsl:value-of select="$agencyCategory"/>
				</nc:OrganizationCategoryText>
				<xsl:apply-templates select="CourtName"/>
			</nc:Organization>
		</lexsdigest:EntityOrganization>
	</xsl:template>
	<xsl:template match="CourtName">
		<nc:OrganizationName>
			<xsl:value-of select="."/>
		</nc:OrganizationName>
	</xsl:template>
	<xsl:template match="ReportableToDistrictAttorney">
		<inc-ext:IncidentReportableToDistrictAttorneyIndicator>
			<xsl:value-of select="."/>
		</inc-ext:IncidentReportableToDistrictAttorneyIndicator>
	</xsl:template>
	<xsl:template match="Organization" mode="LocationOrganizationAssociation">
		<xsl:variable name="address" select="ContactInformation/AddressReference/@ref"/>
		<nc:LocationOrganizationAssociation>
			<nc:LocationReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(//Address[@id=$address])"/></xsl:attribute>
			</nc:LocationReference>
			<nc:OrganizationReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
			</nc:OrganizationReference>
		</nc:LocationOrganizationAssociation>
	</xsl:template>
	<xsl:template match="Court" mode="LocationOrganizationAssociation">
		<xsl:variable name="address" select="AddressReference/@ref"/>
		<nc:LocationOrganizationAssociation>
			<nc:LocationReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(//Address[@id=$address])"/></xsl:attribute>
			</nc:LocationReference>
			<nc:OrganizationReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
			</nc:OrganizationReference>
		</nc:LocationOrganizationAssociation>
	</xsl:template>
	<xsl:template match="Victim" mode="SubjectVictimAssociation">
		<xsl:variable name="id" select="@id"/>
		<xsl:variable name="person" select="RoleOfPersonReference/@ref"/>
		<xsl:variable name="organization" select="RoleOfOrganizationReference/@ref"/>
		<xsl:choose>
			<xsl:when test="RoleOfPersonReference">
				<xsl:apply-templates select="//Subject[SubjectOffense/VictimReference/@ref=$id]" mode="SubjectVictimPersonAssociation">
					<xsl:with-param name="pID" select="$person"/>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:when test="RoleOfOrganizationReference">
				<xsl:apply-templates select="//Subject[SubjectOffense/VictimReference/@ref=$id]" mode="SubjectVictimOrganizationAssociation">
					<xsl:with-param name="oID" select="$organization"/>
				</xsl:apply-templates>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="Subject" mode="SubjectVictimPersonAssociation">
		<xsl:param name="pID"/>
		<xsl:variable name="person" select="RoleOfPersonReference/@ref"/>
		<lexsdigest:SubjectVictimAssociation>
			<lexsdigest:SubjectPersonReference>
				<xsl:attribute name="s:ref" select="generate-id(//Person[@id=$person])"/>
			</lexsdigest:SubjectPersonReference>
			<lexsdigest:VictimPersonReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(//Person[@id=$pID])"/></xsl:attribute>
			</lexsdigest:VictimPersonReference>
		</lexsdigest:SubjectVictimAssociation>
	</xsl:template>
	<xsl:template match="Subject" mode="SubjectVictimOrganizationAssociation">
		<xsl:param name="oID"/>
		<xsl:variable name="person" select="RoleOfPersonReference/@ref"/>
		<lexsdigest:SubjectVictimAssociation>
			<lexsdigest:SubjectPersonReference>
				<xsl:attribute name="s:ref" select="generate-id(//Person[@id=$person])"/>
			</lexsdigest:SubjectPersonReference>
			<lexsdigest:VictimOrganizationReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(//Organization[@id=$oID])"/></xsl:attribute>
			</lexsdigest:VictimOrganizationReference>
		</lexsdigest:SubjectVictimAssociation>
	</xsl:template>
	<xsl:template match="Subject" mode="OffenseSubjectPersonAssociation">
		<xsl:variable name="id" select="@id"/>
		<xsl:variable name="person" select="RoleOfPersonReference/@ref"/>
		<xsl:apply-templates select="SubjectOffense" mode="OffenseSubjectPersonAssociation">
			<xsl:with-param name="subject" select="$id"/>
			<xsl:with-param name="personID" select="$person"/>
		</xsl:apply-templates>
	</xsl:template>
	<xsl:template match="SubjectOffense" mode="OffenseSubjectPersonAssociation">
		<xsl:param name="subject"/>
		<xsl:param name="personID"/>
		<lexsdigest:OffenseSubjectPersonAssociation>
			<nc:ActivityReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
			</nc:ActivityReference>
			<xsl:apply-templates select="//Person" mode="OffenseVictimPersonAssociation">
				<xsl:with-param name="personID" select="$personID"/>
			</xsl:apply-templates>
		</lexsdigest:OffenseSubjectPersonAssociation>
	</xsl:template>
	<xsl:template match="Victim" mode="OffenseVictimPersonAssociation">
		<xsl:variable name="id" select="@id"/>
		<xsl:variable name="person" select="RoleOfPersonReference/@ref"/>
		<xsl:apply-templates select="VictimOffense" mode="OffenseVictimPersonAssociation">
			<xsl:with-param name="victim" select="$id"/>
			<xsl:with-param name="personID" select="$person"/>
		</xsl:apply-templates>
	</xsl:template>
	<xsl:template match="VictimOffense" mode="OffenseVictimPersonAssociation">
		<xsl:param name="victim"/>
		<xsl:param name="personID"/>
			<lexsdigest:OffenseVictimPersonAssociation>
				<nc:ActivityReference>
					<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				</nc:ActivityReference>
				<xsl:apply-templates select="//Person" mode="OffenseVictimPersonAssociation">
					<xsl:with-param name="personID" select="$personID"/>
				</xsl:apply-templates>
			</lexsdigest:OffenseVictimPersonAssociation>
	</xsl:template>
	<xsl:template match="Person" mode="OffenseVictimPersonAssociation">
		<xsl:param name="personID"/>
		<xsl:if test="@id=$personID">
			<nc:PersonReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
			</nc:PersonReference>
		</xsl:if>
	</xsl:template>
	<xsl:template match="Victim" mode="OffenseVictimOrganizationAssociation">
		<xsl:variable name="id" select="@id"/>
		<xsl:variable name="organization" select="RoleOfOrganizationReference/@ref"/>
		<xsl:apply-templates select="VictimOffense" mode="OffenseVictimOrganizationAssociation">
			<xsl:with-param name="victim" select="$id"/>
			<xsl:with-param name="orgID" select="$organization"/>
		</xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Organization" mode="OffenseVictimOrganizationAssociation">
		<xsl:param name="orgID"/>
		<xsl:if test="@id=$orgID">
			<nc:OrganizationReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
			</nc:OrganizationReference>
		</xsl:if>
	</xsl:template>
	<xsl:template match="SubjectOffense" mode="OffenseVictimOrganizationAssociation">
		<xsl:param name="victim"/>
		<xsl:param name="orgID"/>
		<xsl:if test="VictimReference/@ref=$victim">
			<lexsdigest:OffenseVictimOrganizationAssociation>
				<nc:ActivityReference>
					<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				</nc:ActivityReference>
				<xsl:apply-templates select="//Organization" mode="OffenseVictimOrganizationAssociation">
					<xsl:with-param name="orgID" select="$orgID"/>
				</xsl:apply-templates>
			</lexsdigest:OffenseVictimOrganizationAssociation>
		</xsl:if>
	</xsl:template>
	<xsl:template match="VictimOffense" mode="OffenseVictimOrganizationAssociation">
		<xsl:param name="victim"/>
		<xsl:param name="orgID"/>
		<lexsdigest:OffenseVictimOrganizationAssociation>
			<nc:ActivityReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
			</nc:ActivityReference>
			<xsl:apply-templates select="//Organization" mode="OffenseVictimOrganizationAssociation">
				<xsl:with-param name="orgID" select="$orgID"/>
			</xsl:apply-templates>
		</lexsdigest:OffenseVictimOrganizationAssociation>
	</xsl:template>
	<xsl:template match="Subject" mode="IncidentSubjectPersonAssociation">
		<xsl:variable name="person" select="RoleOfPersonReference/@ref"/>
		<lexsdigest:IncidentSubjectPersonAssociation>
			<nc:ActivityReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(..)"/></xsl:attribute>
			</nc:ActivityReference>
			<nc:PersonReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(//Person[@id=$person])"/></xsl:attribute>
			</nc:PersonReference>
		</lexsdigest:IncidentSubjectPersonAssociation>
	</xsl:template>
	<xsl:template match="Evidence" mode="IncidentEvidenceAssociation">
		<lexsdigest:IncidentEvidenceAssociation>
			<nc:ActivityReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(..)"/></xsl:attribute>
			</nc:ActivityReference>
			<nc:ItemReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id()"/></xsl:attribute>
			</nc:ItemReference>
		</lexsdigest:IncidentEvidenceAssociation>
	</xsl:template>
	<xsl:template match="Arrest" mode="ArrestOfficerAssociation">
		<xsl:variable name="officerCount" select="count(//IssuingOfficer)"/>
		<xsl:choose>
			<xsl:when test="$officerCount = 1">
				<lexsdigest:ArrestOfficerAssociation>
					<nc:ActivityReference>
						<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
					</nc:ActivityReference>
					<nc:PersonReference>
						<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(//IssuingOfficer)"/></xsl:attribute>
					</nc:PersonReference>
				</lexsdigest:ArrestOfficerAssociation>
			</xsl:when>
			<xsl:when test="$officerCount > 1">
				<xsl:apply-templates select="ArrestingOfficerReference"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="ArrestingOfficerReference">
		<xsl:variable name="officerID" select="@ref"/>
		<lexsdigest:ArrestOfficerAssociation>
			<nc:ActivityReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
			</nc:ActivityReference>
			<nc:PersonReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(//IssuingOfficer[@id=$officerID])"/></xsl:attribute>
			</nc:PersonReference>
		</lexsdigest:ArrestOfficerAssociation>
	</xsl:template>
	<xsl:template match="SubjectOffense" mode="ArrestOffenseAssociation">
		<xsl:if test="../Arrest">
			<lexsdigest:ArrestOffenseAssociation>
				<nc:ActivityReference>
					<xsl:attribute name="s:ref"><xsl:value-of select="generate-id()"/></xsl:attribute>
				</nc:ActivityReference>
				<nc:ActivityReference>
					<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(../Arrest)"/></xsl:attribute>
				</nc:ActivityReference>
			</lexsdigest:ArrestOffenseAssociation>
		</xsl:if>
	</xsl:template>
	<xsl:template match="IssuingOfficer" mode="ActivityEnforcementOfficialAssociation">
		<j:ActivityEnforcementOfficialAssociation>
			<nc:ActivityReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(../Incident)"/></xsl:attribute>
			</nc:ActivityReference>
			<nc:PersonReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
			</nc:PersonReference>
		</j:ActivityEnforcementOfficialAssociation>
	</xsl:template>
	<xsl:template match="Evidence" mode="MaineEvidence">
		<inc-ext:PropertyEvidence>
			<xsl:apply-templates select="EvidenceStatus"/>
			<lexslib:SameAsDigestReference>
				<xsl:attribute name="lexslib:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
			</lexslib:SameAsDigestReference>
		</inc-ext:PropertyEvidence>
	</xsl:template>
	<xsl:template match="EvidenceStatus">
		<nc:ItemStatus>
			<nc:StatusDescriptionText>
				<xsl:value-of select="."/>
			</nc:StatusDescriptionText>
		</nc:ItemStatus>
	</xsl:template>
	<xsl:template match="Evidence" mode="DigestEntityTangibleItem">
		<lexsdigest:EntityTangibleItem>
			<nc:TangibleItem>
				<xsl:call-template name="AssignID"/>
				<xsl:apply-templates select="EvidenceDescription"/>
				<xsl:apply-templates select="EvidenceIncidentBasedReportingType"/>
			</nc:TangibleItem>
		</lexsdigest:EntityTangibleItem>
	</xsl:template>
	<xsl:template match="EvidenceDescription">
		<nc:ItemDescriptionText>
			<xsl:value-of select="."/>
		</nc:ItemDescriptionText>
	</xsl:template>
	<xsl:template match="EvidenceIncidentBasedReportingType">
		<nc:ItemCategoryText>
			<xsl:value-of select="."/>
		</nc:ItemCategoryText>
	</xsl:template>
	<xsl:template match="Witness[RoleOfPersonReference]" mode="IncidentWitness">
		<xsl:variable name="person" select="RoleOfPersonReference/@ref"/>
		<lexsdigest:IncidentWitnessAssociation>
			<nc:ActivityReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(..)"/></xsl:attribute>
			</nc:ActivityReference>
			<nc:PersonReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(//Person[@id=$person])"/></xsl:attribute>
			</nc:PersonReference>
			<xsl:apply-templates select="WitnessInvolvement"/>
		</lexsdigest:IncidentWitnessAssociation>
	</xsl:template>
	<xsl:template match="WitnessInvolvement">
		<nc:PersonActivityInvolvementText>
			<xsl:value-of select="."/>
		</nc:PersonActivityInvolvementText>
	</xsl:template>
	<xsl:template match="Victim" mode="IncidentVictimPerson">
		<xsl:variable name="roleOfPerson" select="RoleOfPersonReference/@ref"/>
		<lexsdigest:IncidentVictimPersonAssociation>
			<nc:ActivityReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(..)"/></xsl:attribute>
			</nc:ActivityReference>
			<nc:PersonReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(//Person[@id=$roleOfPerson])"/></xsl:attribute>
			</nc:PersonReference>
			<xsl:apply-templates select="VictimInvolvement" mode="Person"/>
		</lexsdigest:IncidentVictimPersonAssociation>
	</xsl:template>
	<xsl:template match="VictimInvolvement" mode="Person">
		<nc:PersonActivityInvolvementText>
			<xsl:value-of select="."/>
		</nc:PersonActivityInvolvementText>
	</xsl:template>
	<xsl:template match="Victim" mode="IncidentVictimOrganization">
		<xsl:variable name="roleOfOrg" select="RoleOfOrganizationReference/@ref"/>
		<lexsdigest:IncidentVictimOrganizationAssociation>
			<nc:ActivityReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(..)"/></xsl:attribute>
			</nc:ActivityReference>
			<nc:OrganizationReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(//Organization[@id=$roleOfOrg])"/></xsl:attribute>
			</nc:OrganizationReference>
		</lexsdigest:IncidentVictimOrganizationAssociation>
	</xsl:template>
	<xsl:template match="//Victim" mode="NDExVictim">
		<xsl:variable name="roleOfPerson" select="RoleOfPersonReference/@ref"/>
		<xsl:variable name="roleOfOrg" select="RoleOfOrganizationReference/@ref"/>
		<xsl:if test="VictimInjury or VictimType">
		<ndexia:Victim>
			<xsl:apply-templates select="VictimInjury"/>
			<xsl:apply-templates select="VictimType"/>
			<ndexia:VictimAugmentation>
				<lexslib:SameAsDigestReference>
					<xsl:choose>
						<xsl:when test="RoleOfPersonReference">
							<xsl:attribute name="lexslib:ref"><xsl:value-of select="generate-id(//Person[@id=$roleOfPerson])"/></xsl:attribute>
						</xsl:when>
						<xsl:when test="RoleOfOrganizationReference">
							<xsl:attribute name="lexslib:ref"><xsl:value-of select="generate-id(//Organization[@id=$roleOfOrg])"/></xsl:attribute>
						</xsl:when>
					</xsl:choose>
				</lexslib:SameAsDigestReference>
			</ndexia:VictimAugmentation>
		</ndexia:Victim>
		</xsl:if>
	</xsl:template>
	<xsl:template match="VictimInjury">
		<j:VictimInjury>
			<nc:InjuryCategoryText>
				<xsl:value-of select="."/>
			</nc:InjuryCategoryText>
		</j:VictimInjury>
	</xsl:template>
	<xsl:template match="VictimType">
		<j:VictimCategoryCode>
			<xsl:value-of select="."/>
		</j:VictimCategoryCode>
	</xsl:template>
	<xsl:template match="SubjectOffense" mode="NDExOffense">
		<ndexia:Offense>
			<ndexia:ActivityAugmentation>
				<lexslib:SameAsDigestReference>
					<xsl:attribute name="lexslib:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				</lexslib:SameAsDigestReference>
			</ndexia:ActivityAugmentation>
			<xsl:if test="Statute != ''">
				<j:Statute>
					<xsl:apply-templates select="Statute"/>
					<xsl:apply-templates select="ChargeText" mode="Statute"/>
				</j:Statute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="OffenseCategoryCode != '' or OffenseCategoryText !=''">
					<xsl:apply-templates select="OffenseCategoryCode"/>
					<xsl:apply-templates select="OffenseCategoryText"/>
				</xsl:when>
				<xsl:when test="ChargeText != ''">
					<xsl:apply-templates select="ChargeText" mode="offense"/>
				</xsl:when>
			</xsl:choose>
		</ndexia:Offense>
	</xsl:template>
	<xsl:template match="VictimOffense" mode="NDExOffense">
		<ndexia:Offense>
			<ndexia:ActivityAugmentation>
				<lexslib:SameAsDigestReference>
					<xsl:attribute name="lexslib:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				</lexslib:SameAsDigestReference>
			</ndexia:ActivityAugmentation>
			<xsl:if test="Statute != ''">
				<j:Statute>
					<xsl:apply-templates select="Statute"/>
					<xsl:apply-templates select="ChargeText" mode="Statute"/>
				</j:Statute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="OffenseCategoryCode != '' or OffenseCategoryText !=''">
					<xsl:apply-templates select="OffenseCategoryCode"/>
					<xsl:apply-templates select="OffenseCategoryText"/>
				</xsl:when>
				<xsl:when test="ChargeText != ''">
					<xsl:apply-templates select="ChargeText" mode="offense"/>
				</xsl:when>
			</xsl:choose>
		</ndexia:Offense>
	</xsl:template>
	<xsl:template match="Offense" mode="NDExOffense">
		<ndexia:Offense>
			<ndexia:ActivityAugmentation>
				<lexslib:SameAsDigestReference>
					<xsl:attribute name="lexslib:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				</lexslib:SameAsDigestReference>
			</ndexia:ActivityAugmentation>
			<xsl:if test="Statute != ''">
				<j:Statute>
					<xsl:apply-templates select="Statute"/>
					<xsl:apply-templates select="ChargeText" mode="Statute"/>
				</j:Statute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="OffenseCategoryCode != '' or OffenseCategoryText !=''">
					<xsl:apply-templates select="OffenseCategoryCode"/>
					<xsl:apply-templates select="OffenseCategoryText"/>
				</xsl:when>
				<xsl:when test="ChargeText != ''">
					<xsl:apply-templates select="ChargeText" mode="offense"/>
				</xsl:when>
			</xsl:choose>
		</ndexia:Offense>
	</xsl:template>
	<xsl:template match="OffenseCategoryCode">
		<ndexia:OffenseCode>
			<xsl:value-of select="."/>
		</ndexia:OffenseCode>
	</xsl:template>
	<xsl:template match="OffenseCategoryText">
		<ndexia:OffenseText>
			<xsl:value-of select="."/>
		</ndexia:OffenseText>
	</xsl:template>
	<xsl:template match="Statute">
		<j:StatuteCodeIdentification>
			<nc:IdentificationID>
				<xsl:value-of select="."/>
			</nc:IdentificationID>
			<nc:IdentificationJurisdictionText>
				<xsl:value-of select="$stateName"/>
			</nc:IdentificationJurisdictionText>
		</j:StatuteCodeIdentification>
	</xsl:template>
	<xsl:template match="ChargeText" mode="Statute">
		<j:StatuteDescriptionText>
			<xsl:value-of select="."/>
		</j:StatuteDescriptionText>
	</xsl:template>
	<xsl:template match="ChargeText" mode="offense">
		<ndexia:OffenseText>
			<xsl:value-of select="."/>
		</ndexia:OffenseText>
	</xsl:template>	
	<xsl:template match="SubjectOffense" mode="MaineCharge">
		<inc-ext:Charge>
			<xsl:apply-templates select="ChargeSequenceNumber"/>
			<xsl:apply-templates select="ChargeTrackingNumber"/>
			<!--Officer signature is currently here, but not sure it is correct -->
			<!--confirm that speed elements are no longer needed -->
			<lexslib:SameAsDigestReference>
				<xsl:attribute name="lexslib:ref"><xsl:value-of select="generate-id()"/></xsl:attribute>
			</lexslib:SameAsDigestReference>
		</inc-ext:Charge>
	</xsl:template>
	<xsl:template match="ChargeSequenceNumber">
		<j:ChargeIdentification>
			<nc:IdentificationID>
				<xsl:value-of select="."/>
			</nc:IdentificationID>
		</j:ChargeIdentification>
	</xsl:template>
	<xsl:template match="SubjectOffense" mode="DigestActivity">
		<lexsdigest:EntityActivity>
			<nc:Activity>
				<xsl:call-template name="AssignID"/>
				<nc:ActivityCategoryText>Offense</nc:ActivityCategoryText>
				<xsl:apply-templates select="ChargeDateRange"/>
				<xsl:apply-templates select="ChargeDate"/>
			</nc:Activity>
		</lexsdigest:EntityActivity>
	</xsl:template>
	<xsl:template match="VictimOffense" mode="DigestActivity">
		<lexsdigest:EntityActivity>
			<nc:Activity>
				<xsl:call-template name="AssignID"/>
				<nc:ActivityCategoryText>Offense</nc:ActivityCategoryText>
				<xsl:apply-templates select="ChargeDateRange"/>
				<xsl:apply-templates select="ChargeDate"/>
			</nc:Activity>
		</lexsdigest:EntityActivity>
	</xsl:template>
	<xsl:template match="Offense" mode="DigestActivity">
		<lexsdigest:EntityActivity>
			<nc:Activity>
				<xsl:call-template name="AssignID"/>
				<nc:ActivityCategoryText>Offense</nc:ActivityCategoryText>
				<xsl:apply-templates select="ChargeDateRange"/>
				<xsl:apply-templates select="ChargeDate"/>
			</nc:Activity>
		</lexsdigest:EntityActivity>
	</xsl:template>
	<xsl:template match="ChargeDate">
		<nc:ActivityDate>
			<nc:Date>
				<xsl:value-of select="."/>
			</nc:Date>
		</nc:ActivityDate>
	</xsl:template>
	<xsl:template match="ChargeDateRange">
		<nc:ActivityDateRange>
			<xsl:apply-templates select="StartDate"/>
			<xsl:apply-templates select="EndDate"/>
		</nc:ActivityDateRange>
	</xsl:template>
	<xsl:template match="StartDate">
		<nc:StartDate>
			<nc:Date>
				<xsl:value-of select="."/>
			</nc:Date>
		</nc:StartDate>
	</xsl:template>
	<xsl:template match="EndDate">
		<nc:EndDate>
			<nc:Date>
				<xsl:value-of select="."/>
			</nc:Date>
		</nc:EndDate>
	</xsl:template>
	<xsl:template match="ChargeTrackingNumber">
		<j:ChargeSequenceID>
			<nc:IdentificationID>
				<xsl:value-of select="."/>
			</nc:IdentificationID>
		</j:ChargeSequenceID>
	</xsl:template>
	<xsl:template match="OfficerSignature">
		<inc-ext:OfficerInCharge>
			<inc-ext:OfficerSignatureImage>
				<nc:BinaryBase64Object>
					<xsl:value-of select="."/>
				</nc:BinaryBase64Object>
			</inc-ext:OfficerSignatureImage>
			<lexslib:SameAsDigestReference>
				<xsl:attribute name="lexslib:ref"><xsl:value-of select="generate-id(..)"/></xsl:attribute>
			</lexslib:SameAsDigestReference>
		</inc-ext:OfficerInCharge>
	</xsl:template>
	<xsl:template match="AddressReference" mode="IncidentLocationAssociation">
		<xsl:variable name="address" select="@ref"/>
		<lexsdigest:IncidentLocationAssociation>
			<nc:ActivityReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(..)"/></xsl:attribute>
			</nc:ActivityReference>
			<nc:LocationReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(//Address[@id=$address])"/></xsl:attribute>
			</nc:LocationReference>
		</lexsdigest:IncidentLocationAssociation>
	</xsl:template>
	<xsl:template match="IncidentStatus" mode="NDExIncident">
		<ndexia:Incident>
			<ndexia:ActivityStatus>
				<ndexia:ActivityStatusAugmentation>
					<ndexia:IncidentStatusCode>
						<xsl:value-of select="."/>
					</ndexia:IncidentStatusCode>
				</ndexia:ActivityStatusAugmentation>
			</ndexia:ActivityStatus>
			<ndexia:IncidentAugmentation>
				<lexslib:SameAsDigestReference>
					<xsl:attribute name="lexslib:ref"><xsl:value-of select="generate-id(..)"/></xsl:attribute>
				</lexslib:SameAsDigestReference>
			</ndexia:IncidentAugmentation>
		</ndexia:Incident>
	</xsl:template>
	<xsl:template match="AgencyORI">
		<xsl:variable name="generatedID" select="generate-id(..)"/>
		<xsl:variable name="id" select="string-join(($generatedID, 'IssuingAgency'),'')"/>
		<ndexia:EnforcementUnit>
			<j:OrganizationAugmentation>
				<j:OrganizationORIIdentification>
					<nc:IdentificationID>
						<xsl:value-of select="."/>
					</nc:IdentificationID>
				</j:OrganizationORIIdentification>
			</j:OrganizationAugmentation>
			<ndexia:EnforcementUnitAugmentation>
				<lexslib:SameAsDigestReference>
					<xsl:attribute name="lexslib:ref"><xsl:value-of select="$id"/></xsl:attribute>
				</lexslib:SameAsDigestReference>
			</ndexia:EnforcementUnitAugmentation>
		</ndexia:EnforcementUnit>
	</xsl:template>
	<xsl:template match="IncidentCase">
		<inc-ext:IncidentCase>
			<xsl:apply-templates select="MaineCaseType"/>
			<xsl:apply-templates select="DispositionWaiver"/>
		</inc-ext:IncidentCase>
	</xsl:template>
	<xsl:template match="DispositionWaiver">
		<inc-ext:DispositionWaiver>
			<xsl:apply-templates select="PleaEnteredDate"/>
			<xsl:if test="FineAmount or FineAmountPaid or FineAmountPaidIndicator">
				<j:ChargeDispositionSanction>
					<j:SanctionSetObligation>
						<xsl:apply-templates select="FineAmount"/>
						<xsl:apply-templates select="FineAmountPaid"/>
						<xsl:apply-templates select="FineAmountPaidIndicator"/>
					</j:SanctionSetObligation>
				</j:ChargeDispositionSanction>
			</xsl:if>
		</inc-ext:DispositionWaiver>
	</xsl:template>
	<xsl:template match="FineAmount">
		<nc:ObligationTotalAmount>
			<xsl:value-of select="."/>
		</nc:ObligationTotalAmount>
	</xsl:template>
	<xsl:template match="FineAmountPaid">
		<nc:ObligationPaidAmount>
			<xsl:value-of select="."/>
		</nc:ObligationPaidAmount>
	</xsl:template>
	<xsl:template match="FineAmountPaidIndicator">
		<nc:ObligationCompleteIndicator>
			<xsl:value-of select="."/>
		</nc:ObligationCompleteIndicator>
	</xsl:template>
	<xsl:template match="PleaEnteredDate">
		<nc:DispositionDate>
			<nc:Date>
				<xsl:value-of select="."/>
			</nc:Date>
		</nc:DispositionDate>
	</xsl:template>
	<xsl:template match="MaineCaseType">
		<nc:ActivityCategoryText>
			<xsl:value-of select="."/>
		</nc:ActivityCategoryText>
	</xsl:template>
	<xsl:template match="Vehicle">
		<lexsdigest:EntityVehicle>
			<nc:Vehicle>
				<xsl:call-template name="AssignID"/>
				<xsl:apply-templates select="VehicleTypeDescription"/>
				<xsl:apply-templates select="ColorText"/>
				<xsl:apply-templates select="ColorCode"/>
				<xsl:apply-templates select="MakeText"/>
				<xsl:apply-templates select="ModelText"/>
				<xsl:apply-templates select="Year" mode="Vehicle"/>
				<xsl:apply-templates select="BodyStyle"/>
				<xsl:if test="PlateType or VehicleRegistrationNumber or RegistrationState">
					<nc:ConveyanceRegistrationPlateIdentification>
						<xsl:apply-templates select="VehicleRegistrationNumber"/>
						<xsl:apply-templates select="PlateType"/>
						<xsl:apply-templates select="RegistrationState"/>
					</nc:ConveyanceRegistrationPlateIdentification>
				</xsl:if>
				<xsl:apply-templates select="VIN"/>
				<xsl:apply-templates select="MakeCode"/>
				<xsl:apply-templates select="ModelCode"/>
			</nc:Vehicle>
		</lexsdigest:EntityVehicle>
	</xsl:template>
	<xsl:template match="MakeCode">
		<nc:VehicleMakeCode>
			<xsl:value-of select="."/>
		</nc:VehicleMakeCode>
	</xsl:template>
	<xsl:template match="ModelCode">
		<nc:VehicleModelCode>
			<xsl:value-of select="."/>
		</nc:VehicleModelCode>
	</xsl:template>
	<xsl:template match="VIN">
		<nc:VehicleIdentification>
			<nc:IdentificationID>
				<xsl:value-of select="."/>
			</nc:IdentificationID>
		</nc:VehicleIdentification>
	</xsl:template>
	<xsl:template match="RegistrationState">
		<j:IdentificationJurisdictionNCICLISCode>
			<xsl:value-of select="."/>
		</j:IdentificationJurisdictionNCICLISCode>
	</xsl:template>
	<xsl:template match="PlateType">
		<nc:IdentificationCategoryText>
			<xsl:value-of select="."/>
		</nc:IdentificationCategoryText>
	</xsl:template>
	<xsl:template match="VehicleRegistrationNumber">
		<nc:IdentificationID>
			<xsl:value-of select="."/>
		</nc:IdentificationID>
	</xsl:template>
	<xsl:template match="BodyStyle">
		<nc:VehicleStyleCode>
			<xsl:value-of select="."/>
		</nc:VehicleStyleCode>
	</xsl:template>
	<xsl:template match="Year" mode="Vehicle">
		<xsl:if test="string-length(.) = 4">
			<nc:ItemModelYearDate>
				<xsl:value-of select="."/>
			</nc:ItemModelYearDate>
		</xsl:if>			
	</xsl:template>
	<xsl:template match="ModelText">
		<nc:ItemModelName>
			<xsl:value-of select="."/>
		</nc:ItemModelName>
	</xsl:template>
	<xsl:template match="MakeText">
		<nc:ItemMakeName>
			<xsl:value-of select="."/>
		</nc:ItemMakeName>
	</xsl:template>
	<xsl:template match="ColorText">
		<nc:ItemColorDescriptionText>
			<xsl:value-of select="."/>
		</nc:ItemColorDescriptionText>
	</xsl:template>
	<xsl:template match="ColorCode">
		<nc:VehicleColorPrimaryCode>
			<xsl:value-of select="."/>
		</nc:VehicleColorPrimaryCode>
	</xsl:template>
	<xsl:template match="VehicleTypeDescription">
		<nc:ItemCategoryText>
			<xsl:value-of select="."/>
		</nc:ItemCategoryText>
	</xsl:template>
	<xsl:template match="Subject" mode="MaineIncidentSubject">
		<inc-ext:IncidentSubject>
			<xsl:apply-templates select="RoleOfPersonReference" mode="MaineSubject"/>
			<xsl:apply-templates select="BloodAlcoholContent"/>
			<xsl:apply-templates select="PersonOfInterestIndicator"/>
			<xsl:apply-templates select="CustodyStatus"/>
			<xsl:apply-templates select="ViolationProbationIndicator"/>
			<xsl:apply-templates select="ArrestWarrantIndicator"/>
			<xsl:apply-templates select="CitationNumber"/>
		</inc-ext:IncidentSubject>
	</xsl:template>
	<xsl:template match="CitationNumber">
		<j:Citation>
			<nc:ActivityIdentification>
				<nc:IdentificationID>
					<xsl:value-of select="."/>
				</nc:IdentificationID>
			</nc:ActivityIdentification>
		</j:Citation>
	</xsl:template>
	<xsl:template match="ArrestWarrantIndicator">
		<inc-ext:SubjectActiveArrestWarrantIndicator>
			<xsl:value-of select="."/>
		</inc-ext:SubjectActiveArrestWarrantIndicator>
	</xsl:template>
	<xsl:template match="ViolationProbationIndicator">
		<inc-ext:SubjectViolatedProbationIndicator>
			<xsl:value-of select="."/>
		</inc-ext:SubjectViolatedProbationIndicator>
	</xsl:template>
	<xsl:template match="CustodyStatus">
		<inc-ext:SubjectStatusDescriptionText>
			<xsl:value-of select="."/>
		</inc-ext:SubjectStatusDescriptionText>
	</xsl:template>
	<xsl:template match="PersonOfInterestIndicator">
		<inc-ext:SubjectIsOfInterestIndicator>
			<xsl:value-of select="."/>
		</inc-ext:SubjectIsOfInterestIndicator>
	</xsl:template>
	<xsl:template match="BloodAlcoholContent">
		<inc-ext:SubjectBloodAlcoholContentNumber>
			<xsl:value-of select="."/>
		</inc-ext:SubjectBloodAlcoholContentNumber>
	</xsl:template>
	<xsl:template match="RoleOfPersonReference" mode="MaineSubject">
		<xsl:variable name="person" select="@ref"/>
		<lexslib:SameAsDigestReference>
			<xsl:attribute name="lexslib:ref"><xsl:value-of select="generate-id(//Person[@id=$person])"/></xsl:attribute>
		</lexslib:SameAsDigestReference>
	</xsl:template>
	<xsl:template name="PDMessageMetadata">
		<lexs:PDMessageMetadata>
			<xsl:copy-of select="$document/MaineNDExConfiguration/lexs:PDMessageMetadata/lexs:LEXSVersion"/>
			<lexs:MessageDateTime>
				<!-- this is necessary to support unit testing -->
				<xsl:if test="$document != ''">
					<xsl:value-of select="current-dateTime()"/>
				</xsl:if>
			</lexs:MessageDateTime>
			<xsl:copy-of select="$document/MaineNDExConfiguration/lexs:PDMessageMetadata/lexs:MessageSequenceNumber"/>
			<xsl:copy-of select="$document/MaineNDExConfiguration/lexs:PDMessageMetadata/lexs:DataSensitivity"/>
		</lexs:PDMessageMetadata>
	</xsl:template>
	<xsl:template match="AddressFromLicenseReference">
		<xsl:variable name="licenseAddress" select="@ref"/>
		<inc-ext:DriverLicenseLocationAssociation>
			<nc:LocationReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(//Address[@id=$licenseAddress])"/></xsl:attribute>
			</nc:LocationReference>
			<nc:DriverLicenseReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(..)"/></xsl:attribute>
			</nc:DriverLicenseReference>
		</inc-ext:DriverLicenseLocationAssociation>
	</xsl:template>
	<xsl:template match="GeoCode">
		<inc-ext:Location>
			<nc:LocationMapLocation>
				<nc:MapCoordinateFullText>
					<xsl:value-of select="."/>
				</nc:MapCoordinateFullText>
			</nc:LocationMapLocation>
			<lexslib:SameAsDigestReference>
				<xsl:attribute name="lexslib:ref"><xsl:value-of select="generate-id(..)"/></xsl:attribute>
			</lexslib:SameAsDigestReference>
		</inc-ext:Location>
	</xsl:template>
	<xsl:template match="LocationCommonName">
		<ndexia:Location>
			<nc:LocationName>
				<xsl:value-of select="."/>
			</nc:LocationName>
			<ndexia:LocationAugmentation>
				<lexslib:SameAsDigestReference>
					<xsl:attribute name="lexslib:ref"><xsl:value-of select="generate-id(..)"/></xsl:attribute>
				</lexslib:SameAsDigestReference>
			</ndexia:LocationAugmentation>
		</ndexia:Location>
	</xsl:template>
	<xsl:template match="IssuingOfficer" mode="AssignedUnit">
		<xsl:variable name="generatedID" select="generate-id(.)"/>
		<xsl:variable name="id" select="string-join(($generatedID, 'IssuingAgency'),'')"/>
		<nc:PersonAssignedUnitAssociation>
			<nc:PersonReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
			</nc:PersonReference>
			<nc:OrganizationReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="$id"/></xsl:attribute>
			</nc:OrganizationReference>
		</nc:PersonAssignedUnitAssociation>
	</xsl:template>
	<xsl:template match="IssuingOfficer" mode="IssuingAgency">
		<xsl:variable name="generatedID" select="generate-id(.)"/>
		<xsl:variable name="id" select="string-join(($generatedID, 'IssuingAgency'),'')"/>
		<xsl:variable name="alternateIssuingAgency" select="AgencyName"/>
		<lexsdigest:EntityOrganization>
			<nc:Organization>
				<xsl:attribute name="s:id"><xsl:value-of select="$id"/></xsl:attribute>
				<xsl:choose>
					<xsl:when test="normalize-space($agencyCategory) != ''">
						<nc:OrganizationCategoryText>
							<xsl:value-of select="$agencyCategory"/>
						</nc:OrganizationCategoryText>
					</xsl:when>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="normalize-space($issuingAgency) != ''">
						<nc:OrganizationName><xsl:value-of select="$issuingAgency"/></nc:OrganizationName>
					</xsl:when>
					<xsl:when test="normalize-space($alternateIssuingAgency) != ''">
						<nc:OrganizationName><xsl:value-of select="$alternateIssuingAgency"/></nc:OrganizationName>
					</xsl:when>
				</xsl:choose>
			</nc:Organization>
		</lexsdigest:EntityOrganization>
	</xsl:template>
	<xsl:template match="IssuingOfficer" mode="DigestPerson">
		<xsl:variable name="generatedID" select="generate-id(.)"/>
		<xsl:variable name="id" select="string-join(($generatedID, 'IssuingOfficer'),'')"/>
		<lexsdigest:EntityPerson>
			<lexsdigest:Person>
				<xsl:call-template name="AssignID"/>
				<xsl:apply-templates select="OfficerName"/>
			</lexsdigest:Person>
			<j:EnforcementOfficial>
				<xsl:attribute name="s:id"><xsl:value-of select="$id"/></xsl:attribute>
				<nc:RoleOfPersonReference>
					<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				</nc:RoleOfPersonReference>
				<xsl:apply-templates select="OfficerIdentificationNumber"/>
				<xsl:apply-templates select="OfficerTroop"/>
			</j:EnforcementOfficial>
		</lexsdigest:EntityPerson>
	</xsl:template>
	<xsl:template match="OfficerTroop">
		<j:EnforcementOfficialUnit>
			<j:EnforcementUnitBeatIdentification>
				<nc:IdentificationID>
					<xsl:value-of select="."/>
				</nc:IdentificationID>
			</j:EnforcementUnitBeatIdentification>
		</j:EnforcementOfficialUnit>
	</xsl:template>
	<xsl:template match="OfficerIdentificationNumber">
		<j:EnforcementOfficialBadgeIdentification>
			<nc:IdentificationID>
				<xsl:value-of select="."/>
			</nc:IdentificationID>
		</j:EnforcementOfficialBadgeIdentification>
	</xsl:template>
	<xsl:template match="OfficerName">
		<nc:PersonName>
			<nc:PersonFullName>
				<xsl:value-of select="."/>
			</nc:PersonFullName>
		</nc:PersonName>
	</xsl:template>
	<xsl:template match="AddressReference" mode="PersonAddress">
		<xsl:variable name="addressID" select="@ref"/>
		<nc:ResidenceAssociation>
			<nc:PersonReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(../..)"/></xsl:attribute>
			</nc:PersonReference>
			<nc:LocationReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(//Address[@id=$addressID])"/></xsl:attribute>
			</nc:LocationReference>
		</nc:ResidenceAssociation>
	</xsl:template>
	<xsl:template match="Address" mode="EntityLocation">
		<lexsdigest:EntityLocation>
			<nc:Location>
				<xsl:call-template name="AssignID"/>
				<nc:LocationAddress>
					<xsl:choose>
						<xsl:when test="FullAddress">
							<xsl:apply-templates select="FullAddress"/>
						</xsl:when>
						<xsl:when test="Street or City or State or ZipCode">
							<nc:StructuredAddress>
								<xsl:apply-templates select="Street"/>
								<xsl:apply-templates select="City"/>
								<xsl:apply-templates select="State"/>
								<xsl:apply-templates select="ZipCode"/>
							</nc:StructuredAddress>
						</xsl:when>
					</xsl:choose>
				</nc:LocationAddress>
				<xsl:if test="Latitude or Longitude">
					<nc:LocationTwoDimensionalGeographicCoordinate>
						<xsl:apply-templates select="Latitude"/>
						<xsl:apply-templates select="Longitude"/>
					</nc:LocationTwoDimensionalGeographicCoordinate>
				</xsl:if>
			</nc:Location>
		</lexsdigest:EntityLocation>
	</xsl:template>
	<xsl:template match="Latitude">
		<nc:GeographicCoordinateLatitude>
			<xsl:apply-templates select="Degree" mode="Latitude"/>
			<xsl:apply-templates select="Minute" mode="Latitude"/>
			<xsl:apply-templates select="Second" mode="Latitude"/>
		</nc:GeographicCoordinateLatitude>
	</xsl:template>
	<xsl:template match="Longitude">
		<nc:GeographicCoordinateLongitude>
			<xsl:apply-templates select="Degree" mode="Longitude"/>
			<xsl:apply-templates select="Minute" mode="Longitude"/>
			<xsl:apply-templates select="Second" mode="Longitude"/>
		</nc:GeographicCoordinateLongitude>
	</xsl:template>
	<xsl:template match="Degree" mode="Latitude">
		<nc:LatitudeDegreeValue>
			<xsl:value-of select="."/>
		</nc:LatitudeDegreeValue>
	</xsl:template>
	<xsl:template match="Minute" mode="Latitude">
		<nc:LatitudeMinuteValue>
			<xsl:value-of select="."/>
		</nc:LatitudeMinuteValue>
	</xsl:template>
	<xsl:template match="Second" mode="Latitude">
		<nc:LatitudeSecondValue>
			<xsl:value-of select="."/>
		</nc:LatitudeSecondValue>
	</xsl:template>
	<xsl:template match="Degree" mode="Longitude">
		<nc:LongitudeDegreeValue>
			<xsl:value-of select="."/>
		</nc:LongitudeDegreeValue>
	</xsl:template>
	<xsl:template match="Minute" mode="Longitude">
		<nc:LongitudeMinuteValue>
			<xsl:value-of select="."/>
		</nc:LongitudeMinuteValue>
	</xsl:template>
	<xsl:template match="Second" mode="Longitude">
		<nc:LongitudeSecondValue>
			<xsl:value-of select="."/>
		</nc:LongitudeSecondValue>
	</xsl:template>
	<xsl:template match="Street">
		<nc:LocationStreet>
			<nc:StreetFullText>
				<xsl:value-of select="."/>
			</nc:StreetFullText>
		</nc:LocationStreet>
	</xsl:template>
	<xsl:template match="City">
		<nc:LocationCityName>
			<xsl:value-of select="."/>
		</nc:LocationCityName>
	</xsl:template>
	<xsl:template match="State">
		<nc:LocationStateName>
			<xsl:value-of select="."/>
		</nc:LocationStateName>
	</xsl:template>
	<xsl:template match="ZipCode">
		<nc:LocationPostalCode>
			<xsl:value-of select="."/>
		</nc:LocationPostalCode>
	</xsl:template>
	<xsl:template match="FullAddress">
		<nc:AddressFullText>
			<xsl:value-of select="."/>
		</nc:AddressFullText>
	</xsl:template>
	<xsl:template match="ContactInformation" mode="PersonContactAssociation">
		<xsl:choose>
			<xsl:when test="PhoneNumber or EmailAddress">
				<lexsdigest:PersonContactAssociation>
					<nc:PersonReference>
						<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(..)"/></xsl:attribute>
					</nc:PersonReference>
					<xsl:apply-templates select="EmailAddress" mode="PersonAssociation"/>
					<xsl:apply-templates select="PhoneNumber" mode="PersonAssociation"/>
				</lexsdigest:PersonContactAssociation>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="PhoneNumber" mode="PersonAssociation">
		<lexsdigest:ContactPersonTelephoneNumberReference>
			<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
		</lexsdigest:ContactPersonTelephoneNumberReference>
	</xsl:template>
	<xsl:template match="EmailAddress" mode="PersonAssociation">
		<lexsdigest:ContactPersonEmailIDReference>
			<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
		</lexsdigest:ContactPersonEmailIDReference>
	</xsl:template>
	<xsl:template match="PhoneNumber" mode="EntityOrganizationAssociation">
		<lexsdigest:EntityTelephoneNumberAssociation>
			<nc:OrganizationReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(../..)"/></xsl:attribute>
			</nc:OrganizationReference>
			<lexsdigest:TelephoneNumberReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
			</lexsdigest:TelephoneNumberReference>
		</lexsdigest:EntityTelephoneNumberAssociation>
	</xsl:template>
	<xsl:template match="PhoneNumber" mode="EntityPersonAssociation">
		<lexsdigest:EntityTelephoneNumberAssociation>
			<nc:PersonReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(../..)"/></xsl:attribute>
			</nc:PersonReference>
			<lexsdigest:TelephoneNumberReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
			</lexsdigest:TelephoneNumberReference>
			<xsl:apply-templates select="following-sibling::PhoneNumberType[1]"/>
		</lexsdigest:EntityTelephoneNumberAssociation>
	</xsl:template>
	<xsl:template match="PhoneNumber" mode="EntityTelephoneNumber">
		<lexsdigest:EntityTelephoneNumber>
			<lexsdigest:TelephoneNumber>
				<xsl:call-template name="AssignID"/>
				<nc:FullTelephoneNumber>
					<nc:TelephoneNumberFullID>
						<xsl:value-of select="."/>
					</nc:TelephoneNumberFullID>
				</nc:FullTelephoneNumber>
			</lexsdigest:TelephoneNumber>
		</lexsdigest:EntityTelephoneNumber>
	</xsl:template>
	<xsl:template match="PhoneNumberType">
		<xsl:choose>
			<xsl:when test=".='Home'">
				<lexsdigest:TelephoneNumberHomeIndicator>true</lexsdigest:TelephoneNumberHomeIndicator>
			</xsl:when>
			<xsl:when test=".='Business'">
				<lexsdigest:TelephoneNumberWorkIndicator>true</lexsdigest:TelephoneNumberWorkIndicator>
			</xsl:when>
			<xsl:otherwise>
				<lexsdigest:TelephoneNumberUnspecifiedIndicator>true</lexsdigest:TelephoneNumberUnspecifiedIndicator>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="EmailAddress" mode="EntityEmail">
		<lexsdigest:EntityEmail>
			<nc:ContactEmailID>
				<xsl:call-template name="AssignID"/>
				<xsl:value-of select="."/>
			</nc:ContactEmailID>
		</lexsdigest:EntityEmail>
	</xsl:template>
	<xsl:template match="EmailAddress" mode="EntityOrganizationAssociation">
		<lexsdigest:EntityEmailAssociation>
			<nc:OrganizationReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(../..)"/></xsl:attribute>
			</nc:OrganizationReference>
			<lexsdigest:EmailIDReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
			</lexsdigest:EmailIDReference>
		</lexsdigest:EntityEmailAssociation>
	</xsl:template>
	<xsl:template match="EmailAddress" mode="EntityPersonAssociation">
		<lexsdigest:EntityEmailAssociation>
			<nc:PersonReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(../..)"/></xsl:attribute>
			</nc:PersonReference>
			<lexsdigest:EmailIDReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
			</lexsdigest:EmailIDReference>
		</lexsdigest:EntityEmailAssociation>
	</xsl:template>
	<xsl:template match="OrganizationName">
		<nc:OrganizationName>
			<xsl:value-of select="."/>
		</nc:OrganizationName>
	</xsl:template>
	<xsl:template match="Organization" mode="DigestOrganization">
		<xsl:variable name="name" select="OrganizationName"/>
		<xsl:variable name="lcName" select="lower-case($name)"/>
		<xsl:variable name="id" select="@id"/>
		<lexsdigest:EntityOrganization>
			<nc:Organization>
				<xsl:call-template name="AssignID"/>
				<xsl:choose>
					<xsl:when test="$lcName = 'state of maine'">
						<nc:OrganizationCategoryText>Society</nc:OrganizationCategoryText>
					</xsl:when>
					<xsl:otherwise>
						<nc:OrganizationCategoryText><xsl:value-of select="$name"/></nc:OrganizationCategoryText>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:apply-templates select="OrganizationName"/>
			</nc:Organization>
			<xsl:apply-templates select="//Victim[RoleOfOrganizationReference/@ref=$id]" mode="VictimOrganization"/>
		</lexsdigest:EntityOrganization>
	</xsl:template>
	<xsl:template match="Person" mode="NDExPerson">
		<xsl:choose>
			<xsl:when test="Prefix or Suffix or Race">
				<ndexia:Person>
					<xsl:apply-templates select="PersonName" mode="NDExPersonName"/>
					<ndexia:PersonAugmentation>
						<lexslib:SameAsDigestReference>
							<xsl:attribute name="lexslib:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						</lexslib:SameAsDigestReference>
						<xsl:apply-templates select="Race"/>
					</ndexia:PersonAugmentation>
				</ndexia:Person>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="Race">
		<ndexia:PersonRaceCode>
			<xsl:choose>
				<xsl:when test=". = 'UNK' or . = 'Unknown'">
					<xsl:text>U</xsl:text>
				</xsl:when>
				<xsl:when test=". = 'Black'">
					<xsl:text>B</xsl:text>
				</xsl:when>
				<xsl:when test=". = 'Asian or Pacific Islander'">
					<xsl:text>A</xsl:text>
				</xsl:when>
				<xsl:when test=". = 'American Indian/Alaskan Native'">
					<xsl:text>I</xsl:text>
				</xsl:when>				
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</ndexia:PersonRaceCode>
	</xsl:template>
	<xsl:template match="PersonName" mode="NDExPersonName">
		<xsl:choose>
			<xsl:when test="Prefix or Suffix">
				<nc:PersonName>
					<xsl:apply-templates select="Prefix"/>
					<xsl:apply-templates select="Suffix"/>
				</nc:PersonName>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="Person" mode="DigestPerson">
		<xsl:variable name="id" select="@id"/>
		<lexsdigest:EntityPerson>
			<lexsdigest:Person>
				<xsl:call-template name="AssignID"/>
				<xsl:apply-templates select="Age"/>
				<xsl:apply-templates select="BirthDate"/>
				<xsl:apply-templates select="EyeColorText"/>
				<xsl:apply-templates select="EyeColorCode"/>
				<xsl:apply-templates select="HairColorText"/>
				<xsl:apply-templates select="HairColorCode"/>
				<xsl:apply-templates select="HeightMeasureInches"/>
				<xsl:apply-templates select="PersonName" mode="DigestPersonName"/>
				<xsl:apply-templates select="SexCode"/>
				<xsl:apply-templates select="SexText"/>
				<xsl:apply-templates select="SocialSecurityNumber"/>
				<xsl:apply-templates select="WeightMeasurePounds"/>
				<xsl:choose>
					<xsl:when test="OperatorLicense[LicenseNumber != '' and IssuingState !=''] or FBINumber or StateID">
						<j:PersonAugmentation>
							<xsl:apply-templates select="OperatorLicense" mode="DriverLicense"/>
							<xsl:apply-templates select="FBINumber"/>
							<xsl:apply-templates select="StateID"/>
						</j:PersonAugmentation>
					</xsl:when>
				</xsl:choose>
			</lexsdigest:Person>
			<xsl:apply-templates select="//Subject[RoleOfPersonReference/@ref=$id]" mode="Subject"/>
			<xsl:apply-templates select="//Victim[RoleOfPersonReference/@ref=$id]" mode="Victim"/>
			<xsl:apply-templates select="//Witness[RoleOfPersonReference/@ref=$id]" mode="Witness"/>
		</lexsdigest:EntityPerson>
	</xsl:template>
	<xsl:template match="Subject" mode="Subject">
		<xsl:variable name="person" select="RoleOfPersonReference/@ref"/>
		<xsl:if test="Arrest/*">
			<j:ArrestSubject>
				<xsl:attribute name="s:id"><xsl:text>AS</xsl:text><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<nc:RoleOfPersonReference>
					<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(//Person[@id=$person])"/></xsl:attribute>
				</nc:RoleOfPersonReference>
			</j:ArrestSubject>
		</xsl:if>
		<j:IncidentSubject>
			<xsl:attribute name="s:id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
			<nc:RoleOfPersonReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(//Person[@id=$person])"/></xsl:attribute>
			</nc:RoleOfPersonReference>
		</j:IncidentSubject>
	</xsl:template>
	<xsl:template match="Victim" mode="Victim">
		<xsl:variable name="person" select="RoleOfPersonReference/@ref"/>
		<j:Victim>
			<xsl:attribute name="s:id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
			<nc:RoleOfPersonReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(//Person[@id=$person])"/></xsl:attribute>
			</nc:RoleOfPersonReference>
		</j:Victim>
	</xsl:template>
	<!-- Inster VictimOrg here -->
	<xsl:template match="Victim" mode="VictimOrganization">
		<xsl:variable name="organization" select="RoleOfOrganizationReference/@ref"/>
		<j:Victim>
			<xsl:attribute name="s:id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
			<nc:RoleOfOrganizationReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(//Organization[@id=$organization])"/></xsl:attribute>
			</nc:RoleOfOrganizationReference>
		</j:Victim>
	</xsl:template>
	<xsl:template match="Witness" mode="Witness">
		<xsl:variable name="person" select="RoleOfPersonReference/@ref"/>
		<j:Witness>
			<xsl:attribute name="s:id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
			<nc:RoleOfPersonReference>
				<xsl:attribute name="s:ref"><xsl:value-of select="generate-id(//Person[@id=$person])"/></xsl:attribute>
			</nc:RoleOfPersonReference>
			<xsl:apply-templates select="WitnessNarrative"/>
		</j:Witness>
	</xsl:template>
	<xsl:template match="WitnessNarrative">
		<j:WitnessAccountDescriptionText>
			<xsl:value-of select="."/>
		</j:WitnessAccountDescriptionText>
	</xsl:template>
	<xsl:template match="FBINumber">
		<j:PersonFBIIdentification>
			<nc:IdentificationID>
				<xsl:value-of select="."/>
			</nc:IdentificationID>
		</j:PersonFBIIdentification>
	</xsl:template>
	<xsl:template match="StateID">
		<j:PersonStateFingerprintIdentification>
			<nc:IdentificationID>
				<xsl:value-of select="."/>
			</nc:IdentificationID>
			<j:IdentificationJurisdictionNCICRESCode>
				<xsl:value-of select="$stateCode"/>
			</j:IdentificationJurisdictionNCICRESCode>
		</j:PersonStateFingerprintIdentification>
	</xsl:template>
	<xsl:template match="OperatorLicense[LicenseNumber != '' and IssuingState !='']" mode="DriverLicense">
		<xsl:variable name="is" select="IssuingState"/>
		<nc:DriverLicense>
			<xsl:call-template name="AssignID"/>
			<nc:DriverLicenseIdentification>
				<xsl:apply-templates select="LicenseNumber"/>
				<xsl:if test="index-of($driversLicenseState, $is)">
					<xsl:apply-templates select="IssuingState"/>
				</xsl:if>
			</nc:DriverLicenseIdentification>
		</nc:DriverLicense>
	</xsl:template>
	<xsl:template match="LicenseNumber">
		<nc:IdentificationID>
			<xsl:value-of select="."/>
		</nc:IdentificationID>
	</xsl:template>
	<xsl:template match="IssuingState">
		<j:IdentificationJurisdictionNCICLISCode>
			<xsl:value-of select="."/>
		</j:IdentificationJurisdictionNCICLISCode>
	</xsl:template>
	<xsl:template match="SocialSecurityNumber">
		<nc:PersonSSNIdentification>
			<nc:IdentificationID>
				<xsl:value-of select="."/>
			</nc:IdentificationID>
		</nc:PersonSSNIdentification>
	</xsl:template>
	<xsl:template match="SexCode">
		<nc:PersonSexCode>
			<xsl:value-of select="."/>
		</nc:PersonSexCode>
	</xsl:template>
	<xsl:template match="SexText">
		<xsl:choose>
			<xsl:when test=".='Male' or .='male' or .='m' or .='M'">
				<nc:PersonSexCode>M</nc:PersonSexCode>
			</xsl:when>
			<xsl:when test=".='Female' or .='female' or .='f' or .='F'">
				<nc:PersonSexCode>F</nc:PersonSexCode>
			</xsl:when>
			<xsl:otherwise>
				<nc:PersonSexCode>U</nc:PersonSexCode>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="PersonName" mode="DigestPersonName">
		<nc:PersonName>
			<xsl:apply-templates select="FirstName"/>
			<xsl:apply-templates select="MiddleName"/>
			<xsl:apply-templates select="LastName"/>
			<xsl:apply-templates select="FullName"/>
		</nc:PersonName>
	</xsl:template>
	<xsl:template match="Prefix">
		<nc:PersonNamePrefixText>
			<xsl:value-of select="."/>
		</nc:PersonNamePrefixText>
	</xsl:template>
	<xsl:template match="Suffix">
		<nc:PersonNameSuffixText>
			<xsl:value-of select="."/>
		</nc:PersonNameSuffixText>
	</xsl:template>
	<xsl:template match="FirstName">
		<nc:PersonGivenName>
			<xsl:value-of select="."/>
		</nc:PersonGivenName>
	</xsl:template>
	<xsl:template match="MiddleName">
		<nc:PersonMiddleName>
			<xsl:value-of select="."/>
		</nc:PersonMiddleName>
	</xsl:template>
	<xsl:template match="LastName">
		<nc:PersonSurName>
			<xsl:value-of select="."/>
		</nc:PersonSurName>
	</xsl:template>
	<xsl:template match="FullName">
		<nc:PersonFullName>
			<xsl:value-of select="."/>
		</nc:PersonFullName>
	</xsl:template>
	<xsl:template match="WeightMeasurePounds">
		<xsl:if test=". > 0">
			<nc:PersonWeightMeasure>
				<nc:MeasurePointValue>
					<xsl:value-of select="."/>
				</nc:MeasurePointValue>
				<nc:WeightUnitCode>
					<xsl:value-of select="$weightUnit"/>
				</nc:WeightUnitCode>
			</nc:PersonWeightMeasure>
		</xsl:if>	
	</xsl:template>
	<xsl:template match="HeightMeasureInches">
		<xsl:if test=". > 0">
			<nc:PersonHeightMeasure>
				<nc:MeasurePointValue>
					<xsl:value-of select="."/>
				</nc:MeasurePointValue>
				<nc:LengthUnitCode>
					<xsl:value-of select="$heightUnit"/>
				</nc:LengthUnitCode>
			</nc:PersonHeightMeasure>
		</xsl:if>
	</xsl:template>
	<xsl:template match="EyeColorText">
		<xsl:choose>
			<xsl:when test=". = 'Brown'">
				<nc:PersonEyeColorCode>BRO</nc:PersonEyeColorCode>
			</xsl:when>
			<xsl:when test=". = 'Black'">
				<nc:PersonEyeColorCode>BLK</nc:PersonEyeColorCode>
			</xsl:when>
			<xsl:when test=". = 'Blue'">
				<nc:PersonEyeColorCode>BLU</nc:PersonEyeColorCode>
			</xsl:when>
			<xsl:when test=". = 'Green'">
				<nc:PersonEyeColorCode>GRN</nc:PersonEyeColorCode>
			</xsl:when>			
			<xsl:when test=". = 'Hazel'">
				<nc:PersonEyeColorCode>HAZ</nc:PersonEyeColorCode>
			</xsl:when>
			<xsl:when test=". = '* EYE COLOR *'">
				<nc:PersonEyeColorCode>XXX</nc:PersonEyeColorCode>
			</xsl:when>
			<xsl:otherwise>
				<nc:PersonEyeColorText>
					<xsl:value-of select="."/>
				</nc:PersonEyeColorText>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="EyeColorCode">
		<nc:PersonEyeColorCode>
			<xsl:value-of select="."/>
		</nc:PersonEyeColorCode>
	</xsl:template>
	<xsl:template match="HairColorText">
		<xsl:choose>
			<xsl:when test=". = 'Brown'">
				<nc:PersonHairColorCode>BRO</nc:PersonHairColorCode>
			</xsl:when>
			<xsl:when test=". = 'Black'">
				<nc:PersonHairColorCode>BLK</nc:PersonHairColorCode>
			</xsl:when>
			<xsl:when test=". = 'Blond'">
				<nc:PersonHairColorCode>BLN</nc:PersonHairColorCode>
			</xsl:when>
			<xsl:when test=". = '* HAIR COLOR *'">
				<nc:PersonHairColorCode>XXX</nc:PersonHairColorCode>
			</xsl:when>
			<xsl:when test=". = 'Red/Auburn'">
				<nc:PersonHairColorCode>RED</nc:PersonHairColorCode>
			</xsl:when>
			<xsl:when test=". = 'Gray/Partially Gray'">
				<nc:PersonHairColorCode>GRY</nc:PersonHairColorCode>
			</xsl:when>
			<xsl:otherwise>
				<nc:PersonHairColorText>
					<xsl:value-of select="."/>
				</nc:PersonHairColorText>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="HairColorCode">
		<nc:PersonHairColorCode>
			<xsl:value-of select="."/>
		</nc:PersonHairColorCode>
	</xsl:template>
	<xsl:template match="Age">
		<nc:PersonAgeMeasure>
			<nc:MeasurePointValue>
				<xsl:value-of select="."/>
			</nc:MeasurePointValue>
			<nc:TimeUnitCode>
				<xsl:value-of select="$timeUnit"/>
			</nc:TimeUnitCode>
		</nc:PersonAgeMeasure>
	</xsl:template>
	<xsl:template match="BirthDate">
		<nc:PersonBirthDate>
			<nc:Date>
				<xsl:value-of select="."/>
			</nc:Date>
		</nc:PersonBirthDate>
	</xsl:template>
	<xsl:template match="Incident" mode="DigestActivity">
		<lexsdigest:EntityActivity>
			<nc:Activity>
				<xsl:call-template name="AssignID"/>
				<xsl:apply-templates select="LEACaseNumber"/>
				<nc:ActivityCategoryText>
					<xsl:value-of select="$incidentCategory"/>
				</nc:ActivityCategoryText>
				<xsl:apply-templates select="IncidentDateTime"/>
				<xsl:apply-templates select="IncidentDateRange"/>
				<xsl:apply-templates select="IncidentNarrative"/>
			</nc:Activity>
		</lexsdigest:EntityActivity>
	</xsl:template>
	<xsl:template match="IncidentNarrative">
		<nc:ActivityDescriptionText>
			<xsl:value-of select="."/>
		</nc:ActivityDescriptionText>
	</xsl:template>
	<xsl:template match="LEACaseNumber">
		<nc:ActivityIdentification>
			<nc:IdentificationID>
				<xsl:value-of select="."/>
			</nc:IdentificationID>
		</nc:ActivityIdentification>
	</xsl:template>
	<xsl:template match="IncidentDateRange">
		<nc:ActivityDateRange>
			<nc:StartDate>
				<nc:Date>
					<xsl:value-of select="StartDate"/>
				</nc:Date>
			</nc:StartDate>
			<nc:EndDate>
				<nc:Date>
					<xsl:value-of select="EndDate"/>
				</nc:Date>
			</nc:EndDate>
		</nc:ActivityDateRange>
	</xsl:template>
	<xsl:template match="IncidentDateTime">
		<nc:ActivityDate>
			<nc:DateTime>
				<xsl:value-of select="."/>
			</nc:DateTime>
		</nc:ActivityDate>
	</xsl:template>
	<xsl:template match="Arrest" mode="NDExArrest">
		<ndexia:Arrest>
			<ndexia:ArrestAugmentation>
				<lexslib:SameAsDigestReference>
					<xsl:attribute name="lexslib:ref"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				</lexslib:SameAsDigestReference>
				<xsl:apply-templates select="ArrestTrackingNumber" mode="ATN"/>
			</ndexia:ArrestAugmentation>
		</ndexia:Arrest>
	</xsl:template>
	<xsl:template match="ArrestTrackingNumber" mode="ATN">
		<ndexia:ArrestCaseNumberText>
			<xsl:value-of select="."/>
		</ndexia:ArrestCaseNumberText>
	</xsl:template>
	<xsl:template match="Arrest" mode="DigestArrest">
		<lexsdigest:EntityActivity>
			<nc:Activity>
				<xsl:attribute name="s:id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:choose>
					<xsl:when test="normalize-space(ArrestTrackingNumber) != ''">
						<xsl:apply-templates select="ArrestTrackingNumber" mode="ActivityIdentification"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="/IncidentReport/Incident/LEACaseNumber"/>
					</xsl:otherwise>
				</xsl:choose>
				<nc:ActivityCategoryText>
					<xsl:value-of select="$arrestCategory"/>
				</nc:ActivityCategoryText>
				<xsl:apply-templates select="ArrestDate"/>
				<xsl:apply-templates select="ArrestNarrative"/>
			</nc:Activity>
		</lexsdigest:EntityActivity>
	</xsl:template>
	<xsl:template match="ArrestTrackingNumber" mode="ActivityIdentification">
		<nc:ActivityIdentification>
			<nc:IdentificationID><xsl:value-of select="."/></nc:IdentificationID>
		</nc:ActivityIdentification>
	</xsl:template>
	<xsl:template match="ArrestNarrative">
		<nc:ActivityDescriptionText>
			<xsl:value-of select="."/>
		</nc:ActivityDescriptionText>
	</xsl:template>
	<xsl:template match="ArrestDate">
		<nc:ActivityDate>
			<nc:Date>
				<xsl:value-of select="."/>
			</nc:Date>
		</nc:ActivityDate>
	</xsl:template>
	<xsl:template name="AssignID">
		<xsl:attribute name="s:id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
	</xsl:template>
</xsl:stylesheet>