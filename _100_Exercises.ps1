# 100 PowerShell Exercises for Data Engineers

# ## Beginner Level

# 1. Create a simple PowerShell script that displays "Hello, Data Engineer!" on the console.

Write-Host 'Hello'

# 2. List all files in the current directory and save the output to a text file named "files.txt".

ls | Out-File "File.txt"

gci | Out-File "File.txt"

Get-ChildItem | Out-File "File.txt"

# 3. Create a new directory called "DataProcessing" and navigate into it using PowerShell commands.

New-Item -ItemType 'Directory' -Name 'DataProcessing'


# 4. Display all PowerShell environment variables and filter only those containing the word "PATH".

Get-ChildItem "Env:" | Where-Object {$PSItem.Name -Contains "PATH"}


# 5. Create a simple PowerShell script that accepts a name parameter and outputs "Hello, [name]!".

Get-Command -Name *host*
Get-Help Get-Host -Online
Get-Help Read-Host -Online
$Name = Read-Host "Insert your name"
Write-Host "Hello $Name"

# 6. Create a script that counts the number of files in a directory and outputs the result.

Get-Help Measure-Object -Online
Get-ChildItem | Measure-Object

# 7. Use Get-Process to list all running processes, then filter to show only those using more than 100MB of memory.

Get-Process | GM
Get-Process | Where-Object {$PSItem.VM -gt 100MB} # For virtual Memory
Get-Process | Where-Object {$_.WorkingSet -gt 100MB} # For RAM

# 8. Create a PowerShell script that accepts multiple parameters (name, age, role) with appropriate data types.

[string]$Name = Read-Host "What's your name"
[int]$Age = Read-Host "What's your age"
[string]$Role = Read-Host "What's your role"

Write-Host "My name is $Name, I'm $Age years old and my role is"

# 9. List all PowerShell modules installed on your system and their versions.

Get-Module -All | Select-Object -Property ModuleType, Version

# 10. Create a basic PowerShell function that converts a temperature from Celsius to Fahrenheit.

function Get-FahrenheitFromCelcius {
    [int]$celcius = Read-Host -Prompt 'Please enter a Celsius Temperature'

    [int]$fahrenheit = ($celcius * 9/5) + 32 

    Write-Host "The converted temperature in fahrenheit is $fahrenheit"

}

Get-FahrenheitFromCelcius 

# ## Intermediate Level

# 11. Read a CSV file named "employees.csv" and display only the rows where the "Department" column equals "Data".

Get-Command *path*
Set-Location -Path 'C:\Users\karim.niang\Downloads'
New-Item -ItemType 'File' -Name 'emplyees.csv'

$employeeContent  = @(
    'name, surname, Department'
    'Lucas,Pasta,Mode'
    'Alessio,Maccheroni,Marketing'
    'Franco,Numeri,Data'
    'Giorgio,Molto,Data'
)
Add-Content -Path 'emplyees.csv' -Value $employeeContent

Get-Help Import-Csv -Online 
Import-Csv -Path 'emplyees.csv' -Delimiter ',' | Where-Object {$PSItem.Department -eq 'Data'} | Write-Host


# 12. Create a script that finds all files larger than 100MB in a specified directory and its subdirectories.

Get-ChildItem . | Where-Object {$PSItem.length -gt 100MB} |Write-Host # Nothing

Get-ChildItem . | Where-Object {$PSItem.length -gt 10MB} # Nothing

# 13. Write a script that retrieves system information (OS version, CPU, RAM) and exports it to a JSON file.

Get-ComputerInfo 

# 14. Use PowerShell to parse a log file and count occurrences of ERROR, WARNING, and INFO messages.

# 15. Create a script that compares two directories and identifies files that exist in one but not the other.

# 16. Write a function that processes a CSV file to calculate the average of a specified numeric column.

# 17. Create a script that retrieves the last 50 entries from the System event log and saves them to an XML file.

# 18. Write a script that monitors a directory for new files and processes them when they appear.

# 19. Create a PowerShell function that compresses files older than 30 days in a specified directory.

# 20. Write a script that renames multiple files in a directory based on a pattern (e.g., add a timestamp).

# ## CSV and Data Processing

# 21. Write a script that merges multiple CSV files into a single file while preserving headers.

# 22. Create a function that splits a large CSV file into smaller files based on a specified row count.

# 23. Write a script that transforms data in a CSV file by applying a calculation to a specific column.

# 24. Create a script that pivots data in a CSV file (similar to a pivot table in Excel).

# 25. Write a function that removes duplicate rows from a CSV file based on a specified column.

# 26. Create a script that validates data in a CSV file against predefined rules and outputs validation errors.

# 27. Write a function that samples a specified percentage of rows from a large CSV file.

# 28. Create a script that joins two CSV files based on a common column (similar to SQL JOIN).

# 29. Write a function that exports specific columns from a CSV file to create a new, filtered CSV.

# 30. Create a script that converts a CSV file to JSON format preserving the structure.

# ## Working with JSON and XML

# 31. Write a script that extracts specific fields from a complex JSON file and outputs them to a CSV.

# 32. Create a function that updates values in a JSON configuration file without changing its structure.

# 33. Write a script that transforms XML data to a PowerShell object and filters based on attributes.

# 34. Create a function that compares two JSON files and identifies differences in their structure and values.

