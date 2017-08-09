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
