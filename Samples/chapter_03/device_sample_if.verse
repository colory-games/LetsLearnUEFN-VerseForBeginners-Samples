using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

device_sample_if := class(creative_device):

    @editable
    MyVar1 : int = 1

    @editable
    MyVar2 : int = 2
    
    OnBegin<override>()<suspends> : void =
        Print("[Device sample (If)]")

        if (MyVar1 < MyVar2):
            # Executed if the "MyVar1" value is less than the "MyVar2" value.
            var TempVar : int = MyVar1 + MyVar2
            Print("If1 success : {TempVar}")

        # The following code is always executed because it is outside the "if" block.
        Print("If1 end")    

        if (MyVar1 > 0 or MyVar2 < 10):
            # Executed if the "MyVar1" value is greater than "0" or "MyVar2" is less than "10".
            var TempVar : int = MyVar1 - MyVar2 
            Print("If2 success : {TempVar}")

        if ((MyVar1 > 5 and MyVar2 > 5) or MyVar2 < 10 ):
            # Executed if "the MyVar1 value is greater than 5 and the MyVar2 value is greater than 5" or "the MyVar2 value is less than 10".
            Print("If3 success3")

        var MyLocalVar : int = 0

        if (MyVar1 + MyVar2 = 0):
            # Executed if the value of "MyVar1 + MyVar2" is equal to "0".
            set MyLocalVar = MyVar1 + MyVar2 
            Print("If4 success")
            
            # You can write another "if" expression within an "if" block.
            if (MyVar1 >= 10):
                # Executed if the "MyVar1" value is "10" or more.
                Print("If5 success")
            else:
                # Executed if the condition "MyVar1 >= 10" is not met.
                Print("If5 failure")
        else:
            # Executed if the condition "MyVar1 + MyVar2 = 0" is not met.
            set MyLocalVar = MyVar1 - MyVar2 
            Print("If4 failure")
            
        Print("If4 : {MyLocalVar}")

        if (not MyVar1 < 0):
            # Executed if "MyVar1" is not less than "0" (is "failure").
            Print("If6 success1")
        else if (MyVar2 < 0):
            # Executed if the above condition ("not MyVar1 < 0") is not met and the "MyVar2" value is less than "0".
            Print("If6 success2")
        else if (MyVar2 < 10):
            # Executed if none of the above conditions ("not MyVar1 < 0" or "MyVar2 < 0") are met and the "MyVar2" value is less than "10".
            Print("If6 success3")
        else:
            Print("If6 failure")