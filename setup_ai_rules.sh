#!/bin/bash

# 设置正确的字符编码
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# 函数：将字符串转换为小写
to_lowercase() {
    echo "$1" | tr '[:upper:]' '[:lower:]'
}

# 函数：复制.ai文件夹
copy_ai_folder() {
    local root_dir="$1"
    if [ -d ".ai" ]; then
        cp -r .ai "$root_dir"
        echo "已将.ai文件夹复制到 $root_dir"
    else
        echo "错误：当前目录中没有找到.ai文件夹"
        exit 1
    fi
}

# 函数：复制特定语言的.cursorrules文件
copy_language_rules() {
    local root_dir="$1"
    local language="$2"
    local language_dir=$(to_lowercase "$language")
    
    echo "正在查找 /$language_dir/.cursorrules 文件..."
    cursorrules_file=$(pwd)/$language_dir/.cursorrules
    echo $cursorrules_file
    if [ -f "$cursorrules_file" ]; then
        cp "$cursorrules_file" "$root_dir"
        echo "已将 $language_dir/.cursorrules 文件复制到 $root_dir"
    else
        echo "错误：未找到 $language_dir/.cursorrules 文件"
        exit 1
    fi
}

# 函数：显示语言选择菜单
select_language() {
    echo "请选择语言：" >&2
    select lang in "Solidity" "Swift" "退出"; do
        case $lang in
            "Solidity")
                echo "solidity"
                return 
                ;;
            "Swift")
                echo "swift"
                return
                ;;
            "退出")
                echo "exit"
                return
                ;;
            *)
                echo "无效选择，请重试" >&2
                ;;
        esac
    done
}

# # 主程序
echo "请输入根目录路径："
read -r root_dir

if [ ! -d "$root_dir" ]; then
    echo "错误：指定的根目录不存在"
    exit 1
fi

language=$(select_language)

if [ "$language" = "exit" ]; then
    echo "操作已取消"
    exit 0
fi

echo "选择的语言: $language"

copy_ai_folder "$root_dir"
copy_language_rules "$root_dir" "$language"

echo "设置完成！"