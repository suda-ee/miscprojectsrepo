<distribution version="8.5.1" name="SJ-EMC 仪表数据通信" type="MSI">
	<msi GUID="{F726E17E-6B95-448B-A799-F7F0B9D98859}">
		<general appName="SJ-EMC 仪表数据通信" outputLocation="d:\cai\projects\SJ-EMC-1.0\cvidistkit.SJ-EMC 仪表数据通信" relOutputLocation="cvidistkit.SJ-EMC 仪表数据通信" outputLocationWithVars="d:\cai\projects\SJ-EMC-1.0\cvidistkit.%name" relOutputLocationWithVars="cvidistkit.%name" autoIncrement="true" version="1.0.2">
			<arp company="苏州信息产品检测中心" companyURL="http://www.cqc-it.com/" supportURL="" contact="" phone="+86-512-6630 3631" comments=""/>
			<summary title="SJ-EMC 仪表数据通信安装程序" subject="" keyWords="" comments="" author="苏州信息产品检测中心"/></general>
		<userinterface language="Chinese (Simplified)" readMe="" license=""><dlgstrings welcomeTitle="SJ-EMC 仪表数据通信安装程序" welcomeText="">
			</dlgstrings></userinterface>
		<dirs appDirID="100">
			<installDir name="SJ-EMC 仪表数据通信" dirID="100" parentID="2" isMSIDir="false" visible="true"/>
			<installDir name="SJ-EMC 仪表数据通信" dirID="101" parentID="7" isMSIDir="false" visible="true"/>
			<installDir name="[Program Files]" dirID="2" parentID="-1" isMSIDir="true" visible="true"/>
			<installDir name="[Start&gt;&gt;Programs]" dirID="7" parentID="-1" isMSIDir="true" visible="true"/></dirs>
		<files>
			<simpleFile fileID="0" sourcePath="d:\cai\projects\SJ-EMC-1.0\SJ-EMC.exe" targetDir="100" readonly="false" hidden="false" system="false" regActiveX="false" runAfterInstallStyle="IMMEDIATELY_RESUME_INSTALL" cmdLineArgs="" runAfterInstall="false" uninstCmdLnArgs="" runUninst="false"/>
			<simpleFile fileID="1" sourcePath="d:\cai\projects\SJ-EMC-1.0\docs\UsersGuide\UsersGuide.pdf" relSourcePath="docs\UsersGuide\UsersGuide.pdf" relSourceBase="0" targetDir="100" readonly="false" hidden="false" system="false" regActiveX="false" runAfterInstallStyle="IMMEDIATELY_RESUME_INSTALL" cmdLineArgs="" runAfterInstall="false" uninstCmdLnArgs="" runUninst="false"/></files>
		<fileGroups>
			<projectOutput targetType="0" dirID="100" projectID="1">
				<fileID>0</fileID></projectOutput>
			<projectDependencies dirID="100" projectID="1"/></fileGroups>
		<shortcuts>
			<shortcut name="SJ-EMC 仪表数据通信" targetFileID="0" destDirID="101" cmdLineArgs="" description="" runStyle="NORMAL"/>
			<shortcut name="SJ-EMC 仪表数据通信用户指南" targetFileID="1" destDirID="101" cmdLineArgs="" description="" runStyle="NORMAL"/></shortcuts>
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
		<Projects NumProjects="2">
			<Project000 ProjectID="0" ProjectAbsolutePath="d:\cai\projects\SJ-EMC-1.0\doc.prj" ProjectRelativePath="doc.prj"/>
			<Project001 ProjectID="1" ProjectAbsolutePath="d:\cai\projects\SJ-EMC-1.0\SJ-EMC1.0.prj" ProjectRelativePath="SJ-EMC1.0.prj"/></Projects>
		<buildData progressBarRate="0.057736421259370">
			<progressTimes>
					<Begin>0.000000000000000</Begin>
					<ProductsAdded>0.280999660491943</ProductsAdded>
					<DPConfigured>1.078000068664551</DPConfigured>
					<DPMergeModulesAdded>7.828000068664551</DPMergeModulesAdded>
					<DPClosed>10.671999931335449</DPClosed>
					<DistributionsCopied>10.686999797821045</DistributionsCopied>
					<End>17.320089783668518</End></progressTimes></buildData>
	</msi>
</distribution>
