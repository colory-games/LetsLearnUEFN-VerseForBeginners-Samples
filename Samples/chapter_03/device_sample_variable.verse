using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

device_sample_variable := class(creative_device):
    
    # Define the "float" type field "MyVar1" with the initial value "1.0".
    var MyVar1 : float = 1.0

    # Define the "float" type field "MyVar2" with the initial value "2.0".
    var MyVar2 : float = 2.0

    # Define the "int" type field "MyVar3" with the initial value "5".
    var MyVar3 : int = 5

    <# Build Error Example

    # You cannot name the same variable name.
    var MyVar3 : int = 3

    # You cannot omit the initial value.
    var MyVar4 : int

    # You cannot set a different type value as the initial value.
    var MyVar5 : float = 3
    
    #>

    OnBegin<override>()<suspends> : void =
        Print("[Device sample (Variable)]")

        # Define the local variable "MyVarA" with the initial value "0.0".
        var MyVarA : float = 0.0
        
        # Define the local variable "MyVarB". The Initial value is the sum of "MyVar1" and "MyVar2".
        var MyVarB : float = MyVar1 + MyVar2

        # Set the sum of "MyVarB" and "10.0" to "MyVarA".
        set MyVarA =  MyVarB + 10.0

        # Output the "MyVarA" value as a log.
        Print("Out1 : {MyVarA}")

        # Define the local variables "MyVarC"/"MyVarD" with the initial values "20"/"3".
        var MyVarC : int = 20
        var MyVarD : int = 3

        # Set the sum of "MyVar3" and "MyVarC" to "MyVar3".
        set MyVar3 = MyVar3 + MyVarC

        # Output the sum of "MyVar3" and "MyVarD" as a log.
        Print("Out2 : {MyVar3 + MyVarD}")

        <# Build Error Example

            # You must write "set" to set a value.
            MyVarA = MyVarB + 10.0

            # You cannot set a different type value.
            set MyVar3 = MyVar2

        #>