local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

PROMPT='%{$fg[white]%}%~%{$reset_color%}
${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c%{$fg_bold[blue]%}%{$fg_bold[blue]%}%{$reset_color%}> '
