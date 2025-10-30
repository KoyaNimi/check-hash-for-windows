#ファイルハッシュ値(チェックサム)計算スクリプト

# ハッシュ値計算の対象フォルダを指定
$TargetFolder = "C:\test"

# 計算結果の出力先を指定
$OutputFile = Join-Path -Path $env:USERPROFILE -ChildPath "Desktop\checksums.txt" # デスクトップ


# ハッシュ値計算
Get-ChildItem -Path $TargetFolder -Recurse | # 対象フォルダに存在するフォルダ内もチェック
    Where-Object {-not $_.PSIsContainer} | # 計算対象からフォルダを除外
    Get-FileHash -Algorithm SHA256 |
    Select-Object Path, Hash |
    Sort-Object Path | # 出力順序を固定
    Out-File $OutputFile