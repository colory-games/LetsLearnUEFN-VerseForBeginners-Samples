using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

device_sample_for := class(creative_device):

    @editable
    var MyVar1 : int = 5

    @editable
    MyVar2 : int = 10

    OnBegin<override>()<suspends> : void =
        Print("[Device sample (For)]")

        var MyLocalVar : int = 0
        for (Count := 0..10):
            # Executed repeatedly with the "Count" variable changing from "0" to "10" (11 times in total).
            set MyLocalVar += Count
            Print("For1 count : {Count}, {MyLocalVar}")

        # The following code is executed only once because it is outside the "for" block.
        Print("For1 end")    

        for (Count := 0..20; Count >= MyVar1):
            # Executed repeatedly with the "Count" variable changing from "0" to "20" (21 times in total).
            # Executed only if the "Count" value is greater than or equal to the "MyVar" value.
            Print("For2 count : {Count}")
        
        for (Count := 0..10; MyVar1 >= MyVar2; MyVar2 > 0):
            # Executed repeatedly with the "Count" variable changing from "0" to "10" (11 times in total).
            # Executed only if "the MyVar1 value is greater than or equal to the MyVar2 value" and "the MyVar2 value is greater than 0".
            set MyVar1 += 1
            Print("For3 count : {Count}")