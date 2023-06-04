## Python

### 给出优化当前文件夹及子文件夹内所有图片的文件大小的 python 代码

对于优化当前文件夹及其子文件夹中所有图片的文件大小，你可以使用 Python 的 Pillow 库（PIL）来重新保存这些图片，选择更高的压缩质量或调整图片的尺寸。以下是一个示例代码，它会递归遍历文件夹并优化所有图片文件的大小：

```python
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
input_folder = 'path/to/input/folder'
output_folder = 'path/to/output/folder'

# 调用优化函数
optimize_images(input_folder, output_folder, quality=80, max_size=(800, 800))
```

你可以根据需要调整`quality`参数以选择压缩质量，以及使用`max_size`参数调整图片的尺寸。请确保将`input_folder`和`output_folder`替换为实际的文件夹路径。注意，原始文件夹中的图片将不会被修改，而是在`output_folder`中保存优化后的图片。

### 给出转换当前文件夹及子文件夹下所有文件名到大写的 python 代码，不包含后缀名

当使用 Python 时，可以使用`os`和`os.path`模块来遍历文件夹及其子文件夹，然后使用字符串的`upper()`方法将文件名转换为大写。下面是一个示例代码：

```python
import os

def convert_filenames_to_uppercase(folder_path):
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            file_name, file_extension = os.path.splitext(file)
            new_file_name = file_name.upper()
            old_file_path = os.path.join(root, file)
            new_file_path = os.path.join(root, new_file_name + file_extension)
            os.rename(old_file_path, new_file_path)

# 使用当前文件夹作为示例
current_folder = os.getcwd()
convert_filenames_to_uppercase(current_folder)
```

在这个示例中，`convert_filenames_to_uppercase`函数接受一个文件夹路径作为参数，并使用`os.walk`遍历文件夹及其子文件夹。对于每个文件，它使用`os.path.splitext`函数来获取文件名和文件扩展名，然后使用`upper()`方法将文件名转换为大写。最后，使用`os.rename`函数将文件重命名为新的大写文件名。

请确保在运行此代码之前备份重要的文件，以防出现意外情况。

### 给出压缩输入文件夹并显示压缩进度的 python 代码

要在 Python 中压缩输入文件夹并显示压缩进度，你可以使用`shutil`和`tqdm`模块。`shutil`模块用于进行文件和文件夹操作，而`tqdm`模块用于显示进度条。以下是一个示例的 Python 代码：

```python
import shutil
from tqdm import tqdm

def compress_folder_with_progress(input_folder, output_zip):
    total_size = shutil.disk_usage(input_folder).used
    progress_bar = tqdm(total=total_size, unit='B', unit_scale=True)

    def progress_callback(complete, total):
        progress_bar.n = complete
        progress_bar.refresh()

    shutil.make_archive(output_zip, 'zip', input_folder, progress_callback=progress_callback)
    progress_bar.close()

# 使用示例
input_folder = '/path/to/input_folder'
output_zip = '/path/to/output_zip.zip'
compress_folder_with_progress(input_folder, output_zip)
```

在这个示例中，`compress_folder_with_progress`函数接受输入文件夹路径和输出压缩文件路径作为参数。它使用`shutil.disk_usage`函数获取输入文件夹的总大小，并使用`tqdm`模块创建一个进度条。在`make_archive`函数中，我们通过`progress_callback`参数将进度回调函数传递给`shutil`模块，以便在压缩过程中更新进度条。

请确保在运行此代码之前已经安装了`tqdm`模块，并将`input_folder`和`output_zip`变量替换为实际的文件夹路径和输出压缩文件的路径。

## Shell

### 给出压缩输入文件夹并显示压缩进度的 shell 代码

要压缩输入文件夹并显示压缩进度，你可以使用`pv`命令结合`zip`命令。`pv`是一个用于监视进度的实用程序。以下是一个示例的 Shell 代码：

```shell
zip -r input_folder.zip input_folder | pv -lep -s $(du -sb input_folder | awk '{print $1}') > /dev/null
```

在这个示例中，`input_folder.zip`是要创建的压缩文件的名称，`input_folder`是要压缩的输入文件夹的路径。

该命令通过使用管道将`zip`命令的输出重定向到`pv`命令。`du -sb input_folder`用于获取输入文件夹的总大小，并使用`awk`命令提取文件夹大小值。`-s`选项用于指定总大小。

`pv`命令的选项`-lep`用于显示估计时间、行号和进度百分比。

最后，`> /dev/null`将输出重定向到空设备，以防止在终端上显示压缩文件的内容。

确保在运行此代码之前，你已经安装了`pv`命令和`zip`命令，并将命令行的当前目录设置为合适的位置，以便正确指定输入文件夹的路径。
