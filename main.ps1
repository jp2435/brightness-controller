param (
    [int]$Brightness = 5  # Parâmetro opcional para o valor de brilho (padrão é 5)
)

# Obtém o valor atual do brilho do monitor
$Monitor = Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightness
$currentBrightness = $Monitor.CurrentBrightness

# Se o parâmetro de brilho for enviado, adiciona o valor do parâmetro ao brilho atual
$newBrightness = $currentBrightness + $Brightness

# Verifica se o novo valor está dentro do intervalo válido (0 a 100)
$newBrightness = [Math]::Min([Math]::Max($newBrightness, 0), 100)

# Ajusta o brilho para o novo valor incrementado
$MonitorMethods = Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightnessMethods
$MonitorMethods.WmiSetBrightness(1, $newBrightness)
