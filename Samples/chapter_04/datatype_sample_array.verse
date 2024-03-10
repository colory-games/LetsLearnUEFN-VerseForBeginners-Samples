using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }    # Required to use structures.

datatype_sample_array := class(creative_device):

    # Define an array type constant with "int" type elements.
    @editable
    IntArrayVar1 : []int = array{}

    # Define an array type field with "int" type elements.
    @editable
    var IntArrayVar2 : []int = array{1, 3, 5}

    # Define an array type constant with "vector3" type elements.
    @editable
    VectorArrayVar : []vector3 = array{vector3{}, vector3{}}

    OnBegin<override>()<suspends> : void =
        Print("[DataType sample (Array)]")

        # Output the values contained in the array elements as logs.
        # Loop through each element with the "for" expression.
        for (Elem : IntArrayVar1):
            Print("IntArrayVar1 : {Elem}")
        for (Elem : IntArrayVar2):
            Print("IntArrayVar2 : {Elem}")
        for (Elem : VectorArrayVar):
            Print("VectorArrayVar : {Elem}")

        # Output the number of elements in "IntArrayVar1" as a log.
        Print("IntArrayVar1 Length : {IntArrayVar1.Length}")

        # Define "IntArrayVarA". Set the array with elements of "IntArrayVar1" and "10, 20" to "IntArrayVarA".
        var IntArrayVarA : []int = array{}
        set IntArrayVarA = IntArrayVar1 + array{10, 20}
        for (Elem : IntArrayVarA):
            Print("IntArrayVarA elem : {Elem}")

        # Call the method "MyFunc" whose arguments and return type are arrays.
        ReturnArray : []int = MyFunc(IntArrayVar2, 2)
        for (Elem : ReturnArray):
            Print("ReturnArray : {Elem}")

        # The reason for writing the following code in the "if:" block is related to failure (described later).
        # If you don't write the code in the "if:" block, a build error will occur.
        if:
            # Get the 3rd element value of "IntArrayVar2".
            IntArrayVar2Elem : int = IntArrayVar2[2]

            # Set the 3rd element value of "IntArrayVar2".
            set IntArrayVar2[2] = 5

            # Call the function "RemoveElement".
            IntArrayVar1.RemoveElement[2]

    # Define the method "MyFunc" whose arguments and return type are arrays.
    MyFunc(InArray : []int, InInt : int) : []int =
        var LocalArray : []int = array{}
        for(Count := 0..InInt):
            set LocalArray = LocalArray + array{Count}
        return LocalArray
