using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

datatype_sample_class_target := class(creative_device):

    @editable
    FloatVar : float = 10.0

    var IntVar : int = 0

    MyFunc(In : int) : int =
        Print("Target IntVar : {IntVar}")
        return IntVar + In

datatype_sample_class := class(creative_device):

    # Define a "item_spawner_device" type field.
    @editable
    ItemSpawner : item_spawner_device =
        item_spawner_device{}

    # Define a "datatype_sample_class_target" type field.
    @editable
    TargetDevice : datatype_sample_class_target =
        datatype_sample_class_target{}

    OnBegin<override>()<suspends> : void =
        Print("[DataType sample (Class)]")

        # Call a method on an instance stored in the variable "ItemSpawner".
        ItemSpawner.SpawnItem()

        # Get/Set a field value of an instance stored in the variable "TargetDevice".
        LocalVarA : float = TargetDevice.FloatVar
        Print("Target FloatVar : {LocalVarA}")
        set TargetDevice.IntVar = 30

        # Call a method on an instance stored in the variable "TargetDevice".
        LocalVarB : int = TargetDevice.MyFunc(20)
        Print("Target Func Return : {LocalVarB}")
        