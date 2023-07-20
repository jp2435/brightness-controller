param (
    [int]$Brightness  # Parâmetro para o valor de brilho (de 0 a 100)
)

$Monitor = Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightnessMethods
$Monitor.WmiSetBrightness(1, $Brightness)
