<#
.Synopsis
   PowerShell Software Library
.DESCRIPTION
   This script maintains a list of software downloads, it downloads the latest known versions at the time of the latest update to this script.
   All versions will be kept in the folder of the product, and so in time you create a library of versions of your favorite software.
.Run
   .\psl-v2024.ps1
.Created by
   Edwin van Brenk
.Version
   v.2024-01
.Date
   26-01-2024
#>

# Define a hashtable for software and their download links
$softwareList = @{
#	.NET
".NET\Framework 3" = "http://download.microsoft.com/download/1/6/7/167F0D79-9317-48AE-AEDB-17120579F8E2/NDP451-KB2858728-x86-x64-AllOS-ENU.exe";
".NET\Framework 3.5 Incl. sp1" = "http://download.microsoft.com/download/2/0/E/20E90413-712F-438C-988E-FDAA79A8AC3D/dotnetfx35.exe";
".NET\Framework 4" = "https://download.microsoft.com/download/9/5/A/95A9616B-7A37-4AF6-BC36-D6EA96C8DAAE/dotNetFx40_Full_x86_x64.exe";
".NET\Framework 4.6" = "http://download.microsoft.com/download/C/3/A/C3A5200B-D33C-47E9-9D70-2F7C65DAAD94/NDP46-KB3045557-x86-x64-AllOS-ENU.exe";
".NET\Framework 4.61" = "https://download.microsoft.com/download/E/4/1/E4173890-A24A-4936-9FC9-AF930FE3FA40/NDP461-KB3102436-x86-x64-AllOS-ENU.exe";
".NET\Framework 4.62" = "https://download.visualstudio.microsoft.com/download/pr/8e396c75-4d0d-41d3-aea8-848babc2736a/80b431456d8866ebe053eb8b81a168b3/ndp462-kb3151800-x86-x64-allos-enu.exe";
".NET\Framework 4.7" = "https://download.visualstudio.microsoft.com/download/pr/2dfcc711-bb60-421a-a17b-76c63f8d1907/e5c0231bd5d51fffe65f8ed7516de46a/ndp47-kb3186497-x86-x64-allos-enu.exe";
".NET\Framework 4.71" = "https://download.visualstudio.microsoft.com/download/pr/4312fa21-59b0-4451-9482-a1376f7f3ba4/9947fce13c11105b48cba170494e787f/ndp471-kb4033342-x86-x64-allos-enu.exe";
".NET\Framework 4.72" = "https://download.visualstudio.microsoft.com/download/pr/1f5af042-d0e4-4002-9c59-9ba66bcf15f6/089f837de42708daacaae7c04b7494db/ndp472-kb4054530-x86-x64-allos-enu.exe";
".NET\Framework 4.8" = "https://download.visualstudio.microsoft.com/download/pr/7afca223-55d2-470a-8edc-6a1739ae3252/abd170b4b0ec15ad0222a809b761a036/ndp48-x86-x64-allos-enu.exe";
".NET\Framework 6.0" = "https://download.visualstudio.microsoft.com/download/pr/9b8baa92-04f4-4b1a-8ccd-aa6bf31592bc/3a25c73326e060e04c119264ba58d0d5/dotnet-sdk-6.0.418-win-x64.exe";
".NET\Framework 7.0" = "https://download.visualstudio.microsoft.com/download/pr/febc46ff-cc68-4bee-83d2-c34786b5ca68/524ef9b25d29dc90efdb0fba0f589779/dotnet-sdk-7.0.405-win-x64.exe";
".NET\Framework 8.0" = "https://download.visualstudio.microsoft.com/download/pr/cb56b18a-e2a6-4f24-be1d-fc4f023c9cc8/be3822e20b990cf180bb94ea8fbc42fe/dotnet-sdk-8.0.101-win-x64.exe";
".NET\NetFxRepairTool" = "https://download.microsoft.com/download/2/B/D/2BDE5459-2225-48B8-830C-AE19CAF038F1/NetFxRepairTool.exe";
".NET\.NET Core\windowsdesktop-runtime-3.1.2" = "https://download.visualstudio.microsoft.com/download/pr/3240250e-6fe0-4258-af69-85abef6c00de/e01ee0af6c65d894f4a02bdf6705ec7b/windowsdesktop-runtime-3.1.2-win-x64.exe";
#	1-9
".\7-Zip x64" = "https://www.7-zip.org/a/7z2301-x64.exe";
".\3UTools" = "hhttps://dl.3u.com/update/v300/dl/3uTools_v3.08.025_Setup_x86.exe";
#	A
".\Adobe\Reader" = "https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/2300820470/AcroRdrDC2300820470_en_US.exe";
".\AnyBurn 64 bit" = "https://www.anyburn.com/anyburn_setup_x64.exe";
#	B
".\BurnAwareFree" = "https://download.betanews.com/download/1212419334-2/burnaware_free_17.3.exe";
#	C
".\Google Chrome" = "https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7BC6B8E5B5-796F-3303-857C-35EFD663B1A6%7D%26lang%3Den%26browser%3D5%26usagestats%3D0%26appname%3DGoogle%2520Chrome%26needsadmin%3Dtrue%26ap%3Dx64-stable-statsdef_0%26brand%3DGCGI/dl/chrome/install/googlechromestandaloneenterprise64.msi";
".\Certify the Web" = "https://certifytheweb.s3.amazonaws.com/downloads/archive/CertifyTheWebSetup_V6.0.13.exe";
#	E
".\Epic Privacy Browser" = "https://cdn.epicbrowser.com/winsetup/EpicSetup.exe";
#	F
".\FastStone\Viewer" = "https://www.faststonesoft.net/DN/FSViewerSetup78.exe";
".\FastStone\Viewer\Portable" = "https://www.faststonesoft.net/DN/FSViewer78.zip";
".\FastStone\Photo Resizer 4.3" = "https://www.faststonesoft.net/DN/FSResizerSetup44.exe";
".\FastStone\Photo Resizer 4.3\Portable" = "https://www.faststonesoft.net/DN/FSResizer44.zip";
".\Firefox" = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/122.0/win64/en-US/Firefox%20Setup%20122.0.exe";
#	H
".\HTTrack" = "https://download.httrack.com/httrack_x64-3.49.2.exe";
".\HTTrack Portable" = "https://download.httrack.com/httrack_x64-noinst-3.49.2.zip";
#	I
".\IrfanView" = "https://www.fosshub.com/IrfanView.html?dwl=iview466_x64_setup.exe";
".\IrfanView Portable" = "https://www.irfanview.info/files/iview466_x64.zip";
".\ioBit Driver Booster" = "https://cdn.iobit.com/dl/driver_booster_setup.exe";
".\IISCrypto" = "https://www.nartac.com/Downloads/IISCrypto/IISCrypto.exe";
".\IISCryptoCLI" = "https://www.nartac.com/Downloads/IISCrypto/IISCryptoCli.exe";
#	J
".\Java" = "https://sdlc-esd.oracle.com/ESD6/JSCDL/jdk/8u401-b10/4d245f941845490c91360409ecffb3b4/jre-8u401-windows-x64.exe?GroupName=JSC&FilePath=/ESD6/JSCDL/jdk/8u401-b10/4d245f941845490c91360409ecffb3b4/jre-8u401-windows-x64.exe&BHost=javadl.sun.com&File=jre-8u401-windows-x64.exe&AuthParam=1706200242_b1785412be363d4a26c91c76d59970db&ext=.exe";
#	K
".\KeePass" = "https://netix.dl.sourceforge.net/project/keepass/KeePass%202.x/2.55/KeePass-2.55-Setup.exe";
".\KeePass Portable" = "https://netcologne.dl.sourceforge.net/project/keepass/KeePass%202.x/2.55/KeePass-2.55.zip";
".\Ketarin" = "https://ketarin.org/downloads/Ketarin/Ketarin-1.8.11.zip";
#	L

#	M
".\Microsoft Online Services Sign-in Assistant for IT Professionals" = "https://download.microsoft.com/download/7/1/E/71EF1D05-A42C-4A1F-8162-96494B5E615C/msoidcli_64bit.msi";
".\McAfee Avert Stinger" = "http://downloadcenter.mcafee.com/products/mcafee-avert/stinger/stinger64.exe";
".\MRemoteNG" = "https://github-releases.githubusercontent.com/460848/6278a380-5cff-11e9-82bd-bd9776fdd7cc?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20211202%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20211202T155458Z&X-Amz-Expires=300&X-Amz-Signature=0bf8ffaf811611f52e7d62ae05ee04a680b730cdc86689f30855b9920dea38d8&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=460848&response-content-disposition=attachment%3B%20filename%3DmRemoteNG-Installer-1.76.20.24615.msi&response-content-type=application%2Foctet-stream";
".\MRemoteNG\Portable" = "https://github-releases.githubusercontent.com/460848/542a8780-5cff-11e9-899c-784bab35a625?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20211202%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20211202T155407Z&X-Amz-Expires=300&X-Amz-Signature=72cbe1c8310c6b78a00986fc8723f45c5f28a19e0a710b871337c98e16bf2f10&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=460848&response-content-disposition=attachment%3B%20filename%3DmRemoteNG-Portable-1.76.20.24669.zip&response-content-type=application%2Foctet-stream";
".\MediaCreationTool-Windows10" = "https://download.microsoft.com/download/b/0/5/b053c6bc-fc07-4785-a66a-63c5aeb715a9/MediaCreationTool21H2.exe";
".\MediaCreationTool-Windows11" = "https://software-download.microsoft.com/download/pr/888969d5-f34g-4e03-ac9d-1f9786c69161/MediaCreationToolW11.exe";
# Exchange 2013
".\Microsoft Exchange 2013\CU23 EN X64" = "https://download.microsoft.com/download/7/F/D/7FDCC96C-26C0-4D49-B5DB-5A8B36935903/Exchange2013-x64-cu23.exe";
# Exchange 2016
".\Microsoft Exchange 2016\CU22 EN X64 ISO" = "https://download.microsoft.com/download/f/0/e/f0e65686-3761-4c9d-b8b2-9fb71a207b8d/ExchangeServer2016-x64-CU22.ISO";
".\Microsoft Exchange 2016\CU23 EN X64 ISO" = "https://download.microsoft.com/download/8/d/2/8d2d01b4-5bbb-4726-87da-0e331bc2b76f/ExchangeServer2016-x64-CU23.ISO";
# Exchange 2019
".\Microsoft Exchange 2019\CU12 EN X64 ISO" = "https://download.microsoft.com/download/b/c/7/bc766694-8398-4258-8e1e-ce4ddb9b3f7d/ExchangeServer2019-x64-CU12.ISO";
".\Microsoft Exchange 2019\CU13 EN X64 ISO" = "https://download.microsoft.com/download/7/5/f/75f4d77e-002c-419c-a03a-948e8eb019f2/ExchangeServer2019-x64-CU13.ISO";
# Microsoft Visual C++
".\Microsoft Visual C++\Redistributable 2013 x64" = "https://download.visualstudio.microsoft.com/download/pr/10912041/cee5d6bca2ddbcd039da727bf4acb48a/vcredist_x64.exe";
".\Microsoft Visual C++\Redistributable 2022 x64" = "https://aka.ms/vs/17/release/vc_redist.x64.exe";
#	N
".\NewsLeecher 7\Final" = "https://www.newsleecher.com/nl_setup.exe";
".\NewsLeecher 8\Beta 4" = "https://www.newsleecher.com/nl_setup_beta.exe";
".\Notepad++ X64" = "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.6.2/npp.8.6.2.Installer.x64.exe";
#	P
".\Paint.NET" = "https://github.com/paintdotnet/release/releases/download/v5.0.12/paint.net.5.0.12.install.anycpu.web.zip";
".\Putty" = "https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.80-installer.msi";
".\PowerShell\7 Windows X64" = "https://github.com/PowerShell/PowerShell/releases/download/v7.4.1/PowerShell-7.4.1-win-x64.msi";
#	Q
".\QuickPar 0.9.1.0" = "http://www.quickpar.org.uk/Download-0.9.1.0.htm";
#	R
".\RDCMan RemoteDesktopConnectionManager" = "https://download.sysinternals.com/files/RDCMan.zip";
".\Resource Hacker Portable" = "https://www.angusj.com/resourcehacker/resource_hacker.zip";
".\Rufus" = "https://github.com/pbatard/rufus/releases/download/v4.4/rufus-4.4.exe";
#	S
".\Samsung Magician\8.0.1.1000" = "https://download.semiconductor.samsung.com/resources/software-resources/Samsung_Magician_Installer_Official_8.0.1.1000.exe";
".\Spotnet" = "https://www.spotnet.tk/Spotnet.2.0.0.284.setup.exe.swf";
".\Sysinternals Suite 2024" = "https://download.sysinternals.com/files/SysinternalsSuite.zip";
".\ShowKeyPlus" = "https://github.com/Superfly-Inc/ShowKeyPlus/releases/download/ShowKeyPlus7060/ShowKeyPlus1.0.7060.zip";
".\SharePointOnlineManagementShell" = "https://download.microsoft.com/download/0/2/E/02E7E5BA-2190-44A8-B407-BC73CA0D6B87/SharePointOnlineManagementShell_24322-12000_en-us.msi";
".\Sonos" = "https://update-software.sonos.com/software/tJiCdMg7vB/Sonos_57.19-49220.exe";
#	T
".\TagScanner" = "https://www.xdlab.ru/files/tagscan-6.1.16_x64-setup.exe";
".\TagScanner Portable" = "https://www.xdlab.ru/files/tagscan-6.1.16_x64.zip";
".\Tor Browser" = "https://dist.torproject.org/torbrowser/13.0.9/tor-browser-windows-x86_64-portable-13.0.9.exe";
".\TextCrawler" = "https://www.digitalvolcano.co.uk/download/TextCrawler_Setup.exe";
#	V
".\Microsoft Research Virtual WiFi" = "https://download.microsoft.com/download/0/2/1/0219DB4F-7550-4233-B742-ADA241BCA06C/MSRMesh-VirtualWIFI.MSIhttps://download.microsoft.com/download/0/2/1/0219DB4F-7550-4233-B742-ADA241BCA06C/MSRMesh-VirtualWIFI.MSI";
".\VLC Media Player x64" = "https://videolan.mirror.liteserver.nl/vlc/3.0.20/win64/vlc-3.0.20-win64.exe";
#	W
".\WinRAR x64" = "https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-624.exe";
".\Wireshark Portable" = "https://2.na.dl.wireshark.org/win64/WiresharkPortable64_4.2.2.paf.exe";
".\Wireshark" = "https://2.na.dl.wireshark.org/win64/Wireshark-4.2.2-x64.exe";
".\WSUS Offline" = "https://download.wsusoffline.net/wsusoffline120.zip";
".\WindowsISODownloader" = "https://www.heidoc.net/php/Windows-ISO-Downloader.exe";
#	X
".\XnView" = "https://download.xnview.com/XnView-win-full.exe";


}

# Loop through the hashtable
foreach ($software in $softwareList.GetEnumerator()) {
    # Create directory
    New-Item -ItemType Directory -Force -Path "$env:OneDriveConsumer\PSL\$($software.Name)"

    # Define the path of the file to be downloaded
    $filePath = "$env:OneDriveConsumer\PSL\$($software.Name)\$(Split-Path -Path $software.Value -Leaf)"

    # Check if the file already exists
    if (!(Test-Path -Path $filePath)) {
        # Download file
        try {
            (new-object System.Net.WebClient).DownloadFile($software.Value, $filePath)
        } catch {
            Write-Error "Failed to download $($software.Value)"
        }
    } else {
        Write-Output "File $filePath already exists. Skipping download."
    }
}
