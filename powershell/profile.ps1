Set-PSReadLineOption -EditMode Emacs

Set-Alias d ls
#Set-Alias head 'Select-Object -first 10'
#Set-Alias tail 'Select-Object -last 10'
function recursive-size-report {

}

function prompt {
    # original source: https://blog.belibug.com/post/ps-profile-01/
    $curPath = (Get-Location).Path
    $curTime = Get-Date -Format 'h:mm'
    Write-Host $curPath -ForegroundColor Magenta    -NoNewline
    Write-Host ' :: '         -ForegroundColor Cyan  -NoNewline
    Write-Host $curTime -ForegroundColor Green -NoNewline
    Write-Host ' > '          -ForegroundColor Cyan -NoNewline
    return ' '
}

function Compute-Factorial {
    param (
        [int]$N
    )

    echo Fact $N
    if ( $N -eq 0 ) {
        return [int]1
    } else {
        return [int]($N * (Compute-Factorial ($N - 1) ))
    }
}
Set-Alias fact Compute-Factorial

function dirsize {
<#
.SYNOPSIS

.DESCRIPTION

.PARAMETERS

.EXAMPLES
#>
    $sum = 0
    ls | foreach {
        if ($_.GetType().Name -eq "DirectoryInfo") {

        } else {
            $sum += $_.length
        }
    }
    $sum
}
