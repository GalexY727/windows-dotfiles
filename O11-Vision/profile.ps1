Clear-Host
function activate { . .\venv\Scripts\activate } # quickly activates a venv script
function venv { py @($args.Count ? $args : @()) -m venv venv; activate } # allows for venv 3.12 or venv 3.8 to specify version, but is optional

# This "should" be the last line of my profile, but zoxide conflicts with it, so it is the second to last line in my profile.
oh-my-posh init pwsh --config '%USERPROFILE%\GitHub\GalexY727\oh-my-posh-galexy\bubblesextra.omp.json' | Invoke-Expression

zoxide init powershell --cmd cd --hook prompt | Out-String | Invoke-Expression