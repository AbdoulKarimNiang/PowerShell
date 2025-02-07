$sr = $null

Try 
    { 
        $sr = New-Object System.IO.StreamReader -ArgumentList "C:\Users\karim.niang\Downloads\config.json"
        $content = $sr.ReadToEnd() 
    }

Finally
    {
        if ($sr -ne $null) {
        $sr.Close()
        $sr.Dispose()
        }
    }

$content

Get-ChildItem -Path  "C:\Users\karim.niang\Downloads\" | Select-Object -ExpandProperty Name | ForEach-Object { Write-Output "The file name is" + [System.IO.Path]::GetFileName($PSItem)}

Get-ChildItem -Path  "C:\Users\karim.niang\Downloads\" | Select-Object -Property FullName, Name, @{Name = "DateTime"; Expression = {[System.DateTime]::Now}}, @{Name = "PropertyName"; Expression = {"Ciao"}} 


$foo = "Global Scope"

Function MyFunc {

    $foo = "Local Scope Function"

    Write-Output $Global:foo
    Write-Output $Local:foo
    }

MyFunc

Write-Host "After Functnon: $Global:Foo"
Write-Host "After Function second $local:Foo"


Get-Command *-item, *-Variable


Try{
    Write-Output "Ok va bene" 2>&1
    }
catch
    {
        Write-Output "Catturato"
    }


$frase = "Questa frase prevede Split"
$content_without_nothing = $frase.Split("-")
$content_without_nothing
$content_joined = $content_without_nothing -join " "
$content_joined


$command =  "Get-ChildItem"

& $command


$names = @("Babacar", "Adjia", "Karim", "Abdour", "Moussa", "Mohamed", "due")

$names | Group-Object -Property {$_.Length}



$value = $null

if($value) {
    Write-Host "Condition met"
    }
else {
    Write "Condition not met"
    }

$numbers = @()

foreach($n in 1..20){ $numbers + $n}

$numbers


(1..20).ForEach{($_*$_)}


1..20 | ForEach-Object -Begin {
        Write "Starting the count"
}  -Process { 
        $_ * $_
}  -End {
        Echo "Finished"
    }



1..20 | ForEach-Object -Begin {
    Write-Output "Starting the count"
} -Process {
    $_ * $_
} -End {
    Write-Output "Finished"
}


$i = 0

:mainLoop While($i -le 10){
        $j=0
        While($j -le 10) {
            $k =  $i * $j
            if($k -eq 100) {
                break :mainLoop
            }
            else { write $k}
            $j++
        }
        $i++
}


$number = 10

While ($number -ge 0) {
    $number
    $number--
}


Do{
    $number
    $number--
}while ($number -ge 0)



Get-Help about_switch -ShowWindow

<#
Example below it's 
outside of the book
Buy for now does't work. 
Asked StackOverFlow
#>

$collection = [ordered]@{A = [int]1; B=[string]"abc"; C = [int]33; D = [string]"44" }

foreach($key in $collection.Keys)
    {switch ( ($collection.$key).GetType() ){
        { $_ -eq [int32]} {Write-Output "It's an integer"; break}
        { $_ -eq [string]} {Write-Output "It's a string";break}}
}

#Second attempt

foreach($key in $collection.Keys){
        switch ($collection.$key.GetType()){
            {$PSItem -eq [System.Int32]} {Write-Host "It's an integer"; break}
            {$PSItem -eq [System.String]} {Write-Host "It's a string"; break}
        }
}


switch -Wildcard ("Condition") {
    "?ond?tion" {"First Correct"}
    "Condition" {"Second Correct"}
    "Condd*"    {"Third not Correct"}
    "*"         {"Fourth Correct"}
    "Cond*"     {"Fifth Correct"}
}


cd C:\Users\karim.niang\Downloads
New-Item -ItemType File -Name input.txt
Start-Process notepad++ input.txt


switch -file input.txt -CaseSensitive{
"Camminata" {Write "Beccato Camminata"}
"Casa" {Write "Beccato Casa"}
"Occhiali" {Echo "Beccato Occhiali"}
"Francesco" {Write-Host "Case sensitive Francesco"}
"Paolo" {Write-Output "Paolo middle sentence"}
Default {"Nothing"}
}


Echo "Hello`rWorld with Cariage Return"

Echo "Hello`nWorld With NewLine"

Echo "HelloWorld`r`nWith NewLine"


# Here string

$multi_line=@"
Multine sentence
to be printed
"@

Echo $multine


Literal-Multine string

$sentence = @"
Everthing will 
be okay today $(Get-Date)
"@

Write-Host $Host

$arg = @("Hakuna", "Matata")

$f_string = [String]::Format('I want to write {0}, but got {1}', $arg[0], $arg[1])

Write-Host $F_string

$hast_table = [ordered]@{
        "key1" = "value1"
        key2 = "value2"
}

Echo $hast_table
Echo $hast_table."key1"

$new_hast_table = $hast_table += @{key3 = "value34"}

Echo $new_hast_table

foreach($keyvaluepair in $new_hast_table.GetEnumerator()){
    Write-Host $keyvaluepair.Key
    Write-Host $keyvaluepair.Value
    Write-Host $keyvaluepair.GetHashCode()

   } 

foreach($keyvalue in $new_hast_table.GetEnumerator()){
    Write-Host "$($keyvalue.Key) : $($keyvalue.Value)"
}


