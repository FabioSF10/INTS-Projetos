# ============================================================
# LIMPEZA DE PERFIS ANTIGOS
# Remove perfis sem uso ha mais de 90 dias
# ============================================================

$DiasSemUso = 90
$DataLimite = (Get-Date).AddDays(-$DiasSemUso)

# Perfis que NUNCA devem ser removidos
$UsuariosProtegidos = @(
    "ADM",
    "Administrator",
    "Administrador",
    "Default",
    "Default User",
    "Public",
    "All Users"
)

Clear-Host

Write-Host "============================================="
Write-Host "     LIMPEZA DE PERFIS ANTIGOS DO WINDOWS"
Write-Host "============================================="
Write-Host ""
Write-Host "Computador: $env:COMPUTERNAME"
Write-Host "Data atual: $(Get-Date -Format 'dd/MM/yyyy HH:mm')"
Write-Host "Periodo considerado: $DiasSemUso dias"
Write-Host "Perfis anteriores a: $($DataLimite.ToString('dd/MM/yyyy'))"
Write-Host ""

# ------------------------------------------------------------
# Verifica se foi executado como administrador
# ------------------------------------------------------------

$Admin = ([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole(
    [Security.Principal.WindowsBuiltInRole]::Administrator
)

if (-not $Admin) {

    Write-Host "ERRO: Execute este arquivo como Administrador." -ForegroundColor Red
    Write-Host ""
    Read-Host "Pressione ENTER para sair"
    exit
}

# ------------------------------------------------------------
# Obtém perfis do Windows
# ------------------------------------------------------------

$Perfis = Get-CimInstance Win32_UserProfile |
Where-Object {

    $_.LocalPath -like "C:\Users\*" -and
    -not $_.Special

}

$Candidatos = @()
$Protegidos = @()

foreach ($Perfil in $Perfis) {

    $Usuario = Split-Path $Perfil.LocalPath -Leaf

    # --------------------------------------------------------
    # PERFIL CARREGADO
    # --------------------------------------------------------

    if ($Perfil.Loaded) {

        $Protegidos += [PSCustomObject]@{
            Usuario   = $Usuario
            UltimoUso = $Perfil.LastUseTime
            Motivo    = "Perfil carregado atualmente"
        }

        continue
    }

    # --------------------------------------------------------
    # USUARIO DA LISTA DE PROTECAO
    # --------------------------------------------------------

    if ($UsuariosProtegidos -contains $Usuario) {

        $Protegidos += [PSCustomObject]@{
            Usuario   = $Usuario
            UltimoUso = $Perfil.LastUseTime
            Motivo    = "Usuario protegido"
        }

        continue
    }

    # --------------------------------------------------------
    # SEM DATA DE ULTIMO USO
    # Por seguranca NAO remove automaticamente
    # --------------------------------------------------------

    if ($null -eq $Perfil.LastUseTime) {

        $Protegidos += [PSCustomObject]@{
            Usuario   = $Usuario
            UltimoUso = $null
            Motivo    = "Sem data confiavel de ultimo uso"
        }

        continue
    }

    # --------------------------------------------------------
    # MAIS DE 90 DIAS
    # --------------------------------------------------------

    if ($Perfil.LastUseTime -lt $DataLimite) {

        $Candidatos += $Perfil
    }
}

# ------------------------------------------------------------
# MOSTRA PERFIS PROTEGIDOS / IGNORADOS
# ------------------------------------------------------------

Write-Host "PERFIS PRESERVADOS / IGNORADOS"
Write-Host "------------------------------"

$Protegidos |
Select-Object Usuario,
    @{Name="UltimoUso";Expression={
        if ($_.UltimoUso) {
            $_.UltimoUso.ToString("dd/MM/yyyy HH:mm")
        }
        else {
            "Nao informado"
        }
    }},
    Motivo |
Format-Table -AutoSize

Write-Host ""

# ------------------------------------------------------------
# MOSTRA CANDIDATOS
# ------------------------------------------------------------

Write-Host "PERFIS SEM USO HA MAIS DE $DiasSemUso DIAS"
Write-Host "-------------------------------------------"

if ($Candidatos.Count -eq 0) {

    Write-Host ""
    Write-Host "Nenhum perfil antigo encontrado." -ForegroundColor Green
    Write-Host ""

    Read-Host "Pressione ENTER para sair"
    exit
}

$Candidatos |
Select-Object `
    @{Name="Usuario";Expression={Split-Path $_.LocalPath -Leaf}},
    @{Name="UltimoUso";Expression={$_.LastUseTime.ToString("dd/MM/yyyy HH:mm")}},
    LocalPath |
Format-Table -AutoSize

Write-Host ""
Write-Host "Quantidade de perfis encontrados: $($Candidatos.Count)"
Write-Host ""

# ------------------------------------------------------------
# CONFIRMACAO
# ------------------------------------------------------------

Write-Host "ATENCAO!" -ForegroundColor Yellow
Write-Host ""
Write-Host "Os perfis acima serao removidos do Windows."
Write-Host "Isso inclui os dados armazenados dentro do perfil do usuario."
Write-Host ""
Write-Host "O perfil ADM e perfis atualmente carregados NAO serao removidos."
Write-Host ""

$Confirmacao = Read-Host 'Para continuar, digite exatamente APAGAR'

if ($Confirmacao -ne "APAGAR") {

    Write-Host ""
    Write-Host "Operacao cancelada. Nenhum perfil foi removido." -ForegroundColor Yellow

    Read-Host "Pressione ENTER para sair"
    exit
}

# ------------------------------------------------------------
# CRIA LOG
# ------------------------------------------------------------

$PastaLog = "C:\TI\Logs"

if (-not (Test-Path $PastaLog)) {

    New-Item -Path $PastaLog -ItemType Directory -Force | Out-Null
}

$ArquivoLog = Join-Path $PastaLog `
    "LimpezaPerfis_$($env:COMPUTERNAME)_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"

"Limpeza iniciada em $(Get-Date)" |
Out-File $ArquivoLog -Encoding UTF8

"Computador: $env:COMPUTERNAME" |
Out-File $ArquivoLog -Append -Encoding UTF8

"Periodo: perfis sem uso ha mais de $DiasSemUso dias" |
Out-File $ArquivoLog -Append -Encoding UTF8

"" |
Out-File $ArquivoLog -Append -Encoding UTF8

# ------------------------------------------------------------
# REMOCAO
# ------------------------------------------------------------

foreach ($Perfil in $Candidatos) {

    $Usuario = Split-Path $Perfil.LocalPath -Leaf

    Write-Host ""
    Write-Host "Removendo: $Usuario"

    try {

        Remove-CimInstance -InputObject $Perfil -ErrorAction Stop

        Write-Host "OK - Perfil removido." -ForegroundColor Green

        "$(Get-Date -Format 'dd/MM/yyyy HH:mm:ss') - REMOVIDO - $Usuario - $($Perfil.LocalPath)" |
        Out-File $ArquivoLog -Append -Encoding UTF8
    }

    catch {

        Write-Host "ERRO ao remover $Usuario" -ForegroundColor Red

        "$(Get-Date -Format 'dd/MM/yyyy HH:mm:ss') - ERRO - $Usuario - $($_.Exception.Message)" |
        Out-File $ArquivoLog -Append -Encoding UTF8
    }
}

Write-Host ""
Write-Host "============================================="
Write-Host "              PROCESSO FINALIZADO"
Write-Host "============================================="
Write-Host ""
Write-Host "Log salvo em:"
Write-Host $ArquivoLog
Write-Host ""

Read-Host "Pressione ENTER para sair"