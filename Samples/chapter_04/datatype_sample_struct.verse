using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }    # Required to use structures.

datatype_sample_struct := class(creative_device):

    @editable
    VectorVar1 : vector3 = vector3{}          # Define a "vector3" type field.

    @editable
    VectorVar2 : vector3 = vector3{X:=1.0, Y:=1.0, Z:=1.0}

    @editable
    RotationVar : rotation = rotation{}       # Define a "rotation" type field.

    @editable
    TransformVar : transform = transform{}    # Define a "transform" type field.

    OnBegin<override>()<suspends> : void =
        Print("[DataType sample (Struct)]")

        # Outputs the field values as logs.
        Print("VectorVar1 : {VectorVar1}")
        Print("VectorVar2 : {VectorVar2}")
        Print("RotationVar : {RotationVar}")

        # Get/Set the fields "X", "Y", "Z" of the "vector3" variables.
        var VectorVarA : vector3 = vector3{}
        set VectorVarA.X = VectorVar2.X * 2.0
        set VectorVarA.Y = VectorVar2.Y * 2.0
        set VectorVarA.Z = 0.0
        Print("VectorVarA : {VectorVarA}")

        # Call the functions "Distance" and "Length".
        V12Distance : float = Distance(VectorVar1, VectorVar2)
        V1Length : float = VectorVar1.Length()

        # Call the functions "MakeRotation" and "RotateVector".
        var RotVector : vector3 = vector3{X:=0.0, Y:=1.0, Z:=0.0}
        V2Rotation : rotation =
            MakeRotation(VectorVar2, RadiansToDegrees(30.0))
        set RotVector = V2Rotation.RotateVector(RotVector)
        Print("RotVector : {RotVector}")

        # Call the method "MyFunc" whose arguments and return type are structures.
        ReturnVector : vector3 =
            MyFunc(VectorVar1, VectorVar2, RotationVar)
        Print("ReturnVector : {ReturnVector}")

        # Get/Set the fields of the "transform" variables.
        var TransformVarA : transform = transform{}
        set TransformVarA.Scale = TransformVar.Scale + VectorVar2
        set TransformVarA.Rotation = RotationVar.RotateBy(V2Rotation)
        set TransformVarA.Translation = VectorVar1 + VectorVar2
        Print("TransformVar (Scale) : {TransformVarA.Scale}")
        Print("TransformVar (Rotation) : {TransformVarA.Rotation}")
        Print("TransformVar (Translation) : {TransformVarA.Translation}")

    # Define the method "MyFunc" whose arguments and return type are structures.
    MyFunc(A : vector3, B : vector3, C : rotation) : vector3 =
        LocalVar : vector3 = A + B * 2.0
        return C.RotateVector(LocalVar)
