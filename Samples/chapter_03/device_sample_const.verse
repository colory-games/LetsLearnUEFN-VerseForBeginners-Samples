using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

device_sample_const := class(creative_device):

    # Define the "float" type constant "MyConst1" with the value "1.0".
    MyConst1 : float = 1.0

    # Define the "float" type constant "MyConst2" with the value "2.0."
    MyConst2 : float = 2.0     


    # Define the "float" type constant "MyConst3" with the value "0.0".
    @editable             # You can edit the value on the Level Editor.
    MyConst3 : float = 0.0

    # Define the "float" type field "MyVar1" with the value "5.0".
    var MyVar1 : float = 5.0

    <# Build Error Example
        
    # You cannot omit a constant type in this block.
    MyConst4 := 3.0

    #>

    OnBegin<override>()<suspends> : void =
        Print("[Device sample (Const)]")

        # Define the local constant "MyConstA" with the value "4.0".
        MyConstA : float = 4.0

        # Define the local constant "MyConstA" with the sum of "MyConst1" and "MyConstA".
        MyConstB : float = MyConst1 + MyConstA
        Print("Out1 : {MyConstB}")

        # You can omit the type of a local constant. "MyConstC" automatically becomes a "float" type.
        MyConstC := 20.0

        # Set the sum of "MyConst2" and "MyConst3" to "MyVar1".
        set MyVar1 =  MyConst2 + MyConst3
        Print("Out2 : {MyVar1}")

        <# Build Error Example
        
        # You cannot set a value to a constant.
        set MyConst1 = 5    
        
        #>