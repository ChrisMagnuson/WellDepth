
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
        (($Fahrenheit + 459.67) * (5/9))
    } elseif ($Celsius) {
        ($Celsius + 273.15)
    }

    [PSCustomObject]@{} | 
    Add-Member -MemberType NoteProperty -PassThru -Name Kelvin -Value $TemperatureInKelvin |
    Add-Member -MemberType ScriptProperty -PassThru -Name Fahrenheit -Value {
        ($this.Kelvin * (9/5) - 459.67)
    } |
    Add-Member -MemberType ScriptProperty -Name Celsius -PassThru -Value {
        ($This.Kelvin - 273.15)
    }
    
}

function Get-ElkremDepthOfWell {
    $LengthofTimeToEchoInSeconds = 0.018
    $Temperature = Get-Temperature -Fahrenheit 92
    $SpeedOfSound = Get-SpeedOfSoundMetersPerSecond -Temperature $Temperature
    $SoundTravelDistanceInMeters = $LengthofTimeToEchoInSeconds * $SpeedOfSound
}

function Get-SpeedOfSoundMetersPerSecond {
    param (
        $Temperature
    )
    331.4 + (.6 * $Temperature.Celsius)
}
