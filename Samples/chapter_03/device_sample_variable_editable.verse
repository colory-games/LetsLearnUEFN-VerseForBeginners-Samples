using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

device_sample_variable_editable := class(creative_device):

    # You can edit this value on the Level editor.
    @editable
    var MyVar1 : float = 1.0

    #  You cannot edit this value on the Level editor.
    var MyVar2 : float = 5.0

    # You can edit this value on the Level editor.
    @editable
    var MyVar3 : int = 10

    OnBegin<override>()<suspends> : void =
        Print("[Device sample (Editable variable)]")

        # Output the values as logs.
        # "MyVar1" and "MyVar3" become the values edited on the Level Editor.
        Print("MyVar1 : {MyVar1}")
        Print("MyVar2 : {MyVar2}")
        Print("MyVar3 : {MyVar3}")

        # You can set/get the value of a variable with the "editable" attribute the same as a variable without the attribute.
        set MyVar2 = MyVar1 + 1.0
        Print("Out : {MyVar1}")