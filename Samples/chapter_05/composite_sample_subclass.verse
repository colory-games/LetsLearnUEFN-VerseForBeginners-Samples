using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

composite_sample_superclass := class(creative_device):
    
    @editable
    SuperVar : int = 0

    SuperFunc1() : void =
        Print("SuperFunc1 super")

    SuperFunc2() : void =
        Print("SuperFunc2 super")

# Define the Device "composite_sample_subclass" that inherits from "composite_sample_superclass".
composite_sample_subclass := class(composite_sample_superclass):

    # Override the field defined in the superclass.
    @editable
    SuperVar<override> : int = 10

    # Define a "composite_sample_superclass" type field.
    # The field can store an instance of "composite_sample_superclass" or "composite_sample_subclass".
    @editable
    SampleDevice : composite_sample_superclass =
        composite_sample_superclass{}

    OnBegin<override>()<suspends> : void =
        Print("[Composite sample (Subclass)]")

        # Call the method defined in the superclass.
        SuperFunc1()
        SuperFunc2()    # The overridden process is executed.
        
        # Call the specific class method. Executed the method "SuperFunc2" process defined in superclass.
        (composite_sample_superclass:)SuperFunc2()

        # Call the method on an instance stored in the "composite_sample_superclass" type variable. The called process depends on whether the instance stored in the variable is the superclass or the subclass.
        SampleDevice.SuperFunc2()

    # Override the method defined in the superclass.
    SuperFunc2<override>() : void =
        (super:)SuperFunc2()
        Print("SuperFunc2 child")