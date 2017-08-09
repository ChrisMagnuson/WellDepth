Describe -Name "Temperature Conversions" -Fixture {    
    it -name "Test with starting value in Kelvin"  {
        Get-Temperature -Kelvin 32
        $Kelvin = 32        
        ConvertTo-Fahrenheit -Kelvin $Kelvin | select -Property Kelvin | should be $Kelvin
        ConvertTo-Celsius -Kelvin $Kelvin | select -Property Kelvin | should be $Kelvin
    }
}