using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# Define the custom module "module_sample_1".
module_sample_1 := module:
    
    # Define a function in the module.
    Module1Func1<public>() : void=
        Print("Module1 Func1")

    # A function without the "public" specifier.
    Module1Func2() : void=
        Print("Module1 Func2")

    # Define a constant in the module.
    IntConst1<public> : int = 5

    # A constant without the "public" specifier.
    IntConst2 : int = 10

module_sample_2 := module:
    
    Module2Func1<public>():void=
        Print("Module2 Func1")

# Required to use the functions and constants defined in module "module_sample_2".
using { module_sample_2 }

# Define the Device "composite_sample_module" that uses "module_sample_1".
composite_sample_module := class(creative_device):

    OnBegin<override>()<suspends> : void =
        Print("[Composite sample (Module)]")

        # Use the function and constant defined in "module module_sample_1".
        module_sample_1.Module1Func1()
        var LocalVarA : int = module_sample_1.IntConst1

        # Use the function defined in "module module_sample_2".
        Module2Func1()
        module_sample_2.Module2Func1()    # Both codes have the same behavior.

        <# Build Error Example

        # Without the "using" expression, you must specify the module when using functions, constants, and others.
        Module1Func1()
        var LocalVarB : int = IntConst1

        # You cannot use functions, constants, and others without the "public" specifier.
        module_sample_1.Module1Func2()
        var LocalVarC : int = module_sample_1.IntConst2

        #>