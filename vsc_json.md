```bash
$ ~/.config/Code/User/settings.json
```

```json
"ruby.intellisense": "rubyLocate",/*solargraphコード補完*/
"ruby.useLanguageServer": true,

"solargraph.definitions": true,
"solargraph.diagnostics": true

"editor.tabSize": 2,
"editor.insertSpaces": true,

"code-runner.executorMap": {
	"shellscript": "cd $workspaceRoot; bash $fullFileName",
  "ruby": "cd $workspaceRoot; ruby $fullFileName",
  "typescript": "cd $dir; JSF=\"$fileNameWithoutExt.js\"; [ -e \"${JSF}\" ] && read -p 'Overwrite file: '${JSF}', continue with Enter...'; tsc $fileName; cd $workspaceRoot",
  "typescript": "cd $dir; JSF=\"$fileNameWithoutExt.js\"; tsc $fileName; cd $workspaceRoot"
},
"code-runner.ignoreSelection": true,
"code-runner.clearPreviousOutput": true,
"code-runner.runInTerminal": true
```



```bash
$ ~//.config/Code/User/keybindings.json
```

```json
// 既定値を上書きするには、このファイル内にキー バインドを挿入します
[
  {
    "key": "ctrl+tab",
    "command": "workbench.action.nextEditor"
  },
  {
    "key": "ctrl+shift+tab",
    "command": "workbench.action.previousEditor"
  }
]
```