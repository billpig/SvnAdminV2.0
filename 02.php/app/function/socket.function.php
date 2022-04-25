<?php

//declare(strict_types=1);

/**
 * 与守护进程通信
 */
function FunShellExec($shell)
{
    $socket = socket_create(AF_INET, SOCK_STREAM, SOL_TCP) or die("error:" . socket_strerror(socket_last_error()));
    $server = socket_connect($socket, IPC_ADDRESS, (int)IPC_PORT);
    socket_write($socket, $shell);
    $reply = socket_read($socket, (int)SOCKET_READ_LENGTH);
    socket_close($socket);
    return $reply;
}

/**
 * 守护进程状态探测
 * 0 超时
 * 1 打开
 * 2 关闭
 */
function FunDetectState()
{
    $sock = socket_create(AF_INET, SOCK_STREAM, SOL_TCP);


    @socket_connect($sock, IPC_ADDRESS, (int)IPC_PORT);

    socket_set_nonblock($sock);


    socket_set_block($sock);

    $v = array($sock);

    $state = @socket_select($r = $v, $w = $v, $f = $v, 5);

    socket_close($sock);

    return $state;
}
