using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# Define a Device whose class name is "device_sample_class".
# Specify "creative_device" for the superclass.
device_sample_class := class(creative_device):

    OnBegin<override>()<suspends> : void =
        Print("[Device sample (Class)]")