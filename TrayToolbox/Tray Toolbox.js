var exitText = 'Exit';
var iconText = 'Tray Toolbox';
var hideExit = false;
var wshShell = new ActiveXObject("WScript.Shell");

String.prototype.trim = function()
{
    return this.replace(/^\s+|\s+$/g, '');
};

var ForReading = 1;
var fso = new ActiveXObject("Scripting.FileSystemObject");
var fileObj = fso.GetFile(".\\config.txt");
var ts = fileObj.OpenAsTextStream(ForReading, 0 );
while(!ts.AtEndOfStream){
    s = ts.ReadLine();
    if(s.substr(0,s.indexOf("=")+1).trim()=="iconText="){
        iconText=s.substr(s.indexOf("=")+1);
    }else if(s.substr(0,s.indexOf("=")+1).trim()=="exitText="){
        exitText=s.substr(s.indexOf("=")+1);
    }else if(s.substr(0,s.indexOf("=")+1).trim()=="hideExit="){
        if(s.substr(s.indexOf("=")+1).trim() == "true"){
            hideExit = true;
        }
    }
}
ts.Close();



if(hideExit){
    wshShell.Run('%SystemRoot%\\system32\\WindowsPowerShell\\v1.0\\powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File "script.ps1" -hideExit -exitText "' + exitText + '" -iconText "' + iconText + '"', 0, false);
}else{
    wshShell.Run('%SystemRoot%\\system32\\WindowsPowerShell\\v1.0\\powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File "script.ps1" -exitText "' + exitText + '" -iconText "' + iconText + '"', 0, false);
}