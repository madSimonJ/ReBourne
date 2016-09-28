Write-Host 'VITAL MESSAGE'
Write-Host ''
Write-Host 'HOW DIFFICULT? (4-10)'

# Variable to store whether the player has made a valid difficulty
# level choice.  It's false initially & will be set to True only when
# a valid choice is made
$PlayerMadeAValidChoice = $False
# A function is being used to parse the number Char from the console into
# an Integer.  It requires that the variable used to store the converted
# int already exist before it is called.  It's being defined here therefore
# with an obvious 'wrong' value
$DifficultyLevel = -1
# Loop until a correct choice is made
While ($PlayerMadeAValidChoice -ne $True) {
    # Use the .NET Console class to read a character from the user
    $DifficultyLevelChar = [string][Console]::ReadKey($True).KeyChar
    # use the .NET int.TryParse function to attempt to convert the
    # char received from the console to an Int.
    [int]::TryParse($DifficultyLevelChar, [ref]$DifficultyLevel)
    # if the value is between 4 and 10 (inclusive), then a valid
    # selection has been made
    If([Int]$DifficultyLevel -ge 4 -And $DifficultyLevel -le 10) {
        $PlayerMadeAValidChoice = $True
    }
}

# Initial value for the Secret Code is an empty string
$SecretCode = ''
# Each iteration of this loop adds a letter to the secret code. There
# are as many characters as the difficulty level
for($i = 0; $i -lt $DifficultyLevel; $i++) {
    # Get a random number between 97 ('a' on the ASCII table) and 
    # 123 ('z' on the ASCII table)
    $SecretCodeLetterAsNumber = Get-Random -Minimum 97 -Maximum 123
    # Convert the randomly generated number to a Char and append it
    # to the secret message
    $SecretCode += [Char]$SecretCodeLetterAsNumber
}

Write-Host "SEND THIS MESSAGE"
Write-Host 
Write-Host $SecretCode

# Pause for a length of time based on the difficulty level.  The
# original code had the computer running a For loop to no effect to
# create the impression of a pause.  PowerShell has a more elegant
# facility available for this purpose.
Start-Sleep ($DifficultyLevel * 0.2)

# Clear the screen once the message has been displayed for long enough
cls



[Console]::ReadKey($True)