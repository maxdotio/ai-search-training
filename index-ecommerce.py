#!pip install opensearch-py==2.3.1
from opensearchpy import OpenSearch,helpers
from opensearchpy.helpers import bulk
from tqdm import tqdm
import json
import os

# https://github.com/opensearch-project/opensearch-py/blob/main/USER_GUIDE.md
host = 'localhost'
port = 9200
client = OpenSearch(hosts = [{'host': host, 'port': port}])
info = client.info()
print(f"Welcome to {info['version']['distribution']} {info['version']['number']}!")

def batch_index(folder_path, index_name):
    files = os.listdir(folder_path)
    batch = []
    size = len(files)
    total = size//10

    for i in tqdm(range(0, size, 10), desc='Batch Indexing', total=total):
        current_batch_files = files[i:i+10]
        
        for file_name in current_batch_files:
            with open(os.path.join(folder_path, file_name), 'r') as f:
                doc = json.load(f)
                source = {
                    "title_embedding":doc["vectors"][0],
                    "id": doc["id"],
                    "text": doc["text"],
                    "title": doc["title"],
                    "description": doc["description"],
                    "bullet_point": doc["bullet_point"],
                    "brand": doc["brand"],
                    "color": doc["color"],
                    "asin": doc["asin"],
                    "type": doc["type"],
                    "stars": doc["stars"],
                    "category": doc["category"],
                    "categories": doc["categories"],
                    "price": doc["price"],
                    "template": doc["template"],
                    "image": doc["image"],
                    "locale": doc["locale"],
                    "subtitle": doc["subtitle"],
                    "author": doc["author"],                    
                }
                batch.append({
                    "_index": index_name,
                    "_source": source
                })
                
        bulk(client, batch)
        batch = []
        
# Usage
batch_index('vectors/esci-s_part_00.jsonl', 'ai-search-ecommerce')