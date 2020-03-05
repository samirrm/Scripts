$ie = New-Object -ComObject InternetExplorer.Application
    $ie.Visible = $True

    $ie.Navigate('https://github.com/login')

    While($ie.Busy -eq $True){
        Start-Sleep -Milliseconds 100
    }

    ($ie.Document.getElementsByName("login") | Select-Object -Unique).Value = "otto.gori@concrete.com.br"

    ($ie.Document.getElementsByName("commit") | Select-Object -Unique).Click()

    While($ie.Busy -eq $True){
        Start-Sleep -Milliseconds 100
    }

    $monitor =  [System.Windows.Forms.SystemInformation]::PrimaryMonitorSize

    $bounds = [Drawing.Rectangle]::FromLTRB(0, 0, $monitor.Width, $monitor.Height)

    $bmp = New-Object Drawing.Bitmap $bounds.width, $bounds.height

    $graphics = [Drawing.Graphics]::FromImage($bmp)

    $graphics.CopyFromScreen($bounds.Location, [Drawing.Point]::Empty, $bounds.size)

    $bmp.Save("$HOME\print.png")

    $graphics.Dispose()
    $bmp.Dispose()

    Invoke-Item "$HOME\print.png"

    $ie.Quit()