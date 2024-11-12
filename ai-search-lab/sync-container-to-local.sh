#!/bin/bash
SOURCE_CONTAINER="ai-search-ai-search-lab-1"
SOURCE_DIR="/home/jovyan/notebooks"
DESTINATION_DIR="notebooks"
docker cp "$SOURCE_CONTAINER":"$SOURCE_DIR/01-color-distance.ipynb" "$DESTINATION_DIR"
docker cp "$SOURCE_CONTAINER":"$SOURCE_DIR/01a-dot-product.ipynb" "$DESTINATION_DIR"
docker cp "$SOURCE_CONTAINER":"$SOURCE_DIR/02-sentence-transformer.ipynb" "$DESTINATION_DIR"
docker cp "$SOURCE_CONTAINER":"$SOURCE_DIR/03-index-opensearch.ipynb" "$DESTINATION_DIR"
docker cp "$SOURCE_CONTAINER":"$SOURCE_DIR/04-query-hybrid.ipynb" "$DESTINATION_DIR"
docker cp "$SOURCE_CONTAINER":"$SOURCE_DIR/05-RAG.ipynb" "$DESTINATION_DIR"
docker cp "$SOURCE_CONTAINER":"$SOURCE_DIR/06-Text2Query.ipynb" "$DESTINATION_DIR"
docker cp "$SOURCE_CONTAINER":"$SOURCE_DIR/07-CLIP.ipynb" "$DESTINATION_DIR"
docker cp "$SOURCE_CONTAINER":"$SOURCE_DIR/08-chain-of-thought.ipynb" "$DESTINATION_DIR"
docker cp "$SOURCE_CONTAINER":"$SOURCE_DIR/requirements.txt" "$DESTINATION_DIR"

#cc_news_title_embeddings_50000.pkl
#color_vectors.jsonl
#reindex.py
#schema-ecommerce.json
#color_vectors.json
#queries.json
#requirements.txt
#schema.json
