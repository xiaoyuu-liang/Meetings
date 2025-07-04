#!/bin/bash

# 查找所有 .md 文件（包括子目录）
find . -name "*.md" | while read mdfile; do
    echo "Processing $mdfile"

    ###### 1. 移动 Markdown 格式图片引用文件 ######
    grep -oE '!\[[^]]*\]\(([^)]+\.png|jpg|jpeg|gif)\)' "$mdfile" | \
    sed -E 's/.*\(([^)]+)\)/\1/' | while read imgpath; do
        if [ -f "$imgpath" ]; then
            echo "Moving Markdown image $imgpath → ../assets/images/"
            mv "$imgpath" ../assets/images/
        fi
    done

    ###### 2. 移动 HTML 格式 <img src="..."> 图片 ######
    grep -oE 'src="[^"]+\.(png|jpg|jpeg|gif)"' "$mdfile" | \
    sed -E 's/src="([^"]+)"/\1/' | while read imgpath; do
        if [ -f "$imgpath" ]; then
            echo "Moving HTML image $imgpath → ../assets/images/"
            mv "$imgpath" ../assets/images/
        fi
    done

    ###### 3. 替换 Markdown 图片路径 ######
    sed -i '' 's#](assets/images/#](../assets/images/#g' "$mdfile"

    ###### 4. 替换 HTML 图片路径 ######
    sed -i '' 's#src="assets/images/#src="../assets/images/#g' "$mdfile"
    sed -i '' 's#src="/Users/liangxiaoyu/Library/Application Support/typora-user-images/#src="../assets/images/#g' "$mdfile"

done

