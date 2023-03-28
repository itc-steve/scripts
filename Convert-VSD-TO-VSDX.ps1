$directoryToUpdate='C:\Users\Admin\Downloads\'
$visio= New-Object -com Visio.Application
foreach($vsdFile in (get-childitem "$directoryToUpdate\*.vsd")){
   write-host "Working on $vsdfile"
   $doc=$visio.Documents.Open($vsdFile.FullName)
   $vsdxFileName=[io.path]::ChangeExtension($vsdFile,'.vsdx')
   $doc.SaveAs($VSDXFileName)
   $doc.close();
}
