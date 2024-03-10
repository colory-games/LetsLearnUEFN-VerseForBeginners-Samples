using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

datatype_sample_map := class(creative_device):

    # Define a map type constant with "string" type keys and "int" type values.
    IntMapVar : [string]int = map{"A" => 1, "B" => 3}

    # Define a map type field with "string" type keys and "float" type values.
    var FloatMapVar : [string]float = map{"C" => 5.0, "D" => 10.0}

    OnBegin<override>()<suspends> : void =
        Print("[DataType sample (Map)]")

        # Output the values stored in the map elements as logs.
        # Loop through each element with the "for" expression.
        for (Elem : IntMapVar):
            Print("IntMapVar : {Elem}")
        for (Elem : FloatMapVar):
            Print("FloatMapVar: {Elem}")
        
        # Output the number of elements in "IntMapVar" as a log.
        Print("IntMapVar Length : {IntMapVar.Length}")

        # The reason for writing the following code in the "if:" block is related to failure (described later).
        # If you don't write the code in the "if:" block, a build error will occur.
        if:
            # Get the element value of the "A" key.
            FloatMapVarElem : float = FloatMapVar["A"]

            # Set the element value of the "B" key.
            set FloatMapVar["B"] = 20.0

