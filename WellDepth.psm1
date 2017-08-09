$LengthofTimeToEcho = 0.018
$SpeedOfSound

function Get-Temperature {
    [CmdletBinding(DefaultParameterSetName="All")]
    param (
        [Parameter(Mandatory,ParameterSetName="Fahrenheit")]$Fahrenheit,
        [Parameter(Mandatory,ParameterSetName="Celsius")]$Celsius,
        [Parameter(Mandatory,ParameterSetName="Kelvin")]$Kelvin
    )    
    $TemperatureInKelvin = if ($Kelvin) { 
        $Kelvin 
    } elseif ($Fahrenheit) {
        (($Fahrenheit + 459.67) * 5/9)
    } elseif ($Celsius) {
        ($Celsius + 273.15)
    }

    [PSCustomObject]@{} | 
    Add-Member -MemberType NoteProperty -PassThru -Name Kelvin -Value $TemperatureInKelvin |
    Add-Member -MemberType ScriptProperty -PassThru -Name Fahrenheit -Value {
        ($this.Kelvin * 9/5 - 459.67)
    } |
    Add-Member -MemberType ScriptProperty -Name Celsius -PassThru -Value {
        ($This.Kelvin + 273.15)
    }
    
}

function Get-ElkremDepthOfWell {
    
    $TemperatureInFahrenheit
}

function Get-SpeedOfSoundMetersPerSecond {
    param (
        $TemperatureInCelsius
    )
    331.4 + (.6 * $TemperatureInCelsius)
}

#function ConvertTo-Fahrenheit {
#    [CmdletBinding(DefaultParameterSetName="All")]
#    param (
#        [Parameter(Mandatory,ValueFromPipelineByPropertyName,ParameterSetName="Celsius")]$Celsius,
#        [Parameter(Mandatory,ValueFromPipelineByPropertyName,ParameterSetName="Kelvin")]$Kelvin
#    )
#    if ($Celsius) {
#        Get-Temperature -Fahrenheit ((($Celsius * 9) / 5) + 32)
#    } elseif ($Kelvin) {
#        Get-Temperature -Fahrenheit ($Kelvin * 9/5 - 459.67)
#    }
#}
#
#function ConvertTo-Celsius {
#    [CmdletBinding(DefaultParameterSetName="All")]
#    param (
#        [Parameter(Mandatory,ValueFromPipelineByPropertyName,ParameterSetName="Fahrenheit")]$Fahrenheit,
#        [Parameter(Mandatory,ValueFromPipelineByPropertyName,ParameterSetName="Kelvin")]$Kelvin
#    )
#    if ($Fahrenheit) { 
#        Get-Temperature -Celsius (($Fahrenheit - 32) * 5/9)
#    } elseif ($Kelvin) {
#        Get-Temperature -Celsius ($Kelvin + 273.15)
#    }
#}
#
#function ConvertTo-Kelvin {
#    [CmdletBinding(DefaultParameterSetName="All")]
#    param (
#        [Parameter(Mandatory,ValueFromPipelineByPropertyName,ParameterSetName="Celsius")]$Celsius,
#        [Parameter(Mandatory,ValueFromPipelineByPropertyName,ParameterSetName="Fahrenheit")]$Fahrenheit
#    )
#    if ($Celsius) { 
#        Get-Temperature -Kelvin ($Celsius + 273.15)
#    } elseif ($Fahrenheit) {
#        Get-Temperature -Kelvin (($Fahrenheit + 459.67) * 5/9)
#    }
#}