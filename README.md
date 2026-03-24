site muito legal usando JAVA 🥲

## Colocar `:` em uma variável de batch
No batch do Windows o caractere `:` pode ir normalmente no valor de uma variável — apenas não use `set /a`, que é voltado para contas. Use aspas para evitar espaços extras:

```bat
@echo off
setlocal

set "mensagem=Saí às 15:30"
set "horario=%time:~0,5%"   rem captura a hora atual já com os dois pontos

echo %mensagem%
echo Horário atual: %horario%
endlocal
```

Se precisar escapar o caractere (por exemplo, logo no início de uma linha), use `^:`. Para remover os dois pontos (por exemplo, ao formar um nome de arquivo), use substituição: `set "horario=%time::=%"`.
