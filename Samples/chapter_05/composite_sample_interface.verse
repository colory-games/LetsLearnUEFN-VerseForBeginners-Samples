using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# Define the custom interface "interface_sample_1".
interface_sample_1 := interface:

    # Define a method in the interface.
    MyFunc1(In1 : float, In2 : float) : void

    <# Build Error Example

    # You must not write the process of a function.
    MyFunc() : void =
        Print("Error")

    #>

# Define an interface that inherits from another interface.
interface_sample_2 := interface(interface_sample_1):

    # Define a method in the interface.
    MyFunc2() : void

# Define the "Device composite_sample_interface" that inherits from "interface_sample_2".
composite_sample_interface := class(creative_device, interface_sample_2):

    OnBegin<override>()<suspends> : void =
        Print("[Composite sample (Interface)]")

        # Call the methods defined in the interfaces.
        MyFunc1(1.0, 2.0)
        MyFunc2()

    # Override the methods defined in parent interfaces.
    # If you don't override all methods, a build error will occur.
    MyFunc1<override>(In1 : float, In2 : float) : void =
        LocalVar : float = In1 + In2
        Print("MyFunc1 : {LocalVar}")

    MyFunc2<override>() : void =
        Print("MyFunc2")