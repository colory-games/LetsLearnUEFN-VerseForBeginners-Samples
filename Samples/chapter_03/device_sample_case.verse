using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

device_sample_case := class(creative_device):

    @editable
    MyVar : int = 0

    OnBegin<override>()<suspends> : void =
        Print("[Device sample (Case)]")

        var MyLocalVar : int = 0

        case (MyVar):
            0 =>
                # Executed if the "MyVar" value is "0".
                set MyLocalVar = 1
                Print("Case 0")
            1 =>
                # Executed if the "MyVar" value is "1".
                set MyLocalVar = 2
                Print("Case 1")
            _ =>
                # Executed if none of the above conditions are met.
                set MyLocalVar = 3
                Print("Case default")
        # The following code is always executed because it is outside the "case" block.
        Print("Case end : {MyLocalVar}")

        <# Build Error Example

        # You cannot omit the default case.
        case (MyVar):
            0 =>
                Print("Case 0")
            1 =>
                Print("Case 1")
                
        # You cannot specify a variable for a case value.
        case (MyVar):
            MyLocalVar =>   
                Print("Case 0")
            _ =>
                Print("Case 1")

        #>