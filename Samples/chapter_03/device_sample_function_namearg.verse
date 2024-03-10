using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

device_sample_function_namearg := class(creative_device):

    OnBegin<override>()<suspends> : void =
        Print("[Device sample (Function with name argument)]")


        # Call the function "MyFunc1" whose arguments "In1"/"In2" are "10"/"5" respectively.
        # Set the return value to the constant "LocalConstA".
        LocalConstA : int = MyFunc1(?In1 := 10, ?In2 := 5)
        Print("Out1 : {LocalConstA}")

        # Set the same value as "LocalConstA" to the constant "LocalConstB".
        # You can reorder the named arguments.
        LocalConstB : int = MyFunc1(?In2 := 5, ?In1 := 10)
        Print("Out2 : {LocalConstB}")

        # Call the function "MyFunc2" whose arguments "In1"/"In2"/"In3" are "4"/"5"/"10" respectively.
        # Set the return value to the constant "LocalConstC".
        LocalConstC : int = MyFunc2(4, ?In2 := 5, ?In3 := 10)
        Print("Out3 : {LocalConstC}")

    # Define the method "MyFunc1" (with the "int" type named arguments "In1"/"In2" and the "int" type return value).
    MyFunc1(?In1 : int, ?In2 : int) : int =
        Print("Func1")
        return In1 - In2
 
    # Define the method "MyFunc2" (with the "int" type argument "In1", named arguments "In2"/"In3" and the "int" type return value).
    MyFunc2(In1 : int, ?In2 : int, ?In3 : int) : int =
        Print("Func2")
        return In1 + In2 + In3