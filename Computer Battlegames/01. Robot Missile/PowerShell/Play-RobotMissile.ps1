Write-Host 'ROBOT MISSILE'
Write-Host ''
Write-Host 'TYPE THE CORRECT CODE'
Write-Host 'LETTER (A-Z) TO'
Write-Host 'DEFUSE THE MISSILE'
Write-Host 'YOU HAVE 4 CHANCES'
Write-Host ''

# N.B - Get-Random's Maximum paramter should be made one higher
# than the highest number you want to generate.  In the example
# below, a number between 97 and 122 (inclusive) will be generated
$SecretCodeAsNumber = Get-Random -Minimum 97 -Maximum 123

# Cast a number into a character with the same ASCII value - e.g 97 = A, 98 =B, etc.
# See here: http://www.asciitable.com/  for more information about ASCII values
$SecretCode = [Char]$SecretCodeAsNumber

# A variable to store whether the user won.  Initially set to False, and
# will remain False, unless they win
$TheUserGuessedTheCode = $False

# Loop around 4 times, with the variable $i having the
# initial value of 0, then incrementing with each loop
# up to the vaue of 3
For($i = 0; $i -le 3; $i++) {
    # Read a keystroke from the console.  There is another method available
    # called Read-Host, but that has the user enter any amount of text
    # they want, followed by return.  Tapping into the console's ReadKey
    # function allows the capture of a single key-press.  Console is a
    # .NET Static Class accessed via PowerShell.  .Net functions are called
    # using :: instead of a .
   $UsersGuess = [Console]::ReadKey($true).KeyChar

    # If the user's guess equals the Secret Code
   If ($UsersGuess -eq $SecretCode) {
        # Store that the user has won, and terminate the
        # loop early, rather than keep the user guessing
        $TheUserGuessedTheCode = $True
        break
   }
   Else {
        # Write a hint to the user, based on whether the Secret Code
        # is higher or lower in the alphabet than the last guess
        If($SecretCode -gt $UsersGuess) {
            Write-Host 'LATER'
        }
        Else {
            Write-Host 'EARLIER'
        }
   }
}

If ($TheUserGuessedTheCode -eq $True) {
    Write-Host 'TICK...FZZZ...CLICK'
    Write-Host 'YOU DID IT'
}
Else {
    Write-Host 'BOOOOOOOOMM...'
    Write-Host 'YOU BLEW IT.'
    # Note here that double-quotes are used instead of single-quotes.  In
    # PowerShell, Double-Quotes are used for interpolated strings - i.e. strings
    # made of a mix of text and variable values
    Write-Host "THE CORRECT CODE WAS $SecretCode"
}

Write-Host
Write-Host 'Original Code (c) Usbourne Publishing'
Write-Host 'Available to view here: http://www.usborne.com/catalogue/feature-page/computer-and-coding-books.aspx'
Write-Host 'PowerShell Update by Simon J. Painter'
Write-Host 'https://github.com/madSimonJ'

[Console]::ReadKey($true)