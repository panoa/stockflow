# -*- coding:utf-8 -*-

import requests
import zipfile
import codecs

def download_file(url):
    """
    URL を指定してカレントディレクトリにファイルをダウンロードする
    """
    filename = url.split('/')[-1]
    r = requests.get(url, stream=True)

    with open(filename, 'wb') as f:
        for chunk in r.iter_content(chunk_size=1024):
            if chunk:
                f.write(chunk)
                f.flush()
        return filename

    # ファイルが開けなかった場合は False を返す
    return False

def encode(filename):
    index = 0
    with open(filename, "rb") as fp:
        for line in fp:
            print(line)

            if index > 5:
                break

            index += 1

def zip_extract(filename):
    """
    ファイル名を指定して zip ファイルをカレントディレクトリに展開する
    """
    target_directory = '.'
    zfile = zipfile.ZipFile(filename)
    zfile.extractall(target_directory)

if __name__ == "__main__":
    # 郵便局の郵便番号データをダウンロード
    url = 'http://stock-databox.net/y180330.zip'
    filename = download_file(url)
    zip_extract(filename)

    encode("y180330.txt")

    if filename:
        print('{} is downloaded.'.format(filename))
