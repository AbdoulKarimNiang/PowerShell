
$user_name = ''

$path_origin= "C:\Users\$user_name\Downloads\"

$path_destination = "C:\Users\$user_name\Desktop\BulkCopy\"


New-Item -ItemType Directory -Path $path_destination

[System.IO.File]::Copy

[System.IO.Path]::Combine


[System.IO.Directory]::EnumerateFiles($path_origin) | ForEach-Object {

        $File_name = [System.IO.Path]::GetFileName($PSItem)
        $file_path_destination = [System.IO.Path]::Combine($path_destination, $File_name)
       
        [System.IO.File]::Copy($PSItem, $file_path_destination)
}