# 35. Write a script that queries a REST API and processes the JSON response into a CSV report.

# 36. Create a function that flattens a nested JSON structure into a tabular format.

# 37. Write a script that validates JSON data against a schema and reports violations.

# 38. Create a function that transforms data between XML and JSON formats while preserving structure.

# 39. Write a script that extracts and aggregates specific metrics from JSON-formatted log files.

# 40. Create a function that queries an XML document using XPath and exports the results.

# ## Filtering and Data Transformation

# 41. Write a script that processes a dataset and applies different transformations based on data types.

# 42. Create a function that performs string manipulations (substring, replace, regex) on text data in a file.

# 43. Write a script that extracts date/time patterns from text and converts them to a standardized format.

# 44. Create a function that cleans and normalizes data (remove spaces, standardize case, etc.).

# 45. Write a script that detects and handles outliers in a numeric dataset using statistical methods.

# 46. Create a function that performs basic data profiling on a CSV file (min, max, avg, distinct values, etc.).

# 47. Write a script that applies custom business rules to transform data in a complex ETL process.

# 48. Create a function that bins continuous data into categories based on specified ranges.

# 49. Write a script that normalizes values in a dataset using min-max or z-score normalization.

# 50. Create a function that generates a frequency distribution report for categorical data.

# ## Error Handling and Logging

# 51. Write a script with comprehensive error handling for file operations that logs failures.

# 52. Create a function that implements retry logic for unstable network operations with exponential backoff.

# 53. Write a script that creates a custom logging mechanism for ETL operations with different log levels.

# 54. Create a function that validates input parameters thoroughly before executing operations.

# 55. Write a script that implements a transaction-like pattern where operations can be rolled back on failure.

# 56. Create a function that logs performance metrics for data processing operations.

# 57. Write a script that implements proper error handling for parallel operations.

# 58. Create a logging function that writes to multiple destinations (file, console, event log) based on severity.

# 59. Write a script that implements assertion checks throughout a data pipeline.

# 60. Create a function that generates comprehensive execution reports for scheduled data jobs.

# ## Database Operations

# 61. Write a script that connects to a SQL Server database and executes a query to export data to CSV.

# 62. Create a function that performs a bulk insert of CSV data into a SQL Server table.

# 63. Write a script that compares data between a database table and a CSV file, identifying differences.

# 64. Create a function that generates CREATE TABLE SQL statements based on CSV structure.

# 65. Write a script that executes multiple SQL queries in parallel and aggregates the results.

# 66. Create a function that performs incremental loads from a source to a target database.

# 67. Write a script that generates database documentation by querying system tables.

# 68. Create a function that executes a stored procedure with parameters and processes the results.

# 69. Write a script that monitors database performance metrics and generates alerts.

# 70. Create a function that performs database schema comparison between dev and prod environments.

# ## Automation and Scheduling

# 71. Write a script that sets up a scheduled task to run a data processing job at specific intervals.

# 72. Create a function that implements a dependency chain for ETL jobs (Job B starts after Job A completes).

# 73. Write a script that monitors the execution of scheduled PowerShell jobs and sends notifications.

# 74. Create a function that implements a simple workflow engine for data processing tasks.

# 75. Write a script that dynamically generates and executes PowerShell jobs based on configuration.

# 76. Create a function that implements checkpoints in long-running data operations for resumability.

# 77. Write a script that throttles resource-intensive operations to prevent system overload.

# 78. Create a function that dispatches different data processing jobs to specific servers based on load.

# 79. Write a script that implements a producer-consumer pattern for processing a queue of data files.

# 80. Create a function that monitors and manages disk space before large data operations.

# ## Advanced Scripting

# 81. Write a script that uses multithreading to process multiple large files concurrently.

# 82. Create a function that dynamically generates PowerShell classes based on data structures.

# 83. Write a script that implements a plugin architecture for extensible data transformations.

# 84. Create a function that uses reflection to dynamically invoke methods based on configuration.

# 85. Write a script that leverages PowerShell's Abstract Syntax Tree (AST) to analyze scripts.

# 86. Create a function that implements a simple state machine for complex data processing workflows.

# 87. Write a script that creates and consumes a REST API for data services using PowerShell.

# 88. Create a function that implements a caching mechanism for expensive data operations.

# 89. Write a script that interacts with cloud storage services (Azure Blob, AWS S3) for data transfers.

# 90. Create a function that implements a command pattern for undoable data operations.

# ## Complex Data Engineering Scenarios

# 91. Write a script that orchestrates a complete ETL pipeline with error handling, logging, and notifications.

# 92. Create a function that performs data quality assessment across multiple systems and generates reports.

# 93. Write a script that implements near real-time data synchronization between disparate systems.

# 94. Create a function that manages data partitioning and distribution across multiple storage locations.

# 95. Write a script that performs complex data transformations using statistical methods (z-scores, etc.).

# 96. Create a function that implements data lineage tracking throughout a processing pipeline.

# 97. Write a script that builds a metadata repository by scanning and documenting data sources.

# 98. Create a function that implements data masking/anonymization for sensitive information.

# 99. Write a script that performs impact analysis for proposed data structure changes.

# 100. Create a comprehensive data engineering framework that combines many of the previous exercises into a reusable module.