[System.Collections.IDictionaryEnumerator]::GetEnumerator()


Get-item .\


$object = New-Object -TypeName psobject -Property @{
    Name = $env:USERNAME
    ID = [System.Random]::new().Next(0,15)
    address = $null

}

Write-Output $object

Add-Member -InputObject $object -Name Greet -Value {param($name) "Hello $($this.$name)"} -MemberType ScriptProperty -Force








Get-Help Add-Member -ShowWindow


$object = New-Object -TypeName PSObject -Property @{
    Name = $env:USERNAME
    ID= [System.Random]::new().Next(10,50)
    address = $null
    }

Add-Member -InputObject $object -MemberType ScriptProperty -Value {param($name) "hello $($this.name)"} -Name Gretings -Force

$object





$dummyobject = "dummy" | Select-Object -Property Name, ID, Address


$add_rows = [PSobject][Ordered]@{
   Name = "Alessandra"
   ID = [System.Random]::new().Next(10,15)
   address = "Via Giacomo Leopardi 99"
}


$dummyobject

+=$add_rows



# Initialize an array to hold the rows (objects)
$rows = @()

# First row
$orderedProperties1 = [Ordered]@{
    Name    = "Alice"
    ID      = [System.Random]::new().Next(0, 15)
    Address = "123 Wonderland"
}

$object1 = New-Object -TypeName PSObject -Property $orderedProperties1
$rows += $object1  # Add the first row to the array

# Second row
$orderedProperties2 = [Ordered]@{
    Name    = "Bob"
    ID      = [System.Random]::new().Next(0, 15)
    Address = "456 Builder St"
}

$object2 = New-Object -TypeName PSObject -Property $orderedProperties2
$rows += $object2  # Add the second row to the array

# Third row
$orderedProperties3 = [Ordered]@{
    Name    = "Charlie"
    ID      = [System.Random]::new().Next(0, 15)
    Address = "789 Chocolate Factory"
}

$object3 = New-Object -TypeName PSObject -Property $orderedProperties3
$rows += $object3  # Add the third row to the array

# Output all rows
$rows | Format-Table -AutoSize
$rows.GetType()




$dummyobject

# PowerShell Functions

Function Get-Greting {
    $name = Read-Host "What's your name?: "
    Write-Host "Hello $name, nice to meet you" 
}

Get-Greting

Function Get-GretingWithYear ($name, $age) {

    Write-Host "Hello $name, you've $age years old"
}

Get-GretingWithYear -name Karim -age 30

Function Get-GreetingLong {

<#
.Synopsis
Very short desciption
.Description
A much much longer desciption
.Input
.Output
.Example
PS> Get-GreetingLong -name "John" -age 30
Your name is John and you are 30 years old.
.Example
PS> Get-GreetingLong -name "Jane" -age 25
Your name is Jane and you are 25 years old.
#>


    [CmdletBinding(HelpUri='http://www.microsoft.com',
                   ConfirmImpact = 'Low')                   
                    ]
    Param(
        [Parameter(Mandatory = $true, Position = 0)]
        
        #This is the first parameter. It's mandatory and you have to insert the name
        [string]$name,

        [Parameter(Mandatory= $true, Position = 1)]
        #This is the second parameter. It's mandatory and you have to insert the age
        [int16]$age

    )

    if ($name -eq $null -or $age -eq $null)
        {Write-Error "Please insert all the mandatory parameter `$name and `$age"}


    elseif ($name.Length -eq 0 -or $age.lenght -eq 0)
        {Write-Error "Please insert all the mandatory parameter `$name and `$age"}

    else{

        Write-Host "Your name is $name and You are $age years old"
    }

}



Get-GreetingLong 


Get-Help Get-GreetingLong -full

Get-Help Get-GreetingLong -Detailed

Get-Help Get-GreetingLong -Examples





Function Get-GreetingLongBetter {

<#
.Synopsis
Very short desciption
.Description
A much much longer desciption
.Input
.Output
.Example
PS> Get-GreetingLong -name "John" -age 30
Your name is John and you are 30 years old.
.Example
PS> Get-GreetingLong -name "Jane" -age 25
Your name is Jane and you are 25 years old.
#>


    [CmdletBinding(HelpUri='http://www.microsoft.com',
                   ConfirmImpact = 'Low')                   
                    ]
    Param(
        [Parameter(Mandatory = $true, Position = 0)]
        
        #This is the first parameter. It's mandatory and you have to insert the name
        [ValidateNotNull()]
        [ValidateLength(3,20)]
        [string]$name,

        [Parameter(Mandatory= $true, Position = 1)]
        [ValidateNotNull()]
        #This is the second parameter. It's mandatory and you have to insert the age
        [int16]$age

    )

   Begin{}
   Process{Write-Host "Your name is $name and You are $age years old"}
   End{}

        


}


Get-GreetingLongBetter Kamm 30


#PowerShell Classes


$mydate =[System.Datetime]::new(1994, 12,01)
$mydate
$mydate.GetType()
$onlydate = $mydate.Date
$onlydate.GetType()
$onlydate


$mydate = [System.DateTime]::new(1994, 12, 01)
$justDate = $mydate.Date

# Output the result
Write-Output $justDate
Write-Output ($justDate.GetType())  # To confirm it's a DateTime object
