
#1. Write a PowerShell script to display "Hello, World!" on the console.

Write-Output "Hello World"
Write-Host "Hello World"


#2. Create a script to list all files in a directory.

$path = "C:\Users\karim.niang\Downloads\"

#dir $path
#ls $path
Get-ChildItem $path

#3. Write a script to display the current date and time.

$CurrentDateTime = [System.DateTime]::Now

Write-Host $CurrentDateTime


#4. Create a script to count the number of files in a directory.

$content = Get-ChildItem $path
$content.Length


#5. Write a script to create a new directory.


$path_to_copy = $path + "NewDirectoryNewItem"

Set-Location $path
# mkdir "NewDirectoryMkdir"
New-Item -ItemType "directory" -Name "\NewDirectoryNewItem"


# 6. Create a script to copy all files from one directory to another.

Get-ChildItem $path | ForEach-Object {
        if ($PSitem -eq "NewDirectoryNewItem") {
            continue}

        else{
            Copy-Item -Path $PSitem.FullName -Destination $path_to_copy
        }
 }

 ## Script more performant

$path= "C:\Users\karim.niang\Downloads\"
$path_destination = "C:\Users\karim.niang\Desktop\BulkCopy\"


New-Item -ItemType Directory -Path $path_destination


# Only to get the module parameters
[System.IO.File]::Copy

[System.IO.Path]::Combine


[System.IO.Directory]::EnumerateFiles($path) | ForEach-Object {

        $File_name = [System.IO.Path]::GetFileName($PSItem)
        $file_path_destination = [System.IO.Path]::Combine($path_destination, $File_name)
       
        [System.IO.File]::Copy($PSItem, $file_path_destination)
}




#7. Write a script to delete all files in a directory.

ForEach($item in $path_to_copy) {Remove-Item -Path $item -Force}


# 8. Create a script to move files from one directory to another.

Get-Help Measure-Command -Online

#Comparing with Measure commands

Measure-Command -Expression {[System.IO.Directory]::EnumerateFileSystemEntries($path) | Move-Item -Destination $path_destination } 

Measure-Command {Get-ChildItem $path | Move-Item $path_destination}

Get-Help Move-Item -Online

# Test the command

[System.IO.Directory]::EnumerateFileSystemEntries($path) | Move-Item -Destination $path_destination -WhatIf

# 9. Write a script to display all running processes.

Get-Process 

# 10. Create a script to stop a specific process by its name.

Get-Process | Where-Object { $($_.ProcessName) -eq "Notion"} 


Stop-Process -Name Notion

# 11. Write a script to create a new user account on a local machine.

Get-Help New-LocalUser -Online

$parameter = [ordered]@{
    Name = "Exercises"
    FullName = "This is only for the exercise purpose"
    NoPassword = $true
    }

New-LocalUser @parameter
Get-LocalUser -Name Exercises


# 12. Create a script to retrieve and display system information.

Get-ComputerInfo

#13 . Write a script to read content from a text file and display it.

New-Item - 

#14. Create a script to write content to a text file.
#15. Write a script to append content to an existing text file.
#16. Create a script to search for a specific string in a text file.
#17. Write a script to replace a string in a text file with another string.
#18. Create a script to list all installed software on a local machine.
#19. Write a script to check if a specific software is installed.
#20. Create a script to monitor changes in a directory.
#21. Write a script to back up a directory to a specified location.
#22. Create a script to schedule a task to run at a specific time.
#23. Write a script to automate the installation of Windows updates.
#24. Create a script to retrieve event logs from a local or remote machine.
#25. Write a script to create a report of disk usage for all drives on a local machine.
