FROM python:2.7-slim

RUN mkdir /hx_intersight_deploy
RUN mkdir /hx_intersight_deploy/logs

COPY ./source/hx_intersight_deploy.py /hx_intersight_deploy
COPY ./source/device_connector.py /hx_intersight_deploy
COPY ./source/get_data_2.pyc /hx_intersight_deploy
COPY ./source/GetData /hx_intersight_deploy/GetData
COPY ./source /hx_intersight_deploy/source

#RUN rm /hx_intersight_deploy/source/hx_intersight_deploy.py

RUN tar -xf /hx_intersight_deploy/source/IntersightPythonSDK.tar.gz -C /hx_intersight_deploy/source/

RUN pip install -r /hx_intersight_deploy/source/requirements.txt

WORKDIR /hx_intersight_deploy/source/IntersightPythonSDK_v1.1

RUN python /hx_intersight_deploy/source/IntersightPythonSDK_v1.1/setup.py install

WORKDIR /hx_intersight_deploy

ENTRYPOINT ["./hx_intersight_deploy.py"]
