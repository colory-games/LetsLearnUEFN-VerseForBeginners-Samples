using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

device_sample_loop := class(creative_device):

    @editable
    var MaxCount : int = 10

    OnBegin<override>()<suspends> : void =
        Print("[Device sample (Loop)]")

        var Count : int = 0

        loop:
            Print("Loop count : {Count}")
            set Count += 1
        
            # If the "Count" value reaches the "MaxCount" value, the loop process is terminated.
            if (Count = MaxCount):
                Print("Loop count : End")
                break

        # The following code is executed only once because it is outside the "loop" block.
        Print("Loop end")    