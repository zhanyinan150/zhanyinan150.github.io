# ============================================================
#  一键发布脚本 publish.ps1
#  用法: 在博客目录下双击运行,或在 PowerShell 里执行 .\publish.ps1
#  功能: 生成页面 -> 部署上线 -> 提交源码备份
# ============================================================

# 切到脚本所在目录(即博客根目录)
Set-Location -Path $PSScriptRoot

Write-Host ""
Write-Host "===== 1/4  清理旧的生成文件 =====" -ForegroundColor Cyan
npx hexo clean

Write-Host ""
Write-Host "===== 2/4  生成静态页面 =====" -ForegroundColor Cyan
npx hexo generate

# ---- 部署步骤带重试(git push 偶发 TLS 抖动)----
Write-Host ""
Write-Host "===== 3/4  部署到 GitHub Pages =====" -ForegroundColor Cyan
$maxRetry = 3
$success = $false
for ($i = 1; $i -le $maxRetry; $i++) {
    Write-Host "  尝试部署 (第 $i/$maxRetry 次)..." -ForegroundColor DarkGray
    npx hexo deploy
    if ($LASTEXITCODE -eq 0) {
        $success = $true
        break
    }
    Write-Host "  部署失败,可能是网络抖动,稍后重试..." -ForegroundColor Yellow
    Start-Sleep -Seconds 3
}

if (-not $success) {
    Write-Host ""
    Write-Host "部署失败!请检查网络后重新运行本脚本,或手动执行: npx hexo deploy" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "===== 4/4  提交源码备份到 source 分支 =====" -ForegroundColor Cyan
git add -A
# 仅当有改动时才提交
$status = git status --porcelain
if ($status) {
    $msg = Read-Host "  输入本次提交说明(回车用默认)"
    if ([string]::IsNullOrWhiteSpace($msg)) { $msg = "更新博客内容" }
    git commit -m $msg
    git push
    Write-Host "  源码已备份。" -ForegroundColor Green
} else {
    Write-Host "  源码无改动,跳过提交。" -ForegroundColor DarkGray
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  发布完成!1-2 分钟后访问:" -ForegroundColor Green
Write-Host "  https://zhanyinan150.github.io/" -ForegroundColor White
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Read-Host "按回车键关闭窗口"
