<distribution version="8.5.0" name="SJ-EMC1.0 仪表数据通信" type="MSI">
	<msi GUID="{98FA48F5-FBFF-4735-9998-C0D4DD3C8296}">
		<general appName="SJ-EMC1.0 仪表数据通信" outputLocation="d:\cai\projects\SJ-EMC1.0\cvidistkit.SJ-EMC1.0 仪表数据通信" relOutputLocation="cvidistkit.SJ-EMC1.0 仪表数据通信" outputLocationWithVars="d:\cai\projects\SJ-EMC1.0\cvidistkit.%name" relOutputLocationWithVars="cvidistkit.%name" autoIncrement="true" version="1.0.1">
			<arp company="苏州信息产品检测中心" companyURL="http://www.cqc-it.com/" supportURL="" contact="" phone="0512-66303631" comments=""/>
			<summary title="SJ-EMC1.0 仪表数据通信安装程序" subject="" keyWords="" comments="" author="苏州信息产品检测中心"/></general>
		<userinterface language="Chinese (Simplified)" readMe="" license=""><dlgstrings welcomeTitle="SJ-EMC1.0 仪表数据通信" welcomeText="">
			</dlgstrings></userinterface>
		<dirs appDirID="100">
			<installDir name="[Program Files]" dirID="2" parentID="-1" isMSIDir="true" visible="true"/>
			<installDir name="SJ-EMC1.0 仪表数据通信" dirID="100" parentID="2" isMSIDir="false" visible="true"/>
			<installDir name="[Start&gt;&gt;Programs]" dirID="7" parentID="-1" isMSIDir="true" visible="true"/>
			<installDir name="SJ-EMC1.0 仪表数据通信" dirID="101" parentID="7" isMSIDir="false" visible="true"/></dirs>
		<files>
			<simpleFile fileID="0" sourcePath="d:\cai\projects\SJ-EMC1.0\SJ-EMC1.0.exe" targetDir="100" readonly="false" hidden="false" system="false" regActiveX="false" runAfterInstallStyle="IMMEDIATELY_RESUME_INSTALL" cmdLineArgs="" runAfterInstall="false" uninstCmdLnArgs="" runUninst="false"/></files>
		<fileGroups>
			<projectOutput targetType="0" dirID="100" projectID="0">
				<fileID>0</fileID></projectOutput>
			<projectDependencies dirID="100" projectID="0"/></fileGroups>
		<shortcuts>
			<shortcut name="SJ-EMC1.0 仪表数据通信" targetFileID="0" destDirID="101" cmdLineArgs="" description="" runStyle="NORMAL"/></shortcuts>
		<mergemodules/>
		<products/>
		<runtimeEngine cvirte="true" instrsup="false" lvrt="false" analysis="false" netvarsup="false" dotnetsup="false" activeXsup="false" lowlevelsup="false" rtutilsup="false" installToAppDir="false"/>
		<advanced mediaSize="650">
			<launchConditions>
				<condition>MINOS_WIN2K_SP3</condition>
			</launchConditions>
			<includeConfigProducts>true</includeConfigProducts>
			<maxImportVisible>silent</maxImportVisible>
			<maxImportMode>merge</maxImportMode></advanced>
		<Projects NumProjects="1">
			<Project000 ProjectID="0" ProjectAbsolutePath="d:\cai\projects\SJ-EMC1.0\SJ-EMC1.0.prj" ProjectRelativePath="SJ-EMC1.0.prj"/></Projects>
		<buildData progressBarRate="0.062563894526444">
			<progressTimes>
					<Begin>0.000000000000000</Begin>
					<ProductsAdded>0.000000000000000</ProductsAdded>
					<DPConfigured>1.062999725341797</DPConfigured>
					<DPMergeModulesAdded>7.218999862670898</DPMergeModulesAdded>
					<DPClosed>10.265999794006348</DPClosed>
					<DistributionsCopied>10.280999660491943</DistributionsCopied>
					<End>15.983659706115724</End></progressTimes></buildData>
	</msi>
</distribution>
