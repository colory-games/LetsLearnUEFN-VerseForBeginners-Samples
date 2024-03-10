using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }    # Required to use structures.

datatype_sample_tuple := class(creative_device):

    # Define a tuple type field with "int" and "float" type elements.
    TupleVar1 : tuple(int, float) = (1, 10.0)

    TupleVar2 : tuple(int, float) = (2, 5.0)

    OnBegin<override>()<suspends> : void =
        Print("[DataType sample (Tuple)]")

        # Get the 1st/2nd element values of the tuple type variables "TupleVar1"/"TupleVar2".
        IntConstA : int = TupleVar1(0) + TupleVar2(0)
        FloatConstA : float = TupleVar1(1) + TupleVar2(1)

        # Define a tuple type variable "TupleVarA" with "int" and "float" type elements.
        # Set the "IntConstA" and "FloatConstA" values to the variable.
        var TupleVarA : tuple(int, float) = (0, 0.0)
        set TupleVarA = (IntConstA, FloatConstA)
        Print("TupleVarA : {TupleVarA(0)}, {TupleVarA(1)}")

        # Call the method "MyFunc" whose argument and return type are tuples.
        ReturnTuple :tuple(int, float) = MyFunc(TupleVar1, 10)
        Print("ReturnTuple : {ReturnTuple(0)}, {ReturnTuple(1)}")

        # Define the tuple type variable "TupleVarB" with "vector3" and "float" type elements.
        # Set the "VectorConstB" and "FloatConstB" values as the initial value.
        var TupleVarB : tuple(vector3, float) = (vector3{}, 0.0)
        VectorConstB : vector3 = vector3{X:= 1.0, Y := 2.0, Z := 3.0}
        FloatConstB : float = TupleVar1(1) + TupleVar2(1)
        set TupleVarB = (VectorConstB, FloatConstB)

    # Define the method "MyFunc" whose argument and return type are tuples.
    MyFunc(In1 : tuple(int, float), In2 : int) : tuple(int, float) =
        var LocalTupleVar : tuple(int, float) = (In1(0) * In2, In1(1))
        return LocalTupleVar

