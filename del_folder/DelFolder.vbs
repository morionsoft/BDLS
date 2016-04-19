On Error Resume Next

strFldr = "D:\SoftInform\MorionOld\Layers\Layers2"
Set objFSO = CreateObject("Scripting.FileSystemObject")

ClearFolder strFldr

Function ClearFolder(sFldr)
   On Error Resume Next
   Dim oD, cF, cD, oI

   Set oD = objFSO.GetFolder(sFldr)
   Set cF = oD.Files
   Set cD = oD.SubFolders

   For Each oI In cF
      oI.Attributes = 0
      oI.Delete
   Next

   For Each oI In cD
      ClearFolder oI.Path
      oI.Attributes = 0
      oI.Delete
   Next
End Function