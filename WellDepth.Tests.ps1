Import-Module -Force WellDepth

Describe -Name "Temperature Conversions" -Fixture {    
    it -name "Test with starting value of 32 Kelvin"  {
        $Temperature = Get-Temperature -Kelvin 32
        $Temperature.Kelvin | should be 32
        $Temperature.Fahrenheit | should be -402.07
        $Temperature.Celsius | should be -241.15
    }

    it -name "Test with starting value of 90 Fahrenheit"  {
        $Temperature = Get-Temperature -Fahrenheit 90
        $Temperature.Kelvin | should be 305.372222222222
        $Temperature.Fahrenheit | should be 90
        $Temperature.Celsius | should be -183.15
    }

    it -name "Test with starting value of 20 Celsius"  {
        $Temperature = Get-Temperature -Celsius 20
        $Temperature.Kelvin | should be 293.15
        $Temperature.Fahrenheit | should be 67.9999999999999
        $Temperature.Celsius | should be 20
    }
}