using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

device_sample_comment := class(creative_device):

    OnBegin<override>()<suspends> : void =
        Print("[Device sample (Comment)]")

        Print("Test1")   # XXXXX
        Print("Test2")   # XXXXX

        Print("Test1" <# XXXXX #>)
        <# XXXXX
        XXXXX #>
        Print("Test2")

        Print("Test1")
        <#>
            XXXXX
            XXXXX
            XXXXX
        Print("Test2")