using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }

# Define the custom structure "struct_sample_1".
struct_sample_1 := struct<concrete><computes>:

    @editable
    FloatVar : float = 0.0

    @editable
    IntVar : int = 0

    @editable
    VectorVar : vector3 = vector3{}

    NonEditableVar : float = 0.0

    <# Build Error Example

    # You must not write "var".
    var IntVar1 : int = 2

    # You cannot define a function.
    MyFunc() : void =
        Print("Func")

    #>

# Define the custom structure "struct_sample_1" without the "concrete" and "computes" specifiers.
struct_sample_2 := struct:
    
    @editable
    FloatVar : float = 0.0

# Define the Device "composite_sample_struct" that uses "struct_sample_1" and "struct_sample_2".
composite_sample_struct := class(creative_device):

    # Define a "struct_sample_1" type field (no initial value).
    @editable
    var StructVar1 : struct_sample_1 = struct_sample_1{}

    # Define a "struct_sample_1" type field (with initial values).
    @editable
    var StructVar2 : struct_sample_1 =
       struct_sample_1{FloatVar := 10.0, IntVar := 10,
                       VectorVar := vector3{X := 1.0, Y := 2.0, Z := 3.0},
                       NonEditableVar := 1.0}

    var StructVar3 : struct_sample_2 = struct_sample_2{}

    <# Build Error Example

    # You cannot specify the "editable" attribute to a variable of a structure type without the "concrete" specifier.
    @editable
    var StructVar4 : struct_sample_2 = struct_sample_2{}

    #>

    OnBegin<override>()<suspends> : void =
        Print("[Composite sample (Struct)]")

        # Get/Set field values of the "struct_sample_1" type variable.
        var LocalStructVar : struct_sample_1 = struct_sample_1{}
        set LocalStructVar.FloatVar =
            StructVar1.FloatVar + StructVar2.FloatVar
        set LocalStructVar.IntVar =
            StructVar1.IntVar + StructVar2.IntVar
        set LocalStructVar.VectorVar =
            StructVar1.VectorVar + StructVar2.VectorVar
        Print("LocalStructVar Float : {LocalStructVar.FloatVar}")
        Print("LocalStructVar Int : {LocalStructVar.IntVar}")
        Print("LocalStructVar Vector : {LocalStructVar.VectorVar}")

        <# Build Error Example

        # You cannot set a value to a field of a structure type without the "computes" specifier.
        set StructVar3.FloatVar = 1.0

        #>