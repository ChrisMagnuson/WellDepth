Describe -Name "Temperature Conversions" -Fixture {    
    it -name "Test with starting value in Kelvin"  {
        Get-Temperature -Kelvin 32
        Get-Temperature -Fahrenheit 90
    }
}