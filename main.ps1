param (
    [int]$Brightness = 5,        # Parâmetro opcional para o valor de brilho (padrão é 5)
    [switch]$BrightnessReset     # Parâmetro opcional para redefinir o brilho para um valor específico
)

# Função para obter o valor atual do brilho do monitor
function Get-Brightness {
    Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightness | ForEach-Object { $_.CurrentBrightness }
}

# Função para ajustar o brilho do monitor para um valor específico
function Set-Brightness {
    param (
        [int]$NewBrightness  # O valor de brilho a ser ajustado
    )
    $MonitorMethods = Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightnessMethods
    $MonitorMethods.WmiSetBrightness(1, $NewBrightness)
}

# Obter o valor atual do brilho do monitor
$currentBrightness = Get-Brightness

# Se o parâmetro "BrightnessReset" for usado, definir o brilho para o valor especificado
if ($BrightnessReset) {
    Set-Brightness $Brightness
}
else {
    # Se o parâmetro de brilho for enviado, adiciona o valor do parâmetro ao brilho atual
    $newBrightness = $currentBrightness + $Brightness

    # Verifica se o novo valor está dentro do intervalo válido (0 a 100)
    $newBrightness = [Math]::Min([Math]::Max($newBrightness, 0), 100)

    # Ajusta o brilho para o novo valor incrementado
    Set-Brightness $newBrightness
}
