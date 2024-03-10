using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# Define the custom enumeration "enum_sample".
enum_sample := enum:
    Up
    Down
    Left
    Right

# Define the Device "composite_sample_enum" that uses "enum_sample".
composite_sample_enum := class(creative_device):
    
    # Define a "enum_sample" type field.
    @editable
    var EnumVar : enum_sample = enum_sample.Up

    OnBegin<override>()<suspends> : void =
        Print("[Composite sample (Enum)]")

        # Branch by the "EnumVar" value with the "case" expression.
        case (EnumVar):
            enum_sample.Up =>
                Print("Case : Up")
            enum_sample.Down =>
                Print("Case : Down")
            enum_sample.Left =>
                Print("Case : Left")
            enum_sample.Right =>
                Print("Case : Right")