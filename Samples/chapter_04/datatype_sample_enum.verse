using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/UI }    # Required to use enumerations.

datatype_sample_enum := class(creative_device):

    # Define a "orientation" type constant.
    @editable
    OrientVar1 : orientation = orientation.Horizontal

    @editable
    OrientVar2 : orientation = orientation.Horizontal

    # Define a "horizontal_alignment" type field.
    @editable
    var HorizonVar : horizontal_alignment = horizontal_alignment.Center

    OnBegin<override>()<suspends> : void =
        Print("[DataType sample (Enum)]")

        # Define a "horizontal_alignment" type local variable. Set the value of "HorizonVar" to the variable.
        var LocalVar : horizontal_alignment = horizontal_alignment.Center
        set LocalVar = HorizonVar

        # Branch by the "OrientVar1" value with the "if" expression.
        if (OrientVar1 = orientation.Horizontal):
            Print("Success1")
        else:
            Print("Failure1")

        # Branch by the "OrientVar1" value with the "case" expression.
        case (OrientVar1):
            orientation.Horizontal =>
                Print("Case : Horizontal")
            orientation.Vertical =>
                Print("Case : Horizontal")

        # Call the method "MyFunc" whose argument types are enumerations.
        MyFunc(OrientVar1, OrientVar2)

    # Define the method "MyFunc" whose argument types are enumerations.
    MyFunc(In1 : orientation, In2 : orientation) : void =
        if (In1 = In2):
            Print("Success2")