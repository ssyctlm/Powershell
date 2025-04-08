# Day8 practice, Check folder exist, if not create it

$folderName = "testps"


$location = "C:\users\name\documents"

$fullpath = Join-Path -path $location -ChildPath $foldername

if (test-path -path $fullpath -PathType container){
  write-host "Folder '$foldername' already exists at '$location'" 
} else {
  new-item -itemtype directory -path $fullpath
  write-host "Folder '$folderName' was created."
}