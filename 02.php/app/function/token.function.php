<?php

//declare(strict_types=1);

//生成token
function FunCreateToken($userRoleId, $userName)
{
    $nowTime = time();
    $startTime = $nowTime;
    $endTime = $startTime + 86400;
    $part1 = $userRoleId . '.' . $userName . '.' . $startTime . '.' . $endTime;
    $part2 = hash_hmac('md5', $part1, SIGNATURE);
    return $part1 . '.' . $part2;
}

//校验token
function FunCheckToken($token)
{
    //判断是否为空
    if (!isset($token) || empty($token)) {
        FunMessageExit(401, 0, '非法请求');
    }

    //校验token格式
    if (substr_count($token, '.') != 4) {
        FunMessageExit(401, 0, '非法请求');
    }

    $arr = explode('.', $token);

    //校验token格式
    foreach ($arr as $value) {
        if (trim($value) == '') {
            FunMessageExit(401, 0, '非法请求');
        }
    }

    //检验token内容
    $part1 =  hash_hmac('md5', $arr[0] . '.' . $arr[1] . '.' . $arr[2] . '.' . $arr[3], SIGNATURE);
    $part2 = $arr[4];
    if ($part1 != $part2) {
        FunMessageExit(401, 0, '非法请求');
    }

    //校验是否过期
    if (time() > $arr[3]) {
        FunMessageExit(401, 0, '登录过期');
    }
}
