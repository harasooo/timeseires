FROM jupyter/datascience-notebook
USER root

WORKDIR /root
COPY requirements.txt ./
RUN pip install --no-cache-dir -r /root/requirements.txt && \
    jupyter contrib nbextension install && \
    jupyter nbextensions_configurator enable && \
    julia -e 'using Pkg; Pkg.add("Plots"); using Plots'

EXPOSE 8000
USER jovyan
WORKDIR /home/jovyan