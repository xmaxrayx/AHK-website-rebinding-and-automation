#Requires AutoHotkey v2.0
#SingleInstance Force



global twitterAHK_GUI__status := 0
global twitterAHK_GUI__ID := 0

;===
global xFix := 100
global yFix := 0

;==
global appLocation_X :=  (" x" ((A_ScreenWidth - xFix) )     )
global ShowAgru := " E0x20  -Caption +AlwaysOnTop"

global appKeyboardMode__str := "Navigation"
global appKeyboardMode := 0



appKeyboardMode__numToStr_Func(){
    switch appKeyboardMode {
        case 0:
            AHKTwitterGUI__textBox.Text := "Navigation"
            AHKTwitterGUI__color := twitterAHK_GUI.BackColor := "0x00FF00"
        case 1:
            AHKTwitterGUI__textBox.Text := "Typing"
            AHKTwitterGUI__color := twitterAHK_GUI.BackColor := "0xfff700"          
        default:
            AHKTwitterGUI__textBox.Text := "Typing"
            AHKTwitterGUI__color := twitterAHK_GUI.BackColor := "0xfff700"   
            
    }
}






{       
    global appKeyboardMode__str := "Navigation"
    twitterAHK_GUI := Gui(" E0x20 ToolWindow -Caption +AlwaysOnTop","twitterAHK")
    global  AHKTwitterGUI__textBox := twitterAHK_GUI.Add("text",,appKeyboardMode__str)
    global AHKTwitterGUI__color := twitterAHK_GUI.BackColor := "0x00FF00"
    
    twitterAHK_GUI.Show(appLocation_X)
    WinWait("twitterAHK")

    global twitterAHK_GUI__ID := WinGetID("twitterAHK")
    WinSetTransparent(60,"twitterAHK" )
    

    twitterAHK_GUI.Hide()
}



; #HotIf WinActive("twitter")
; twitterAHK_GUI.Show()


#HotIf WinActive("twitter.com") 

^Down::sendInput("{Down}")
^up::sendInput("{Up}")


Down::
s::
Space::{
    ; MsgBox
    ; twitterAHK_GUI.Show()
    ; WinActivate("twitter.com")
    ;
    
    global appKeyboardMode

    switch appKeyboardMode {
        case 0:
            SendInput("j")
            Sleep(10)
        case 1:     
            sendInput(A_ThisHotkey)
        case 2: MsgBox
        default:
            appKeyboardMode := 1
            SendInput("{Space}")
    }


}








x::
Up::
w::
{
    ; MsgBox
    ; twitterAHK_GUI.Show()
    ; WinActivate("twitter.com")
    ;
    
    global appKeyboardMode

    switch appKeyboardMode {
        case 0:
            SendInput("k")
            Sleep(10)
        case 1:     
            sendInput(A_ThisHotkey)
        case 2: MsgBox
        default:
            appKeyboardMode := 1
            SendInput("{Space}")
    }


}





#SuspendExempt
~^Space::{
    Suspend
    global appKeyboardMode
switch  appKeyboardMode{
    case 0:
        global appKeyboardMode := 1
        appKeyboardMode__numToStr_Func() 
        AHKTwitterGUI__color := twitterAHK_GUI.BackColor := "0xfff700"
    case 1:
        global appKeyboardMode := 0
        appKeyboardMode__numToStr_Func()    

    default:
        global appKeyboardMode :=0
        appKeyboardMode__numToStr_Func()    
        
}
}
#SuspendExempt False


while !WinActive("twitter.com") {
    WinWaitActive("twitter.com")
    twitterAHK_GUI.Show()

        try{
            WinActivate("twitter.com")
        }catch{
            WinActivateBottom("twitter.com")
        }else{
            WinActivateBottom
        }


        ;==
        ; while appKeyboardMode != 9{
        ;     MsgBox "lol"
        ; }



    
    WinWaitNotActive("twitter.com")
    twitterAHK_GUI.Hide()
    twitterAHK_GUI.Flash
    sleep(10)
}   



;//////
;bugs
;/////

;▶	161: WinActivateBottom("twitter.com")
