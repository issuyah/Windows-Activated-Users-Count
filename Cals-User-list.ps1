# Import the ActiveDirectory module
Import-Module ActiveDirectory

# Get all active users in the domain
$users = Get-ADUser -Filter {Enabled -eq $True -and ObjectClass -eq "user"} -Properties SamAccountName

# Initialize a hashtable to store the unique users
$uniqueUsers = @{}

# Loop through the users and add them to the hashtable
foreach ($user in $users) {
    $uniqueUsers[$user.SamAccountName] = $true
}

# Output the number of unique users
Write-Output $($uniqueUsers.Count)