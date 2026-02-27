$listener = [System.Net.HttpListener]::new()
$listener.Prefixes.Add('http://localhost:3456/')
$listener.Start()
Write-Host 'Servidor rodando em: http://localhost:3456/' -ForegroundColor Green
Start-Process 'http://localhost:3456/'
while ($listener.IsListening) {
    $context = $listener.GetContext()
    $request = $context.Request
    $response = $context.Response
    $file = Join-Path $PSScriptRoot 'index.html'
    $content = [System.IO.File]::ReadAllBytes($file)
    $response.ContentType = 'text/html; charset=utf-8'
    $response.OutputStream.Write($content, 0, $content.Length)
    $response.Close()
}
