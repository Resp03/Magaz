from PIL import Image
import os

# Путь к исходному каталогу с изображениями
source_dir = 'C:/Users/Oleg/django/gazmagaz/media/goods_images'
# Путь к новому каталогу, где будут сохранены измененные изображения
destination_dir = 'C:/Users/Oleg/django/gazmagaz/media/goods_images/new'

# Проверяем, существует ли новый каталог, если нет, то создаем его
if not os.path.exists(destination_dir):
    os.makedirs(destination_dir)

# Перебираем все файлы в исходном каталоге
for filename in os.listdir(source_dir):
    # Проверяем, является ли файл изображением
    if filename.lower().endswith(('.png', '.jpg', '.jpeg', '.bmp', '.gif', '.tiff')):
        # Открываем изображение
        with Image.open(os.path.join(source_dir, filename)) as img:
            # Изменяем размер изображения
            img = img.resize((300, 300))
            # Конвертируем в формат JPEG
            img = img.convert('RGB')
            # Формируем имя нового файла
            new_filename = os.path.splitext(filename)[0] + '.jpg'
            # Сохраняем изображение в новый каталог
            img.save(os.path.join(destination_dir, new_filename), 'JPEG')
