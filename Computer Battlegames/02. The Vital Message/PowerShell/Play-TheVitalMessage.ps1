Write-Host 'VITAL MESSAGE'
Write-Host ''
Write-Host 'HOW DIFFICULT? (4-10)'

$PlayerMadeAValidChoice = $False
While ($PlayerMadeAValidChoice -ne $True) {
    $DifficultyLevel = [Char][Console]::ReadKey($True).KeyChar
    Write-Host "Difficulty = $DifficultyLevel"
    If([Int]$DifficultyLevel -ge 4 -And $DifficultyLevel -le 10) {
        $PlayerMadeAValidChoice = $True
    }
}

$SecretCode = ''
for($i = 0; i -lt $DifficultyLevel; $i++) {
    $SecretCodeLetterAsNumber = Get-Random -Minimum 97 -Maximum 123
    $SecretCode += [Char]$SecretCodeLetterAsNumber
}

Write-Host "SEND THIS MESSAGE"
Write-Host 
Write-Host $SecretCode

Start-Sleep ($DifficultyLevel * 8)

cls