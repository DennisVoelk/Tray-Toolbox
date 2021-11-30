# Tray-Toolbox
This tool allows you to launch any program from a simple menu sitting in your system tray.
<br>Just click on the icon and select your application from the context menu!

![Preview](https://i.imgur.com/pAH0vs9.png)

<br>



### **Setup/Installation**

Simply drag the "TrayToolbox" folder to any location and start the application by clicking on "Tray Toolbox.js".

<br>



### **Adding new applications**
Make sure Tray Toolbox isn't running (Click "Exit" or stop the process in your task manager).<br>Open the "programs.txt" file. Type in the name of the application (this text will appear in the context menu) and add the path to your application in the next line. <br>**Make sure the file doesn't contain any empty lines!**<br>Start Tray Toolbox.

*Example:*

    Taskmanager
    C:\Windows\System32\Taskmgr.exe
    Mixer
    C:\Windows\System32\SndVol.exe

<br>



### **Run at startup**
Press Win+R, type in "shell:startup", hit enter and create a shortcut to the "Tray Toolbox.js" file.

<br>



### **Hiding the exit-button**
Make sure Tray Toolbox isn't running (Click "Exit" or stop the process in your task manager).<br>Open the "context.txt" file and change "hideExit=false" to "hideExit=true". <br>If you change the text to "hideExit=false" again, the button will reappear.<br>Start Tray Toolbox.

*Example:*

    hideExit=true

<br>



### **Editing the exit-button text**
Make sure Tray Toolbox isn't running (Click "Exit" or stop the process in your task manager).<br>Open the "context.txt" file. And change "exitText=Exit" to "exitText=Your Text". <br>Start Tray Toolbox.

*Example:*

    exitText=Quit

<br>



### **Editing the icon text**
Make sure Tray Toolbox isn't running (Click "Exit" or stop the process in your task manager).<br>Open the "context.txt" file. And change "iconText=Tray Toolbox" to "iconText=Your Text". <br>Start Tray Toolbox.

*Example:*

    iconText=Toolbox

<br>



### **Changing the icon**
Make sure Tray Toolbox isn't running (Click "Exit" or stop the process in your task manager).<br>Go to the "icons" folder and replace the "icon.ico" file with your icon-file. <br>**Make sure the file is also named "icon.ico"!**<br>Start Tray Toolbox.
