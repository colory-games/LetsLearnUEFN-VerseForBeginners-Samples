using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

device_sample_function := class(creative_device):

    @editable
    MyVar1 : int = 10

    var MyVar2 : int = 0

    OnBegin<override>()<suspends> : void =
        Print("[Device sample (Function)]")

        # Call the method "MyFunc1".
        MyFunc1()

        # Call the method "MyFunc2" whose argument "In" value is "5".
        # Set the return value to the field "MyVar2".
        set MyVar2 = MyFunc2(5)
        Print("Func2 out : {MyVar2}")

        # Call the function "MyFunc3" whose arguments "In1"/"In2"/"In3" values are "MyVar1"/"2"/"5" respectively.
        # Set the return value to the local constant "MyConstA".
        MyConstA : int = MyFunc3(MyVar1, 2, 5)
        Print("Func3 out : {MyConstA}")

        # Call the method "MyFunc4". Change the field "MyVar2" value in the method.
        MyFunc4()
        Print("Var : {MyVar2}")

        # Set the sum of the return values of "MyFunc2(5)" and "MyFunc2(10)" to the local constant "MyConstB".
        # The set value is "MyFunc2(5) + MyFunc2(10) = 10 + 20 = 30".
        MyConstB : int = MyFunc2(5) + MyFunc2(10)
        Print("Out1 : {MyConstB}")

        # Call "MyFunc2" with the return value of "MyFunc2(5)" as an argument.
        # Set the return value of "MyFunc2(MyFunc2(5))" to the local constant "LocalConstC".
        # The set value is "MyFunc2(MyFunc2(5)) = MyFunc2(10) = 20".
        LocalConstC : int = MyFunc2(MyFunc2(5))
        Print("Out2 : {LocalConstC}")

    # Define the method "MyFunc1" (no arguments and no return value).
    MyFunc1() : void =
        Print("Func1")

    # Define the method "MyFunc2" (with the int type argument "In" and the "int" type return value).
    MyFunc2(In : int) : int =
        Print("Func2")
        var LocalVar : int = In * 2
        return LocalVar

    # Define the method "MyFunc3" (with the "int" type arguments "In1"/"In2"/"In3" and the "int" type return value).
    MyFunc3(In1 : int, In2 : int, In3 : int) : int =
        Print("Func3")
        return In1 + In2 + In3

    # Define the method "MyFunc4" (no arguments and no return value).
    MyFunc4() : void =
        Print("Func4")

        # Set the sum of the fields "MyVar1" and "MyVar2" to the local variable "LocalVar".
        # Fields are available in all methods.
        # Local variables are available only within the method that defines them.
        var LocalVar : int = MyVar1 + MyVar2
        Print("Func4 local : {LocalVar}")

        # Set the sum of "MyVar1" and "MyVar2" to the field "MyVar2".
        set MyVar2 += MyVar1