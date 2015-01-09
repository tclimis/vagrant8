$programfiles=${env:ProgramFiles(x86)}
if($programfiles -eq "") {
    $programfiles=${env:ProgramFiles}
}

function make-link
{
    $link = $args[0];
    $dest = $args[1];
    if(test-path "$link") {
        rm "$link"
    }
    cmd /c mklink  "$link" "$dest"
}

write-host "Dot net dev tools"
choco install visualstudiocommunity2013dex -source 'c:\vagrant'
cinst NuGet.CommandLine 
make-link "c:\Users\All Users\Desktop\VS2013" "$programfiles\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe"

