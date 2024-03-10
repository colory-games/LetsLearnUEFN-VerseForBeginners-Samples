using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

device_sample_arithmetic := class(creative_device):

    @editable
    MyVar1 : int = 10

    @editable
    MyVar2 : int = 5

    @editable
    MyVar3 : float = 5.0

    OnBegin<override>()<suspends> : void =
        Print("[Device sample (Arithmetic)]")

        # Define the "int" type variable "MyVarA" and set the following calculated values.
        # "MyVar1 + MyVar2 * 2 + 10 = 10 + 5 * 2 + 10 = 30"
        var MyVarA : int = 0
        set MyVarA = MyVar1 + MyVar2 * 2 + 10
        Print("Out1 : {MyVarA}")

        # Define the "float" type variable "MyVarB" and set the following calculated values.
        # "(MyVar3 + 10.0) / 3.0 - 1.0 = (5.0 + 10.0) / 3.0 - 1.0 = 4.0"
        var MyVarB : float = (MyVar3 + 10.0) / 3.0 - 1.0
        Print("Out2 : {MyVarB}")
        
        # Add the value "1.0" to "MyVarB"
        set MyVarB += 1.0
        Print("Out3 : {MyVarB}")

        <# Build Error Example

        # You cannot set an "int" type value of a division result to an "int" type variable.
        var MyVarC : int = 8 / 2

        #>