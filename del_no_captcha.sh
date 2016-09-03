#! /bin/bash
# 下面这行列出要删掉 key 的命名空间前缀，有几个写几个，可以用 redis desktop manager 先查看实例看到，不包含验证码的前缀 88
#for mode in 01 02 03 04 10 11 65 71 77 78 79 81 83 84 92 98 log
#for mode in 98
#do
#  for key in $(redis-cli -p 6385 -c keys $mode":*" | cut -f2 -d ")")
#  do
#    redis-cli -p 6385 -c del "$key"
#    redis-cli -p 6386 -c del "$key"
#  done
#done

# 验证码保留1000 条
for key in $(seq 1001 1000000)
do
  echo $key
  redis-cli -p 6385 -c del "88:$key"
  redis-cli -p 6386 -c del "88:$key"
done
