import os
from PIL import Image

def optimize_images(folder_path, output_folder, quality=90, max_size=None):
    # 创建输出文件夹
    os.makedirs(output_folder, exist_ok=True)

    # 遍历文件夹及子文件夹
    for root, _, files in os.walk(folder_path):
        for file in files:
            # 获取文件的绝对路径
            file_path = os.path.join(root, file)
            # 检查文件扩展名是否为图片类型
            if file_path.lower().endswith(('.jpg', '.jpeg', '.png', '.gif')):
                try:
                    # 打开图片并优化
                    with Image.open(file_path) as img:
                        # 调整图片尺寸
                        if max_size is not None:
                            img.thumbnail(max_size, Image.ANTIALIAS)

                        # 设置压缩质量并保存图片
                        img.save(os.path.join(output_folder, file), optimize=True, quality=quality)
                except:
                    pass  # 忽略无法打开的文件或无效的图片文件

# 示例用法
# input_folder = 'path/to/input/folder'
# output_folder = 'path/to/output/folder'

input_folder = input('')
output_folder = input('')

# 调用优化函数
optimize_images(input_folder, output_folder, quality=100, max_size=(800, 800))
