Write-Host 'ROBOT MISSILE'
Write-Host ''
Write-Host 'TYPE THE CORRECT CODE'
Write-Host 'LETTER (A-Z) TO'
Write-Host 'DEFUSE THE MISSILE'
Write-Host 'YOU HAVE 4 CHANCES'
Write-Host ''

$SecretCodeAsNumber = Get-Random -Minimum 97 -Maximum 123

$SecretCode = [Char]$SecretCodeAsNumber

$PlayerGuessedTheCode= $False
# New variable that records whether the player reached the last turn
$PlayerOnLastTurn = $False
# New variable to store the number of tries allow.  Change this to change the number of tries
$NumberOfTries = 3;

# The end of the loop is defined as NumberOfTries - 1, this is because we start at turn '0' and count
# up from there
For($i = 0; $i -le ($NumberOfTries - 1); $i++) {
   $UsersGuess = [Console]::ReadKey($true).KeyChar

   # Store whether the current loop number is the last.  Otherwise it stays False
   If ($i -eq ($NumberOfTries - 1)) {
        $PlayerOnLastTurn = $True
   }

   If ($UsersGuess -eq $SecretCode) {
        $PlayerGuessedTheCode= $True
        break
   }
   Else {
        If($SecretCode -gt $UsersGuess) {
            Write-Host 'LATER'
        }
        Else {
            Write-Host 'EARLIER'
        }
   }
}

If ($PlayerGuessedTheCode-eq $True) {
    Write-Host 'TICK...FZZZ...CLICK'
    # Store the standard version of the 'you did it' message as a variable.  Add 'just'
    # to it afterwards if the player was on their last turn.
    $YouDidItMessage = 'YOU DID IT'
    If($PlayerOnLastTurn -eq $True) {
        $YouDidItMessage += '.  JUST'
    }
    Write-Host $YouDidItMessage
}
Else {
    Write-Host 'BOOOOOOOOMM...'
    Write-Host 'YOU BLEW IT.'
    Write-Host "THE CORRECT CODE WAS $SecretCode"
}

Write-Host
Write-Host 'Original Code (c) Usbourne Publishing'
Write-Host 'Available to view here: http://www.usborne.com/catalogue/feature-page/computer-and-coding-books.aspx'
Write-Host 'PowerShell Update by Simon J. Painter'
Write-Host 'https://github.com/madSimonJ'

[Console]::ReadKey($true)