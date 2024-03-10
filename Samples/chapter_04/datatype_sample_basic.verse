using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

datatype_sample_basic := class(creative_device):

    @editable
    var FloatVar : float = 2.0           # Define a "float" type field.

    @editable
    var IntVar : int = 10                # Define a "int" type field.

    @editable
    var LogicVar : logic = true          # Define a "logic" type field.

    var CharVar : char = 'b'             # Define a "char" type field.

    @editable
    var StringVar : string = "Hello!"    # Define a "string" type field.

    OnBegin<override>()<suspends> : void =
        Print("[DataType sample (Basic)]")

        # Outputs the field values as logs.
        Print("FloatVar1 : {FloatVar}")
        Print("IntVar1 : {IntVar}")
        Print("char1 : {CharVar}")
        Print("string1 : {StringVar}")

        # Define local constants.
        set FloatVar = FloatVar + 2.0
        set IntVar = IntVar + 5
        set LogicVar = false
        set CharVar = 'c'
        set StringVar = StringVar + "World!"
        Print("FloatVar2 : {FloatVar}")
        Print("IntVar2 : {IntVar}")
        Print("char2 : {CharVar}")
        Print("string2 : {StringVar}")

        # Manipulate strings.
        StringInt  : string = ToString(IntVar)
        StringFloat  : string = ToString(FloatVar)
        StringOut : string = StringInt + " & " + StringFloat
        Print("Out : {StringOut}")