param ([switch]$hideExit, $exitText="Exit", $iconText="Tray Toolbox")

[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')    | out-null
[System.Reflection.Assembly]::LoadWithPartialName('System.Drawing')    | out-null


$icon = [System.Drawing.Icon]::ExtractAssociatedIcon(".\icons\icon.ico") 
$Main_Tool_Icon = New-Object System.Windows.Forms.NotifyIcon
$Main_Tool_Icon.Text = $iconText
$Main_Tool_Icon.Icon = $icon
$Main_Tool_Icon.Visible = $true
$contextmenu = New-Object System.Windows.Forms.ContextMenu
$Main_Tool_Icon.ContextMenu = $contextmenu

#Create exit item
$Menu_Exit = New-Object System.Windows.Forms.MenuItem
$Menu_Exit.Text = $exitText

$Menu_Exit.add_Click({
 $Main_Tool_Icon.Visible = $false
 Stop-Process $pid
}.GetNewClosure())

if(-Not $hideExit){
    $Main_Tool_Icon.contextMenu.MenuItems.add($Menu_Exit)
}


#Adding programs
$newItem = $true

foreach($line in [System.IO.File]::ReadLines(".\programs.txt")){
    if($newItem){
        $Main_Tool_Icon.contextMenu.MenuItems.add((New-Object System.Windows.Forms.MenuItem))
        $Main_Tool_Icon.contextMenu.MenuItems[-1].Text = $line
        $newItem = $false
    }else{
        $Main_Tool_Icon.contextMenu.MenuItems[-1].add_Click({
            Start-Process -FilePath $line
        }.GetNewClosure())
        $newItem = $true
    }
}


$Main_Tool_Icon.add_MouseDown({
    $Main_Tool_Icon.GetType().GetMethod("ShowContextMenu",[System.Reflection.BindingFlags]::Instance -bor [System.Reflection.BindingFlags]::NonPublic).Invoke($Main_Tool_Icon,$null)
})


$windowcode = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);'
$asyncwindow = Add-Type -MemberDefinition $windowcode -name Win32ShowWindowAsync -namespace Win32Functions -PassThru
$null = $asyncwindow::ShowWindowAsync((Get-Process -PID $pid).MainWindowHandle, 0)
[System.GC]::Collect()
$appContext = New-Object System.Windows.Forms.ApplicationContext
[void][System.Windows.Forms.Application]::Run($appContext)