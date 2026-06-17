# ============================================================
#  本地预览脚本 preview.ps1
#  用法: 在博客目录下运行 .\preview.ps1
#  功能: 启动本地预览服务器,浏览器访问 http://localhost:4000/
#        按 Ctrl+C 停止
# ============================================================

Set-Location -Path $PSScriptRoot

Write-Host ""
Write-Host "正在启动本地预览..." -ForegroundColor Cyan
Write-Host "浏览器打开:  http://localhost:4000/" -ForegroundColor Green
Write-Host "按 Ctrl+C 停止服务" -ForegroundColor DarkGray
Write-Host ""

npx hexo server
