FROM jupyter/scipy-notebook:2023-09-04
USER root

#Install requirements
COPY ./notebooks ./notebooks
RUN python -m pip install --upgrade pip && pip install -r notebooks/requirements.txt

EXPOSE 8888

#Start the notebook
CMD jupyter notebook --ip=0.0.0.0 --no-browser --NotebookApp.token='' --NotebookApp.password='' --allow-root