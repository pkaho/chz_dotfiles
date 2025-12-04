# ╭───────────────────────────────────────────────────────────╮
# │ 脚本导入                                                  │
# ╰───────────────────────────────────────────────────────────╯

# 使用 `.` 保持脚本变量在当前会话中
. "$PSScriptRoot/alias.ps1"
. "$PSScriptRoot/scoop.ps1"

# ╭───────────────────────────────────────────────────────────╮
# │ 按键映射配置                                              │
# ╰───────────────────────────────────────────────────────────╯

# 设置编辑模式为 Emacs 风格
Set-PSReadLineOption -EditMode Emacs

# 单词导航
Set-PSReadLineKeyHandler -Chord Ctrl+LeftArrow  -Function BackwardWord
Set-PSReadLineKeyHandler -Chord Ctrl+RightArrow -Function NextWord

# 单词删除
Set-PSReadLineKeyHandler -Chord Ctrl+Backspace -Function BackwardDeleteWord

# 补全菜单
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# 历史命令搜索
Set-PSReadlineKeyHandler -Key UpArrow   -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# ╭───────────────────────────────────────────────────────────╮
# │ 第三方工具初始化                                          │
# ╰───────────────────────────────────────────────────────────╯

# Starship 提示符配置
function Invoke-Starship-TransientFunction {
    &starship module character
}

function Invoke-Starship-PreCommand {
    # 设置 WezTerm OSC7 集成，新窗格同步路径
    $current_location = $executionContext.SessionState.Path.CurrentLocation
    if ($current_location.Provider.Name -eq "FileSystem") {
        $ansi_escape = [char]27
        $provider_path = $current_location.ProviderPath -replace "\\", "/"
        $osc7_code = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}$ansi_escape\"
        $host.ui.Write($osc7_code)
    }
}

# 初始化 Starship
Invoke-Expression (&starship init powershell)
Enable-TransientPrompt

# 初始化 Zoxide (智能目录跳转)
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# 初始化 Scoop 搜索
Invoke-Expression (&scoop-search --hook)

# 导入 Gsudo 模块
Import-Module "gsudoModule"

