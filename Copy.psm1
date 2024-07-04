class Copy {
    [string] $fromPath
    [string] $toPath

    [void] Main() {
        $this.Greetings()
    
        if (-not (Test-Path $this.fromPath)) {
            Write-Host "The source path does not exist."
            return
        }
    
        if (-not (Test-Path $this.toPath)) {
            mkdir $this.toPath
        }
        
        $_path = $this.fromPath + "/*"
        $files = Get-ChildItem -Path $_path
    
        $child_count = $files.Count
        $progress = 0
        $i = 0
    
        foreach ($file in $files) {
            $progress = [System.Math]::floor(($i / $child_count) * 100)
            Write-Progress -Activity "Copying files" -Status "$progress% Complete:" -PercentComplete $progress
            
            $destination = Join-Path $this.toPath $file.Name
            Copy-Item -Path $file.FullName -Destination $destination
            
            Start-Sleep -Milliseconds 250
            $i++
        }
    
        Write-Host "Copying Complete"
    }

    [void] CopyFiles($from, $to) {
        Copy-Item -Path $from -Destination $to
    }

    [void] Greetings() {
        Write-Host "Hello from Copy v1.0."
    }
}