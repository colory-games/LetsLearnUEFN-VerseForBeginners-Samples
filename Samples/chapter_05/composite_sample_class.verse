using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# Define the custom class "class_sample".
class_sample := class<concrete>:
    
    @editable
    var IntVar : int = 10

    @editable
    var FloatVar : float = 1.0

    MyFunc() : void =
        set IntVar = IntVar * 2
        set FloatVar = FloatVar * 2
        Print("Class Func")

# Define the Device "composite_sample_class" that uses "class_sample".
composite_sample_class := class(creative_device):

    # Define a "class_sample" type field (no initial value).
    @editable
    ClassVar1 : class_sample = class_sample{}

    # Define a "class_sample" type field (with initial values).
    @editable
    ClassVar2 : class_sample =
        class_sample{IntVar := 20, FloatVar := 10.0}

    OnBegin<override>()<suspends> : void =
        Print("[Composite sample (Class)]")

        # Get/Set field values of an instance stored in the "class_sample" variable.
        var LocalVar : class_sample = class_sample{}
        set LocalVar.IntVar = ClassVar1.IntVar + ClassVar2.IntVar
        set LocalVar.FloatVar = ClassVar1.FloatVar + ClassVar2.FloatVar
        Print("LocalVar Int : {LocalVar.IntVar}")
        Print("LocalVar Float : {LocalVar.FloatVar}")

        # Call a method on an instance stored in the "class_sample" variable.
        ClassVar2.MyFunc()
        Print("ClassVar2 Int: {ClassVar2.IntVar}")
        Print("ClassVar2 Float: {ClassVar2.FloatVar}")